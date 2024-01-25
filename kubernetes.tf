###
# Variables
###

variable "project_slug" {
  type        = string
  description = "Google cloud project slug"
}

###
# Providers
###

terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.25.2"
    }
    google = {
      source  = "hashicorp/google"
      version = "5.12.0"
    }
  }
}


###
# Provider configuration
###

provider "google" {
  # Configuration options
  project = var.project_slug
  region  = "europe-west3"
  zone    = "europe-west3-a"
}

data "google_client_config" "provider" {}

provider "kubernetes" {
  host  = "https://${google_container_cluster.primary.endpoint}"
  token = data.google_client_config.provider.access_token
  cluster_ca_certificate = base64decode(
    google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
  )
}

provider "helm" {
  kubernetes {
    host  = "https://${google_container_cluster.primary.endpoint}"
    token = data.google_client_config.provider.access_token
    cluster_ca_certificate = base64decode(
      google_container_cluster.primary.master_auth[0].cluster_ca_certificate,
    )
  }
}


###
# K8s cluster
###

# Enable Google cloud containers
resource "google_project_service" "container" {
  service = "container.googleapis.com"

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
}

resource "google_service_account" "default" {
  account_id   = "service-account-id"
  display_name = "Service Account"
}

resource "google_container_cluster" "primary" {
  name     = "my-gke-cluster"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  deletion_protection = false

  depends_on = [google_project_service.container]
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "my-node-pool"
  location   = "us-central1"
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "e2-medium"

    # Google recommends custom service accounts that have cloud-platform scope and permissions granted via IAM Roles.
    service_account = google_service_account.default.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}


###
# Install ArgoCD
###

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }
  depends_on = [google_container_node_pool.primary_preemptible_nodes]
}

resource "helm_release" "argocd-primary" {
  name       = "argocd-primary"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "5.53.1"

  namespace = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "controller.replicas"
    value = "1"
  }

  set {
    name  = "server.replicas"
    value = "1"
  }

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "repoServer.replicas"
    value = "1"
  }

  set {
    name  = "applicationSet.replicas"
    value = "1"
  }

  set {
    # Bcrypt hashed admin password
    name = "configs.secret.argocdServerAdminPassword"
    # argocd account bcrypt --password banana
    value = "$2a$10$zWEiSVBCGD5hY7pQgu4IsOqpNWHELW59YpNAPM9r25qGB5BNZXxVe"
  }

  timeout = "1200"

}

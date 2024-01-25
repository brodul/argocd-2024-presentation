.PHONY: create_cluster install

project_slug = brodul-argocd2

all: create_cluster install_cli login

create_cluster:
	terraform apply -var="project_slug=$(project_slug)"
	gcloud config set project $(project_slug)
	gcloud container clusters get-credentials my-gke-cluster --region us-central1 --project $(project_slug)

install_cli:
	wget https://github.com/argoproj/argo-cd/releases/download/v2.8.9/argocd-linux-amd64
	mv ./argocd-linux-amd64 ./argocd
	chmod u+x ./argocd

login:
	gcloud config set project $(project_slug)
	./argocd login $(shell gcloud compute forwarding-rules list --format="value(IPAddress)") --username admin --password banana --insecure
	@echo Go to:
	gcloud compute forwarding-rules list --format="value(IPAddress)"

delete:
	rm ./argocd
	terraform destroy -var="project_slug=$(project_slug)"

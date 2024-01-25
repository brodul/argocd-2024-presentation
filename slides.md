---
title: Andraz Brodnik
theme: night
---

## Argo CD 🐙

Andraz Brodnik

![qr](./img/frame.png)

---

## What I do 😎

- DevOps fullstack developer
- Declerative, Ephemeral, Immutable infrastructure
- Menthorships and consulting
- Podcast Ogrodje

![qr](./img/frame.png)


Notes:
- takrat ko se je to se dalo
- Zmesnjava izrazov
- Sistemc -> DevOps -> SRE
- Ogrodje

---

<!-- .slide: data-background="./img/tf1.png" data-background-size="contain" -->

![qr](./img/frame.png)


---

<!-- .slide: data-background="./img/tf2.png" data-background-size="contain" -->

![qr](./img/frame.png)


---

# Kubernetes

---

<!-- .slide: data-background="./img/give.jpg" data-background-size="contain" -->

Notes:
- YOu are the King/User
- You give k8s the general a manifest on how to orcestrate apps/army
- You don't realy care about detailed actions you do it in a declerative manner

---

<!-- .slide: data-background="./img/post.png" data-background-size="contain" -->

Notes:
- just a POST api call
- when you submit a comment on a blog via a Form
- YOu do a POST request to a server with a body/ the comment
- kubectl does a request/ reads a file and submits to the k8s api

---

<!-- .slide: data-background="./img/api.png" data-background-size="contain" -->

Notes:
- WE will do a Deployment create call
- whats in the body

---

<!-- .slide: data-background="./img/deployment.png" data-background-size="contain" -->

Notes:
- necromancer and 3 skeletons
- yaml representation of the body/ k8s manifest
- violet: api path and the type of the object
- red: name of the deployment + some labels that are informational
- blue: actual spec / who do I control
- yelloy: template for the pods

---

<!-- .slide: data-background="./img/k8s.png" data-background-size="contain" -->

Notes:
- api server
- etcd for storing state

---

<!-- .slide: data-background="./img/argo.png" data-background-size="contain" -->

Notes:
- Events: manage kubernetes with external events or emit events (kafka, slack ...)
- Workflos: Directional acylic jobs
- Rollouts: simmilar to flagger green/blue
- CI: gitops delivery

---

## Argo CD

Declarative continuous delivery with a fully-loaded UI.

Gitops for Kubernetes.

---

<!-- .slide: data-background="./img/dash.png" data-background-size="contain" -->

Notes:
- simple empty dashboard

---

## Add a Deployment

---

<!-- .slide: data-background="./img/github.png" data-background-size="contain" -->

Notes:
- repo: argocd-control-repo
- folder: simple_manifest

---
<!-- .slide: data-background="./img/create.png" data-background-size="contain" -->

Notes:
- clicked on create app
- lets take a closer look


---
<!-- .slide: data-background="./img/general.png" data-background-size="contain" -->

Notes:
- Application name
- Argo project
- sync manual automatic
- options

---
<!-- .slide: data-background="./img/source.png" data-background-size="contain" -->

Notes:
- repo url
- git revision
- folder in the repo

---
<!-- .slide: data-background="./img/destination.png" data-background-size="contain" -->

Notes:
- which cluster (default the one where it is installed)
- points to api
- namespace

---
<!-- .slide: data-background="./img/card1.png" data-background-size="contain" -->

Notes:
- card with app syncing
---
<!-- .slide: data-background="./img/card2.png" data-background-size="contain" -->
Notes:
- synced

---
<!-- .slide: data-background="./img/graph.png" data-background-size="contain" -->

Notes:
- graph representation of the app
- deployment spawns pods

---
<!-- .slide: data-background="./img/pod1.png" data-background-size="contain" -->

Notes:
- details of the pod

---
<!-- .slide: data-background="./img/events.png" data-background-size="contain" -->

---
<!-- .slide: data-background="./img/logs1.png" data-background-size="contain" -->


---
<!-- .slide: data-background="./img/graph.png" data-background-size="contain" -->

Notes:
- Lets click other views

---
<!-- .slide: data-background="./img/node.png" data-background-size="contain" -->

Notes:
- node view


---

## Add a service

---

<!-- .slide: data-background="./img/gpt.png" data-background-size="contain" -->

---
<!-- .slide: data-background="./img/git.png" data-background-size="contain" -->

---
<!-- .slide: data-background="./img/card3.png" data-background-size="contain" -->

---
<!-- .slide: data-background="./img/network.png" data-background-size="contain" -->

---
<!-- .slide: data-background="./img/web.png" data-background-size="contain" -->
---

<!-- .slide: data-background="./img/logs2.png" data-background-size="contain" -->

---

## Back to the feature

---

<!-- .slide: data-background="./img/rollback.png" data-background-size="contain" -->

Notes:

- drug nacin revert v gitu

---

## Inception

---

## Where does Argo CD stores it's configuration?

---

<!-- .slide: data-background="./img/inception.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/inception2.png" data-background-size="contain" -->

---

## More features

---

<!-- .slide: data-background="./img/helm.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/tools.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/argocd_architecture.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/gpg.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/auth.png" data-background-size="contain" -->

---

<!-- .slide: data-background="./img/perm.png" data-background-size="contain" -->

---

## Rollback if stuff breaks?

---

## Argo rollouts

---

<!-- .slide: data-background="./img/rollouts.png" data-background-size="contain" -->

---

Andraz Brodnik

@brodul

brodul@brodul.org

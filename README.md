# Argo CD

We will take a look at a declarative, GitOps continuous deliver tool for Kubernetes.
The presentation will have a short overview of Argo CD alternatives, overview of Argo CD core concepts, basic use cases and a quick look at the features that might be useful for larger organizations.


## Run the examples

Tested on a linux distro, slight changes might be needed to install on MacOS.

This repository is ment for testing purposes only. As it has the password hardcoded and TLS self signed for easier demonstration.

Running this will mutate `.argocd` in your home as it will configure argocd CLI interface.

Create a GCP account and add setup billing.
Create a GCP project `example_name` remember the slug of the project.

Install if not installed already:

- terraform
- GNU make


Change the variable `project_slug` in `Makefile`

### Run

```
terraform init
make
# read the output
# confirm terraform resource creation
```

### Play around

Make file will return a public IP go to that IP with the browser.
There will be a TLS error which you can skip as it is self signed.
Username is `admin` and the password can be found in `kubernetes.tf`

Argo CLI is authorized `./argocd --help`


### Cleanup

```
make delete
# read the output
# confirm terraform resource deletion
```

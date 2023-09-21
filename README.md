# Single Node GKE Cluster - Terraform

This terraform repo will deploy a single node (by default) GKE cluster for quick LAB purposes. Available in 2 versions:

1. Plain GKE cluster
1. GKE cluster with Gitlab K8s agent integration

## Prerequisites

The following tools must exist on the machine where the terraform will be executed:

1. gcloud CLI
1. gke-gcloud-auth-plugin


For lazy hands:

```
# Install Gcloud for Debian/Ubuntu
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt-get update && sudo apt-get install google-cloud-cli kubectl jq -y
sudo gcloud components install gke-gcloud-auth-plugin
```

To authenticate to Gcloud:
```
# Using your user
gcloud init 

# Then
gcloud auth application-default login
```
## How to use

### GKE Only 

1. Authenticate `gcloud`
1. Create a `terraform.tfvars` file ([example](#sample-tfvars-files)) and fill the required [input variables](#terraform-input-vars)
1. Do `terraform init`
1. Plan and apply

### GKE with Gitlab K8s agent setup 

1. Create a Gitlab Agent for Kubernetes, and retrieve the token.
1. Same steps with the GKE Only

## Sample tfvars files

terraform.tfvars

```
project_id = "default-project"
region = "asia-southeast2"
zone = "asia-southeast2-a"
machine_type = "e2-small"
```

For Gitlab K8s agent setup, include the required variables:
```
agent_namespace = "gitlab-agent"
agent_token = abcdef123456789
agent_kas_address = wss://gitlab.com/-/kubernetes-agent/"
```

## Terraform input vars

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| project\_id | GCP Project ID | string | n/a | yes |
| region | GCP Project region | string | "asia-southeast2" | yes |
| zone | GCP Project zone | string | "asia-southeast2-b" | yes |
| machine\_type | GKE Node Machine type | string | "e2-medium" | yes |
| node\_count | GKE node count | int | 1 | yes |
| is\_preemptible\_node\_pool | Whether the nodepool is preemptible or not | bool | true | yes |
| agent\_namespace | Gitlab agent namespace | string | "gitlab-agent" | yes in gitlab k8s agent |
| agent\_token | Gitlab agent token | string | n/a | yes in gitlab k8s agent |
| kas\_address | KAS address | string | n/a | yes in gitlab k8s agent | 

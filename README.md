# gke-terraform

## Terraform
Before applying terraform, run the following commands:
* Download the credentials of the service account into cred.json
* Enable GKE and CRM API using: 
    ```bash
    gcloud services enable container.googleapis.com
    gcloud services enable cloudresourcemanager.googleapis.com
    ```

## Jenkins
The jenkins plugins to install are:
* Blue Ocean
* Terraform
* CloudBees Docker Build and Publish
* Docker
* Google Container Registry Auth
* Google OAuth Credentials
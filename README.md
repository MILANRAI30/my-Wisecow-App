# my-Wisecow-App

Overview
This repository contains the source code and deployment configuration for the Wisecow application. The application is deployed on Kubernetes with a Continuous Integration and Continuous Deployment (CI/CD) pipeline using GitHub Actions. This setup ensures automated build, push, and deployment of Docker images.

Setup

1. Prerequisites

Kubernetes Cluster: Kubernetes cluster up and running.
Docker: Docker is installed and configured.
GitHub Repository Secrets: Set up the following secrets in your GitHub repository:
"DOCKER_USERNAME"
"DOCKER_PASSWORD"
"KUBECONFIG" (Kubeconfig file for accessing the Kubernetes cluster)

2. Docker Configuration

The Dockerfile is configured to build the Wisecow application image.  Dockerfile is correctly set up to build your application.

3. Cluster secrets 

a. Docker Registry Credentials

we're pushing Docker images to a private registry, you'll need to provide your registry credentials:

kubectl create secret docker-registry regcred\
  --docker-server=your-registry-server>\
  --docker-username=your-username>\
  --docker-password=your-password>\
  --docker-email=your-email>

b.  TLS Configuration & Certificates


To enable TLS for your application:

Obtain TLS Certificates: Obtain a TLS certificate and key for your domain.

Create Kubernetes Secret: Run the following command to create a TLS secret:

"kubectl create secret tls wisecow-tls --cert=path/to/tls.crt --key=path/to/tls.key"

To enable TLS for your application, you need to create a Kubernetes secret with your TLS certificates:

kubectl create secret tls wisecow-tls \
  --cert=path/to/tls.crt \
  --key=path/to/tls.key

Update DNS Records: Ensure your domain points to the LoadBalancer IP or hostname provided by the Kubernetes service.

4. Kubernetes Configuration

a. Deployment Manifest
The deployment.yaml file defines the Kubernetes Deployment for the Wisecow application. It specifies the container image and port configuration.

b. Service Manifest
The service.yaml file exposes the Wisecow application on port 449 using a LoadBalancer service.

c. Ingress Manifest
The ingress.yaml file configures the Ingress resource for the Wisecow application to handle TLS termination and route traffic to the service.

5. GitHub Actions Workflow

The .github/workflows/deploy.yml file defines the CI/CD pipeline using GitHub Actions:

Build and Push: The workflow builds the Docker image and pushes it to the Docker registry.
Deploy: The workflow deploys the updated image to the Kubernetes cluster.


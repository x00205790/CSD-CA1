# CSD-CA1
![badge](https://img.shields.io/endpoint?url=https://gist.githubusercontent.com/x00205790/39415c64e57c913926b4a9c23b7bd3a9/raw/code-coverage.json)

# Project setup
## Initial build
The initial build is contained in the first-deploy.yml workflow. This workflow uses a combination of Azure CLI and Terraform to create the initial storage accounts, and container registry.

## Staging pipeline
The staging pipeline runs with multiple jobs within multiple workflows.

compile-and-test-staging --> deploy-staging-container --> zap-scan --> k6s-load-test

### Compile and testing

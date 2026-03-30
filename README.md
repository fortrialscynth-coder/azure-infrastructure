# Secure Azure Infrastructure with Terraform and Ansible

## Overview
This project demonstrates end-to-end infrastructure automation using
Terraform and Ansible. It provisions a production-style network
environment and automatically configures a web server, mirroring
real-world enterprise Azure deployment workflows.

## Architecture
- **Virtual Network** — 10.0.0.0/16 address space
- **Subnet** — 10.0.1.0/24
- **Network Security Group** — controlled inbound rules for SSH (22) and HTTP (80)
- **Web Server** — nginx installed and configured via Ansible

## Tech Stack
| Tool | Purpose |
|------|---------|
| Terraform | Infrastructure as Code |
| Ansible | Configuration management |
| nginx | Web server |
| Linux (Ubuntu) | Target environment |

## Project Structure
```
azure-infrastructure/
├── main.tf
├── variables.tf
├── outputs.tf
├── ansible/
│   └── playbook.yml
└── output/
    ├── network_config.json
    └── inventory.ini
```

## Usage

### 1. Initialise Terraform
```bash
terraform init
```

### 2. Preview the deployment
```bash
terraform plan
```

### 3. Deploy the infrastructure
```bash
terraform apply
```

### 4. Configure the web server
```bash
ansible-playbook -i output/inventory.ini ansible/playbook.yml --ask-become-pass
```

### 5. Verify
```bash
curl http://localhost
```

## What This Demonstrates
- Infrastructure as Code using Terraform
- Configuration management using Ansible
- Network security design with controlled traffic rules
- End-to-end automation from provisioning to deployment
- Version controlled, reproducible deployments

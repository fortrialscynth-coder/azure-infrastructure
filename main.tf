terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.0"
    }
  }
}

resource "local_file" "network_config" {
  filename = "${path.module}/output/network_config.json"
  content  = jsonencode({
    resource_group = "atos-demo-rg"
    location       = "uksouth"
    vnet = {
      name          = "main-vnet"
      address_space = "10.0.0.0/16"
    }
    subnet = {
      name   = "main-subnet"
      prefix = "10.0.1.0/24"
    }
    security_rules = [
      {
        name     = "allow-ssh"
        port     = "22"
        priority = 100
        access   = "Allow"
      },
      {
        name     = "allow-http"
        port     = "80"
        priority = 200
        access   = "Allow"
      }
    ]
  })
}

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/output/inventory.ini"
  content  = <<-EOT
    [webservers]
    localhost ansible_connection=local
  EOT
}

output "network_config_file" {
  description = "Path to the generated network config"
  value       = local_file.network_config.filename
}

output "ansible_inventory_file" {
  description = "Path to the generated Ansible inventory"
  value       = local_file.ansible_inventory.filename
}

output "droplet_ips" {
    value = module.app.droplet_ips
}

output "droplet_resources" {
    value = module.app.droplet_resources
}

output "database_storage_size_mib" {
    value = module.app.database_storage_size_mib
}

output "database_connection" {
    value = module.app.database_connection
}

output "loadbalancer_info" {
    value = module.app.loadbalancer_info
}

output "loadbalancer_rules" {
    value = module.app.loadbalancer_rules
}
output "loadbalancer_healthchecks" {
    value = module.app.loadbalancer_healthchecks
}

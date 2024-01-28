output "droplet_ips" {
    value = { for instance in digitalocean_droplet.webserver : instance.name => {
            ipv4_address = instance.ipv4_address
            ipv4_address_private = instance.ipv4_address_private
            ipv6_address = instance.ipv6_address
        } 
    }
}

output "droplet_resources" {
    value = { for instance in digitalocean_droplet.webserver : instance.name => {
            cpus = instance.vcpus
            memory = instance.memory
            disk = instance.disk
        } 
    }
}

output "database_storage_size_mib" {
    value = digitalocean_database_cluster.database.storage_size_mib
}

output "database_connection" {
    value = {
        host = digitalocean_database_cluster.database.host
        port = digitalocean_database_cluster.database.port
        user = digitalocean_database_cluster.database.user
        # password = digitalocean_database_cluster.database.password  # sensitive
        # uri = digitalocean_database_cluster.database.uri            # sensitive
    }
}

output "loadbalancer_info" {
    value = {
        status = digitalocean_loadbalancer.loadbalancer.status
        url = "http://${digitalocean_loadbalancer.loadbalancer.ip}"
        algorithm = digitalocean_loadbalancer.loadbalancer.algorithm
    }
}

output "loadbalancer_rules" {
    value = [
        for rule in digitalocean_loadbalancer.loadbalancer.forwarding_rule : {
            entry_port       = rule.entry_port
            entry_protocol   = rule.entry_protocol
            target_port      = rule.target_port
            target_protocol  = rule.target_protocol
            tls_passthrough = rule.tls_passthrough
        }
    ]
}

output "loadbalancer_healthchecks" {
    value = [
        for healthcheck in digitalocean_loadbalancer.loadbalancer.healthcheck : {
            protocol  = healthcheck.protocol
            port      = healthcheck.port
            path      = healthcheck.path
            interval  = healthcheck.check_interval_seconds
            threshold = healthcheck.healthy_threshold
        }
    ]
}

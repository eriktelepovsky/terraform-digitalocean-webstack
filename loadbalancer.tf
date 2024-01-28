resource "digitalocean_loadbalancer" "loadbalancer" {
    name   = "test-loadbalancer"
    region = var.region
    droplet_ids = [for i in digitalocean_droplet.webserver : i.id]

    forwarding_rule {
        entry_port     = 80
        entry_protocol = "http"

        target_port     = 80
        target_protocol = "http"
    }

    healthcheck {
        port                    = var.loadbalancer_healthcheck_port
        protocol                = var.loadbalancer_healthcheck_protocol
        path                    = var.loadbalancer_healthcheck_protocol == "http" ? var.loadbalancer_healthcheck_path : null
        check_interval_seconds  = var.loadbalancer_healthcheck_interval
        healthy_threshold       = var.loadbalancer_healthcheck_threshold
    }
}
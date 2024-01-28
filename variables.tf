# Security

variable private_ssh_key_path {
    type = string
    sensitive = true
    description = "Path to your private SSH key"
}

variable public_ssh_key_name {
    type = string
    sensitive = true
    description = "Name of your public SSH key in Digital Ocean"
}

# General

variable region {
    type = string
    default = "fra1"
    description = "Region for your resources"
}

# Droplets

variable droplet_count {
    type = number
    default = 3
    description = "Number of droplets / load balancer nodes"
}

variable droplet_image {
    type = string
    default = "nginx"
    description = "Image for droplet / node"
}

variable droplet_user_data_file {
    type = string
    default = ""
    description = "Custom data file to execute during droplet creation"
}

variable droplet_size {
    type = string
    default = "s-1vcpu-1gb"
    description = "Size of droplet"
}

variable droplet_monitoring {
    type = bool
    default = true
    description = "Enable/disable droplet monitoring"
}

# Database

variable droplet_backups {
    type = bool
    default = true
    description = "Enable/disable droplet backups"
}

variable db_size {
    type = string
    default = "db-s-1vcpu-2gb"
    description = "Size of database"
}

variable db_engine {
    type = string
    default = "pg"
    description = "Database engine"
}

variable db_nodes {
    type = number
    default = 1
    description = "Number of database nodes"
}

variable db_version {
    type = number
    default = 15
    description = "Database engine version"
}

# Load Balancer

variable loadbalancer_healthcheck_port {
    type = number
    default = 80
    description = "Port for loadbalancer healthcheck"
}

variable loadbalancer_healthcheck_protocol {
    type = string
    default = "http"
    description = "Protocol for loadbalancer healthcheck"
}

variable loadbalancer_healthcheck_path {
    type = string
    default = "/"
    description = "Path for loadbalancer healthcheck"
}

variable loadbalancer_healthcheck_interval {
    type = number
    default = 10
    description = "Number of seconds for loadbalancer healthcheck interval"
}

variable loadbalancer_healthcheck_threshold {
    type = number
    default = 5
    description = "Threshold for loadbalancer healthcheck"
}

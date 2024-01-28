terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.34"
    }
  }
}

variable "do_token" {
  # export TF_VAR_do_token=<YOUR_DIGITALOCEAN_TOKEN>
}

provider "digitalocean" {
  token = var.do_token
}

module "app" {
  source = "../"

  # required atrributes
  private_ssh_key_path = "~/.ss/id_rsa"
  public_ssh_key_name = "my-terraform-key"
  
  # optional attributes
  region = "fra1"
  droplet_count = 2
  droplet_image = "nginx"
  droplet_user_data_file = "webserver.yaml"
  droplet_size = "s-1vcpu-1gb"
  droplet_monitoring = true
  droplet_backups = true
  db_size = "db-s-1vcpu-2gb"
  db_engine = "pg"
  db_nodes = 2
  db_version = 15
  loadbalancer_healthcheck_port = 80
  loadbalancer_healthcheck_protocol = "http"
  loadbalancer_healthcheck_path = "/"
  loadbalancer_healthcheck_interval = 3
  loadbalancer_healthcheck_threshold = 10
}

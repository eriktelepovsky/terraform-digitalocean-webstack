terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = ">= 2.34"
    }
  }
}

data "digitalocean_ssh_key" "terraform" {
  name = var.public_ssh_key_name
} 

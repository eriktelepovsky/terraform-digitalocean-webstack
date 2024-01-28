resource "digitalocean_droplet" "webserver" {
  name          = "webserver-${count.index + 1}"
  region        = var.region
  count         = var.droplet_count
  image         = var.droplet_image
  size          = var.droplet_size
  monitoring    = var.droplet_monitoring
  backups       = var.droplet_backups
  ssh_keys      = [data.digitalocean_ssh_key.terraform.id]
  user_data     = var.droplet_user_data_file != "" ? file(var.droplet_user_data_file) : null
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.private_ssh_key_path)
    timeout = "2m"
  }
}
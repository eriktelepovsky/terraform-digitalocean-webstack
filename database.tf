resource "digitalocean_database_cluster" "database" {
    region     = var.region
    name       = "database"
    engine     = var.db_engine
    version    = var.db_version
    size       = var.db_size
    node_count = var.db_nodes
}

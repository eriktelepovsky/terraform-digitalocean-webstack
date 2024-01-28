# terraform-digitalocean-webstack
*Author: Erik Telepovský*

This is a terraform module for DigitalOcean to create a simple web stack containing LEPP by default: 

- [**L**]inux [**E**]nginx [**P**]ostgreSQL [**P**]ython

but the images for droplets and DB engine could be changed (for example Apache and MySQL) to construct LAMP or any other web stacks. 

Generated resources:
- droplets as webserver nodes
- managed database
- load balancer

## Inputs

| Variable | Type | Description | Required | Default |
| -------- | ---- | ----------- | -------- | ------- |
| private_ssh_key_path | string | Path to your private SSH key | YES | |
| public_ssh_key_name | string | Name of your public SSH key in Digital Ocean | YES | |
| region | string | Region for your resources | no | fra1 |
| droplet_count | mumber | Number of droplets / load balancer nodes | no | 3 |
| droplet_image | sting | Image for droplet / node | no | nginx |
| droplet_user_data_file | string | Custom data file to execute during droplet creation | no | |
| droplet_size | string | Size of droplet | no | s-1vcpu-1gb |
| droplet_monitoring | bool | Enable/disable droplet monitoring | no | true |
| droplet_backups | bool | Enable/disable droplet backups | no | true |
| db_size | string | Size of database | no | db-s-1vcpu-2gb |
| db_engine | string | Database engine | no | pg |
| db_nodes | number | Number of database nodes | no | 1 |
| db_version | number | Database engine version | no | 15 |
| loadbalancer_healthcheck_port | number | Port for loadbalancer healthcheck | no | 80 |
| loadbalancer_healthcheck_protocol | string | Protocol for loadbalancer healthcheck | no | http |
| loadbalancer_healthcheck_path | string | Path for loadbalancer healthcheck | no | / |
| loadbalancer_healthcheck_interval | number | Number of seconds for loadbalancer healthcheck interval | no | 10 |
| loadbalancer_healthcheck_threshold | number | Threshold for loadbalancer healthcheck | no | 5 |

## Outputs

| Name        | Description |
| ----------- | ----------- |
| droplet_ips | public IPv4, private IPv4 and public IPv6 addresses for each droplet |
| droplet_resources | Number of CPUs, Memory, Disk for each droplet |
| database_storage_size_mib | Size of database in MiB |
| database_connection | Host, Port and User details for database connection |
| loadbalancer_info | Status, URL and algorithm of load balancer |
| loadbalancer_rules | Load balancer rules (Entry port & protocol, Target port & protcol, TLS) |
| loadbalancer_healthchecks | Load balancer healthchecks (protocol, port, path, interval, threshold) |

## Example:

Modify inputs in ``example/main.tf`` according your needs

```bash
cd example
export TF_VAR_do_token=<YOUR_DIGITALOCEAN_TOKEN>
terraform init --upgrade
terraform plan
terraform apply
terraform outputs
```

terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
  required_version = ">= 1.0"
}

# Provider
provider "digitalocean" {
  token = var.do_token
}

# Variables
variable "do_token" {
  type      = string
  sensitive = true
}

variable "pvt_key" {}

variable "ssh_key_name" {
  type      = string
}

data "digitalocean_ssh_key" "terraform" {
  name = var.ssh_key_name
}

resource "digitalocean_droplet" "www-1" {
  image = "ubuntu-20-04-x64"
  name = "www-1"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.pvt_key
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

resource "digitalocean_droplet" "www-2" {
  image = "ubuntu-20-04-x64"
  name = "www-2"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.pvt_key
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

resource "digitalocean_droplet" "www-3" {
  image = "ubuntu-20-04-x64"
  name = "www-3"
  region = "nyc3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.terraform.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = var.pvt_key
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      # install nginx
      "sudo apt update",
      "sudo apt install -y nginx"
    ]
  }
}

# Output IP addresses for all droplets
output "ip_addresses" {
  value = {
    www-1 = digitalocean_droplet.www-1.ipv4_address
    www-2 = digitalocean_droplet.www-2.ipv4_address
    www-3 = digitalocean_droplet.www-3.ipv4_address
  }
}

# Add a DigitalOcean Load Balancer
resource "digitalocean_loadbalancer" "www_lb" {
  name   = "www-loadbalancer"
  region = "nyc3"

  forwarding_rule {
    entry_port      = 80
    entry_protocol  = "http"
    target_port     = 80
    target_protocol = "http"
  }

  healthcheck {
    port     = 80
    protocol = "http"
    path     = "/"
    unhealthy_threshold = 3
    healthy_threshold   = 5
  }

  droplet_ids = [
    digitalocean_droplet.www-1.id,
    digitalocean_droplet.www-2.id,
    digitalocean_droplet.www-3.id
  ]
}

# Output Load Balancer IP
output "load_balancer_ip" {
  value = digitalocean_loadbalancer.www_lb.ip
}

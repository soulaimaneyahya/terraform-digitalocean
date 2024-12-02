# terraform-digitalocean

### Init
```bash
terraform init
```

### Apply Configuration
```bash
terraform plan
terraform plan --out=planfile
```

```bash
terraform apply
```

### Targeting module

```sh
terraform plan -target=digitalocean_droplet.www-1
terraform apply -target=digitalocean_droplet.www-1
<service_name><instance_name>
```

### Destory

```bash
terraform destroy
```

Learn more: [Automating Linux Server Deployments with Terraform and DigitalOcean](https://engineering.multividas.com/posts/1733138598695)

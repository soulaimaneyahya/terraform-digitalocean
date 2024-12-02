# terraform-digitalocean

### Init
```bash
terraform init
```

### Apply Configuration
```bash
terraform plan -var "pvt_key=$HOME/.ssh/terraform_ssh"
terraform plan --out=planfile -var "pvt_key=$HOME/.ssh/terraform_ssh"
```

```bash
terraform apply -var "pvt_key=$HOME/.ssh/terraform_ssh"
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

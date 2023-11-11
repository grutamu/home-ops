terraform {
  cloud {
    organization = "zabardwell"

    workspaces {
      name = "homelab"
    }
  }  
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.14"
    }
  }
}

variable "proxmox_api_url" {
  type = string
}
variable "proxmox_api_token_id" {
  type = string
  sensitive = true
}
variable "proxmox_api_token_secret" {
  type = string
  sensitive = true
}
variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAzVyeD4Ofj0ZCLBH4tmmJL5V8j2KpKsWT/ez9uW9yKLde/o1qEg8VO8E2B0Ehuwg1QJ1onU0hXxY0CVJpbE2cPsGNTeXpsXcMDWEOqmf+VUQfg7C28rfjfURgQvrnnqrnGTJJ3SGU3Lf6WslFeFRKKFcE5tCY5F2kMrKLUkaeBzrVU+9kzwbadAa1QjLUQLw3G+cik6RImmRRVDXR+09MH7GXtW3nFf4W+ecKODKafzROvkcY9mJSTg9ajJXKzVwIk1BBZ1w/MdRPrRU5eZWidejfNz0hZMTZmWW0DFDjQuvcfuA48B1X3drQwach+vkk2SgMfX/3zidiS3HqfI1UzQ== zbardwell"
}
variable "ciuser" {
  default = "zbardwell"
}

provider "proxmox" {
  pm_api_url = var.proxmox_api_url
  pm_api_token_id = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret
  pm_parallel     = 5
  pm_tls_insecure = true
}
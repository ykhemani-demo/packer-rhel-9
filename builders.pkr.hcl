packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = "~> 1"
    }
  }
}

build {
  hcp_packer_registry {
    bucket_name = var.bucket_name
    description = var.bucket_description

    bucket_labels = {
      "os" = "linux"
    }

    build_labels = {
      "build-time" = timestamp()
    }
  }

  sources = [
    "source.amazon-ebs.rhel-9-us-east",
  ]

  #provisioner "ansible" {
  #  playbook_file = "./playbook.yaml"
  #}

  provisioner "shell" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm",
      "sudo yum -y install jq",
      "sudo yum -y install htop",
      "sudo yum install -y yum-utils",
      "sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo",
      "sudo yum install -y terraform packer vault-enterprise consul-enterprise nomad-enterprise"
    ]
  }
}

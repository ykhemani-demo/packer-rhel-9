# packer-rhel-9

## Background

This repo provides a [HashiCorp](https://hashicorp.com) [Packer](https://packer.io) template for building machine image(s) based on [RedHat Enterprise Linux (RHEL) 9](https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux).

Packer allows you to deliver identical images for multiple public and private cloud platforms from a common configuration.

The Packer template in this repo builds off of RHEL 9 on [AWS](https://aws.amazon.com). You may extend it to build RHEL 9 images on other public and private clouds.

The images that are built are registered in the HashiCorp Cloud Platform ([HCP](https://cloud.hashicorp.com)) Packer Registry.

### Provisioners

This Packer template uses the [Shell provisioner](https://developer.hashicorp.com/packer/docs/provisioners/shell).

## Usage

### Prerequisites

#### Software

This Packer template has been tested with the following software on a Mac running macOS on Apple Silicon.

* [Packer](https://developer.hashicorp.com/packer/tutorials/docker-get-started/get-started-install-cli) version 1.12.0.


#### Cloud Credentials

For provisioning to AWS, you will need AWS clould credentials. Set these as environment variables:

* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `AWS_SESSION_TOKEN` # if needed for your AWS account

For registering the image with the HCP Packer Registry, you will need HCP cloud credentials. Set these as environment variables as follows:

* `HCP_CLIENT_ID`
* `HCP_CLIENT_SECRET`

#### Packer Variables

Set the values for Packer variables. See [yash.pkrvars.hcl](yash.pkrvars.hcl) for an example.

### Running Packer

#### Initialize Packer

```
packer init -var-file=<variables file> .
```

#### Check and correct formatting of the Packer configuration

```
packer fmt -var-file=<variables file> .
```

#### Validate the Packer configuration

```
packer validate -var-file=<variables file> .
```

#### Build the machine image(s)

```
packer build -var-file=<variables file> .
```

---

owner              = "yash"
aws_region_us_east = "us-east-1"
aws_instance_type  = "m5.large"
bucket_name        = "rhel-9-golden-image"
bucket_description = "RHEL 9 golden image"
tags = {
  owner          = "yash"
  ttl            = "-1"
  config-as-code = "packer"
  repo           = "ykhemani/packer-ubuntu-focal"
}

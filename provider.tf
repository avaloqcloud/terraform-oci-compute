terraform {
  required_version = "~> 1.2"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.39"
    }
    oci = {
      source  = "oracle/oci"
      version = "5.18.0"
    }
  }

  backend "s3" {
    bucket         = "avinash-test"
    key            = "terraform.tfstate"
    region         = "eu-zurich-1"
    endpoint       = "https://objectstorage.eu-zurich-1.oraclecloud.com"
    skip_region_validation = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
  }

}

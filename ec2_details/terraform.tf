terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.53.0"
    }
  }

/*  backend "s3" {
    bucket = "mpsaps-state-12345"
    key    = "terraform.tfstate"
    region = "us-west-2"

    use_lockfile = true
  }
*/
}

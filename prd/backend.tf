terraform {
  backend "s3" {
    bucket = "sctp-ce4-tfstate-bucket"
    key    = "Quintet-CE4-Grp3-Capstone.tfstate"
    region = "ap-southeast-1"

    # State Locking
    dynamodb_table = "quintet-state"
  }
}

/*
# To remove after testinhg by akb
terraform {
  backend "s3" {
    bucket = "sctp-ce4-tfstate-bucket"
    key    = "dev/terraform.tfstate"
    region = "ap-southeast-1"
  }
}
*/

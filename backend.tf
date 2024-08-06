terraform {
    backend "s3" {
        bucket = "my-iquant-test-bucket"
        dynamodb_table = "iquant-state-lock"
        key = "dev/mystatefile/terraform.tfstate"
        region = "us-east-1"
        encrypt = true
    }
}


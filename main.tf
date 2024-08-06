# Amazon EC2 Instance Resource 

resource "aws_instance" "terra_ec2" {
  ami                    = var.AMI
  instance_type          = var.TYPE
  key_name               = var.KEY
  vpc_security_group_ids = ["sg-040c1fca5fe860748"]
  tags = {
    "Name"        = "Terra EC2"
    "Environment" = "Dev"
  }
}

# DynamoDB Table to lock our statefile
resource "aws_dynamodb_table" "iquant-dynamodb-table" {
  name           = "iquant-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }
}
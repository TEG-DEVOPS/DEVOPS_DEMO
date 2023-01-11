variable REGION {
  default = "us-east-2"
}

variable ZONE1 {
  default = "us-east-2a"
}

variable AMIS {
  type = map
  default = {
    us-east-2 = "ami-0283a57753b18025b"
  }
}

variable USER {
  #default = "ec2-user"
  default = "ubuntu"
}

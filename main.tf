provider "aws" {
    region = "us-east-1"
}

variable "cidr_block" {
    description = "cidr block and name for vpc and subnet" 
    type = list(object({
      cidr_block = string,
      Name = string
    }))
}

variable "available_zone" {}

resource "aws_vpc" "dev" {
    cidr_block = var.cidr_block[0].cidr_block
    tags = { 
        Name = var.cidr_block[0].Name
        
    }
}

resource "aws_subnet" "dev_1" {
    vpc_id = aws_vpc.dev.id
    cidr_block = var.cidr_block[1].cidr_block
    availability_zone = var.available_zone
    tags ={ 
        Name = var.cidr_block[1].Name
    }
}

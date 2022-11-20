# https://developer.hashicorp.com/terraform/language/values/variables

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "Public Subnet CIDR values"
  default     = ["10.0.0.0/22", "10.0.4.0/22", "10.0.8.0/22"]
}


variable "private_subnet_cidrs" {
  type        = list(string)
  description = "Private Subnet CIDR values"
  default     = ["10.0.12.0/22", "10.0.16.0/22", "10.0.20.0/22"]
}

variable "azs" {
  type        = list(string)
  description = "Availability Zones"
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "playground_sg" {
  type = object({
    name          = string
    description   = string
    ports_ingress = list(number)
    ports_egress  = list(number)
  })
  default = {
    name          = "playground-sg"
    description   = "playground security group"
    ports_ingress = [22, 80, 443]
    ports_egress  = [0]
  }
}
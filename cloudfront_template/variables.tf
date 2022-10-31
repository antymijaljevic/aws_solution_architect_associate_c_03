# PLAYGROUND
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
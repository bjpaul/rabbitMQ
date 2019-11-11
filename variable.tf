variable "vpc_cidr" {
  default = "10.0.0.0/16"
}
variable "pub_cidr" {
  default = ["10.0.3.0/24","10.0.4.0/24"]
}
variable "azs" {
  default = ["us-east-1a","us-east-1b"]
}
variable "ami-id" {
  default = "ami-0088a8b9520420043"
}
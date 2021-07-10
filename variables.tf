variable "region" {
  type = string

}
variable "availability_zone" {
  type = list

}
variable "vpc_cidr" {
  type = string

}

variable "secure_cidr" {
  type = list

}

variable "private_cidr" {
  type = list

}

variable "public_cidr" {
  type = list

}

variable "number_resources" {
  default = 2
}
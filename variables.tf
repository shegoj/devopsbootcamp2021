variable "ssh_key" {
  description = "This is used for logging in"
  default     = "test1000"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "tag_name" {
  default = "Real_Web_Server"
}

variable "bucket" {
  default = "shegoj-tutorial-1"
}

variable "key" {
  default = "training/june2021/day3-statefile"
}

variable "instance_ami" {
  default = "ami-0ac43988dfd31ab9a"
}
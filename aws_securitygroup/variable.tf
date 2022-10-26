variable "vpc_id" {
  default = ""
}

variable "vpc_cidr_secure" {
  default = ""
}

variable "allow_ports_webserver" {

  description = "List of ports to open for server"
  type        = list(any)
  default     = ["80", "443"]
}

variable "allow_ports_secure" {
  description = "List of ports to open for secure connection"
  type        = list(any)
  default     = ["44", "22"]
}

variable "common_tags" {
  description = "Common tags to all resourses"
  type        = map(any)
  default = {
    Owner       = "Vadim Aleksandrovich"
    YouTube     = "From 18 lesson"
    Environment = "development"
  }
}

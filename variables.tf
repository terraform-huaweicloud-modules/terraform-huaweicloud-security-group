variable "security_group_id" {
  description = "The ID of the security group"
  default     = ""
}

variable "name" {
  description = "The name of the security group"
  default     = ""
}

variable "description" {
  description = "The description of security group"
  default     = ""
}

variable "delete_default_rules" {
  type        = bool
  description = "Whether or not to delete the default egress security rules"
  default     = true
}

variable "rules" {
  type = list(object({
    direction      = string
    ethertype      = string
    protocol       = string
    port_range_min = string
    port_range_max = string
    remote_ip_cidr = string
  }))
  description = "List of rules in a security group"
  default     = []
}


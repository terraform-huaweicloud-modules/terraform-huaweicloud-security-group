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

variable "rules" {
  type = "list(map(string))"
  description = "List of rules in a security group"
  default     = []
}

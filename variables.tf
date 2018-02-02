variable "principal_arns" {
  type        = "list"
  description = "List of ARNs (accounts) to grant dockercloud-swarm privilleges."
  default     = ["arn:aws:iam::689684103426:root"]
}

variable "prefix" {
  description = "Prefix for created resources"
  type        = "string"
  default     = ""
}

variable "role_name" {
  description = "Name of the created role."
  type        = "string"
  default     = "dockercloud-swarm-role"
}

variable "policy_name" {
  description = "Name of the created policy."
  type        = "string"
  default     = "dockercloud-swarm-policy"
}

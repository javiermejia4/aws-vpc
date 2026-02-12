variable "ingress_ports" {
  type        = list(number)
  default     = [22, 80, 443]
  description = "list of ingress ports"
}

variable "allowed_ips" {
  type        = list(string)
  default     = ["45.50.88.178/32"]
  description = "Allowed CIDR IPs"
}
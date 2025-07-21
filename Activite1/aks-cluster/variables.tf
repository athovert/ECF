variable "resource_group_name" {
  default = "aks-rg"
}

variable "location" {
  default = "westeurope"
}

variable "cluster_name" {
  default = "myAKSCluster"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  description = "Node VM size"
  type        = string
  default     = "Standard_D2s_v3"  # Taille compatible avec 'westeurope'
}

variable "subscription_id" {
  description = "Id of the subscription"
  type        = string
  default     = "9dd39b91-bc0a-4b04-a1d5-c7fea35eb534"
}

variable "subscription_id" {
  description = "Id of the subscription"
  type        = string
  default     = "b4be01bf-f023-4ec7-a8f9-1069eca4f1ca"
}

variable "resource_group_name" {
  default = "aks-rg"
}

variable "location" {
  default = "westeurope"
}

variable "cluster_name" {
  default = "aks-cluster"
}

variable "node_count" {
  default = 2
}

variable "vm_size" {
  description = "Node VM size"
  type        = string
  default     = "Standard_DS2_v2"  # Taille compatible avec 'westeurope'
}





variable "resource_group_name" {
  description = "Name of the resource group for AKS"
  type        = string
  default     = "rg-h09-aks"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "canadacentral"
}

variable "aks_cluster_name" {
  description = "Name of the AKS cluster"
  type        = string
  default     = "aks-h09-cluster"
}

variable "node_count_min" {
  description = "Minimum number of AKS nodes"
  type        = number
  default     = 1
}

variable "node_count_max" {
  description = "Maximum number of AKS nodes"
  type        = number
  default     = 3
}

variable "vm_size" {
  description = "AKS node VM size"
  type        = string
  default     = "Standard_B2s"
}
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_kubernetes_cluster" "app" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "h09aksdns"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name                 = "system"
    vm_size              = var.vm_size
    auto_scaling_enabled = true
    min_count            = var.node_count_min
    max_count            = var.node_count_max
    os_disk_type         = "Managed"
    os_sku               = "Ubuntu"
    type                 = "VirtualMachineScaleSets"
  }

  network_profile {
    network_plugin    = "kubenet"
    load_balancer_sku = "standard"
  }

  sku_tier = "Free"
}
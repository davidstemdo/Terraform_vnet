variable "vnet_name" {
  description = "Nombre de la VNet"
  type        = string

  validation {
    condition     = can(regex("^vnet", var.vnet_name)) && var.vnet_name != ""
    error_message = "El nombre de la VNet debe comenzar con 'vnet' y no puede estar vacío."
  }
}

variable "vnet_address_space" {
  description = "Espacio de direcciones IP para la VNet"
  type        = list(string)
}

variable "location" {
  description = "Localización"
  type        = string
  default     = "West Europe"
}

variable "owner_tag" {
  description = "Propietario del recurso"
  type        = string

  validation {
    condition     = var.owner_tag != ""
    error_message = "El owner_tag no puede estar vacío."
  }
}

variable "environment_tag" {
  description = "Entorno del recurso (dev, pro, tes, pre)"
  type        = string

  validation {
    condition = contains(["dev", "pro", "tes", "pre"], lower(var.environment_tag)) && var.environment_tag != ""
    error_message = "environment_tag debe ser uno de los siguientes: dev, pro, tes, pre, y no puede estar vacío."
  }
}

variable "vnet_tags" {
  description = "Tags adicionales"
  type        = map(string)
  default     = {}

  validation {
    condition = alltrue([
      for value in var.vnet_tags : (
        value != null && value != ""
      )
    ])
    error_message = "Todos los valores de vnet_tags deben ser strings no vacíos ni nulos."
  }
}

variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
}

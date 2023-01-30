variable "app_name" {
  type        = string
  description = "name of the app"
  default     = "deploy-first-containerapp"
}

variable "location" {
  type        = string
  description = "Location of Resources"
  default     = "canadacentral"
}

variable "environment" {
  type        = string
  description = "Environment"
  default     = "test"
}

variable "acr_name" {
  type    = string
  default = "deployfirstcontainerapp"
}

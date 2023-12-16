###### I know this is a terrible habit
variable "app_name" {}

variable "tenant" {}

variable "rg" {}

variable "subscription_id"{}

variable "storage_account_name" {}

variable "storage_container" {}

variable "location" {
  type        = string
  description = "Location of Resources"
  default     = "northeurope"
}

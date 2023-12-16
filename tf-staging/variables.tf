###### I know this is a terrible habit
variable "tenant" {}

variable "rg" {}

variable "subscription_id"{}

variable "acr_user"{}

variable "acr_pass"{}

variable "location" {
  type        = string
  description = "Location of Resources"
  default     = "northeurope"
}

variable "namespace" {
  type        = string
  description = "Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar'"
}

variable "environment" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. 'app' or 'jenkins'"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

variable "availability_zone" {
  type        = string
  default     = "eu-west-2a"
  description = "The Availability Zone in which to create your instance"
}

variable "blueprint_id" {
  type        = string
  default     = "wordpress"
  description = ""
}

variable "bundle_id" {
  type        = string
  default     = "micro_2_0"
  description = "The bundle of specification information"
}

variable "key_pair_name" {
  type        = string
  default     = ""
  description = "The name of your key pair. Created in the Lightsail console (cannot use aws_key_pair at this time)"
}

variable "user_data" {
  type        = string
  default     = ""
  description = "launch script to configure server with additional user data"
}

variable "create_static_ip" {
  type        = bool
  default     = true
  description = "Create and attach a statis IP to the instance"
}

variable "enable_email_alarm" {
  type        = bool
  default     = true
  description = "Enable metric for StatusCheckFailed which will notify using email"
}

variable "customer_email" {
  type        = string
  description = "Customers email address, used to track owners of the platform, used for notifications and reporting"
}

variable "customer_business_name" {
  type        = string
  description = "Customers business name, used for notifications and reporting"
}

variable "application" {
  type        = string
  description = "Application running on the lightsail instance e.g `website`"
}
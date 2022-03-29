variable "project_id" {
    description = "Project ID where the resources will be provisioned"
    type        = string
    default     = "hackathon-project-six"
}

variable "host_project_id" {
    description = "project ID of the shared VPC HOST Network. If left as 'null' will default to the value of 'project_id'"
    type        = string
    default     = null 
}

variable "region" {
    description = "The region where the resource will be provisioned"
    type        = string
    default     = "australia-southeast1"
}

variable "database_version" {
    description = "The version of the database, Ex, 'MYSQL_5_6 or 'POSTGRES_9_6'"
    type        = string
    default     = "POSTGRES_9_6"  
}

variable "tier" {
    description = "The machine type to use. See this page for supported tiers and pricing: https://cloud.google.com/sql/pricing"
    type        = string
    default     = "db-f1-micro"  
}

variable "availabilty type" {
    description = "This specifies whether a PostgresSQL instance should be set up for high availability (REGIONAL) or single zone (zonal)." 
    type        = string
    default     = "REGIONAL"
}

variable "disk_size_in_gb" {
    description = "The size of data disk, in GB. size of a running instance cannot be reduced but can be increased"
    type        = number
    default     = 10
}

variable "disk_type" {
    description = "The type of data disk: 'PD_SSD' or 'PD_HDD'."
    default     = "PD_SSD"
    type        = string
}

variable "disk_autoresize_is_enabled" {
    description = "Configuration to increase storage size automatically"
    type        = bool
    default     = true
}

variable "root_password" {
    description = "Intial root password for MS SQL server, ignored by MySQL and PostgreSQL"
    type        = string
    default     = null
}

variable "database_flags" {
    description = "Map of cloud SQL flags that are applied to the database server"
    type = list(map(string))
    default = [{
    name = "log_output"
    value = "FILE",
}]
}



variable "backup_configuration" {
    description = "Map of backup config flags that are applied to the database server"
    default = {
    enabled = false
}
    type = map(string)
}



variable "custom_labels" {
    description = "Map of workload specific Labels"
    type = map(string)
    default = {}
}



variable "operations_labels" {
    description = "Map of mandatory operations Labels"
    type = object({})
    default = {}
}

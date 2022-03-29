resource "google_sql_database_instance" "main" {
  provider          = google-beta
  project           = var.project_id
  name              = var.name
  region            = var.region # security control: GCP-SEC_CA_005-SQL-S1-V2
  database_version  = var.database_version


  settings {
    tier                = var.tier
    disk_size           = var.disk_size_in_gb
    disk_autoresize     = var.disk_autoresize_is_enabled
    disk_type           = var.disk_type


    backup_configuration {
      binary_log_enabled = lookup(var.backup_configuration, "binary_log_enabled", null)
      enabled            = lookup(var.backup_configuration, "enabled", null)
      location           = lookup(var.backup_configuration, "location", null)
      start_time         = lookup(var.backup_configuration, "start_time", null)
    }

    ip_configuration {
      ipv4_enabled    = true  # security control: GCP-SEC_NS_001-SQL-S1-V2
      require_ssl     = true  # security control: GCP-SEC_IP_003-SQL-S1-V2
}
}

  root_password = var.root_password
  lifecycle {
    ignore_changes = [settings.0.disk_size]
  }

  depends_on = [var.module_depends_on]
}

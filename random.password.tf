resource "random_string" "password" {
  length           = 16
  special          = true
  override_special = "/@\" "
}

resource "random_string" "dbpassword" {
  length           = 16
  special          = true
  override_special = "/@\" "
}

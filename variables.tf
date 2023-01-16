variable "bundle_id" {
  description = "ID of the bundle to deploy workspaces as"
  type = string
  default = ""
}
variable "username" {
  description = "workspace username"
  type = string
  default = ""
}

variable "directory_name" {
  description = "Active directory name"
  type = string
  default = ""
}
variable "password" {
  description = "Active directory password"
  type = string
  default = ""
}
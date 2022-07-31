variable "win-protocol" {
  type    = string
  default = "rdp"
}
variable "rdp-to-port" {
  type    = number
  default = 3389
}
variable "rdp-form-port" {
  type    = number
  default = 3389
}
variable "linux-protocol" {
  type    = string
  default = "rdp"
}
variable "ssh-to-port" {
  type    = number
  default = 22
}
variable "ssh-form-port" {
  type    = number
  default = 22
}

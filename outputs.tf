output "this_security_group_id" {
    description = "The ID of the security group"
    value       = "${var.security_group_id=="" ? join("",huaweicloud_networking_secgroup_v2.this.*.id) : var.security_group_id}"
}

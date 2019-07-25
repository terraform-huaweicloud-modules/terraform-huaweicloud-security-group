# Create Security Group
resource "huaweicloud_networking_secgroup_v2" "this" {
  count                = "${var.security_group_id=="" ? 1 : 0}"
  name                 = "${var.name}"
  description          = "${var.description}"
  delete_default_rules = "${var.delete_default_rules}"
}

# Create Security Group Rule
resource "huaweicloud_networking_secgroup_rule_v2" "this" {
  count 			= "${length(var.rules)}"
  direction         = "${lookup(var.rules[count.index], "direction")}"
  ethertype         = "${lookup(var.rules[count.index], "ethertype")}"
  protocol          = "${lookup(var.rules[count.index], "protocol")}"
  port_range_min    = "${lookup(var.rules[count.index], "port_range_min")}"
  port_range_max    = "${lookup(var.rules[count.index], "port_range_max")}"
  remote_ip_prefix  = "${lookup(var.rules[count.index], "remote_ip_cidr")}"
  security_group_id = "${var.security_group_id=="" ? join("",huaweicloud_networking_secgroup_v2.this.*.id) : var.security_group_id}"
}

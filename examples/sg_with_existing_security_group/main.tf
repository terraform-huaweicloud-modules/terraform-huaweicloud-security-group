provider "huaweicloud" {
  access_key  = "AK"
  secret_key  = "SK"
  auth_url    = "https://iam.cn-north-1.myhwclouds.com:443/v3"
  region      = "cn-north-1"
  tenant_name = "cn-north-1"
}

data "huaweicloud_networking_secgroup_v2" "default" {
  name = "default"
}

module "example" {
  source ="../.."

  security_group_id = "${data.huaweicloud_networking_secgroup_v2.default.id}"

  // Security Group Rule
  rules = [
    {
      direction      = "ingress",
      ethertype      = "IPv4",
      protocol       = "tcp",
      port_range_min = "22",
      port_range_max = "22",
      remote_ip_cidr = "0.0.0.0/0"
    },
    {
      direction      = "ingress",
      ethertype      = "IPv4",
      protocol       = "tcp",
      port_range_min = "443",
      port_range_max = "443",
      remote_ip_cidr = "0.0.0.0/0"
    },
  ]
}

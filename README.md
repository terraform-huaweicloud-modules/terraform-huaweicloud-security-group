# Huawei Cloud Security Group Terraform Module

Terraform moudle which create Security Group resource on Huawei Cloud.

These types of resources are supported:

* [Security Group](https://www.terraform.io/docs/providers/huaweicloud/r/networking_secgroup_v2.html)
* [Security Group Rule](https://www.terraform.io/docs/providers/huaweicloud/r/networking_secgroup_rule_v2.html)

## Usage

```hcl
module "example" {
  source = "terraform-huaweicloud-modules/security-group/huaweicloud"

  // Security Group
  name        = "testSG"
  description = "testSG description"

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
```

## Conditional creation

This moudle can create both Security Group and Security Group Rule, it is possible to use
existing security group only if you specify `security_group_id` parameter.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| security_group_id  | Specifying existing security group ID  | string  | `""`  | no  |
| name  | The name of the security group  | string  | `""`  | no  |
| description  | The description of the security group  | string  | `""`  | no  |
| delete_default_rules  | Whether or not to delete the default egress security rules  | bool  | `true`  | no  |
| rules  | List of rules associated with the security group  | list(map(string))  | `[]`  | no  |


## Outputs

| Name | Description |
|------|-------------|
| this_security_group_id | The id of the security group |

Authors
----
Created and maintained by [Zhenguo Niu](https://github.com/niuzhenguo)

License
----
Apache 2 Licensed. See LICENSE for full details.

# terraform-aws-teamcity

[![Build Status](https://github.com/JamesWoolfenden/terraform-aws-teamcity/workflows/Verify%20and%20Bump/badge.svg?branch=master)](https://github.com/JamesWoolfenden/terraform-aws-teamcity)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-teamcity.svg)](https://github.com/JamesWoolfenden/terraform-aws-teamcity/releases/latest)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/JamesWoolfenden/terraform-aws-teamcity.svg?label=latest)](https://github.com/JamesWoolfenden/terraform-aws-teamcity/releases/latest)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.14.0-blue.svg)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/JamesWoolfenden/terraform-aws-teamcity/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-teamcity&benchmark=CIS+AWS+V1.2)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![checkov](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/jameswoolfenden/terraform-aws-teamcity/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=JamesWoolfenden%2Fterraform-aws-teamcity&benchmark=INFRASTRUCTURE+SECURITY)

This module is to create a Teamcity CICD server on EC2. Its is fully automatic it install Teamcity as part of the userdata payload.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "teamcity" {
  source                      = "JamesWoolfenden/teamcity/aws"
  version                     = "0.1.21"
  ami_id                      = data.aws_ami.amazon.id
  associate_public_ip_address = false
  common_tags                 = var.common_tags
  instance_type               = var.instance_type
  key_name                    = var.key_name
  private_subnets             = data.aws_subnet_ids.private.ids
  public_subnets              = data.aws_subnet_ids.public.ids
  vpc_id                      = var.vpc_id
  listeners = [
    {
      instance_port      = 8111
      instance_protocol  = "http"
      lb_port            = 80
      lb_protocol        = "http"
      ssl_certificate_id = ""
    }
  ]
}
```

Using these as your values in your terraform tfvars file:

```YAML
common_tags={
    AccountType=           "Management"
    Application=           "base"
    Environment=           "Management"
}
```

## Costs

Monthly cost estimate:

```text
Project: .

 Name                                                Monthly Qty  Unit         Monthly Cost

 module.teamcity.aws_elb.service_elb
 ├─ Classic load balancer                                    730  hours              $21.46
 └─ Data processed                                             0  GB                  $0.00

 module.teamcity.aws_instance.teamcity
 ├─ Instance usage (Linux/UNIX, reserved, t2.micro)          730  hours               $0.00
 ├─ EC2 detailed monitoring                                    7  metrics             $2.10
 └─ root_block_device
    └─ Storage (general purpose SSD, gp2)                      8  GB-months           $0.93

 module.teamcity.aws_s3_bucket.artifact
 ├─ Glacier deep archive
 │  ├─ Storage                                                 0  GB-months           $0.00
 │  ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
 │  ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
 │  ├─ Lifecycle transition                                    0  1k requests         $0.00
 │  ├─ Retrieval requests (standard)                           0  1k requests         $0.00
 │  ├─ Retrievals (standard)                                   0  GB-months           $0.00
 │  ├─ Retrieval requests (bulk)                               0  1k requests         $0.00
 │  ├─ Retrievals (bulk)                                       0  GB-months           $0.00
 │  └─ Early delete (within 180 days)                          0  GB-months           $0.00
 ├─ Standard
 │  ├─ Storage                                                 0  GB-months           $0.00
 │  ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
 │  ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
 │  ├─ Select data scanned                                     0  GB-months           $0.00
 │  └─ Select data returned                                    0  GB-months           $0.00
 ├─ Intelligent tiering
 │  ├─ Storage (frequent access)                               0  GB-months           $0.00
 │  ├─ Storage (infrequent access)                             0  GB-months           $0.00
 │  ├─ Monitoring and automation                               0  1k objects          $0.00
 │  ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
 │  ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
 │  ├─ Lifecycle transition                                    0  1k requests         $0.00
 │  ├─ Select data scanned                                     0  GB-months           $0.00
 │  ├─ Select data returned                                    0  GB-months           $0.00
 │  └─ Early delete (within 30 days)                           0  GB-months           $0.00
 ├─ Standard - infrequent access
 │  ├─ Storage                                                 0  GB-months           $0.00
 │  ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
 │  ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
 │  ├─ Lifecycle transition                                    0  1k requests         $0.00
 │  ├─ Retrievals                                              0  GB-months           $0.00
 │  ├─ Select data scanned                                     0  GB-months           $0.00
 │  └─ Select data returned                                    0  GB-months           $0.00
 ├─ One zone - infrequent access
 │  ├─ Storage                                                 0  GB-months           $0.00
 │  ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
 │  ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
 │  ├─ Lifecycle transition                                    0  1k requests         $0.00
 │  ├─ Retrievals                                              0  GB-months           $0.00
 │  ├─ Select data scanned                                     0  GB-months           $0.00
 │  └─ Select data returned                                    0  GB-months           $0.00
 └─ Glacier
    ├─ Storage                                                 0  GB-months           $0.00
    ├─ PUT, COPY, POST, LIST requests                          0  1k requests         $0.00
    ├─ GET, SELECT, and all other requests                     0  1k requests         $0.00
    ├─ Lifecycle transition                                    0  1k requests         $0.00
    ├─ Retrieval requests (standard)                           0  1k requests         $0.00
    ├─ Retrievals (standard)                                   0  GB-months           $0.00
    ├─ Select data scanned (standard)                          0  GB-months           $0.00
    ├─ Select data returned (standard)                         0  GB-months           $0.00
    ├─ Retrieval requests (expedited)                          0  1k requests         $0.00
    ├─ Retrievals (expedited)                                  0  GB-months           $0.00
    ├─ Select data scanned (expedited)                         0  GB-months           $0.00
    ├─ Select data returned (expedited)                        0  GB-months           $0.00
    ├─ Retrieval requests (bulk)                               0  1k requests         $0.00
    ├─ Retrievals (bulk)                                       0  GB-months           $0.00
    ├─ Select data scanned (bulk)                              0  GB-months           $0.00
    ├─ Select data returned (bulk)                             0  GB-months           $0.00
    └─ Early delete (within 90 days)                           0  GB-months           $0.00

 PROJECT TOTAL                                                                       $24.49
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_local"></a> [local](#provider\_local) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_elb.service_elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |
| [aws_iam_instance_profile.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.teamcity-server](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.ssm-attach](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_s3_bucket.artifact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.artifact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_public_access_block.artifacts](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.artifact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.artifact](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |
| [aws_security_group.elb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.teamcity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [local_file.private_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [local_file.public_key_pem](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.dbpassword](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [random_string.password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [tls_private_key.teamcity](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | n/a | `number` | `10` | no |
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | Which image to use | `string` | n/a | yes |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | n/a | `bool` | `false` | no |
| <a name="input_backup_retention_period"></a> [backup\_retention\_period](#input\_backup\_retention\_period) | n/a | `number` | `14` | no |
| <a name="input_common_tags"></a> [common\_tags](#input\_common\_tags) | Implements the common\_tags scheme | `map(any)` | n/a | yes |
| <a name="input_elb-whitelist"></a> [elb-whitelist](#input\_elb-whitelist) | The allow list | `list(any)` | <pre>[<br>  "0.0.0.0/0"<br>]</pre> | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | MySQl Version | `string` | `"5.7.11"` | no |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | Instance DB size | `string` | `"db.t2.small"` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | THe instance type | `string` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | description | `string` | n/a | yes |
| <a name="input_kms_key"></a> [kms\_key](#input\_kms\_key) | n/a | `any` | n/a | yes |
| <a name="input_listeners"></a> [listeners](#input\_listeners) | Details for SSL redirect | <pre>list(object({ instance_port = number,<br>    instance_protocol  = string,<br>    lb_port            = number,<br>    lb_protocol        = string,<br>    ssl_certificate_id = string<br>  }))</pre> | n/a | yes |
| <a name="input_monitoring_interval"></a> [monitoring\_interval](#input\_monitoring\_interval) | The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance | `string` | `30` | no |
| <a name="input_monitoring_role_arn"></a> [monitoring\_role\_arn](#input\_monitoring\_role\_arn) | n/a | `string` | `""` | no |
| <a name="input_need_db"></a> [need\_db](#input\_need\_db) | Only create db when set | `number` | `0` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | n/a | `list(any)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | n/a | `list(any)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The id for the vpc | `string` | n/a | yes |
| <a name="input_whitelist"></a> [whitelist](#input\_whitelist) | The CIDRs that can have access to the instance | `list(any)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_artifact-bucket"></a> [artifact-bucket](#output\_artifact-bucket) | n/a |
| <a name="output_dbpassword"></a> [dbpassword](#output\_dbpassword) | n/a |
| <a name="output_elb"></a> [elb](#output\_elb) | n/a |
| <a name="output_password"></a> [password](#output\_password) | n/a |
| <a name="output_server"></a> [server](#output\_server) | n/a |
| <a name="output_teamcity_db"></a> [teamcity\_db](#output\_teamcity\_db) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Policy

This is the policy required to build this project:

<!-- BEGINNING OF PRE-COMMIT-PIKE DOCS HOOK -->
The Terraform resource required is:

```golang
resource "aws_iam_policy" "terraform_pike" {
  name_prefix = "terraform_pike"
  path        = "/"
  description = "Pike Autogenerated policy from IAC"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupEgress",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CreateKeyPair",
                "ec2:CreateSecurityGroup",
                "ec2:CreateTags",
                "ec2:DeleteKeyPair",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteTags",
                "ec2:DescribeAccountAttributes",
                "ec2:DescribeAvailabilityZones",
                "ec2:DescribeInstanceAttribute",
                "ec2:DescribeInstanceCreditSpecifications",
                "ec2:DescribeInstanceTypes",
                "ec2:DescribeInstances",
                "ec2:DescribeKeyPairs",
                "ec2:DescribeNetworkInterfaces",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeTags",
                "ec2:DescribeVolumes",
                "ec2:ImportKeyPair",
                "ec2:ModifyInstanceAttribute",
                "ec2:MonitorInstances",
                "ec2:RevokeSecurityGroupEgress",
                "ec2:RevokeSecurityGroupIngress",
                "ec2:RunInstances",
                "ec2:StartInstances",
                "ec2:StopInstances",
                "ec2:TerminateInstances",
                "ec2:UnmonitorInstances"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor1",
            "Effect": "Allow",
            "Action": [
                "elasticloadbalancing:AddTags",
                "elasticloadbalancing:AttachLoadBalancerToSubnets",
                "elasticloadbalancing:CreateLoadBalancer",
                "elasticloadbalancing:CreateLoadBalancerListeners",
                "elasticloadbalancing:DeleteLoadBalancer",
                "elasticloadbalancing:DescribeLoadBalancerAttributes",
                "elasticloadbalancing:DescribeLoadBalancers",
                "elasticloadbalancing:DescribeTags",
                "elasticloadbalancing:ModifyLoadBalancerAttributes",
                "elasticloadbalancing:RemoveTags"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor2",
            "Effect": "Allow",
            "Action": [
                "iam:AddRoleToInstanceProfile",
                "iam:AttachRolePolicy",
                "iam:CreateInstanceProfile",
                "iam:CreateRole",
                "iam:DeleteInstanceProfile",
                "iam:DeleteRole",
                "iam:DetachRolePolicy",
                "iam:GetInstanceProfile",
                "iam:GetRole",
                "iam:ListAttachedRolePolicies",
                "iam:ListInstanceProfilesForRole",
                "iam:ListRolePolicies",
                "iam:PassRole",
                "iam:RemoveRoleFromInstanceProfile",
                "iam:UpdateRoleDescription"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor3",
            "Effect": "Allow",
            "Action": [
                "rds:AddTagsToResource",
                "rds:CreateDBInstance",
                "rds:CreateDBSubnetGroup",
                "rds:DeleteDBSubnetGroup",
                "rds:DescribeDBInstances",
                "rds:DescribeDBSubnetGroups",
                "rds:ListTagsForResource",
                "rds:ModifyDBInstance",
                "rds:RemoveTagsFromResource"
            ],
            "Resource": "*"
        },
        {
            "Sid": "VisualEditor4",
            "Effect": "Allow",
            "Action": [
                "s3:CreateBucket",
                "s3:DeleteBucket",
                "s3:GetAccelerateConfiguration",
                "s3:GetBucketAcl",
                "s3:GetBucketCORS",
                "s3:GetBucketLogging",
                "s3:GetBucketObjectLockConfiguration",
                "s3:GetBucketPolicy",
                "s3:GetBucketPublicAccessBlock",
                "s3:GetBucketRequestPayment",
                "s3:GetBucketTagging",
                "s3:GetBucketVersioning",
                "s3:GetBucketWebsite",
                "s3:GetEncryptionConfiguration",
                "s3:GetLifecycleConfiguration",
                "s3:GetObject",
                "s3:GetObjectAcl",
                "s3:GetReplicationConfiguration",
                "s3:ListAllMyBuckets",
                "s3:ListBucket",
                "s3:PutBucketAcl",
                "s3:PutBucketPublicAccessBlock",
                "s3:PutBucketVersioning",
                "s3:PutEncryptionConfiguration"
            ],
            "Resource": "*"
        }
    ]
})
}


```
<!-- END OF PRE-COMMIT-PIKE DOCS HOOK -->

## Instructions

## Related Projects

Check out these related projects.

- [terraform-aws-codebuild](https://github.com/jameswoolfenden/terraform-aws-codebuild) - Making a Build pipeline

## Help

**Got a question?**

File a GitHub [issue](https://github.com/jameswoolfenden/terraform-aws-teamcity/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/jameswoolfenden/terraform-aws-teamcity/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2019-2022 James Woolfenden

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements. See the NOTICE file
distributed with this work for additional information
regarding copyright ownership. The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License. You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied. See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150

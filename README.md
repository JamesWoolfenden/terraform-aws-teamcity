
[![Slalom][logo]](https://slalom.com)

# terraform-aws-teamcity

[![Build Status](https://travis-ci.com/JamesWoolfenden/terraform-aws-teamcity.svg?branch=master)](https://travis-ci.com/JamesWoolfenden/terraform-aws-teamcity)
[![Latest Release](https://img.shields.io/github/release/JamesWoolfenden/terraform-aws-teamcity.svg)](https://github.com/JamesWoolfenden/terraform-aws-teamcity/releases/latest)
[![pre-commit](https://img.shields.io/badge/pre--commit-enabled-brightgreen?logo=pre-commit&logoColor=white)](https://github.com/pre-commit/pre-commit)
[![pre-commit](https://img.shields.io/badge/checkov-verified-brightgreen)](https://www.checkov.io/)

This module is to create a Teamcity CICD server in ec2.

---

It's 100% Open Source and licensed under the [APACHE2](LICENSE).

## Usage

Include this repository as a module in your existing terraform code:

```hcl
module "teamcity" {
  source       = "JamesWoolfenden/teamcity/aws"
  version      = "0.1.21"
  common_tags  = var.common_tags
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
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| aws | n/a |
| local | n/a |
| random | n/a |
| tls | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| ami\_id | Which image to use | `string` | n/a | yes |
| associate\_public\_ip\_address | n/a | `string` | `false` | no |
| common\_tags | Implements the common\_tags scheme | `map` | n/a | yes |
| elb-whitelist | n/a | `list` | <pre>[<br>  "0.0.0.0/0"<br>]<br></pre> | no |
| instance\_type | THe instance type | `string` | n/a | yes |
| key\_name | description | `string` | n/a | yes |
| listeners | Details for SSL redirect | <pre>list(object({ instance_port = number,<br>    instance_protocol  = string,<br>    lb_port            = number,<br>    lb_protocol        = string,<br>    ssl_certificate_id = string<br>  }))<br></pre> | n/a | yes |
| need\_db | Only create db when set | `number` | `0` | no |
| private\_subnets | n/a | `list` | n/a | yes |
| public\_subnets | n/a | `list` | n/a | yes |
| vpc\_id | n/a | `string` | n/a | yes |
| whitelist | The CIDRs that can have access to the instance | `list` | <pre>[<br>  "0.0.0.0/0"<br>]<br></pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| artifact-bucket | n/a |
| dbpassword | n/a |
| elb | n/a |
| password | n/a |
| server | n/a |
| teamcity\_db | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
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

Copyright © 2019-2020 [Slalom, LLC](https://slalom.com)

## License

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

See [LICENSE](LICENSE) for full details.

Licensed to the Apache Software Foundation (ASF) under one
or more contributor license agreements.  See the NOTICE file
distributed with this work for additional information
regarding copyright ownership.  The ASF licenses this file
to you under the Apache License, Version 2.0 (the
"License"); you may not use this file except in compliance
with the License.  You may obtain a copy of the License at

<https://www.apache.org/licenses/LICENSE-2.0>

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
KIND, either express or implied.  See the License for the
specific language governing permissions and limitations
under the License.

### Contributors

[![James Woolfenden][jameswoolfenden_avatar]][jameswoolfenden_homepage]<br/>[James Woolfenden][jameswoolfenden_homepage]

[jameswoolfenden_homepage]: https://github.com/jameswoolfenden
[jameswoolfenden_avatar]: https://github.com/jameswoolfenden.png?size=150
[logo]: https://gist.githubusercontent.com/JamesWoolfenden/5c457434351e9fe732ca22b78fdd7d5e/raw/15933294ae2b00f5dba6557d2be88f4b4da21201/slalom-logo.png
[website]: https://slalom.com
[github]: https://github.com/jameswoolfenden
[linkedin]: https://www.linkedin.com/company/slalom-consulting/
[twitter]: https://twitter.com/Slalom

[share_twitter]: https://twitter.com/intent/tweet/?text=terraform-aws-teamcity&url=https://github.com/jameswoolfenden/terraform-aws-teamcity
[share_linkedin]: https://www.linkedin.com/shareArticle?mini=true&title=terraform-aws-teamcity&url=https://github.com/jameswoolfenden/terraform-aws-teamcity
[share_reddit]: https://reddit.com/submit/?url=https://github.com/jameswoolfenden/terraform-aws-teamcity
[share_facebook]: https://facebook.com/sharer/sharer.php?u=https://github.com/jameswoolfenden/terraform-aws-teamcity
[share_email]: mailto:?subject=terraform-aws-teamcity&body=https://github.com/jameswoolfenden/terraform-aws-teamcity

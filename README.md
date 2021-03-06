<a href=https://magnetarconsulting.co.uk><img src="https://magnetarconsulting.co.uk/wp-content/uploads/2020/04/small-helping-you-innovate-magnetar.png" width="300"></a>

# terraform-aws-lightsail
Terraform (>= 0.12.0) module to create an Lightsail instance

[![Build Status](https://dev.azure.com/MagnetarIT/terraform-aws-lightsail/_apis/build/status/MagnetarIT.terraform-aws-lightsail?branchName=master)](https://dev.azure.com/MagnetarIT/terraform-aws-lightsail/_build/latest?definitionId=14&branchName=master) ![Latest Release](https://img.shields.io/github/release/MagnetarIT/terraform-aws-lightsail.svg)


- [Intro](#Intro)
- [Example](#Example)
- [Inputs](#Inputs)
- [Outputs](#Outputs)
- [Support](#Support)
- [License](#License)

----

## Example
```hcl

provider "aws" {
  region = "eu-west-2"
}

module "lightsail" {
  source = "../"
  namespace = "mag"
  environment = "dev"
  name = "myapp"
}

```

----

## Intro
This module will create the following resources
- Lightsail Instance
- Lightsail Key Pair (Optional)
- Lightsail Static IP (Optional)
- Metric alarm (Optional)

---

## Providers

| Name | Version |
|------|---------|
| aws | ~> 2.0 |
| null | ~> 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| availability\_zone | The Availability Zone in which to create your instance | `string` | `"eu-west-2a"` | no |
| blueprint\_id | n/a | `string` | `"wordpress"` | no |
| bundle\_id | The bundle of specification information | `string` | `"micro_2_0"` | no |
| create\_static\_ip | Create and attach a statis IP to the instance | `bool` | `true` | no |
| customer\_business\_name | Customers business name, used for notifications and reporting | `string` | n/a | yes |
| customer\_email | Customers email address, used to track owners of the platform, used for notifications and reporting | `string` | n/a | yes |
| enable\_email\_alarm | Enable metric for StatusCheckFailed which will notify using email | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | n/a | yes |
| key\_pair\_name | The name of your key pair. Created in the Lightsail console (cannot use aws\_key\_pair at this time) | `string` | `""` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | n/a | yes |
| namespace | Namespace, which could be your team, business name or abbreviation, e.g. 'mag' or 'tar' | `string` | n/a | yes |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |
| use\_default\_key\_pair | Default key pair name will be used, you must keep 'key\_pair\_name' empty | `string` | `"false"` | no |
| user\_data | launch script to configure server with additional user data | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| arn | n/a |
| availability\_zone | n/a |
| blueprint\_id | n/a |
| bundle\_id | n/a |
| created\_at | n/a |
| encrypted\_fingerprint | n/a |
| encrypted\_private\_key | n/a |
| fingerprint | n/a |
| id | n/a |
| ip\_address | n/a |
| key\_arn | n/a |
| key\_id | n/a |
| key\_pair\_name | n/a |
| private\_key | n/a |
| public\_key | n/a |
| staticip\_arn | n/a |
| staticip\_support\_code | n/a |
| user\_data | n/a |

---

## Support

Reach out to me at one of the following places!

- Website at <a href="https://magnetarconsulting.co.uk" target="_blank">`magnetarconsulting.co.uk`</a>
- Twitter at <a href="https://twitter.com/magnetarIT" target="_blank">`@magnetarIT`</a>
- LinkedIn at <a href="https://www.linkedin.com/company/magnetar-it-consulting" target="_blank">`magnetar-it-consulting`</a>

---

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

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.
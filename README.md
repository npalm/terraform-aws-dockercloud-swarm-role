# Terraform module for creating an AWS IAM role for DockerCloud Swarm

This module creates an AWS IAM for Docker Cloud Swarm. The module automates the steps decribes in Dockers guide to [Link Amazon Web Services to Docker Cloud](https://docs.docker.com/docker-cloud/cloud-swarm/link-aws-swarm/). Permissions are based on https://docs.docker.com/docker-for-aws/iam-permissions/ (last update 2018-02-02)


## Example usages:
```
module "dockercloud_swarm_role" {
  source = "npalm/dockercloud-swarm-role/aws"

  // default principals list
  principal_arns = ["arn:aws:iam::689684103426:root"]
}

```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| policy_name | Name of the created policy. | string | `dockercloud-swarm-policy` | no |
| prefix | Prefix for created resources | string | `` | no |
| principal_arns | List of ARNs (accounts) to grant dockercloud-swarm privilleges. | list | `<list>` | no |
| role_name | Name of the created role. | string | `dockercloud-swarm-role` | no |

## Outputs

| Name | Description |
|------|-------------|
| dockercloud_swarm_role_arn | ARN of the role created for dockercloud swarm. |

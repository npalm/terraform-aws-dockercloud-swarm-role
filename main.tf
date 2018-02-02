terraform {
  required_version = "> 0.11.0"
}

locals {
  resource_prefix = "${var.prefix == "" ? "" : "var.prefix-"}"
}

data "aws_iam_policy_document" "cross_account_policy" {
  statement {
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["${var.principal_arns}"]
    }

    actions = ["sts:AssumeRole"]

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"

      values = [
        "npalm",
      ]
    }
  }
}

resource "aws_iam_role" "dockercloud_swarm" {
  name               = "${local.resource_prefix}${var.role_name}"
  description        = "A role so that Docker Cloud can provision and manage swarms on your behalf."
  assume_role_policy = "${data.aws_iam_policy_document.cross_account_policy.json}"
}

data "template_file" "dockercloud_swarm_policy" {
  template = "${file("${path.module}/policies/dockercloud-swarm-permissions.json")}"
}

resource "aws_iam_role_policy" "docker_cloud" {
  name   = "${local.resource_prefix}${var.policy_name}"
  role   = "${aws_iam_role.dockercloud_swarm.name}"
  policy = "${data.template_file.dockercloud_swarm_policy.rendered}"
}

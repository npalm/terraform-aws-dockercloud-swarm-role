output "dockercloud_swarm_role_arn" {
  description = "ARN of the role created for dockercloud swarm."
  value       = "${aws_iam_role.dockercloud_swarm.arn}"
}

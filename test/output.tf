output "dockercloud_swarm_role_arn" {
  description = "ARN of the role created for dockercloud swarm."
  value       = "${module.dockercloud_swarm_role.dockercloud_swarm_role_arn}"
}

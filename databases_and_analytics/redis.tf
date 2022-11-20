# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster

# resource "aws_elasticache_cluster" "playground-redis" {
#   cluster_id           = "redis-cluster"
#   engine               = "redis"
#   node_type            = "cache.t2.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = "default.redis3.2"
#   engine_version       = "3.2.10"
#   port                 = 6379
# }
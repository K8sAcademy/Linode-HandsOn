output "data_center" {
  value = data.linode_lke_cluster.my-cluster.region
}

output "k8s_version" {
  value = data.linode_lke_cluster.my-cluster.k8s_version
}

output "default_pool_node_count" {
  value = data.linode_lke_cluster.my-cluster.pools[0].count
}
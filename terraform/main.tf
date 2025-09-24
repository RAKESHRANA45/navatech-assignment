terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "0.19.0"
    }
  }
}

provider "kind" {}

resource "kind_cluster" "ha_cluster" {
  name           = "ha-cluster"
  wait_for_ready = true

  kind_config = <<EOT
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOT
}

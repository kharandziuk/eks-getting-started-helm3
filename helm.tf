provider "helm" {
  version = "~>1.0.0"
  debug = true
  alias = "helm"

  kubernetes {
    host = aws_eks_cluster.demo.endpoint
    token = data.aws_eks_cluster_auth.demo.token
    cluster_ca_certificate = base64decode(aws_eks_cluster.demo.certificate_authority.0.data)
    load_config_file = false
  }
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com"
}

resource "helm_release" "mydatabase" {
  provider  = helm.helm
  name  = "mydatabase"
  chart = "stable/mariadb"
  namespace = "default"

  set {
    name  = "mariadbUser"
    value = "foo"
  }

  set {
    name  = "mariadbPassword"
    value = "qux"
  }
}

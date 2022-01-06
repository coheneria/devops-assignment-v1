#############################################################################
### Resource manifests for 3 namespaces reusing the application naming    ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_namespace" "app1" {
  metadata {
    name = var.apps.app1
    labels = {
      name  = var.apps_labels.name.app1
      tier  = var.apps_labels.tier.app1
      owner = var.apps_labels.owner.app1
    }
    annotations = {
      "serviceClass"       = var.apps_annotations.serviceClass.app1
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app2" {
  metadata {
    name = var.apps.app2
    labels = {
      name  = var.apps_labels.name.app2
      tier  = var.apps_labels.tier.app2
      owner = var.apps_labels.owner.app2
    }
    annotations = {
      "serviceClass"       = var.apps_annotations.serviceClass.app2
      "loadBalancer/class" = true
    }
  }
}

resource "kubernetes_namespace" "app3" {
  metadata {
    name = var.apps.app3
    labels = {
      name  = var.apps_labels.name.app3
      tier  = var.apps_labels.tier.app3
      owner = var.apps_labels.owner.app3
    }
    annotations = {
      "serviceClass"       = var.apps_annotations.serviceClass.app3
      "loadBalancer/class" = false
    }
  }
}
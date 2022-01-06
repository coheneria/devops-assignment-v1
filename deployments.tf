#############################################################################
### Deployment manifests for 3 applications (frontend, backend, database) ###
### feel free to change anything and to implement any function or method  ###
#############################################################################

resource "kubernetes_deployment" "app1" {
  metadata {
    name      = var.apps.app1
    namespace = var.apps.app1
    labels = {
      name = var.apps_labels.name.app1
      tier = var.apps_labels.tier.app1
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.apps_labels.name.app1
        tier = var.apps_labels.tier.app1
      }
    }
    template {
      metadata {
        name = var.apps.app1
        labels = {
          name = var.apps_labels.name.app1
          tier = var.apps_labels.tier.app1
        }
      }
      spec {
        container {
          name  = var.apps.app1
          image = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "app2" {
  metadata {
    name      = var.apps.app2
    namespace = var.apps.app2
    labels = {
      name = var.apps_labels.name.app2
      tier = var.apps_labels.tier.app2
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.apps_labels.name.app2
        tier = var.apps_labels.tier.app2
      }
    }
    template {
      metadata {
        name = var.apps.app2
        labels = {
          name = var.apps_labels.name.app2
          tier = var.apps_labels.tier.app2
        }
      }
      spec {
        container {
          name  = var.apps.app2
          image = "nginx"
        }
      }
    }
  }
}

resource "kubernetes_deployment" "app3" {
  metadata {
    name      = var.apps.app3
    namespace = var.apps.app3
    labels = {
      name = var.apps_labels.name.app3
      tier = var.apps_labels.tier.app3
    }
  }
  spec {
    selector {
      match_labels = {
        name = var.apps_labels.name.app3
        tier = var.apps_labels.tier.app3
      }
    }
    template {
      metadata {
        name = var.apps.app3
        labels = {
          name = var.apps_labels.name.app3
          tier = var.apps_labels.tier.app3
        }
      }
      spec {
        container {
          name  = var.apps.app3
          image = "mongo"
          env {
            username = var.secret.username
            password = var.secret.password
          }
        }
      }
    }
  }
}

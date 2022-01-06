### app names variables
variable "apps" {
  description = "exposed app names"
  type = "map"
  default = {
    "app1" = "stream-frontend"
    "app2" = "stream-backend"
    "app3" = "stream-database"
  }
}

### apps labels variables
variable "apps_labels" {
  description = "label for each app"
  type        = map(object({
    name = string
    tier = string
    owner = string
  }))
  default = {
    "app1" = {
      "name"  = "stream-frontend"
      "tier"  = "web"
      "owner" = "product"
    }
    "app2" = {
      "name"  = "stream-backend"
      "tier"  = "api"
      "owner" = "product"
    }
    "app3" = {
      "name"  = "stream-database"
      "tier"  = "shared"
      "owner" = "product"
    }
  }
}

### apps annotations variables
variable "apps_annotations" {
  description = "annotations for all apps"
  type        = map(object({
    serviceClass = string
    loadBalancer/class = string
  }))
  default = {
    "app1" = {
      "serviceClass"       = "web-frontend"
      "loadBalancer/class" = "external"
    }
    "app2" = {
      "serviceClass"       = "web-backend"
      "loadBalancer/class" = "internal"
    }
    "app3" = {
      "serviceClass"       = "database"
      "loadBalancer/class" = "disabled"
  }
  }
}

variable "acl_frontend" {
  description = "access allowed from this source"
  type = map(object({
    ingress  = string
    egress   = string
    port     = string
    protocol = string
  }))
  default = {
    frontend = {
      ingress  = "stream-backend"
      egress   = "0.0.0.0/0"
      port     = "80"
      protocol = "TCP"
    }
  }
}

variable "acl_backend" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    backend = {
      ingress  = "stream-frontend"
      egress   = "172.17.0.0/24"
      port     = "80"
      protocol = "TCP"

    }
  }
}

variable "acl_database" {
  description = "access allowed from this source"
  type = map(object({
    ingress = string
    egress  = string
    port     = string
    protocol = string
  }))
  default = {
    database = {
      ingress  = "stream-backend"
      egress   = "172.17.0.0/24"
      port     = "27017"
      protocol = "TCP"
    }
  }
}

### Creating 3 vars namespaces for our dev, prod & test environments. 
variable "environment" {
  description = "multiple environments to run the app"
  type = "map"
  default = {
    "env1" = "dev"
    "env2" = "prod"
    "env3" = "test"
  }
}

### Creating our secret's variable. 
variable "secret" {
  description = "secret configuration to access the db env"
  name = "k8s-secret"
  username = "dbexample"
  password = "P4ssw0rd"
}
### Question 3:

The back-end developers changed the port of the backend application, so we can't access it any more.
We need to change the "port" number to match what the backend developers configured.
For example:
In the code, the backend app listening on port "80" only from "172.17.0.0/24" IP range.
Let's say that the back-end developers changed the port to "443", in order for the app to listen to this new port, we need to change the port in our code and deploy it again, so the frontend can access the backend.

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
      port     = "443" //changed the port
      protocol = "TCP"

    }
  }
}

=========================================

### Question 4:

We can use the "resources" request in our "pod" definiation.
The resources management request let us configure a limit of all the resources a pod will consume.
We can define our request and limit.

For example, if we have frontend application, we can request a specific resources for the application:
resources:
 requests:
  memory: 300Mi //consume 300mb of ram
  cpu: "1" //consume 1 full cpu unit

this pod will request a 300 megabytes of ram & 1 cpu to preform.

Also, if the pod needs more resources, we can limit the pod resources so it'll not consume any resources rather then what we configured.

For example, we can "limit" the resources for our frontend application, so the pod can use this maximum resources:
 
 limits:
  memory: 500Mi //consume 500mb of ram
  cpu: "2" //consume 2 full cpu units

=========================================

### Question 5:

In the code, we can see that we have a single instance per frontend and backend tier.
We need to create more replicaes for our deployment, but when we do it, we can't route the traffic between the instances.

So the K8S object that missing is a "Service" object, with service object we can manage our traffic between the instances so it'll scale more efficiency. 

=========================================

### Question 6:

Creating variable for multiple environments, so we can run the app in 3 differnet namespace: dev, prod & test

variable "environment" {
  description = "multiple environments to run the app"
  type = "map"
  default = {
    "env1" = "dev"
    "env2" = "prod"
    "env3" = "test"
  }
}

After we created this, we need to configure it in our deployment so all the resources created in the seperated namespace. 

=========================================

### Question 7:

We can create a secret object that will contain our sensitive information. after that, we can use it in our deployment manifest to update our deployment using this environment variables.

      spec {
        container {
          name  = var.app.app3
          image = "mongo"
          env {
            username = var.secret.username
            password = var.secret.password
          }
        }
      }
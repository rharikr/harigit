variable "region" {
  default = "us-west-2"
}

variable "map_accounts" {
  description = "Additional AWS account numbers to add to the aws-auth configmap."
  type        = list(string)

  default = [
    "777777777777",
    "888888888888",
  ]
}

variable "istio_namespace" {
  default = "istio-system"
}

variable "app_namespace" {
  default = "sample-app"
}

variable "istio_version" {
  default = "1.4.0"
}
variable "app_version" {
  default = "1.0"
}

variable "istio_url_version" {
  default = "https://github.com/helm/charts/tree/master/incubator/istio/"
}
variable "istio_url_version" {
  default = "1.4.0"
}
variable "app_url_version" {
  default = "https://github.com/rharikr/harigit/tree/master/helm-chart-node/"
}
variable "app_version" {
  default = "1.0"
}
variable "map_roles" {
  description = "Additional IAM roles to add to the aws-auth configmap."
  type = list(object({
    rolearn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      rolearn  = "arn:aws:iam::66666666666:role/role1"
      username = "role1"
      groups   = ["system:masters"]
    },
  ]
}

variable "map_users" {
  description = "Additional IAM users to add to the aws-auth configmap."
  type = list(object({
    userarn  = string
    username = string
    groups   = list(string)
  }))

  default = [
    {
      userarn  = "arn:aws:iam::66666666666:user/user1"
      username = "user1"
      groups   = ["system:masters"]
    },
    {
      userarn  = "arn:aws:iam::66666666666:user/user2"
      username = "user2"
      groups   = ["system:masters"]
    },
  ]
}

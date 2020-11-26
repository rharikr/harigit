data "helm_repository" "istio" {
    name = "istio"
    url  = "${var.istio_url_version}"
}
resource "helm_release" "istio_init" {
  name       = "istio-init"
  repository = "${data.helm_repository.istio.url}"
  chart      = "istio-init"
  version    = "${var.istio_version}"
  namespace  = "${var.istio_namespace}"
}
resource "helm_release" "istio" {
  name       = "istio"
  repository = "${data.helm_repository.istio.url}"
  chart      = "istio"
  version    = "${var.istio_version}"
  namespace  = "${var.istio_namespace}"
  depends_on = ["helm_release.istio_init"]
  set {
    name="global.k8sIngressSelector"
    value="ingressgateway"
  }
  set {
     name="ingress.enable"
     value="true"
  }
  set{
     name = "gateways.enabled"
     value = "true"
   }
  set{
     name="gateways.istio-ingressgateway.type"
     value="NodePort"
  }
}

resource "helm_release" "test_platform" {
  name              = "test-platform-${terraform.workspace}"
  chart             = "${path.module}/../Test-Platform"
  values            = [file("${path.module}/../Test-Platform/${terraform.workspace}-values.yaml")]
  force_update      = true
  create_namespace  = true
  reuse_values      = false
}

resource "helm_release" "test_api" {
  name         = "test-api-${terraform.workspace}"
  namespace    = "test-${terraform.workspace}"
  chart        = "${path.module}/../Test-API"
  values       = [file("${path.module}/../Test-API/${terraform.workspace}-values.yaml")]
  force_update = true
  reuse_values = false
  depends_on = [helm_release.test_platform]
}

resource "helm_release" "test_ui" {
  name         = "test-ui-${terraform.workspace}"
  namespace    = "test-${terraform.workspace}"
  chart        = "${path.module}/../Test-UI"
  values       = [file("${path.module}/../Test-UI/${terraform.workspace}-values.yaml")]
  force_update = true
  reuse_values = false
  depends_on = [helm_release.test_platform]
}

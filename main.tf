terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.38"
    }
  }
}

# Configure the GitHub Provider
provider "github" {

#  app_auth {
#    id              = "371766"
#    installation_id = "40392571"
#    pem_file        = file("~/Downloads/steelecosystems.2023-09-24.private-key.pem")
#  }
  owner = "SteelecoSystems"
}

resource "github_actions_variable" "test-variable" {
  repository    = "tf-test"
  value         = "hello world"
  variable_name = "TEST_VARIABLE"
}

resource "github_actions_variable" "test-variable" {
  repository    = "tf-test"
  value         = "hello world"
  variable_name = "TEST_VARIABLE_2"
}
#resource "github_actions_secret" "test_secret" {
#  secret_name = "SECRET_NAME"
#  plaintext_value = "SECRET_${var.secret_name}"
#  repository = "tf-test"
#}
#
#resource "github_actions_secret" "test_secret_2" {
#  secret_name = "SECRET_${var.secret_name}"
#  plaintext_value = "SECRET_${var.secret_name}"
#  repository = "tf-test"
#}
#
#variable "secret_name" {
#  description = "The secret name"
#  type = string
#  sensitive = true
#}

/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
    
    ah_members = join(",", [for s in setunion(toset(formatlist("user:%s",tolist(var.ah_sharing_users))), toset(formatlist("group:%s",tolist(var.ah_sharing_groups)))) : format("%q", s)])

}
data "external" "get_token" {
  count   = length(var.resource_creator_identity) != 0 ? 0 : 1
  program = ["/bin/bash", "-c", "echo \"{\\\"token\\\":\\\"$(gcloud auth application-default print-access-token)\\\"}\""]
}

// Create AH Data Exchange

data "http" "non_conf_data_exchange" {
  count  = var.create_ah_non_conf_sharing ? 1 : 0
  url    = "https://analyticshub.googleapis.com/v1/projects/${module.project_radlab_sdw_non_conf_data.project_id}/locations/${var.region}/dataExchanges?dataExchangeId=non_conf_data_exchange_${local.random_id}"
  method = "POST"

  # request headers
  request_headers = {
    Authorization       = length(var.resource_creator_identity) != 0 ? "Bearer ${data.google_service_account_access_token.default[0].access_token}" : "Bearer ${data.external.get_token[0].result.token}",
    x-goog-user-project = "${module.project_radlab_sdw_non_conf_data.project_id}",
    Accept              = "application/json",
    Content-Type        = "application/json"
  }

  # request body
  request_body = "{\"displayName\":\"non_conf_data_exchange\",\"description\":\"Analytics Hub Data Exchange for Non-Confidential BQ dataset\"}"
  
  depends_on = [
    time_sleep.wait_120_seconds,
    # module.regional_reid_pipeline
  ]
}

resource "null_resource" "non_conf_data_exchange_check" {
  provisioner "local-exec" {
    command = contains([200, 201, 204], data.http.non_conf_data_exchange.0.status_code)
  }
}

// Create AH Data Exchange Listing

data "http" "non_conf_listing" {
  count  = var.create_ah_non_conf_sharing ? 1 : 0
  url    = "https://analyticshub.googleapis.com/v1/projects/${module.project_radlab_sdw_non_conf_data.project_id}/locations/${var.region}/dataExchanges/non_conf_data_exchange_${local.random_id}/listings?listingId=non_conf_listing_${local.random_id}"
  method = "POST"

  # request headers
  request_headers = {
    Authorization       = length(var.resource_creator_identity) != 0 ? "Bearer ${data.google_service_account_access_token.default[0].access_token}" : "Bearer ${data.external.get_token[0].result.token}",
    x-goog-user-project = "${module.project_radlab_sdw_non_conf_data.project_id}",
    Accept              = "application/json",
    Content-Type        = "application/json"
  }

  # request body
  request_body = "{\"bigqueryDataset\":{\"dataset\":\"projects/${module.project_radlab_sdw_non_conf_data.project_id}/datasets/${local.non_confidential_dataset_id}\"},\"displayName\":\"non_conf_listing\",\"description\":\"Analytics Hub Data Listing for Non-Confidential BQ dataset\"}"

  depends_on = [
    null_resource.non_conf_data_exchange_check
  ]
}

resource "null_resource" "non_conf_listing_check" {
  provisioner "local-exec" {
    command = contains([200, 201, 204], data.http.non_conf_listing.0.status_code)
  }
}

// Set IAM on AH Data Exchange

data "http" "non_conf_data_exchange_iam" {
  url      = "https://analyticshub.googleapis.com/v1/projects/${module.project_radlab_sdw_non_conf_data.project_id}/locations/${var.region}/dataExchanges/non_conf_data_exchange_${local.random_id}:setIamPolicy"
  method   = "POST"

  # request headers
  request_headers = {
    Authorization       = length(var.resource_creator_identity) != 0 ? "Bearer ${data.google_service_account_access_token.default[0].access_token}" : "Bearer ${data.external.get_token[0].result.token}",
    x-goog-user-project = "${module.project_radlab_sdw_non_conf_data.project_id}",
    Accept              = "application/json",
    Content-Type        = "application/json"
  }

  # request body
  request_body = "{\"policy\":{\"bindings\":[{\"members\":[${local.ah_members}],\"role\":\"roles/analyticshub.subscriber\"},{\"members\":[${local.ah_members}],\"role\":\"roles/analyticshub.viewer\"}]}}"

  depends_on = [
    null_resource.non_conf_data_exchange_check
  ]
}


resource "null_resource" "non_conf_data_exchange_iam_check" {
  provisioner "local-exec" {
    command = contains([200, 201, 204], data.http.non_conf_data_exchange_iam.status_code)
  }
}
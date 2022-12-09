/**
 * Copyright 2022 Google LLC
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

resource "google_storage_bucket_object" "file_upload" {
  name   = "sample_data/drivers_license.csv"
  bucket = module.secured_data_warehouse.data_ingestion_bucket_name
  source = "${path.module}/scripts/build/sample_data/drivers_license.csv"
}

resource "google_storage_bucket_object" "template_upload" {
  name   = "templates/deidentification.tpl"
  bucket = module.secured_data_warehouse.data_ingestion_bucket_name
  source = "${path.module}/templates/deidentification.tpl"
}

resource "google_storage_bucket_object" "schema_upload" {
  name   = "templates/schema.tpl"
  bucket = module.secured_data_warehouse.data_ingestion_bucket_name
  source = "${path.module}/templates/schema.tpl"
}

// BELOW CONFIGS TO BE REMOVED ONCE THE SDW MODULE DEVELOPMENT IS COMPLETED

data "google_storage_bucket" "sdw-data-ingest" {
  name = module.secured_data_warehouse.data_ingestion_bucket_name
  depends_on = [
    time_sleep.wait_120_seconds
  ]
}

module "sdw_data_ingest_bq_dataset" {
  source  = "terraform-google-modules/bigquery/google"
  version = "~> 5.2.0"

  project_id                  = module.project_radlab_sdw_data_ingest.project_id
  dataset_id                  = "dl_data_dataset"
  dataset_name                = "dl_data_dataset"
  description                 = "Sample Driver License Data"
  location                    = var.region
  delete_contents_on_destroy  = var.delete_contents_on_destroy
  external_tables = [
    {
      table_id              = "dl_data"
      autodetect            = true
      compression           = null
      ignore_unknown_values = true
      max_bad_records       = 0
      source_format         = "CSV"
      schema                = null
      expiration_time       = null

      labels = {
      }
      source_uris = ["${data.google_storage_bucket.sdw-data-ingest.url}/${google_storage_bucket_object.file_upload.output_name}"]
      csv_options = {
        quote                 = ""
        allow_jagged_rows     = false
        allow_quoted_newlines = false
        encoding              = "UTF-8"
        field_delimiter       = ","
        skip_leading_rows     = 1
      }
      hive_partitioning_options = null
      google_sheets_options     = null
    },
  ]
}
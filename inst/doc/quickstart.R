## ---- echo = FALSE-------------------------------------------------------
NOT_CRAN <- identical(tolower(Sys.getenv("NOT_CRAN")), "true")
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  purl = NOT_CRAN,
  eval = NOT_CRAN
)

## ----configure-----------------------------------------------------------
dwapi::configure(auth_token = Sys.getenv("DW_AUTH_TOKEN"))

## ----create_dataset------------------------------------------------------
create_cars_dataset = dwapi::dataset_create_request(
  title = sprintf("My cars dataset %s", runif(1)),
  visibility = "PRIVATE",
  license_string = "Other"
)

cars_dataset = dwapi::create_dataset(Sys.getenv("DW_USER"), create_cars_dataset)
cars_dataset

## ----update_dataset------------------------------------------------------
update_cars_dataset = dwapi::dataset_update_request(
  description = "This is a dataset created from R's cars dataset."
)

dwapi::update_dataset(cars_dataset$uri, update_cars_dataset)

## ----upload_data_frame---------------------------------------------------
upload_response <- dwapi::upload_data_frame(cars_dataset$uri, cars, "cars.csv")
Sys.sleep(10) # Files are processed asyncronously.
upload_response

## ----list_tables---------------------------------------------------------
tables = dwapi::list_tables(cars_dataset$uri)
tables

## ----get_table_schema----------------------------------------------------
dwapi::get_table_schema(cars_dataset$uri, tables[[1]])

## ----update_table_schema-------------------------------------------------
update_cars_schema = dwapi::table_schema_update_request(
  fields = list(dwapi::table_schema_field_update_request(name = "speed", description = "Top speed"))
)
dwapi::update_table_schema(cars_dataset$uri, tables[[1]], update_cars_schema)
dwapi::get_table_schema(cars_dataset$uri, tables[[1]])

## ----query---------------------------------------------------------------
sql_query = "SELECT * FROM cars"
dwapi::sql(cars_dataset$uri, sql_query)


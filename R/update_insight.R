"dwapi-r
Copyright 2018 data.world, Inc.

Licensed under the Apache License, Version 2.0 (the \"License\");
you may not use this file except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an \"AS IS\" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied. See the License for the specific language governing
permissions and limitations under the License.

This product includes software developed at data.world, Inc.
https://data.world"

#' Update an insight.
#' @param project_owner ID of project owner
#' @param project_id ID of project of which insight is a component
#' @param id ID of insight to be replaced
#' @param update_insight_req Request object of
#' type \code{\link{insight_update_request}}.
#' @return Object of type \code{\link{success_message}}.
#' @examples
#' \dontrun{
#'   dwapi::update_insight(
#'     project_owner = 'user',
#'     project_id = 'project',
#'     id = 'insight',
#'     insight_update_request(title='My Insight', image_url='https://...'))
#' }
#' @export
update_insight <-
  function(project_owner, project_id, id, update_insight_req) {

    url <- paste0(getOption("dwapi.api_url"), "/", "insights", "/",
                  project_owner, "/", project_id, "/", id)
    auth <- paste0("Bearer ", auth_token())

    response <-
      httr::PATCH(
        url,
        body = rjson::toJSON(update_insight_req),
        httr::add_headers(`Content-Type` = "application/json",
                          Authorization = auth),
        httr::user_agent(user_agent())
      )

    parse_success_or_error(response)

  }

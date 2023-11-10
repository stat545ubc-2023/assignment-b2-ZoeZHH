#' Count missing values for all columns by group
#'
#' @param data A data frame or tibble to process.
#' @param group_col Column in `data` to group by
#' @param .groups (OPTIONAL) Controls whether the
#' output data frame is grouped. By default,
#' drops all levels of grouping (`"drop"`). Specify
#' `"keep"` to keep the output data frame grouped by
#' `group`. See `summarize()` documentation in
#' `dplyr` for a full list of options.
#'
#' @return A data frame or tibble with the
#' levels of `group`, and the  number of NAs within
#' each level of `group` for all columns in
#' `data` except `group`.
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' count_all_missing_by_group(airquality, Month)
#' @importFrom dplyr summarize group_by across everything
count_all_missing_by_group <- function(data, group_col, .groups = "drop") {

  if(!is.null(.groups)) {
    if(!(.groups %in% c("drop_last", "drop",
                        "keep", "rowwise"))) {
      stop(".groups needs to be one of NULL,
         \"drop_last\", \"drop\", \"keep\",
         and \"rowwise\".")
    }
  }

  data |> group_by({{ group_col }}) |>
    summarize(across(everything(), ~sum(is.na(.x))),
              .groups = .groups)
}

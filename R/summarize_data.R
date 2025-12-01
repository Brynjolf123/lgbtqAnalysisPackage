#' Compute the statistical mode
#'
#' Computes the most frequent value in a vector.
#' If multiple values are tied, the first encountered is returned.
#'
#' @param x A vector (numeric, character, or factor).
#'
#' @return A single value: the mode of \code{x}.
#'
#' @keywords internal
.mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}


#' Summarize state-level data by region
#'
#' Aggregates a state-level dataset into region-level summaries by
#' computing the mean of numeric variables and the modal value of
#' categorical variables.
#'
#' @param data A data frame containing state-level variables including
#'   \code{region} and \code{historical}.
#'
#' @return A data frame with one row per region.
#'
#' @export
summarize_by_region <- function(data) {

  dplyr::summarise(
    dplyr::group_by(
      dplyr::select(data, -dplyr::any_of("state")),
      region
    ),
    gop_2016 = mean(gop_2016, na.rm = TRUE),
    laws = mean(laws, na.rm = TRUE),
    percent_urban = mean(percent_urban, na.rm = TRUE),
    historical = .mode(historical),
    .groups = "drop"
  )
}


#' Clean data
#'
#' @return A cleaned data frame
#' @export
#' @examples
#' \dontrun{
#' clean_data <- clean(data)
#' }
clean <- function(data) {
  dplyr::select(data, -dplyr::any_of("rownames"))
}

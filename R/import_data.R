#' Import data
#'
#' @param file_path Path to data file
#' @return A data frame
#' @export
#' @examples
#' \dontrun{
#' data <- import_data("path/to/file.csv")
#' }
import_data <- function(file_path) {
  # Start simple - make it work first
  read.csv(file_path)
}

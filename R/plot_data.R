#' Plot data of 'gop_2016' voting percentage and laws, mediated by historical party affiliation (color) and region (shapes)
#'
#'
#' @param data A scatter plot containing 'gop_2016' by 'laws', including 'historical' and 'region' data variables
#'
#' @return A scatter plot
#'
#' @export
plot_gop <- function(data) {
  p1 <- ggplot2::ggplot(data, ggplot2::aes(x = gop_2016, y = laws, color = historical, shape = region)) +
    ggplot2::geom_point() +
    ggplot2::labs(
      x = "Percent of Vote to GOP",
      y = "LGBTQ+ Rights Laws",
      color = "Historical Affiliation",
      title = "Number of LGBTQ+ Rights Laws by States GOP Voting Percentage in 2016"
      ) +
    ggplot2::theme_minimal()

  return(p1)
}

#' Plot data of 'percent_urban' (percent of pop. that lives in an urban area) and laws, mediated by historical party affiliation (color) and region (shapes)
#'
#'
#' @param data A scatter plot containing 'percent_urban' by 'laws', including 'historical' and 'region' data variables
#'
#' @return A scatter plot
#'
#' @export
plot_urban <- function(data) {
  p2 <- ggplot2::ggplot(data, ggplot2::aes(x = percent_urban, y = laws, color = historical, shape = region)) +
    ggplot2::geom_point() +
    ggplot2::labs(
      x = "Percent of Pop. in Urban Area",
      y = "LGBTQ+ Rights Laws",
      color = "Historical Affiliation",
      title = "Number of LGBTQ+ Rights Laws by States Urban Living Percentage in 2016"
    ) +
    ggplot2::theme_minimal()

  return(p2)
}

#' Plot data of states and laws, mediated by historical party affiliation (color)
#'
#'
#' @param data A bar plot containing 'states' by 'laws', including the 'historical' data variable
#'
#' @return A bar plot
#'
#' @export
plot_state <- function(data, top_n = 25) {
  # Sort by top states for better visualization
  data <- data[order(data$laws), ]
  # Make states a factor
  data$state <- factor(data$state, levels = data$state)

  p3 <- ggplot2::ggplot(data, ggplot2::aes(x = laws, y = state, fill = historical)) +
    ggplot2::geom_bar(stat = "identity") +
    ggplot2::labs(
      x = "Number of LGBTQ+ Rights Laws",
      y = "State",
      title = "LGBTQ+ Rights Laws by State"
    ) +
    ggplot2::theme_minimal() +
    ggplot2::theme(axis.text.y = ggplot2::element_text(size = 8))

  return(p3)
}


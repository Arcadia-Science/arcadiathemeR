#' Clean Arcadia Plot
#'
#' Generalized extension function for ggplot cleanup. Right now, cleans up axis titles and removes axis lines and whitespace depending on geom type.
#'
#' @return A ggplot object with capitalized axis titles
#' @import ggplot2
#' @import snakecase
#' @export
#'
#' @examples
#' \dontrun{
#' library(ggplot2)
#' library(snakecase)
#' p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point() + labs(x = "horsepower", y = "miles per gallon") + clean_plot()
#' }
clean_plot <- function() {
  structure(list(), class = "clean_plot")
}

#' @export
ggplot_add.clean_plot <- function(object, plot, object_name) {
  # Turn axis titles into sentence case
  if (!is.null(plot$labels$x)) {
    x_label <- plot$labels$x
    plot <- plot + ggplot2::labs(x = snakecase::to_sentence_case(x_label, sep_out = " "))
  }

  if (!is.null(plot$labels$y)) {
    y_label <- plot$labels$y
    plot <- plot + ggplot2::labs(y = snakecase::to_sentence_case(y_label, sep_out = " "))
  }

  # Pull out layers
  layers <- plot$layers
  
  # Getting info on geoms
  contains_tile <- any(sapply(layers, function(layer) {
    inherits(layer$geom, "GeomTile")
  }))

  contains_bar <- any(sapply(layers, function(layer) {
    inherits(layer$geom, "GeomBar")
  }))

  contains_histogram <- any(sapply(layers, function(layer) {
    inherits(layer$geom, "GeomHistogram")
  }))

  contains_density <- any(sapply(layers, function(layer) {
    inherits(layer$geom, "GeomDensity")
  }))

  # Check if plot is a geom_tile and remove axis lines if it is, and 
  # removes whitespace between axis and data
  if (contains_tile) {
    plot <- plot + 
      ggplot2::theme(
        axis.line = element_blank(),
        axis.ticks.x = element_blank(),
        axis.ticks.y = element_blank()
      ) +
      ggplot2::scale_x_continuous(expand = c(0,0)) +
      ggplot2::scale_y_continuous(expand = c(0,0))
  }

  # If a density plot or histogram, remove whitespace for both axes
  if (contains_histogram || contains_density) {
    plot <- plot +
      ggplot2::scale_x_continuous(expand = c(0,0)) +
      ggplot2::scale_y_continuous(expand = c(0,0))
  }

  # If a barplot, remove whitespace for y axis
  if (contains_bar) {
    plot <- plot +
      ggplot2::scale_y_continuous(expand = c(0,0))
  }

  return(plot)
}


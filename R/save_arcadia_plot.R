#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved
#' @param filepath The path where the plot will be saved
#' @param panel_size The size of the panel, one of "full_wide", "float_wide", "half_square", "full_square", "float_square"
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
#' save_arcadia_plot(p, "plot.pdf", "full_wide")
#' }
save_arcadia_plot <- function(filepath, plot, panel_size = c("full_wide", "float_wide", "half_square", "full_square", "float_square")) {
  # Ensure the panel_size argument is valid
  panel_size <- tryCatch(match.arg(panel_size), error = function(e) NA)

  if (is.na(panel_size)) {
    stop("Invalid panel_size. Please choose from: 'full_wide', 'float_wide', 'half_square', 'full_square', 'float_square'.")
  }

  # Set size based on panel size
  if (panel_size == "full_wide") {
    width <- 960
    height <- 1000
  } else if (panel_size == "float_wide") {
    width <- 660
    height <- 700
  } else if (panel_size == "half_square") {
    width <- 460
    height <- 500
  } else if (panel_size == "full_square") {
    width <- 470
    height <- 500
  } else if (panel_size == "float_square") {
    width <- 320
    height <- 350
  }

  # Use ggsave to save the plot
  ggplot2::ggsave(
    filename = filepath,
    plot = plot,
    device = "pdf",
    dpi = 72,
    width = width,
    height = height,
    units = "px"
  )
}

# Example usage
# library(ggplot2)
# p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
# save_arcadia_plot(p, "plot_full_wide.pdf", "full_wide")
# save_arcadia_plot(p, "plot_float_wide.pdf", "float_wide")
# save_arcadia_plot(p, "plot_half_square.pdf", "half_square")
# save_arcadia_plot(p, "plot_full_square.pdf", "full_square")
# save_arcadia_plot(p, "plot_float_square.pdf", "float_square")

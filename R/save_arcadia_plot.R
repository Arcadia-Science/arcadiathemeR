#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved
#' @param filepath The path where the plot will be saved
#' @param orientation The orientation of the plot, either "landscape" or "portrait"
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
#' save_arcadia_plot(p, "plot.pdf", "landscape")
#' }
save_arcadia_plot <- function(filepath, plot, orientation = c("landscape", "portrait")) {
  # Ensure the orientation argument is valid
  orientation <- match.arg(orientation)

  # Set size based on orientation
  if (orientation == "landscape") {
    width <- 11
    height <- 8
  } else if (orientation == "portrait") {
    width <- 8
    height <- 11
  }

  # Use ggsave to save the plot
  ggplot2::ggsave(
    filename = filepath,
    plot = plot,
    device = "pdf",
    dpi = 300,
    width = width,
    height = height,
    units = "in"
  )
}

# Example usage
# library(ggplot2)
# p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
# save_arcadia_plot(p, "plot_landscape.pdf", "landscape")
# save_arcadia_plot(p, "plot_portrait.pdf", "portrait")

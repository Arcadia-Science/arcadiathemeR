#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved
#' @param filepath The path where the plot will be saved
#' @param panel_size The size of the panel, one of "full_wide", "float_wide", "half_square", "full_square", "float_square"
#' @param transparent_bg Logical, whether to set the plot background to be transparent
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
#' save_arcadia_plot("plot_full_wide.pdf", p, "full_wide")
#' save_arcadia_plot("plot_float_wide.pdf", p, "float_wide")
#' save_arcadia_plot("plot_half_square.pdf", p, "half_square"
#' save_arcadia_plot("plot_full_square.pdf", p, "full_square")
#' save_arcadia_plot("plot_float_square.pdf", p, "float_square")
#' }
save_arcadia_plot <- function(filepath, plot, panel_size = c("full_wide", "float_wide", "half_square", "full_square", "float_square")) {
  # Ensure the panel_size argument is valid
  panel_size <- tryCatch(match.arg(panel_size), error = function(e) NA)

  if (is.na(panel_size)) {
    stop("Invalid panel_size. Please choose from: 'full_wide', 'float_wide', 'half_square', 'full_square', 'float_square'.")
  }

  # Set size based on panel size
  if (panel_size == "full_wide") {
    width <- 920
    height <- 340
  } else if (panel_size == "float_wide") {
    width <- 620
    height <- 340
  } else if (panel_size == "half_square") {
    width <- 420
    height <- 380
  } else if (panel_size == "full_square") {
    width <- 430
    height <- 430
  } else if (panel_size == "float_square") {
    width <- 280
    height <- 280
  }

  # Use ggsave to save the plot
  ggplot2::ggsave(
    filename = filepath,
    plot = plot,
    device = "pdf",
    dpi = 72,
    width = width,
    height = height,
    units = "px",
    bg = 'transparent'
  )
}

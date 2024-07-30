#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved as both a PDF and PNG
#' @param filepath The path where the plot will be saved
#' @param panel_size The size of the panel, one of "full_wide", "float_wide", "half_square", "full_square", "float_square", "landscape", and "portrait"
#' @param transparent_bg Logical, whether to set the plot background to be transparent
#'
#' @return None
#' @export
#'
#' @examples
#' \dontrun{
#' p <- ggplot(mtcars, aes(x = hp, y = mpg)) + geom_point()
#' save_arcadia_plot("plot_full_wide", p, "full_wide")
#' save_arcadia_plot("/path/to/figs/folder/plot_float_wide", p, "float_wide")
#' save_arcadia_plot("plot_half_square", p, "half_square"
#' save_arcadia_plot("plot_full_square", p, "full_square")
#' save_arcadia_plot("plot_float_square", p, "float_square")
#' }
save_arcadia_plot <- function(filepath, plot, panel_size = names(PANEL_OPTIONS), transparent_bg = TRUE) {
  # Ensure the panel_size argument is valid
  panel_size <- tryCatch(match.arg(panel_size), error = function(e) NA)

  if (is.na(panel_size)) {
    stop(paste("Invalid panel_size. Please choose from:", paste(names(PANEL_OPTIONS), collapse = ", "), "."))
  }

  # Set size based on panel size
  size <- PANEL_OPTIONS[[panel_size]]
  width <- size["width"]
  height <- size["height"]

  # Set background transparency
  bg <- if (transparent_bg) 'transparent' else 'white'

  # Generate file paths for both PDF and PNG
  pdf_filepath <- paste0(filepath, ".pdf")
  png_filepath <- paste0(filepath, ".png")

  # Use ggsave to save the plot as PDF
  ggplot2::ggsave(
    filename = pdf_filepath,
    plot = plot,
    device = "pdf",
    dpi = 72,
    width = width,
    height = height,
    units = "px",
    bg = bg
  )

  # convert pixels to inches for png
  size_pixels <- PANEL_OPTIONS[[panel_size]]
  width_pixels <- size_pixels["width"]
  height_pixels <- size_pixels["height"]
  dpi <- 72
  width_inches <- pixels_to_inches(width_pixels, dpi)
  height_inches <- pixels_to_inches(height_pixels, dpi)

  # Use ggsave to save the plot as PNG
  ggplot2::ggsave(
    filename = png_filepath,
    plot = plot,
    device = "png",
    dpi = 72,
    width = width_inches,
    height = height_inches,
    units = "in",
    bg = bg
  )
}

PANEL_OPTIONS<- list(
  full_wide = c(width = 920, height = 340),
  float_wide = c(width = 620, height = 340),
  half_square = c(width = 420, height = 380),
  full_square = c(width = 430, height = 430),
  float_square = c(width = 280, height = 280)
)

pixels_to_inches <- function(pixels, dpi = 72) {
  return(pixels / dpi)
}

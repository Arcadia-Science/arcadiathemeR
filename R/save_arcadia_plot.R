#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved as both a PDF and PNG
#' @param filepath The path where the plot will be saved
#' @param panel_size The size of the panel, one of "full_wide", "float_wide", "half_square", "full_square", "float_square", "landscape", and "portrait"
#' @param transparent_bg Logical, whether to set the plot background to be transparent
#' @param formats Vector of file formats to export the plot as. Default is "pdf". Can be "pdf", "png", or both.
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
save_arcadia_plot <- function(filepath, plot, panel_size = names(PANEL_OPTIONS), transparent_bg = TRUE, formats = c("pdf")) {
  # Ensure the panel_size argument is valid
  panel_size <- tryCatch(match.arg(panel_size), error = function(e) NA)

  if (is.na(panel_size)) {
    stop(paste("Invalid panel_size. Please choose from:", paste(names(PANEL_OPTIONS), collapse = ", "), "."))
  }

  # ensure formats argument is valid
  valid_formats <- c("pdf", "png")
  formats <- match.arg(formats, choices = valid_formats, several.ok = TRUE)

  # Set size based on panel size
  size <- PANEL_OPTIONS[[panel_size]]
  width <- size["width"]
  height <- size["height"]

  # Set background transparency
  bg <- if (transparent_bg) 'transparent' else 'white'

  # Save as PDF if specified
  if ("pdf" %in% formats) {
    pdf_filepath <- paste0(filepath, ".pdf")
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
  }

  # Save as PNG if specified
  if ("png" %in% formats) {
    png_filepath <- paste0(filepath, ".png")
    # convert pixels to inches for png
    width_inches <- pixels_to_inches(width)
    height_inches <- pixels_to_inches(height)

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

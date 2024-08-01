#' Save Arcadia Plot
#'
#' @param plot ggplot object to be saved
#' @param filepath The path where the plot will be saved without a file extension
#' @param panel_size The size of the panel, one of "full_wide", "float_wide", "half_square", "full_square", "float_square". Default is "full_square"
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
#' save_arcadia_plot("/path/to/figs/folder/plot_float_wide", p, "float_wide", formats = c("pdf", "png"))
#' save_arcadia_plot("plot_half_square", p, "half_square", formats = "png")
#' save_arcadia_plot("plot_full_square", p, "full_square")
#' save_arcadia_plot("plot_float_square", p, "float_square")
#' }
save_arcadia_plot <- function(filepath, plot, panel_size = "full_square", transparent_bg = TRUE, formats = c("pdf")) {
  # Ensure the panel_size argument is valid
  panel_size <- tryCatch(match.arg(panel_size, choices = names(PANEL_OPTIONS)), error = function(e) NA)

  if (is.na(panel_size)) {
    stop(paste("Invalid panel_size. Please choose from:", paste(names(PANEL_OPTIONS), collapse = ", "), "."))
  }

  # Ensure the formats argument is valid
  valid_formats <- names(FORMAT_OPTIONS)
  formats <- sapply(formats, function(fmt) tryCatch(match.arg(fmt, choices = valid_formats), error = function(e) NA))

  if (any(is.na(formats))) {
    stop(paste("Invalid format. Please choose from:", paste(valid_formats, collapse = ", "), "."))
  }

  # Set size based on panel size
  size <- PANEL_OPTIONS[[panel_size]]
  width <- size["width"]
  height <- size["height"]

  # Set background transparency
  bg <- if (transparent_bg) 'transparent' else 'white'

  # Save as specified formats
  for (format in formats) {
    filepath_with_ext <- paste0(filepath, ".", format)
    if (format == "pdf") {
      ggplot2::ggsave(
        filename = filepath_with_ext,
        plot = plot,
        device = "pdf",
        dpi = 72,
        width = width,
        height = height,
        units = "px",
        bg = bg
      )
    } else if (format == "png") {
      # Convert pixels to inches for png
      width_inches <- pixels_to_inches(width)
      height_inches <- pixels_to_inches(height)

      ggplot2::ggsave(
        filename = filepath_with_ext,
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
}

PANEL_OPTIONS <- list(
  full_wide = c(width = 920, height = 340),
  float_wide = c(width = 620, height = 340),
  half_square = c(width = 420, height = 380),
  full_square = c(width = 430, height = 430),
  float_square = c(width = 280, height = 280)
)

FORMAT_OPTIONS <- list(
  pdf = "pdf",
  png = "png"
)

pixels_to_inches <- function(pixels, dpi = 72) {
  return(pixels / dpi)
}

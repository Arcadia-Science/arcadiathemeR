#' Load in custom fonts
#'
#' @param font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_fonts <- function(font = "Suisse", fallback_font = "sans") {
  # Check if custom font is installed on the system
  # If not installed, use the OS default fallback font
  font_names <- c("Suisse Int'l", "Suisse Int'l Semi Bold", "Suisse Int'l Medium", "Suisse Int'l Mono")

  if (!(font_names[1] %in% extrafont::fonts())) {
    font <- system(sprintf("fc-match -f '%%{family}' %s", fallback_font), intern = TRUE)
    # Ubuntu returns "DejaVu Sans" while R looks for "DejaVuSans", so remove spaces
    if (Sys.info()["sysname"] == "Linux") {
      font <- gsub(" ", "", font)
    }
  }

  # Import and load fonts
  suppressMessages({
    invisible(utils::capture.output(extrafont::font_import(pattern = font, prompt = FALSE)))
    invisible(utils::capture.output(extrafont::loadfonts(device = "pdf", quiet = TRUE)))
  })

  # Check if custom fonts were successfully loaded
  available_fonts <- extrafont::fonts()
  missing_fonts <- setdiff(font_names, available_fonts)

  if (length(missing_fonts) == 0) {
    cat(sprintf("All custom fonts '%s' are successfully loaded.\n", paste(font_names, collapse = ", ")))
    return(font_names)
  } else {
    cat(sprintf("Custom fonts '%s' not found. Using fallback font '%s'.\n", paste(missing_fonts, collapse = ", "), fallback_font))
    return(rep(fallback_font, length(font_names)))
  }
}

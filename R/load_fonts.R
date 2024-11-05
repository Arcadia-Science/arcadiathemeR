#' Load in custom fonts
#'
#' @param custom_font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_fonts <- function(custom_font = "Suisse", fallback_font = "sans") {
  # check if custom font available
  font_family <- custom_font

  if (!("Suisse Int'l" %in% extrafont::fonts())) {
    font_family <- system(sprintf("fc-match -f '%%{family}' %s", fallback_font), intern = TRUE)
    # Ubuntu returns "DejaVu Sans" while R looks for "DejaVuSans", so remove spaces
    if (Sys.info()["sysname"] == "Linux") {
      font_family <- gsub(" ", "", font_family)
    }
  }

  # import and load fonts
  # suppress messages, below will handle incorrect loading
  suppressMessages({
    invisible(utils::capture.output(extrafont::font_import(pattern = font_family, prompt = FALSE)))
    invisible(utils::capture.output(extrafont::loadfonts(device = "pdf", quiet = TRUE)))
  })

  # define font names to check for
  font_names <- c("Suisse Int'l", "Suisse Int'l Semi Bold", "Suisse Int'l Medium", "Suisse Int'l Mono")
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
#' Get font family
#'
#' This function returns the font family to be used. It checks if the custom font is available in the list of available fonts. If the custom font is not available, it uses a fallback font.
#'
#' @param available_fonts Available font names.
#' @param custom_font Custom font family name to be used.
#' @param fallback_font Fallback font family name to be used in case custom font is not available.
#' 
#' @return Font family to be used in plots.
#' @export
#'
get_font_family <- function(available_fonts, custom_font = "Suisse", fallback_font = "sans") {
  if (!(custom_font %in% available_fonts)) {
    font_family <- system(sprintf("fc-match -f '%%{family}' %s", font_family), intern = TRUE)
    return(font_family)
  }
  return(custom_font)
}

#' Load in custom fonts
#'
#' @param custom_font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_fonts <- function(custom_font = "Suisse", fallback_font = "sans") {
  # define font names to check for
  available_fonts <- extrafont::fonts()
  font_names <- c("Suisse Int'l", "Suisse Int'l Semi Bold", "Suisse Int'l Medium", "Suisse Int'l Mono")
  font_family = get_font_family(available_fonts, custom_font, fallback_font)

  # import and load fonts
  # suppress messages, below will handle incorrect loading
  suppressMessages({
    invisible(utils::capture.output(extrafont::font_import(pattern = font_family, prompt = FALSE)))
    invisible(utils::capture.output(extrafont::loadfonts(device = "pdf", quiet = TRUE)))
  })

  # check if custom font available
  missing_fonts <- setdiff(font_names, available_fonts)
  if (length(missing_fonts) == 0) {
    cat(sprintf("All custom fonts '%s' are successfully loaded.\n", paste(font_names, collapse = ", ")))
    return(font_names)
  } else {
    cat(sprintf("Custom fonts '%s' not found. Using fallback font '%s'.\n", paste(missing_fonts, collapse = ", "), fallback_font))
    return(rep(fallback_font, length(font_names)))
  }
}
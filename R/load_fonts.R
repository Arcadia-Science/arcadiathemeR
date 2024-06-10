
#' Load in custom fonts
#'
#' @param custom_font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_font <- function(custom_font = "Suisse", fallback_font = "sans") {
  showtext::showtext_auto(enable = TRUE)

  font_files <- list.files(path = "~/Library/Fonts", pattern = custom_font, full.names = TRUE)

  if (length(font_files) > 0) {
    for (font_path in font_files) {
      font_name <- tools::file_path_sans_ext(basename(font_path))
      sysfonts::font_add(family = font_name, regular = font_path)
      cat(sprintf("Loaded font: %s from %s\n", font_name, font_path))
    }
    return(custom_font)
  } else {
    cat(sprintf("Custom font '%s' not found. Using fallback font '%s'.\n", custom_font, fallback_font))
    return(fallback_font)
  }
}

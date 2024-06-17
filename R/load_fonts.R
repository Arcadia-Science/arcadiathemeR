
#' Load in custom fonts
#'
#' @param custom_font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_fonts <- function(custom_font = "Suisse", fallback_font = "sans") {
  showtext::showtext_auto(enable = TRUE)

  # get all available fonts across the system
  available_fonts <- systemfonts::system_fonts()

  # get the custom font
  custom_font_files <- available_fonts[grepl(custom_font, available_fonts$family), ]

  if (nrow(custom_font_files) > 0) {
    for (i in 1:nrow(custom_font_files)) {
      font_path <- custom_font_files$path[i]
      font_name <- tools::file_path_sans_ext(basename(font_path))
      sysfonts::font_add(family = font_name, regular = font_path)
    }
    return(custom_font)
  } else {
    cat(sprintf("Custom font '%s' not found. Using fallback font '%s'. \n", custom_font, fallback_font))
    return(fallback_font)
  }
}


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
  font_names <- c("Suisse Int'l", "Suisse Int'l Semi Bold", "Suisse Int'l Medium", "Suisse Int'l Mono")
  default_sans_font <- system("fc-match -f '%{family}' sans", intern = TRUE)

  # import and load fonts
  # supress messages, below will handle incorrect loading
  suppressMessages({
    tryCatch(
      {
        invisible(utils::capture.output(extrafont::font_import(pattern = custom_font, prompt = FALSE)))
      },
      error = function(e) {
        invisible(utils::capture.output(extrafont::font_import(pattern = default_sans_font, prompt = FALSE)))
      },
      finally = {
        invisible(utils::capture.output(extrafont::loadfonts(device = "pdf", quiet = TRUE)))
      }
    )
  })

  # check if custom font available
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
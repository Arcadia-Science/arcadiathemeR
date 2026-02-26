#' Load in custom fonts
#'
#' @param custom_font Font family name to be loaded in
#' @param fallback_font Font family name to be used in case custom font not available
#'
#' @return Custom font families or fallback font to use in plots.
#' @export
#'
load_arcadia_fonts <- function(custom_font = "Atkinson Hyperlegible", fallback_font = "sans") {
  # Import and load fonts
  suppressMessages({
    tryCatch(
      # Try to import custom font
      {
        invisible(utils::capture.output(extrafont::font_import(pattern = custom_font, prompt = FALSE)))
      },
      # If custom font is not found, import the OS default for fallback font
      error = function(e) {
        font <- system(sprintf("fc-match -f '%%{family}' %s", fallback_font), intern = TRUE)
        # Ubuntu returns "DejaVu Sans" while R looks for "DejaVuSans", so remove spaces
        if (Sys.info()["sysname"] == "Linux") {
          font <- gsub(" ", "", font)
        }
        invisible(utils::capture.output(extrafont::font_import(pattern = font, prompt = FALSE)))
      },
      # Once imported, load fonts
      finally = {
        invisible(utils::capture.output(extrafont::loadfonts(device = "pdf", quiet = TRUE)))
      }
    )
  })

  # Check if custom fonts were successfully loaded
  font_names <- c("Atkinson Hyperlegible Next", "Atkinson Hyperlegible Next SemiBold", "Atkinson Hyperlegible Next Medium", "Atkinson Hyperlegible Mono")
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

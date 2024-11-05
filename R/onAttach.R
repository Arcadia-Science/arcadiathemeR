.onAttach <- function(libname, pkgname) {
  # startup message
  base::packageStartupMessage("Loading Suisse fonts...")
  # define exact fonts to load and check for
  FONT <- get_font_family(extrafont::fonts(), "Suisse", "sans")
  load_arcadia_fonts()
}

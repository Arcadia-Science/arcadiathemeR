.onAttach <- function(libname, pkgname) {
  # startup message
  base::packageStartupMessage("Loading fonts...")
  # define exact fonts to load and check for
  load_arcadia_fonts()
}

#' Arcadia main color palette function
#'
#' @param palette_name A character string specifying the name of the main color palette to retrieve. Possible values are elements in PALETTES.
#' @param start Starting position of color palette if want to use different subsets of the color palette
#' @param end Ending position of color palette if want to use different subsets of the color palette
#' @param reverse Boolean indicating whether to reverse the palette colors
#'
#' @description Function to pass the main color palettes to scale functions
#'
#' @return A function that can be used to generate the main Arcadia color palettes with different palette options.
#' @export
#' @examples
#' arcadia_palette("primary")
#' arcadia_palette("primary", start=4, end=6)
arcadia_palette <- function(palette_name, start = 1, end = NULL, reverse = FALSE) {

  if (!palette_name %in% PALETTE_NAMES) {
    stop("Invalid palette name. Choose from: ", paste(PALETTE_NAMES, collapse = ", "))
  }

  values <- unname(PALETTES[[palette_name]])

  if (is.null(end)) {
    end <- length(values)
  }

  if (reverse) {
    values <- rev(values)
  }

  if (start > length(values) || end > length(values)) {
    stop("Subsetting indices are out of range for the selected palette.")
  }

  values[start:end]
}

#' Show main palette options
#'
#' @description Shows the main color palette vectors with hex codes.
#'
#' @return Palette vectors with hex codes.
#' @export
#'
#' @examples
#' show_arcadia_palettes()
show_arcadia_palettes <- function() {
  return(PALETTES)
}

#' Arcadia gradient color palettes function
#'
#'
#' @param gradient_name A character string specifying the name of the gradient palette to retrieve. Possible values are elements in GRADIENTS.
#' @param reverse
#'
#' #' @description Function to return and check gradients when used in the scale_gradient* functions applied to a plot.
#'
#' @return A function that can be used to generate the Arcadia gradient palettes with different palette options.
#' @export
#' @importFrom grDevices colorRampPalette
#'
#' @examples
#' arcadia_gradient_palette("wine")
#' arcadia_gradient_palette("wine", reverse = TRUE)
arcadia_gradient_palette <- function(gradient_name, reverse = FALSE) {
  if (!gradient_name %in% GRADIENT_NAMES) {
    stop("Invalid gradient name. Choose from: ", paste(GRADIENT_NAMES, collapse = ", "))
  }

  palette <- GRADIENTS[[gradient_name]]

  if (reverse) {
    palette <- rev(palette)
  }
  return(colorRampPalette(palette))
}

#' Show gradient color palettes as a vector of hex codes
#'
#' @return Gradient palette vectors with hex codes
#' @export
#'
#' @examples
#' show_arcadia_gradients()
show_arcadia_gradients <- function() {
  return(GRADIENTS)
}

# all colors
AEGEAN <- c("#5088C5")
AMBER <- c("#F28360")
SEAWEED <- c("#3B9886")
CANARY <- c("#F7B846")
ASTER <- c("#7A77AB")
ROSE <- c("#F898AE")
VITAL <- c("#73B5E3")
TANGERINE <- c("#FFB984")
OAT <- c("#F5E4BE")
WISH <- c("#BABEE0")
LIME <- c("#97CD78")
DRAGON <- c("#C85152")
SKY <- c("#C6E7F4")
DRESS <- c("#F8C5C1")
TAUPE <- c("#DBD1C3")
DENIM <- c("#B6C8D4")
SAGE <- c("#B5BEA4")
MARS <- c("#DA9085")
MARINE <- c("#8A99AD")
SHELL <- c("#EDE0D6")
WHITE <- c("#FFFFFF")
GRAY <- c("#EBEDE8")
CHATEAU <- c("#BAB0A8")
BARK <- c("#8F8885")
SLATE <- c("#43413F")
CHARCOAL <- c("#484B50")
CROW <- c("#292928")
BLACK <- c("#09090A")
FOREST <- c("#596F74")
PARCHMENT <- c("#FEF7F1")
ZEPHYR <- c("#F4FBFF")
LICHEN <- c("#F7FBEF")
DAWN <- c("#F8F4F1")
LAPIS <- c("#2B65A1")
DUSK <- c("#094468")
MELON <- c("#FFCFAF")
CINNABAR <- c("#9E3F41")
SUN <- c("#FFD364")
MUSTARD <- c("#D68D22")
UMBER <- c("#A85E28")
IRIS <- c("#DCDFEF")
TANZANITE <- c("#54448C")
CONCORD <- c("#341E60")
GLASS <- c("#C3E2DB")
TEAL <- c("#6FBCAD")
ASPARAGUS <- c("#2A6B5E")
DEPTHS <- c("#09473E")
PUTTY <- c("#FFE3D4")
CANDY <- c("#E2718F")
AZALEA <- c("#C04C70")
STONE <- c("#EDE6DA")
MUD <- c("#635C5A")
ICE <- c("#E6EAED")
DOVE <- c("#CAD4DB")
CLOUD <- c("#ABBAC4")
STEEL <- c("#687787")
HEATHER <- c("#A96789")
TUMBLEWEED <- c("#E9A482")
WHEAT <- c("#F5DFB2")
SHIRE <- c("#4E7F72")
TOPAZ <- c("#FFCC7B")
SPACE <- c("#282A49")
LIME <- c("#97CD78")
BUTTER <- c("#FFFDBD")
REDWOOD <- c("#52180A")
BLOSSOM <- c("#F4CAE3")
SOIL <- c("#4D2500")
TERRACOTTA <- c("#964222")
BLUSH <- c("#FFF3F4")
LILAC <- c("#6862AB")
GHOST <- c("#FCF7FF")
FERN <- c("#47784A")

# Palettes
PRIMARY <- c(AEGEAN, AMBER, SEAWEED, CANARY, ASTER, ROSE, VITAL, TANGERINE, OAT, WISH, LIME, DRAGON)

PRIMARY_ORDERED <- c(AEGEAN, AMBER, CANARY, LIME, ASTER, ROSE, SEAWEED, DRAGON, VITAL, TANGERINE, OAT, WISH)

SECONDARY <- c(SKY, DRESS, TAUPE, DENIM, SAGE, MARS, MARINE, SHELL)

SECONDARY_ORDERED <- c(SKY, DRESS, TAUPE, SAGE, DENIM, MARS, SHELL, MARINE)

NEUTRALS <- c(WHITE, GRAY, CHATEAU, BARK, SLATE, CHARCOAL, CROW, BLACK, FOREST)

BLUESHADES <- c(SKY, VITAL, AEGEAN, LAPIS, DUSK)

ORANGESHADES <- c(MELON, TANGERINE, AMBER, DRAGON, CINNABAR)

YELLOWSHADES <- c(OAT, SUN, CANARY, MUSTARD, UMBER)

PURPLESHADES <- c(IRIS, WISH, ASTER, TANZANITE, CONCORD)

GREENSHADES <- c(GLASS, TEAL, SEAWEED, ASPARAGUS, DEPTHS)

PINKSHADES <- c(PUTTY, DRESS, ROSE, CANDY, AZALEA)

WARMGRAYSHADES <- c(STONE, TAUPE, CHATEAU, BARK, MUD)

COOLGRAYSHADES <- c(ICE, DOVE, CLOUD, MARINE, STEEL)

# Gradients
MAGMA <- c(CONCORD, TANZANITE, HEATHER, TUMBLEWEED, WHEAT)

VERDE <- c(DEPTHS, SHIRE, TOPAZ, PUTTY)

VIRIDIS <- c(SPACE, AEGEAN, LIME, BUTTER)

WINE <- c(REDWOOD, DRAGON, TANGERINE, PUTTY)

LISAFRANK <- c(DEPTHS, AEGEAN, WISH, BLOSSOM)

SUNSET <- c(SOIL, UMBER, TUMBLEWEED, TOPAZ, WHEAT)

ORANGES <- c(TERRACOTTA, TANGERINE, DAWN)

SAGES <- c(ASPARAGUS, SAGE, LICHEN)

ORANGE_SAGE <- c(TERRACOTTA, TANGERINE, DAWN, LICHEN, SAGE, ASPARAGUS)

REDS <- c(CINNABAR, DRAGON, BLUSH)

BLUES <- c(LAPIS, AEGEAN, ZEPHYR)

RED_BLUE <- c(CINNABAR, DRAGON, BLUSH, ZEPHYR, AEGEAN, LAPIS)

PURPLES <- c(LILAC, ASTER, GHOST)

GREENS <- c(FERN, LIME, LICHEN)

PURPLES_GREENS <- c(LILAC, ASTER, GHOST, LICHEN, LIME, FERN)

# Palette lists and names

PALETTE_NAMES <- c("primary", "secondary", "primary_ordered", "secondary_ordered", "neutrals", "blue_shades", "orange_shades", "yellow_shades", "purple_shades", "green_shades", "pink_shades", "warm_gray_shades", "cool_gray_shades")

PALETTES <- list(
  primary = PRIMARY,
  secondary = SECONDARY,
  primary_ordered = PRIMARY_ORDERED,
  secondary_ordered = SECONDARY_ORDERED,
  neutrals = NEUTRALS,
  blue_shades = BLUESHADES,
  orange_shades = ORANGESHADES,
  yellow_shades = YELLOWSHADES,
  purple_shades = PURPLESHADES,
  green_shades = GREENSHADES,
  pink_shades = PINKSHADES,
  warm_gray_shades = WARMGRAYSHADES,
  cool_gray_shades = COOLGRAYSHADES
)

GRADIENT_NAMES <- c("magma", "verde", "viridis", "wine", "lisafrank", "sunset", "oranges", "sages", "orangesage", "reds", "blues", "redblue", "purples", "greens", "purplegreen")

GRADIENTS <- list(
  magma = MAGMA,
  verde = VERDE,
  viridis = VIRIDIS,
  wine = WINE,
  lisafrank = LISAFRANK,
  sunset = SUNSET,
  oranges = ORANGES,
  sages = SAGES,
  orangesage = ORANGE_SAGE,
  reds = REDS,
  blues = BLUES,
  redblue = RED_BLUE,
  purples = PURPLES,
  greens = GREENS,
  purplegreen = PURPLES_GREENS
)

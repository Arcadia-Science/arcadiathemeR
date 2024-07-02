#' Arcadia main color palette function
#'
#' @param palette_name A character string specifying the name of the main color palette to retrieve.
#' @param start Starting position of color palette if want to use different subsets of the color palette
#' @param end Ending position of color palette if want to use different subsets of the color palette
#' @param reverse Boolean indicating whether to reverse the palette colors
#'
#' @description Possible values are "primary", "secondary", "neutrals", "blues", "oranges", "yellows", "purples", "greens", "pinks", "warm_grays", and "cool_grays"
#'
#' @return A function that can be used to generate the main Arcadia color palettes with different palette options.
#' @export
#' @examples
#' arcadia_palette("primary")
#' arcadia_palette("primary", start=4, end=6)
arcadia_palette <- function(palette_name, start = 1, end = NULL, reverse = FALSE) {
  palettes <- list(
    primary = primary,
    secondary = secondary,
    neutrals = neutrals,
    blues = blues,
    oranges = oranges,
    yellows = yellows,
    purples = purples,
    greens = greens,
    pinks = pinks,
    warm_grays = warm_grays,
    cool_grays = cool_grays
  )

  if (!palette_name %in% names(palettes)) {
    stop("Invalid palette name. Choose from 'primary', 'secondary', 'neutrals', 'blues', 'oranges', 'yellows', 'purples', 'greens', 'pinks', 'warm_grays', or 'cool_grays'.")
  }

  values <- unname(palettes[[palette_name]])

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
#' @description Shows the main color palette vectors with hex codes
#'
#' @return Palette vectors with hex codes
#' @export
#'
#' @examples
#' show_arcadia_main_palettes()
show_arcadia_main_palettes <- function() {
  palettes <- list(
    primary = primary,
    secondary = secondary,
    neutrals = neutrals,
    blues = blues,
    oranges = oranges,
    yellows = yellows,
    purples = purples,
    greens = greens,
    pinks = pinks,
    warm_grays = warm_grays,
    cool_grays = cool_grays
  )

  return(palettes)

}

#' Arcadia gradient color palettes function
#'
#'
#' @param gradient_name A character string specifying the name of the gradient palette to retrieve.
#' @param reverse
#'
#' #' @description Possible values are "magma", "verde", "viridis", "wine", "lisafrank", "sunset", "oranges", "sages", "orangesage", "reds", "blues", "redblue", "purples", "greens", and "purplegreen".
#'
#' @return A function that can be used to generate the Arcadia gradient palettes with different palette options.
#' @export
#'
#' @examples
#' arcadia_gradient_palette("wine")
#' arcadia_gradient_palette("wine", reverse = TRUE)
arcadia_gradient_palette <- function(gradient_name, reverse = FALSE) {
  gradients <- list(
    magma = magma,
    verde = verde,
    viridis = viridis,
    wine = wine,
    lisafrank = lisafrank,
    sunset = sunset,
    oranges = oranges_gradient,
    sages = sages_gradient,
    orangesage = orange_sage_gradient,
    reds = reds_gradient,
    blues = blues_gradient,
    redblue = red_blue_gradient,
    purples = purples_gradient,
    greens = greens_gradient,
    purplegreen = purples_greens_gradient
  )

  if (!gradient_name %in% names(gradients)) {
    stop("Invalid gradient name. Choose from 'magma', 'verde', 'viridis', 'wine', 'lisafrank', 'sunset', 'oranges', 'sages', 'orangesage', 'reds', 'blues', 'redblue', 'purples', 'greens', or 'purplegreen'. ")
  }

  pal <- gradients[[gradient_name]]

  if (reverse) {
    pal <- rev(pal)
  }
  return(colorRampPalette(pal))
}

#' Show gradient color palettes as a vector of hex codes
#'
#' @return Gradient palette vectors with hex codes
#' @export
#'
#' @examples
#' show_arcadia_gradient_palettes()
show_arcadia_gradient_palettes <- function() {
  gradients <- list(
    magma = magma,
    verde = verde,
    viridis = viridis,
    wine = wine,
    lisafrank = lisafrank,
    sunset = sunset,
    oranges = oranges_gradient,
    sages = sages_gradient,
    orangesage = orange_sage_gradient,
    reds = reds_gradient,
    blues = blues_gradient,
    redblue = red_blue_gradient,
    purples = purples_gradient,
    greens = greens_gradient,
    purplegreen = purples_greens_gradient
  )

  return(gradients)
}

# all colors
aegean <- c("#5088C5")
amber <- c("#F28360")
seaweed <- c("#3B9886")
canary <- c("#F7B846")
aster <- c("#7A77AB")
rose <- c("#F898AE")
vital <- c("#73B5E3")
tangerine <- c("#FFB984")
oat <- c("#F5E4BE")
wish <- c("#BABEE0")
lime <- c("#97CD78")
dragon <- c("#C85152")
sky <- c("#C6E7F4")
dress <- c("#F8C5C1")
taupe <- c("#DBD1C3")
denim	<- c("#B6C8D4")
sage <- c("#B5BEA4")
mars <- c("#DA9085")
marine <- c("#8A99AD")
shell <- c("#EDE0D6")
white <- c("#FFFFFF")
gray <- c("#EBEDE8")
chateau <- c("#BAB0A8")
bark <- c("#8F8885")
slate	<- c("#43413F")
charcoal <- c("#484B50")
crow <- c("#292928")
black <- c("#09090A")
forest <- c("#596F74")
parchment <- c("#FEF7F1")
zephyr <- c("#F4FBFF")
lichen <- c("#F7FBEF")
dawn <- c("#F8F4F1")
lapis <- c("#2B65A1")
dusk <- c("#094468")
melon <- c("#FFCFAF")
cinnabar <- c("#9E3F41")
sun <- c("#FFD364")
mustard <- c("#D68D22")
umber <- c("#A85E28")
iris <- c("#DCDFEF")
tanzanite <- c("#54448C")
concord <- c("#341E60")
glass <- c("#C3E2DB")
teal <- c("#6FBCAD")
asparagus <- c("#2A6B5E")
depths <- c("#09473E")
putty <- c("#FFE3D4")
candy <- c("#E2718F")
azalea <- c("#C04C70")
stone <- c("#EDE6DA")
mud <- c("#635C5A")
ice <- c("#E6EAED")
dove <- c("#CAD4DB")
cloud <- c("#ABBAC4")
steel <- c("#687787")
heather <- c("#A96789")
tumbleweed <- c("#E9A482")
wheat <- c("#F5DFB2")
shire <- c("#4E7F72")
topaz <- c("#FFCC7B")
space <- c("#282A49")
lime <- c("#97CD78")
butter <- c("#FFFDBD")
redwood <- c("#52180A")
blossom <- c("#F4CAE3")
soil <- c("#4D2500")
terracotta <- c("#964222")
blush <- c("#FFF3F4")
lilac <- c("#6862AB")
ghost <- c("#FCF7FF")
fern <- c("#47784A")

# main color palettes
primary <- c(aegean, amber, seaweed, canary, aster, rose, vital, tangerine, oat, wish, lime, dragon)

secondary <- c(sky, dress, taupe, denim, sage, mars, marine, shell)

neutrals <- c(white, gray, chateau, bark, slate, charcoal, crow, black, forest)

blues <- c(sky, vital, aegean, lapis, dusk)

oranges <- c(melon, tangerine, amber, dragon, cinnabar)

yellows <- c(oat, sun, canary, mustard, umber)

purples <- c(iris, wish, aster, tanzanite, concord)

greens <- c(glass, teal, seaweed, asparagus, depths)

pinks <- c(putty, dress, rose, candy, azalea)

warm_grays <- c(stone, taupe, chateau, bark, mud)

cool_grays <- c(ice, dove, cloud, marine, steel)

# gradient palettes
magma <- c(concord, tanzanite, heather, tumbleweed, wheat)

verde <- c(depths, shire, topaz, putty)

viridis <- c(space, aegean, lime, butter)

wine <- c(redwood, dragon, tangerine, putty)

lisafrank <- c(depths, aegean, wish, blossom)

sunset <- c(soil, umber, tumbleweed, topaz, wheat)

oranges_gradient <- c(terracotta, tangerine, dawn)

sages_gradient <- c(asparagus, sage, lichen)

orange_sage_gradient <- c(terracotta, tangerine, dawn, asparagus, sage, lichen)

reds_gradient <- c(cinnabar, dragon, blush)

blues_gradient <- c(lapis, aegean, zephyr)

red_blue_gradient <- c(cinnabar, dragon, blush, lapis, aegean, zephyr)

purples_gradient <- c(lilac, aster, ghost)

greens_gradient <- c(fern, lime, lichen)

purples_greens_gradient <- c(lilac, aster, ghost, fern, lime, lichen)


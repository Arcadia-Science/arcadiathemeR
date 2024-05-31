# Define the color palettes
Neutral <- c("#F4FBFF", "#FYF9FD", "#FFFDF7", "#FFFBF8", "#8F8885", "#43413F", "#292928")
names(Neutral) <- c("Zephyr", "Pale_Azure", "Orchid", "Buff", "Bark", "Slate", "Crow")

Accent <- c("#5088C5", "#F28360", "#3B9886", "#F7B846", "#7A77AB", "#F898AE")
names(Accent) <- c("Aegean", "Amber", "Seaweed", "Canary", "Aster", "Rose")

Lighter_accents <- c("#C6E7F4", "#F8C5C1", "#B5BEA4", "#F5E4BE", "#DCBFFC", "#F5CBE4")
names(Lighter_accents) <- c("Blue_sky", "Dress", "Sage", "Oat", "Periwinkle", "Blossom")

Accent_expanded <- c("#97CD78", "#73B5E3", "#FFB984", "#BAB0A8", "#C85152", "#8A99AD")
names(Accent_expanded) <- c("Lime", "Vital_blue", "Orange", "Chateau", "Dragon", "Marine_blue")

Lighter_accent_expanded <- c("#D1EADF", "#BABEE0", "#F1E8DA", "#DAD3C7", "#DA9085", "#B6C8D4")
names(Lighter_accent_expanded) <- c("Mint", "Wish", "Satin", "Taupe", "Mars", "Denim")

#' Arcadia color palettes
#'
#' @param palette_name A character string specifying the name of the palette to retrieve.
#' Possible values are "Neutral", "Accent", "Lighter_accents", "Accent_expanded", "Lighter_accent_expanded".
#'
#' @return A function that can be used to generate the palette.
#' @export
#' @examples
#' arcadia_palette("Neutral")
arcadia_palette <- function(palette_name) {
  palettes <- list(
    Neutral = Neutral,
    Accent = Accent,
    Lighter_accents = Lighter_accents,
    Accent_expanded = Accent_expanded,
    Lighter_accent_expanded = Lighter_accent_expanded
  )

  if (!palette_name %in% names(palettes)) {
    stop("Invalid palette name. Choose from 'Neutral', 'Accent', 'Lighter_accents', 'Accent_expanded', or 'Lighter_accent_expanded'.")
  }

  values <- unname(palettes[[palette_name]])
  max_n <- length(values)
  f <- scales::manual_pal(values)
  attr(f, "max_n") <- max_n
  f
}

#' Arcadia color scales
#'
#' Color scales using the colors from the Arcadia palettes.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @param palette_name The name of the palette to use. Possible values are "Neutral", "Accent", "Lighter_accents", "Accent_expanded", "Lighter_accent_expanded".
#' @family colour arcadia
#' @export
scale_color_arcadia <- function(palette_name = "Accent", ...) {
  ggplot2::discrete_scale("color", "arcadia", arcadia_palette(palette_name), ...)
}

#' @rdname scale_color_arcadia
#' @export
scale_color_arcadia <- scale_color_arcadia

#' @rdname scale_color_arcadia
#' @export
scale_fill_arcadia <- function(palette_name = "Accent", ...) {
  ggplot2::discrete_scale("fill", "arcadia", arcadia_palette(palette_name), ...)
}


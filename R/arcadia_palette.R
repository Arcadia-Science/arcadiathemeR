#' Arcadia color palettes
#'
#' @param palette_name A character string specifying the name of the palette to retrieve.
#' Possible values are "accent", "accent_expanded", "accent_ordered", and "light_ordered"
#'
#' @return A function that can be used to generate Arcadia palettes with different palette options
#' @export
#' @examples
#' arcadia_palette("accent")
arcadia_palette <- function(palette_name, start = 1, end = NULL) {
  palettes <- list(
    accent = accent,
    accent_expanded = accent_expanded,
    accent_ordered = accent_ordered,
    light_ordered = light_ordered
  )

  if (!palette_name %in% names(palettes)) {
    stop("Invalid palette name. Choose from 'accent', 'accent_expanded', 'accent_ordered', and 'light_ordered'.")
  }

  values <- unname(palettes[[palette_name]])

  if (is.null(end)) {
    end <- length(values)
  }

  if (start > length(values) || end > length(values)) {
    stop("Subsetting indices are out of range for the selected palette.")
  }

  values[start:end]
}

#' Arcadia color scales
#'
#' Color scales using the colors from the Arcadia palettes.
#'
#' @inheritParams ggplot2::scale_colour_hue
#' @param palette_name The name of the palette to use. Possible values are "accent", "accent_expanded", "accent_ordered", and "light_ordered"
#' @param n Integer specifying the number of colors to return
#' @rdname scale_color_arcadia
#' @export
scale_color_arcadia <- function(palette_name = "accent", start = 1, end = NULL, ...) {
  pal <- arcadia_palette(palette_name, start, end)
  ggplot2::discrete_scale("color", "arcadia", palette = function(n) pal, ...)
}

#' @rdname scale_color_arcadia
#' @export
scale_fill_arcadia <- function(palette_name = "accent", start = 1, end = NULL, ...) {
  pal <- arcadia_palette(palette_name, start, end)
  ggplot2::discrete_scale("fill", "arcadia", palette = function(n) pal, ...)
}

# Define the color palettes
accent <- c('#5088C5', '#F28360', '#3B9886', '#F7B846',
               '#7A77AB', '#F898AE', '#C6E7F4', '#F8C5C1',
               '#B5BEA4', '#F5E4BE', '#DCBFFC', '#F5CBE4')

accent_expanded <- c('#97CD78', '#73B5E3', '#FFB984',
                        '#BAB0A8', '#C85152', '#8A99AD',
                        '#D1EADF', '#BABEE0', '#F1E8DA',
                        '#DAD3C7', '#DA9085', '#B6C8D4')

accent_ordered <- c('#5088C5', '#F28360', '#F7B846', '#97CD78',
                    '#7A77AB', '#F898AE', '#3B9886', '#C85152',
                    '#73B5E3', '#BAB0A8', '#8A99AD', '#FFB984')

light_ordered <- c('#C6E7F4', '#F8C5C1', '#F5E4BE', '#B5BEA4',
                   '#DCBFFC', '#B6C8D4', '#DAD3C7', '#DA9085',
                   '#F5CBE4', '#D1EADF', '#BABEE0', '#F1E8DA')


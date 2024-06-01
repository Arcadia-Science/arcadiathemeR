#' Arcadia color palettes
#'
#' @param palette_name A character string specifying the name of the palette to retrieve.
#' @param start Starting position of color palette if want to use different subsets of the color palette
#' @param end Ending position of color paletteif want to use different subsets of the color palette
#'
#' @description Possible values are "accent", "accent_expanded", "accent_ordered", and "light_ordered"
#'
#' @return A function that can be used to generate Arcadia palettes with different palette options
#' @export
#' @examples
#' arcadia_palette("accent")
#' arcadia_palette("accent", start=4, end=6)
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
#' @family color arcadia
#' @rdname scale_arcadia
#' @param palette_name The name of the palette to use. Possible values are "accent", "accent_expanded", "accent_ordered", and "light_ordered"
#' @param start Start index to subset the palette
#' @param end End index to subset the palette

#' @export
#' @examples
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#' geom_point(size=2.5) +
#' theme_arcadia() +
#' scale_color_arcadia("accent")
#' }
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#' geom_point(size=2.5) +
#' theme_arcadia() +
#' scale_color_arcadia("accent", start=2, end=5)
#' }
scale_color_arcadia <- function(palette_name = "accent", start = 1, end = NULL, ...) {
  pal <- arcadia_palette(palette_name, start, end)
  ggplot2::discrete_scale("color", "arcadia", palette = function(n) pal, ...)
}

#' @rdname scale_arcadia
#' @export
#' @examples
#'
#' \dontrun{
#' ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) +
#' geom_density(alpha = 0.8) +
#' theme_arcadia() +
#' scale_fill_arcadia("accent")
#' }
#'
#' \dontrun{
#' ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) +
#' geom_density(alpha = 0.8) +
#' theme_arcadia() +
#' scale_fill_arcadia("accent", start=2, end=5)
#' }
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


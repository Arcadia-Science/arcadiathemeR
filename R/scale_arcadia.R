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
#' @param reverse A boolean indicating to reverse the palette colors

#' @export
#' @examples
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#'   geom_point(size=2.5) +
#'   theme_arcadia() +
#'   scale_color_arcadia("accent")
#' }
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#'  geom_point(size=2.5) +
#'  theme_arcadia() +
#'  scale_color_arcadia("accent", start=2, end=5)
#' }
scale_color_arcadia <- function(palette_name = "accent", start = 1, end = NULL, reverse = FALSE, ...) {
  pal <- arcadia_palette(palette_name, start, end, reverse)
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
#'  geom_density(alpha = 0.8) +
#'  theme_arcadia() +
#'  scale_fill_arcadia("accent", start=2, end=5)
#' }
scale_fill_arcadia <- function(palette_name = "accent", start = 1, end = NULL, reverse = FALSE, ...) {
  pal <- arcadia_palette(palette_name, start, end, reverse)
  ggplot2::discrete_scale("fill", "arcadia", palette = function(n) pal, ...)
}

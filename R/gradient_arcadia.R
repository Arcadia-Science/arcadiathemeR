#' Arcadia gradient color scales
#'
#' Gradient scales using the colors from the Arcadia gradient palettes.
#'
#' @rdname gradient_arcadia
#' @param palette_name The name of the palette to use. Possible values are "magma", "verde", "viridis", "wine", "lisafrank", "sunset", "oranges", "sages", "orangesage", "reds", "blues", "redblue", "purples", "greens", and "purplegreen".
#' @param reverse A boolean indicating to reverse the gradient palette colors

#' @export
#' @examples
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#'   geom_point(size=2.5) +
#'   theme_arcadia() +
#'   gradient_color_arcadia("magma")
#' }
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
#'  geom_point(size=2.5) +
#'  theme_arcadia() +
#'  gradient_color_arcadia("viridis", reverse = TRUE)
#' }
gradient_color_arcadia <- function(palette_name = "magma", reverse = FALSE, ...) {
  pal <- arcadia_gradient_palette(palette_name, reverse)
  ggplot2::scale_color_gradientn(colors = pal$colors, values = scales::rescale(pal$positions), ...)
}

#' @rdname scale_arcadia
#' @export
#' @examples
#'
#' \dontrun{
#' ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) +
#' geom_density(alpha = 0.8) +
#' theme_arcadia() +
#' gradient_fill_arcadia("magma")
#' }
#'
#' \dontrun{
#' ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) +
#'  geom_density(alpha = 0.8) +
#'  theme_arcadia() +
#'  gradient_fill_arcadia("magma", reverse = TRUE)
#' }
gradient_fill_arcadia <- function(palette_name = "magma", reverse = FALSE, ...) {
  pal <- arcadia_gradient_palette(palette_name, reverse)
  ggplot2::scale_fill_gradientn(colors = pal$colors, values = scales::rescale(pal$positions), ...)
}

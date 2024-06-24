#' Arcadia theme adhering to illustration style guides
#'
#' @param base_size Default size of text in plot
#' @param x_axis_type Type of the x-axis data("categorical" or "numerical")
#' @param y_axis_type Type of the y-axis data("categorical" or "numerical")
#'
#'
#' @return Layers onto an existing ggplot2 plot with a theme adhering to Arcadia style guidelines
#' @export
#'
#' @examples
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, y=mpg, color = as.factor(cyl))) +
#'   geom_point(size=2.5) +
#'   theme_arcadia()
#' }
#'
#' \dontrun{
#' ggplot(data=mtcars, aes(x=hp, fill = as.factor(cyl))) +
#'   geom_density(alpha=0.8) +
#'   theme_arcadia()
#' }

theme_arcadia <- function(base_size = 12, x_axis_type = "numerical", y_axis_type = "numerical") {
  # load all Suisse fonts and store
  loaded_suisse_fonts <- load_arcadia_fonts("Suisse")

  x_axis_family <- if (x_axis_type == "categorical") categorical_font else numerical_font
  y_axis_family <- if (y_axis_type == "categorical") categorical_font else numerical_font
  x_axis_label_family <- categorical_font
  y_axis_label_family <- categorical_font
  legend_label_family <- categorical_font
  legend_text_family <- if (x_axis_type == "categorical" || y_axis_type == "categorical") categorical_font else numerical_font # check both because depends on either to change the font


  x_axis_ticks <- if (x_axis_type == "categorical") ggplot2::element_blank() else ggplot2::element_line(color="black", size = 0.5)
  y_axis_ticks <- if (y_axis_type == "categorical") ggplot2::element_blank() else ggplot2::element_line(color="black", size = 0.5)

  ggplot2::theme_minimal(base_size = base_size) +

    # font specifications
  ggplot2::theme(
    plot.title = ggplot2::element_text(family = regular_font, size = base_size * 1.2, face = "bold"),
    axis.title.x = ggplot2::element_text(family = x_axis_label_family, size = base_size),
    axis.title.y = ggplot2::element_text(family = y_axis_label_family, size = base_size),
    axis.text.x = ggplot2::element_text(family = x_axis_family, size = base_size),
    axis.text.y = ggplot2::element_text(family = y_axis_family, size = base_size),
    legend.title = ggplot2::element_text(family = legend_label_family, size = base_size * 0.8),
    legend.text = ggplot2::element_text(family = legend_text_family, size = base_size * 0.7),


    # background specifications
    plot.background = ggplot2::element_rect(fill = background_fill, color = NA),
    panel.background = ggplot2::element_rect(fill = NA, color=NA),
    panel.border = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),

    # tick specifications
    axis.ticks.x = x_axis_ticks,
    axis.ticks.y = y_axis_ticks,
    axis.line = ggplot2::element_line(color="black", size = 0.5),

    # legend specifications
    legend.background = ggplot2::element_rect(fill = background_fill, color = NA),

    )
}

# color and font constants
background_fill <- "#FDF8F2"
regular_font <- "SuisseIntl-Regular"
categorical_font <- regular_font
numerical_font <- "SuisseIntlMono-Regular"

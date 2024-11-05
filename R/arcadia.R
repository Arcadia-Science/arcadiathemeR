#' Arcadia theme adhering to illustration style guides
#'
#' @param base_size Default size of text in plot
#' @param x_axis_type Type of the x-axis data("categorical" or "numerical")
#' @param y_axis_type Type of the y-axis data("categorical" or "numerical")
#' @param background Default set to TRUE to have parchment background fill, set to FALSE to be transparent
#' @param padding Amount of padding white-space to add around the plot
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

theme_arcadia <- function(x_axis_type = "numerical", y_axis_type = "numerical", background = TRUE, padding = c(.25, .25, .25, .25)) {

  # font types
  x_axis_family <- if (x_axis_type == "categorical") CATEGORICAL_FONT else NUMERICAL_FONT
  y_axis_family <- if (y_axis_type == "categorical") CATEGORICAL_FONT else NUMERICAL_FONT
  x_axis_label_family <- MEDIUM_FONT
  y_axis_label_family <- MEDIUM_FONT
  legend_label_family <- SEMIBOLD_FONT
  legend_text_family <- if (x_axis_type == "categorical" || y_axis_type == "categorical") CATEGORICAL_FONT else NUMERICAL_FONT # check both because depends on either to change the font

  # axis sizes
  x_axis_size <- if (x_axis_type == "categorical") 15 else 14.5
  y_axis_size <- if (y_axis_type == "categorical") 15 else 14.5

  # axis ticks
  x_axis_ticks <- if (x_axis_type == "categorical") ggplot2::element_blank() else ggplot2::element_line(color="black", size = 0.35) # size ratio to pts is 2.13, so .75 in pts is .35 here
  y_axis_ticks <- if (y_axis_type == "categorical") ggplot2::element_blank() else ggplot2::element_line(color="black", size = 0.35) # size ratio to pts is 2.13, so .75 in pts is .35 here

  # background fill
  background_color <- if (background == TRUE) BACKGROUND_FILL else 'transparent'

  ggplot2::theme_minimal() +

    # font specifications
  ggplot2::theme(
    plot.title = ggplot2::element_text(family = REGULAR_FONT, size = 16, face = "bold"),
    axis.title.x = ggplot2::element_text(family = x_axis_label_family, size = 15, vjust = -1),
    axis.title.y = ggplot2::element_text(family = y_axis_label_family, size = 15, vjust = +2),
    axis.text.x = ggplot2::element_text(family = x_axis_family, size = x_axis_size, color = "black"),
    axis.text.y = ggplot2::element_text(family = y_axis_family, size = y_axis_size, color = "black"),
    legend.title = ggplot2::element_text(family = legend_label_family, size = 16),
    legend.text = ggplot2::element_text(family = legend_text_family, size = 15),


    # background specifications
    plot.background = ggplot2::element_rect(fill = background_color, color = NA),
    panel.background = ggplot2::element_rect(fill = NA, color=NA),
    panel.border = ggplot2::element_blank(),
    panel.grid.major = ggplot2::element_blank(),
    panel.grid.minor = ggplot2::element_blank(),

    # tick specifications
    axis.ticks.x = x_axis_ticks,
    axis.ticks.y = y_axis_ticks,
    axis.ticks.length.x = ggplot2::unit(0.07, "in"), # 5 pixels is roughly 0.07 inches
    axis.ticks.length.y = ggplot2::unit(0.07, "in"),
    axis.line = ggplot2::element_line(color="black", size=0.35), # size ratio to pts is 2.13, so .75 in pts is .35 here

    # legend specifications
    legend.background = ggplot2::element_rect(fill = background_color, color = NA),
    plot.margin = ggplot2::unit(padding, "in")
  )
}

# font constants
FONT <- "Suisse"
if (!(FONT %in% extrafont::fonts())) {
  FONT <- system("fc-match -f '%%{family}' sans", intern = TRUE)
}
REGULAR_FONT <- paste(FONT, "Int'l")
SEMIBOLD_FONT <- paste(FONT, "Int'l Semi Bold")
MEDIUM_FONT <- paste(FONT, "Int'l Medium")
MONO_FONT <- paste(FONT, "Int'l Mono")

# axis label fonts which differ for categorical and numerical data
CATEGORICAL_FONT <- REGULAR_FONT
NUMERICAL_FONT <- MONO_FONT

# main font types
AXIS_TITLE_FONT <- MEDIUM_FONT
KEY_TITLE <- SEMIBOLD_FONT

# background fill options
BACKGROUND_FILL <- "#FDF8F2"

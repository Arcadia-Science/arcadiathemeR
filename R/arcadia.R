#' Arcadia theme adhering to illustration style guides
#'
#' @param base_size Default size of text in plot
#' @param base_family Default font family in plot
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
theme_arcadia <- function(base_size = 12, base_family = "NULL") {
  if (is.null(base_family)) {
    base_family <- load_arcadia_font()
  }
  ggplot2::theme_minimal(base_size = base_size, base_family = base_family) +

    # font specifications
    ggplot2::theme(
      plot.title = ggplot2::element_text(family = base_family, size = base_size * 1.2, face = "bold"),
      axis.title = ggplot2::element_text(family = base_family, size = base_size),
      axis.text = ggplot2::element_text(family = base_family, size = base_size * 0.8),
      legend.title = ggplot2::element_text(family = base_family, size = base_size * 0.8),
      legend.text = ggplot2::element_text(family = base_family, size = base_size * 0.7),

      # background specifications
      plot.background = ggplot2::element_rect(fill = "#FDF8F2", color = NA),
      panel.background = ggplot2::element_rect(fill = NA, color=NA),
      panel.border = ggplot2::element_blank(),
      panel.grid.major = ggplot2::element_blank(),
      panel.grid.minor = ggplot2::element_blank(),

      # tick specifications
      axis.ticks = ggplot2::element_line(color = "black", size = 0.5),
      axis.line = ggplot2::element_line(color = "black", size = 0.5),

      # legend specifications
      legend.background = ggplot2::element_rect(fill = "#FDF8F2", color = NA),

    )
}

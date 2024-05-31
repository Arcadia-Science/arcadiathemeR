#' Arcadia theme adhering to illustration style guides
#'
#' @param base_size Default size of test in plot
#' @param base_family Default font family in plot
#'
#' @return Reformatted ggplot with Arcadia Science style theme
#' @export
#'
#'
theme_arcadia <- function(base_size = 12, base_family = "sans") {
  ggplot2::theme(
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



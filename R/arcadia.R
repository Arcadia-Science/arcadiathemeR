# Arcadia theme adhering to illustration style guides
#
#
theme_arcadia <- function(base_size = 12, base_family = "sans") {
  ggplot2::theme(
    # background specifications
    plot.background = element_rect(fill = "#FDF8F2", color = NA),
    panel.background = element_rect(fill = NA, color=NA),
    panel.border = element_blank(),
    panel.grid.major = element_blank(),
    panel.gridminor = element_blank(),

    # tick specifications
    axis.ticks = element_line(color = "black", size = 0.5),
    axis.line = element_line(color = "black", size = 0.5)

  )
}

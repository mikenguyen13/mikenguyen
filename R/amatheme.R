#' American-Marketing-Association-ready theme for plots
#'
#' Create a custom ggplot2 theme that complies with the American Marketing Association style.
#' This theme removes major and minor gridlines, panel borders, and adds black lines along the axes.
#'
#' @return A custom ggplot2 theme object.
#' @import ggplot2
#' @export
amatheme <- function() {
  ggplot2::theme_bw(base_size = 14, base_family = "serif") + # This sets the base font size and family (Times New Roman)

    ggplot2::theme(
      # remove major gridlines
      panel.grid.major = ggplot2::element_blank(),

      # remove minor gridlines
      panel.grid.minor = ggplot2::element_blank(),

      # remove panel border
      panel.border = ggplot2::element_blank(),

      line = ggplot2::element_line(),

      # change font
      text = ggplot2::element_text(),

      # if you want to remove legend title
      # legend.title = ggplot2::element_blank(),

      legend.title = ggplot2::element_text(size = ggplot2::rel(0.6), face = "bold"),

      # change font size of legend
      legend.text = ggplot2::element_text(size = ggplot2::rel(0.6)),

      legend.background = ggplot2::element_rect(color = "black"),

      # legend.margin = ggplot2::margin(t = 5, l = 5, r = 5, b = 5),
      # legend.key = ggplot2::element_rect(color = NA, fill = NA),

      # change font size of main title
      plot.title = ggplot2::element_text(
        size = ggplot2::rel(1.2),
        face = "bold",
        hjust = 0.5,
        margin = ggplot2::margin(b = 15)
      ),

      plot.margin = ggplot2::unit(c(1, 1, 1, 1), "cm"),

      # add black line along axes
      axis.line = ggplot2::element_line(colour = "black", linewidth = 0.8),

      axis.ticks = ggplot2::element_line(),

      # axis title
      axis.title.x = ggplot2::element_text(size = ggplot2::rel(1.2), face = "bold"),
      axis.title.y = ggplot2::element_text(size = ggplot2::rel(1.2), face = "bold"),

      # axis text size
      axis.text.y = ggplot2::element_text(size = ggplot2::rel(1)),
      axis.text.x = ggplot2::element_text(size = ggplot2::rel(1))
    )
}

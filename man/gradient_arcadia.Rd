% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gradient_arcadia.R
\name{gradient_color_arcadia}
\alias{gradient_color_arcadia}
\title{Arcadia gradient color scales}
\usage{
gradient_color_arcadia(palette_name = "magma", reverse = FALSE, ...)
}
\arguments{
\item{palette_name}{The name of the palette to use. Possible values are "magma", "verde", "viridis", "wine", "lisafrank", "sunset", "oranges", "sages", "orangesage", "reds", "blues", "redblue", "purples", "greens", and "purplegreen".}

\item{reverse}{A boolean indicating to reverse the gradient palette colors}
}
\description{
Gradient scales using the colors from the Arcadia gradient palettes.
}
\examples{

\dontrun{
ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
  geom_point(size=2.5) +
  theme_arcadia() +
  gradient_color_arcadia("magma")
}

\dontrun{
ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
 geom_point(size=2.5) +
 theme_arcadia() +
 gradient_color_arcadia("viridis", reverse = TRUE)
}
}

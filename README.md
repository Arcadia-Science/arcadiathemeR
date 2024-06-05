
# arcadiathemeR

The goal of the arcadiathemeR package is to create ggplot2-style plots
in R that (mostly) adhere to Arcadia Science style guidelines.

## Installation

You can install arcadiathemeR from Github using the `remotes` package.
If you do not have this package installed you will need to do so before
installing the `arcadiathemeR` package.

``` r
# install.packages("remotes")
remotes::install_github("Arcadia-Science/arcadiathemeR")
```

## Usage

See the full vignette (TBD)

To access the functions in the arcadiathemeR package, load with:

``` r
library(arcadiathemeR)
```

The arcadiathemeR package is modeled after the [`ggthemes`
package](https://github.com/jrnold/ggthemes), layering on the plot theme
and color palettes in the same fashion as the `ggthemes` package.

``` r
library(ggplot2)
library(arcadiathemeR)

ggplot(data=mtcars, aes(x=hp, y=mpg, color=as.factor(cyl))) +
  geom_point(size=2.5) +
  theme_arcadia() +
  scale_color_arcadia("accent")
```

![](man/figures/README-base_use-1.png)<!-- -->

You can also select different indices of colors from the palettes within
the `scale` function:

``` r
ggplot(mtcars, aes(x = hp, fill = as.factor(cyl))) +
  geom_density(alpha = 0.8) +
  theme_arcadia() +
  scale_fill_arcadia("accent_expanded", start=2, end=5)
```

![](man/figures/README-scale_index-1.png)<!-- -->

## Development

To install the package locally while in development, follow the
instructions
[here](https://stackoverflow.com/questions/21171142/how-to-install-r-package-from-private-repo-using-devtools-install-github).
Briefly:

1.  Add a `.Renviron` file to the folder where you are going to install
    this package
2.  Create a Github personal access token, select “repo” to access
    private repositories
3.  Save the token in the `.Renviron` file as `GITHUBTOKEN=<string>`
4.  Install from a specific branch with:

``` r
remotes::install_github("Arcadia-Science/arcadiathemeR", \
ref="EAM/function_logic", \
auth_token=Sys.getenv("GITHUBTOKEN"))
```

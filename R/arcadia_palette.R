#' Arcadia color palettes
#'
#' @param palette_name A character string specifying the name of the palette to retrieve.
#' @param start Starting position of color palette if want to use different subsets of the color palette
#' @param end Ending position of color palette if want to use different subsets of the color palette
#' @param reverse Boolean indicating whether to reverse the palette colors
#'
#' @description Possible values are "accent", "accent_expanded", "accent_ordered", and "light_ordered"
#'
#' @return A function that can be used to generate Arcadia palettes with different palette options
#' @export
#' @examples
#' arcadia_palette("accent")
#' arcadia_palette("accent", start=4, end=6)
arcadia_palette <- function(palette_name, start = 1, end = NULL, reverse = FALSE) {
  palettes <- list(
    accent = accent,
    accent_expanded = accent_expanded,
    accent_ordered = accent_ordered,
    light_ordered = light_ordered
  )

  if (!palette_name %in% names(palettes)) {
    stop("Invalid palette name. Choose from 'accent', 'accent_expanded', 'accent_ordered', and 'light_ordered'.")
  }

  values <- unname(palettes[[palette_name]])

  if (is.null(end)) {
    end <- length(values)
  }

  if (reverse) {
    values <- rev(values)
  }

  if (start > length(values) || end > length(values)) {
    stop("Subsetting indices are out of range for the selected palette.")
  }

  values[start:end]
}

# Define the color palettes
accent <- c('aegean' = '#5088C5', 'amber' = '#F28360', 'seaweed' = '#3B9886', 'canary' = '#F7B846',
            'aster' = '#7A77AB', 'rose' = '#F898AE', 'blue sky' = '#C6E7F4', 'dress' = '#F8C5C1',
            'sage' = '#B5BEA4', 'oat' = '#F5E4BE', 'periwinkle' = '#DCBFFC', 'blossom' = '#F5CBE4')

accent_expanded <- c('lime' = '#97CD78', 'vital blue' = '#73B5E3', 'tangerine' = '#FFB984',
                      'chateau' = '#BAB0A8', 'dragon'= '#C85152', 'marine blue' = '#8A99AD',
                    'mint' = '#D1EADF', 'wish' = '#BABEE0', 'satin' = '#F1E8DA',
                    'taupe' =  '#DAD3C7', 'mars' = '#DA9085', 'denim' = '#B6C8D4')

accent_ordered <- c('aegean' = '#5088C5', 'amber' = '#F28360', 'canary' = '#F7B846',
                    'lime' = '#97CD78', 'aster' = '#7A77AB', 'rose' = '#F898AE',
                    'seaweed' = '#3B9886', 'dragon' = '#C85152', 'vital blue' = '#73B5E3',
                    'chateau' = '#BAB0A8', 'marine blue' = '#8A99AD', 'tangerine' = '#FFB984')

light_ordered <- c('blue sky' =  '#C6E7F4', 'dress' = '#F8C5C1', 'oat' = '#F5E4BE',
                   'sage' = '#B5BEA4', 'periwinkle' = '#DCBFFC', 'denim' = '#B6C8D4',
                   'taupe' = '#DAD3C7', 'mars' = '#DA9085', 'blossom' = '#F5CBE4',
                  'mint' = '#D1EADF', 'wish' = '#BABEE0', 'satin' = '#F1E8DA')

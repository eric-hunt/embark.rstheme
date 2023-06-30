#' Embark official color palette
#'
#' These are the official colors as listed on
#' the [Embark Webpage](https://embark-theme.github.io/)
#' in June 2023.
#' @source https://embark-theme.github.io/
#'
embark_official <- list(
  # Space
  space1 = "#100E23",
  space2 = "#1E1C31",
  space3 = "#2D2B40",
  space4 = "#3E3859",
  space5 = "#585273",
  # Astral
  astral1 = "#8A889D",
  astral2 = "#CBE3E7",
  # Nebula
  nebula01 = "#F48FB1",
  nebula02 = "#A1EFD3",
  nebula03 = "#FFE6B3",
  nebula04 = "#91DDFF",
  nebula05 = "#D4BFFF",
  nebula06 = "#ABF8F7",
  nebula07 = "#F02E6E",
  nebula08 = "#7FE9C3",
  nebula09 = "#F2B482",
  nebula10 = "#78A8FF",
  nebula11 = "#7676FF",
  nebula12 = "#63F2F1"
)

#' Palette shortcuts to use with `rsthemes`
#'
embark_palette <- c(
  embark_official,
  list(
    bg = embark_official$space2,
    bg_dark = embark_official$space1,
    bg_light = embark_official$space3,
    accent_dark = embark_official$space4,
    accent_light = embark_official$space5,
    fg = embark_official$astral2,
    fg_dark = embark_official$astral1,
    red = embark_official$nebula01,
    red_dark = embark_official$nebula07,
    green = embark_official$nebula02,
    green_dark = embark_official$nebula08,
    yellow = embark_official$nebula03,
    yellow_dark = embark_official$nebula09,
    blue = embark_official$nebula04,
    blue_dark = embark_official$nebula10,
    purple = embark_official$nebula05,
    purple_dark = embark_official$nebula11,
    cyan = embark_official$nebula06,
    cyan_dark = embark_official$nebula12
  )
)

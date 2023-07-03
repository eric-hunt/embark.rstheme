#' Create Embark .rstheme file
#'
#' @param install A Boolean - generate and install/apply the .rstheme file
#'  (TRUE), or generate the .scss file without installing/applying
#'
#' @export
embark_rstheme <- function(install = TRUE) {
  if (install) {
    theme_apply <- TRUE
    theme_as_sass <- FALSE
    theme_path = here::here("embark.rstheme")
  } else {
    theme_apply <- FALSE
    theme_as_sass <- TRUE
    theme_path = here::here("embark.scss")
  }
  rsthemes::rstheme(
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##  THEME META                                          >>
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    theme_name    = "Embark",
    theme_dark    = TRUE,
    theme_flat    = TRUE,
    theme_palette = embark_palette,
    theme_as_sass = theme_as_sass,
    theme_apply   = theme_apply,
    theme_path    = theme_path,
    #
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##  UI                                                  >>
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##-----------------------------------------
    ##  RStudio                              --
    ##-----------------------------------------
    ui_background                             = "$bg",
    ui_foreground                             = "$fg",
    ui_rstudio_background                     = "darken($bg, 2.5%)",
    ui_rstudio_foreground                     = "$fg",
    ui_rstudio_tabs_inactive_background       = "$bg",
    ui_rstudio_tabs_inactive_hover_background = "lighten($bg, 2%)",
    ui_rstudio_tabs_inactive_foreground       = "$fg_dark",
    ui_rstudio_tabs_active_background         = "$bg_light",
    ui_rstudio_tabs_active_foreground         = "$fg",
    #
    ##----------------------------------------
    ##  Interactions                        --
    ##----------------------------------------
    ui_cursor             = "transparentize($cyan, 0.25)",
    ui_selection          = "transparentize($red, 0.5)",
    ui_console_selection  = "$ui_selection",
    #
    ##----------------------------------------
    ##  Guides                              --
    ##----------------------------------------
    ui_line_active                      = "$bg_light",
    ui_line_active_selection            = "$ui_selection",
    ui_bracket                          = "transparentize($cyan, 0.5)",
    ui_invisible                        = "$accent_dark",
    ui_margin_line                      = "$accent_dark",
    ui_gutter_background                = "lighten($bg, 2%)",
    ui_gutter_foreground                = "$fg_dark",
    ui_debug_background                 = "transparentize($yellow, 0.75)",
    ui_completions_background           = "transparentize($bg, 0.25)",
    ui_completions_foreground           = "$fg",
    ui_completions_border               = "$accent_light",
    ui_completions_selected_background  = "$bg_light",
    ui_completions_selected_foreground  = "$fg",
    ui_fold_arrows_foreground           = "$fg",
    ui_fold_arrows_background           = "$accent_dark",
    #
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##  CODE                                                >>
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    code_string               = "$purple",
    code_namespace            = "$cyan",
    code_namespace_font_style = "italic",
    code_function             = "$yellow",
    code_value                = "$green",
    code_comment              = "$fg_dark",
    code_variable             = "$cyan_dark",
    code_message              = "$red",
    code_reserved             = "$yellow",
    code_operator             = "$yellow_dark",
    code_identifier           = "$fg",
    code_bracket              = "$fg_dark",
    #
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##  RMD                                                >>
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    rmd_chunk_background    = "$bg_light",
    rmd_heading_foreground  = "$cyan_dark",
    rmd_chunk_header        = "$purple",
    rmd_href                = "$green_dark",
    #
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##  SCSS / PARTIALS                                    >>
    ##>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ##-----------------------------------------
    ##  Command palette                      --
    ##-----------------------------------------
    rsthemes::rstheme_command_palette(
      item_hover_background = "lighten($bg, 5%)",
      item_selected_background = "$accent_dark"
    ),
    #
    ##-----------------------------------------
    ##  Rainbow parentheses                  --
    ##-----------------------------------------
    rsthemes::rstheme_rainbow_parentheses(
      "$fg_dark",
      "$purple",
      "$green_dark",
      "$red",
      "$yellow",
      "$blue_dark",
      "$fg"
    ),
    #
    ##----------------------------------------
    ##  Use large tabs                      --
    ##----------------------------------------
    rsthemes::rstheme_large_tabs(),
    #
    ##----------------------------------------
    ##  Dialog options                      --
    ##----------------------------------------
    rsthemes::rstheme_dialog_options(
      heading_foreground = "$rmd_heading_foreground",
      help_foreground = "$fg_dark",
      border = "$bg_light",
      selected_background = "$bg_light",
      button_border = "$bg_light",
      button_hover_background = "lighten($bg, 2%)",
      input_border = "$accent_dark",
      input_background = "$bg_light",
      input_foreground = "$code_string",
      checkbox_background = "$accent_light",
      select_background = "$bg_light"
    ),
    #
    ##-----------------------------------------
    ##  Terminal colors                      --
    ##-----------------------------------------
    rsthemes::rstheme_terminal_colors(
      theme_dark = TRUE,
      red = "$red_dark",
      red_bright = "$red",
      green = "$green_dark",
      green_bright = "$green",
      yellow = "$yellow_dark",
      yellow_bright = "$yellow",
      blue = "$blue_dark",
      blue_bright = "$blue",
      cyan = "$cyan_dark",
      cyan_bright = "$cyan",
      magenta = "$purple_dark",
      magenta_bright = "$purple",
      white = "darken($fg, 10%)",
      white_bright = "darken($fg, 5%)",
      black = "$accent_light",
      black_bright = "lighten($accent_light, 10%)"
    ),
    #
    ##-----------------------------------------
    ##  Flat theme extras                    --
    ##-----------------------------------------
    # I used this snippet found in the the `rsthemes` Material theme code at
    # https://github.com/gadenbuie/rsthemes inst/templates/material.R
    ".rstudio-themes-flat .gwt-TabLayoutPanelTab-selected {
      .gwt-TabLayoutPanelTabInner .rstheme_tabLayoutCenter {
        box-shadow: 0 3px 0 $cyan inset;
        border-radius: 0 !important;
      }
    }",
    "/* remove border from panes */
      .rstudio-themes-flat
      :-webkit-any(.windowframe, .rstheme_minimizedWindowObject)
      > div:last-child {
      border-color: $ui_rstudio_background !important;
      }",
    '#rstudio_command_palette_list [id^="rstudio_command_entry_"] >
      :first-child:not([id]) {
        background-color: $cyan;
        .gwt-Label {
          color: $bg;
        }
      }
    .ace_comment {
      font-style: italic;
    }'
  )
}

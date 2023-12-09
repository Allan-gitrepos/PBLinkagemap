#' Lmap UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_Lmap_ui <- function(id){
  ns <- NS(id)
  tagList(
    fluidRow(
      box(
        title = "Linkage map",
        closable = TRUE,
        solidHeader = T,
        width = 12,
        height = 500,
        status = "warning",

        collapsible = TRUE,
        label = boxLabel(
          text = 'new',
          status = "danger"
        ),
        dropdownMenu = boxDropdown(
          boxDropdownItem("Link to Github", href = "https://github.com/Allan-gitrepos"),
          boxDropdownItem("Link to PBperfect", href = "https://allanbiotools.shinyapps.io/pbperfect/")
        ),
        sidebar = boxSidebar(
          startOpen = T,
          id = "side",
          sliderInput(
            inputId = "ht",
            label = "Height:",
            min = 0,
            max = 1000,
            value = 500
          ),

          sliderInput(
            inputId = "wd",
            label = "Width:",
            min = 0,
            max = 1000,
            value = 500
          ),

          sliderInput(
            inputId = "txt",
            label = "Text Size:",
            min = 0,
            max = 1000,
            value = 500
          )
        )
      )
    )
  )
}

#' Lmap Server Functions
#'
#' @noRd
mod_Lmap_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

  })
}

## To be copied in the UI
# mod_Lmap_ui("Lmap_1")

## To be copied in the server
# mod_Lmap_server("Lmap_1")

?box

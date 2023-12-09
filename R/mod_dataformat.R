#' dataformat UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_dataformat_ui <- function(id){
  ns <- NS(id)
  tagList(

    fluidRow(
      column(width = 12,
             includeHTML(
               "inst/app/www/dataformat.html"
             )
      )
    )

  )
}

#' dataformat Server Functions
#'
#' @noRd
mod_dataformat_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns


  })
}

## To be copied in the UI
# mod_dataformat_ui("dataformat_1")

## To be copied in the server
# mod_dataformat_server("dataformat_1")

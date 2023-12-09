#' dataview UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @import DT
mod_dataview_ui <- function(id){
  ns <- NS(id)
  tagList(
    fileInput(ns("file1"), "Choose CSV File",
              accept = c("text/csv",
                         "text/comma-separated-values,
                       .csv")),

      DTOutput(ns("linkage_input"))

  )
}

#' dataview Server Functions
#'
#' @noRd
mod_dataview_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns



      data_linkage <- reactive({
        tryCatch(
          {
            read.csv(input$file1$datapath, header = T, sep = ",")
          },
          error = function(e) {
            NULL
          }
        )
      })


    output$linkage_input <- renderDT({
      validate(
        need(data_linkage(),"Kindly upload the data file")
      )
      data_linkage()
    },options = list(scrollX = TRUE))

  })
}

## To be copied in the UI
# mod_dataview_ui("dataview_1")

## To be copied in the server
# mod_dataview_server("dataview_1")

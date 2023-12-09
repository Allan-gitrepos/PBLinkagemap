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

      DTOutput(ns("linkage_input")),


    fluidRow(


      bs4Dash::actionButton(ns("generate"), "Generate PDF",status="success"),



    ),

    br(),


    fluidRow(

      box(
        title = "Linkage map",
        closable = F,
        solidHeader = T,
        width = 12,
        height = 500,
        status = "warning",

        collapsible = TRUE,

        uiOutput(ns("pdfview")),


        label = boxLabel(
          text = 'new',
          status = "danger"
        ),
        dropdownMenu = boxDropdown(
          boxDropdownItem("Link to Github", href = "https://github.com/Allan-gitrepos"),
          boxDropdownItem("Link to PBperfect", href = "https://allanbiotools.shinyapps.io/pbperfect/")
        )
      )
    )

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
        need(data_linkage(),"")
      )
      data_linkage()

    },options = list(scrollX = TRUE))


    observeEvent(input$generate, {
        output$pdfview <- renderUI({

          linkmap(data_linkage())

        tags$iframe(style="height:600px; width:100%", src=("www/Linkagemap.pdf"))
        })
      })




  })
}

## To be copied in the UI
# mod_dataview_ui("dataview_1")

## To be copied in the server
# mod_dataview_server("dataview_1")

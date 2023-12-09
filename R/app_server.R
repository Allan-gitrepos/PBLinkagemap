#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  shinyjs::delay(2000, {
    waiter_hide()

  })

  mod_Home_server("Home_1")
  mod_dataview_server("dataview_1")
  mod_dataformat_server("dataformat_1")
}

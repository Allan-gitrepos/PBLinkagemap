#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import bs4Dash
#' @import waiter
#' @import shinyjs
#'
#' @noRd
app_ui <- function(request) {bootstrapPage(
  tagList(

    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    fluidPage(

      dashboardPage(
        title = "PBLinkageMap",
        preloader = list(html = tagList(spin_4(), "Loading PBLinkageMap Thankyou for your patience..."), color = "#3c8dbc"),
        header = dashboardHeader(
          title = dashboardBrand(
            title = "PBLinkageMap",
            color = "warning",
            href = "https://github.com/Allan-gitrepos",
            image = "www/logo.jpeg"
          )
        ),
        sidebar = dashboardSidebar(
          sidebarMenu(
            id = "sidebarmenu",
            sidebarHeader("Menu"),
            menuItem(
              "Home",
              tabName = "home",
              icon = icon("home")
            ),

            menuItem(
              "Data format",
              tabName = "data",
              icon = htmltools::browsable(tags$i(class ="fa-solid fa-caret-right"))
            ),






            menuItem(
              "Linkagemap",
              tabName = "linkagemap",
              icon = htmltools::browsable(tags$i(class ="fa-solid fa-caret-right"))
            )

          )
        ),
        controlbar = dashboardControlbar(
          controlbarMenu(
            id = "controlbarmenu",
            type = "pills",
            controlbarItem(
              title = "Item 1",
              radioButtons(
                inputId = "radio1",
                label = "Make a choice",
                choices = c("Choice 1", "Choice 2")
              ),
              selectInput(
                inputId = "selectinput1",
                label = "Select something",
                choices = c("Choice 1", "Choice 2")
              )
            ),
            controlbarItem(
              title = "Skin selector",
              div(class = "p-3", skinSelector())
            )
          )
        ),
        footer = dashboardFooter(
          left = a(
            href = "https://allan-gitrepos.github.io/My_resume/",
            target = "_blank", "Github"
          ),
          right = "Allan Victor"
        ),
        body = dashboardBody(

          useShinyjs(),

          bs4TabItems(
            # chooseSliderSkin("Modern"),

            bs4TabItem(
              tabName = "home",
              mod_Home_ui("Home_1")
            ),


            bs4TabItem(
              tabName = "data",
              mod_dataformat_ui("dataformat_1")
            ),

            bs4TabItem(
              tabName = "linkagemap",
              mod_dataview_ui("dataview_1")
            )




          )




        )
      )


    )
  )
)

}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "PBLinkagemap"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}

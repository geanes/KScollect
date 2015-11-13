## ui.r ##

# Mandatory fields code
appCSS <- ".mandatory_star { color: red; }"

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

### DASHBOARD HEADER ###
uiheader <- shinydashboard::dashboardHeader(title = tagList(icon("child"), "KidnapR"))

### DASHBOARD SIDEBAR ###
uisidebar <- shinydashboard::dashboardSidebar(
  shinydashboard::sidebarMenu(
    textInput("collector", label = labelMandatory("Collector"), value = ""),
    shinydashboard::menuItem("Edit Records", tabName = "edit", icon = icon("edit"))
  )
)

### DASHBOARD BODY ###
uibody <- shinydashboard::dashboardBody(
  shinyjs::useShinyjs(), shinyjs::inlineCSS(appCSS),
  shinydashboard::tabItems(
    shinydashboard::tabItem(tabName = "edit",
            fluidRow(
              shinydashboard::box(id = "records", title = tagList(icon("database"), "Records"), solidHeader = TRUE, status = "info", width = 12, collapsible = TRUE, collapsed = TRUE,
                  DT::dataTableOutput("responses")
              )
            ),
            fluidRow(
              shinydashboard::box(background = "red", height = 70, width = 12,
                  actionButton("submit", label = tagList(icon("plus"), "Add record"), width = "110px"),
                  actionButton("reset", label = tagList(icon("refresh"), "Reset inputs")),
                  shinyjs::disabled(actionButton("delete", label = tagList(icon("trash"), "Delete record"))),
                  shinyjs::hidden(
                    div(id = "submit_msg", strong("Submitting...")),
                    div(id = "error",
                        div(br(), tags$b("Error: "), span(id = "error_msg"))
                    )
                  ),
                  shinyjs::hidden(
                    div(id = "success_msg", strong("Record successfully written."))
                  ),
                  shinyjs::hidden(
                    div(id = "delete_msg", strong("Record successfully removed."))
                  )
              )
            ),
            fluidRow(
              shinydashboard::box(id = "input", title = tagList(icon("edit"), "Input"), solidHeader = TRUE, collapsible = TRUE, status = "primary",
                  textInput("name", label = labelMandatory("Name"), value = ""),
                  fluidRow(
                    column(width = 6, dateInput("birth", label = "Birth date", startview = "year")),
                    column(width = 6, dateInput("image", label = "Image date", startview = "year"))
                  ),
                  fluidRow(
                    column(width = 6, shinyjs::disabled(textInput("aged", label = "Age (days)", value = ""))),
                    column(width = 6, shinyjs::disabled(textInput("agey", label = "Age (years)", value = "")))
                  ),
                  checkboxInput("used_shiny", label = "Used Shiny", value = FALSE),
                  sliderInput("r_num_years", label = "R Years", min = 0, max = 25, value = 2, ticks = FALSE)
              ),
              shinydashboard::box(title = tagList(icon("cube"), "Metadata"), solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE, status = "warning",
                  shinyjs::disabled(textInput("uid", label = "UID", value = "")),
                  shinyjs::disabled(textInput("tstamp", label = "Timestamp", value = ""))
              )
            )
    )
  )
)

### SHINY UI ###
ui <- shinydashboard::dashboardPage(title = "KidnapR", skin = "purple",
                    uiheader,
                    uisidebar,
                    uibody
)

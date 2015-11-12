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
uiheader <- dashboardHeader(title = tagList(icon("child"), "KidnapR"))

### DASHBOARD SIDEBAR ###
uisidebar <- dashboardSidebar(
  sidebarMenu(
    textInput("collector", label = labelMandatory("Collector"), value = ""),
    # h4(Sys.time()),
    menuItem("Edit Records", tabName = "edit", icon = icon("edit"))
  )
)

### DASHBOARD BODY ###
uibody <- dashboardBody(
  useShinyjs(), inlineCSS(appCSS),
  tabItems(
    tabItem(tabName = "edit",
            fluidRow(
              box(id = "records", title = tagList(icon("database"), "Records"), solidHeader = TRUE, status = "info", width = 12, collapsible = TRUE, collapsed = FALSE,
                  DT::dataTableOutput("responses")
              )
            ),
            fluidRow(
              box(background = "red", height = 70, width = 12,
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
              box(id = "input", title = tagList(icon("edit"), "Input"), solidHeader = TRUE, collapsible = TRUE, status = "primary",
                  textInput("name", label = labelMandatory("Name"), value = ""),
                  dateInput("birth", label = "Birth date", startview = "year"),
                  dateInput("image", label = "Image date", startview = "year"),
                  shinyjs::disabled(textInput("aged", label = "Age (days)", value = "")),
                  shinyjs::disabled(textInput("agey", label = "Age (years)", value = "")),
                  checkboxInput("used_shiny", label = "Used Shiny", value = FALSE),
                  sliderInput("r_num_years", label = "R Years", min = 0, max = 25, value = 2, ticks = FALSE)
              ),
              box(title = tagList(icon("cube"), "Metadata"), solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE, status = "warning",
                  shinyjs::disabled(textInput("uid", label = "UID", value = "")),
                  dateInput("recdate", label = "Collection date", value = as.character(Sys.Date()))
              )
            )
    )
  )
)

### SHINY UI ###
ui <- dashboardPage(title = "KidnapR", skin = "purple",
                    uiheader,
                    uisidebar,
                    uibody
)

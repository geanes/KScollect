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
  textInput("collector", label = labelMandatory("Collector"), value = ""),
  textInput("location", label = labelMandatory("Location"), value = ""),
  span(shinyjs::disabled(actionLink("recent", icon = icon("bolt"), label = "Recent")), style = "margin-left: 20px"),
  br(), br(),
  shinydashboard::sidebarMenu(
    shinydashboard::menuItem("Edit Records", tabName = "edit", icon = icon("edit")),
    shinydashboard::menuItem("About", tabName = "about", icon = icon("info-circle"))
  )
)

### DASHBOARD BODY ###
uibody <- shinydashboard::dashboardBody(
  shinyjs::useShinyjs(), shinyjs::inlineCSS(appCSS),
  shinydashboard::tabItems(
    shinydashboard::tabItem(tabName = "edit",
            fluidRow(
              shinydashboard::box(id = "records", title = tagList(icon("database"), "Records"), solidHeader = TRUE, status = "info", width = 12, collapsible = TRUE, collapsed = TRUE,
                  div(id = "rectable", DT::dataTableOutput("responses"))#,
                  # span(id = "norec", h4("No records to display."))
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
              shinydashboard::box(id = "medinfo", title = tagList(icon("user-md"), "Medical Information"), solidHeader = TRUE, collapsible = TRUE, status = "primary",
                  textInput("medrec", label = labelMandatory("Medical record"), value = ""),
                  fluidRow(
                    column(width = 6, dateInput("birth", label = "Birth date", startview = "year")),
                    column(width = 6, dateInput("image", label = "Image date", startview = "year"))
                  ),
                  fluidRow(
                    column(width = 6, shinyjs::disabled(textInput("aged", label = "Age (days)", value = ""))),
                    column(width = 6, shinyjs::disabled(textInput("agey", label = "Age (years)", value = "")))
                  ),
                  radioButtons("SEX", label = "Sex", choices = list("Male" = "M", "Female" = "F"), inline = TRUE),
                  fluidRow(
                    column(width = 6, textInput("length_raw", "Length", value = "")),
                    column(width = 6, shinyjs::disabled(textInput("length", "(meters)", value = NA)))
                  ),
                  fluidRow(
                    column(width = 6, textInput("weight_raw", "Weight", value = "")),
                    column(width = 6, shinyjs::disabled(textInput("weight", "(kilograms)", value = NA)))
                  )
              ),
              shinydashboard::tabBox(title = "Long bones", id = "mtabs",
                tabPanel("Femur",
                          fluidRow(
                            column(width = 6,
                              numericInput("FDL", "Diaphysial length", value = NA)
                            ),
                           column(width = 6,
                              numericInput("FMSB", "Midshaft breadth", value = NA),
                              numericInput("FDB", "Distal breadth", value = NA)
                           )
                          )
                        ),
                tabPanel("Tibia",
                          fluidRow(
                            column(width = 6,
                              numericInput("TDL", "Diaphysial length", value = NA),
                              numericInput("TPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 6,
                              numericInput("TMSB", "Midshaft breadth", value = NA),
                              numericInput("TDB", "Distal breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Fibula",
                          fluidRow(
                            column(width = 6,
                                   numericInput("FBDL", "Diaphysial length", value = NA)
                            )
                          )
                        ),
                tabPanel("Humerus",
                          fluidRow(
                            column(width = 6,
                                   numericInput("HDL", "Diaphysial length", value = NA),
                                   numericInput("HPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 6,
                                   numericInput("HMSB", "Midshaft breadth", value = NA),
                                   numericInput("HDB", "Distal breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Radius",
                          fluidRow(
                            column(width = 6,
                                   numericInput("RDL", "Diaphysial length", value = NA),
                                   numericInput("RPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 6,
                                   numericInput("RMSB", "Midshaft breadth", value = NA),
                                   numericInput("RDB", "Distal breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Ulna",
                          fluidRow(
                            column(width = 6,
                                   numericInput("UDL", "Diaphysial length", value = NA)
                            ),
                            column(width = 6,
                                   numericInput("UMSB", "Midshaft Breadth", value = NA)
                            )
                          )
                        )
              ),
              shinydashboard::tabBox(title = "Dentition", id = "dentabs",
                tabPanel("Maxillary"),
                tabPanel("Mandibular")
              ),
              shinydashboard::box(title = tagList(icon("cube"), "Metadata"), solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE, status = "warning",
                  shinyjs::disabled(textInput("uid", label = "UID", value = "")),
                  shinyjs::disabled(textInput("tstamp", label = "Timestamp", value = ""))
              )
            )
    ),
    shinydashboard::tabItem(tabName = "about",
      includeMarkdown(system.file('app/www/md/measurements.md', package = 'kidnapr'))
    )
  )
)

### SHINY UI ###
ui <- shinydashboard::dashboardPage(title = "KidnapR", skin = "purple",
                    uiheader,
                    uisidebar,
                    uibody
)

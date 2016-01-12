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
  span(
    shinyFiles::shinySaveButton("saveFile", label = "Choose data file", title = "Choose data file", filetype = list(data = "rds")),
  style = "margin-left: 20px"),
  htmlOutput("filePath", style = "margin-left: 20px"),
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
              shinydashboard::box(id = "medinfo", title = tagList(icon("user-md"), "Medical Record"), solidHeader = TRUE, collapsible = TRUE, status = "primary", width = 4,
                  textInput("medrec", label = labelMandatory("Record number"), value = ""),
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
                    column(width = 6, textInput("height_raw", "Height", value = "")),
                    column(width = 6, shinyjs::disabled(textInput("height", "(meters)", value = NA)))
                  ),
                  fluidRow(
                    column(width = 6, textInput("weight_raw", "Weight", value = "")),
                    column(width = 6, shinyjs::disabled(textInput("weight", "(kilograms)", value = NA)))
                  ),
                  textInput("COD", label = "Cause of death", value = ""),
                  textInput("MOD", label = "Manner of death", value = "")
              ),
              shinydashboard::tabBox(title = "Long bones", id = "mtabs", width = 8,
                tabPanel("Femur",
                          fluidRow(
                            column(width = 4,
                              numericInput("FDL", "Diaphysial length", value = NA)
                            ),
                           column(width = 4,
                              numericInput("FMSB", "Midshaft breadth", value = NA),
                              numericInput("FDB", "Distal breadth", value = NA)
                           ),
                           column(width = 4,
                             numericInput("FCB", "Cortical breadth", value = NA),
                             numericInput("FIB", "Intermedullary breadth", value = NA)
                           )
                          )
                        ),
                tabPanel("Tibia",
                          fluidRow(
                            column(width = 4,
                              numericInput("TDL", "Diaphysial length", value = NA),
                              numericInput("TPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 4,
                              numericInput("TMSB", "Midshaft breadth", value = NA),
                              numericInput("TDB", "Distal breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Fibula",
                          fluidRow(
                            column(width = 4,
                                   numericInput("FBDL", "Diaphysial length", value = NA)
                            )
                          )
                        ),
                tabPanel("Humerus",
                          fluidRow(
                            column(width = 4,
                                   numericInput("HDL", "Diaphysial length", value = NA),
                                   numericInput("HPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 4,
                                   numericInput("HMSB", "Midshaft breadth", value = NA),
                                   numericInput("HDB", "Distal breadth", value = NA)
                            ),
                            column(width = 4,
                                   numericInput("HCB", "Cortical breadth", value = NA),
                                   numericInput("HIB", "Intermedullary breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Radius",
                          fluidRow(
                            column(width = 4,
                                   numericInput("RDL", "Diaphysial length", value = NA),
                                   numericInput("RPB", "Proximal Breadth", value = NA)
                            ),
                            column(width = 4,
                                   numericInput("RMSB", "Midshaft breadth", value = NA),
                                   numericInput("RDB", "Distal breadth", value = NA)
                            )
                          )
                        ),
                tabPanel("Ulna",
                          fluidRow(
                            column(width = 4,
                                   numericInput("UDL", "Diaphysial length", value = NA)
                            ),
                            column(width = 4,
                                   numericInput("UMSB", "Midshaft Breadth", value = NA)
                            )
                          )
                        )
              ),
              shinydashboard::tabBox(title = "Dentition", id = "dentabs", width = 8,
                tabPanel("Maxillary",
                  fluidRow(
                    column(width = 2,
                      numericInput("max_M3", "Molar 3", value = NA, min = 1, max = 13),
                      numericInput("max_M2", "Molar 2", value = NA, min = 1, max = 13),
                      numericInput("max_M1", "Molar 1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      selectInput("max_M3_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selected = NA, selectize = FALSE),
                      selectInput("max_M2_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE),
                      selectInput("max_M1_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE)
                    ),
                    column(width = 2,
                      numericInput("max_PM2", "Premolar 2", value = NA, min = 1, max = 13),
                      numericInput("max_PM1", "Premolar 1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      selectInput("max_PM2_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE),
                      selectInput("max_PM1_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE)
                    ),
                    column(width = 2,
                      numericInput("max_C", "Canine", value = NA, min = 1, max = 13),
                      numericInput("max_I2", "Incisor 2", value = NA, min = 1, max = 13),
                      numericInput("max_I1", "Incisor 1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      selectInput("max_C_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE),
                      selectInput("max_I2_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE),
                      selectInput("max_I1_side", "side", choices = c(" " = NA, "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = FALSE)
                    )
                  )
                ),
                tabPanel("Mandibular",
                  fluidRow(
                    column(width = 2,
                      numericInput("man_LM3", "Left M3", value = NA, min = 1, max = 13),
                      numericInput("man_LM2", "Left M2", value = NA, min = 1, max = 13),
                      numericInput("man_LM1", "Left M1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      numericInput("man_RM3", "Right M3", value = NA, min = 1, max = 13),
                      numericInput("man_RM2", "Right M2", value = NA, min = 1, max = 13),
                      numericInput("man_RM1", "Right M1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      numericInput("man_LPM2", "Left PM2", value = NA, min = 1, max = 13),
                      numericInput("man_LPM1", "Left PM1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      numericInput("man_RM2", "Right PM2", value = NA, min = 1, max = 13),
                      numericInput("man_RM1", "Right PM1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      numericInput("man_LC", "Left C", value = NA, min = 1, max = 13),
                      numericInput("man_LI2", "Left I2", value = NA, min = 1, max = 13),
                      numericInput("man_LI1", "Left I1", value = NA, min = 1, max = 13)
                    ),
                    column(width = 2,
                      numericInput("man_RC", "Right C", value = NA, min = 1, max = 13),
                      numericInput("man_RI2", "Right I2", value = NA, min = 1, max = 13),
                      numericInput("man_RI1", "Right I1", value = NA, min = 1, max = 13)
                    )
                  )
                )
              ),
              shinydashboard::box(title = tagList(icon("cube"), "Metadata"), solidHeader = TRUE, collapsible = TRUE, collapsed = TRUE, status = "warning", width = 4,
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

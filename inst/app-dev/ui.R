## ui.R ##

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

source("ui_utils.R", local = TRUE)
source("panel_medrec.R", local = TRUE)
source("panel_records.R", local = TRUE)
source("panel_longbone.R", local = TRUE)

ui <- bootstrapPage(title = "KidnapR",
  # include font-awesome, datepicker
  tags$head(tags$link(rel = "stylesheet", type = "text/css",
                      href = "shared/font-awesome/css/font-awesome.min.css"),
            tags$link(rel = "stylesheet", type = "text/css",
                      href = "shared/datepicker/css/datepicker.css"),
            tags$script(src = "shared/datepicker/js/bootstrap-datepicker.min.js"),
            tags$script(src = "sF/shinyFiles.js"),
            tags$link(rel = "stylesheet", type = "text/css",
                      href = "sF/styles.css"),
            tags$link(rel = "stylesheet", type = "text/css",
                      href = "sF/fileIcons.css")
            ),
  # set up shinyjs
  shinyjs::useShinyjs(),
  # include main.css
  includeCSS("www/styles/main.css"),
  includeCSS("www/styles/styles.css"),

  # navbar partial
  includeHTML("www/_navbar.html"),

  # main content container
  tags$div(class = "container-fluid main-content", tags$div(class = "row",
    records_panel,
    medrec_panel,
    longbone_panel
  )),

  # footer partial
  includeHTML("www/_footer.html")
)

## ui.R ##

source("panel_medrec.R", local = TRUE)
source("panel_records.R", local = TRUE)

# Mandatory fields code
appCSS <- ".mandatory_star { color: red; }"

labelMandatory <- function(label) {
  tagList(
    label,
    span("*", class = "mandatory_star")
  )
}

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
  shinyjs::useShinyjs(), shinyjs::inlineCSS(appCSS),
  # include main.css
  includeCSS("www/styles/main.css"),

  # navbar partial
  includeHTML("www/_navbar.html"),

  # main content container
  tags$div(class = "container-fluid main-content", tags$div(class = "row",
    records_panel,
    medrec_panel
  )),

  # footer partial
  includeHTML("www/_footer.html")
)

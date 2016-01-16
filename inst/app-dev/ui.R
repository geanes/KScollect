## ui.R ##

ui <- bootstrapPage(title = "KidnapR",
  # include font-awesome
  tags$head(tags$link(rel = "stylesheet", type = "text/css",
                      href = "shared/font-awesome/css/font-awesome.min.css")),
  # set up shinyjs
  shinyjs::useShinyjs(), shinyjs::inlineCSS(appCSS),
  # include main.css
  includeCSS("www/styles/main.css"),

  # include navbar partial
  includeHTML("www/_navbar.html"),

  # main content container
  tags$div(class = "container-fluid main-content", tags$div(class = "row",
    # include panel_medrec
    source("panel_medrec.R", local = TRUE)
  )),

  # include footer partial
  includeHTML("www/_footer.html")
)

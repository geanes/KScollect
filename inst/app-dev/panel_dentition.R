## panel_dentition.R ##

dentition_panel <- withTags({
  div(class = "col-xs-12 col-sm-8 com-md-6 col-lg-5",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              a(href = "#dentition-panel", "data-toggle" = "collapse", tabindex = "42",
                span(class = "badge pull-right", id = "dentition-badge", "0%"),
                h3(class = "panel-title", "Dentition")
              )
          ),

          # panel body
          div(class = "collapse", id = "dentition-panel",
              div(class = "panel-body",
                fluidRow(
                  column_xs(width = 12,
                    ul(class = "nav nav-pills", role = "tablist",
                      li(role = "presentation", class = "active",
                         a(href = "#maxillary", role = "tab", `data-toggle` = "pill", tabindex = "43", "Maxillary")
                      ),
                      li(role = "presentation",
                        a(href = "#mandibular", role = "tab", `data-toggle` = "pill", tabindex = "60", "Mandibular")
                      )
                    )
                  )
                ),
                hr(),
                fluidRow(
                  column_xs(width = 12,
                    div(class = "tab-content",
                      div(role = "tabpanel", class = "tab-pane active fade in", id = "maxillary",
                        column_xs(width = 3,
                          add_attribs(numericInput("max_M3", "Molar 3", value = NA, min = 1, max = 13), tabindex = 44),
                          add_attribs(numericInput("max_M2", "Molar 2", value = NA, min = 1, max = 13), tabindex = 46),
                          add_attribs(numericInput("max_M1", "Molar 1", value = NA, min = 1, max = 13), tabindex = 48),
                          add_attribs(numericInput("max_PM2", "Premolar 2", value = NA, min = 1, max = 13), tabindex = 50),
                          add_attribs(numericInput("max_PM1", "Premolar 1", value = NA, min = 1, max = 13), tabindex = 52)

                        ),
                        column_xs(width = 3,
                          add_attribs(selectInput("max_M3_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 45, type = "select"),
                          add_attribs(selectInput("max_M2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 47, type = "select"),
                          add_attribs(selectInput("max_M1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 49, type = "select"),
                          add_attribs(selectInput("max_PM2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 51, type = "select"),
                          add_attribs(selectInput("max_PM1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 53, type = "select")

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("max_C", "Canine", value = NA, min = 1, max = 13), tabindex = 54),
                          add_attribs(numericInput("max_I2", "Incisor 2", value = NA, min = 1, max = 13), tabindex = 56),
                          add_attribs(numericInput("max_I1", "Incisor 1", value = NA, min = 1, max = 13), tabindex = 58)
                        ),
                        column_xs(width = 3,
                          add_attribs(selectInput("max_C_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 55, type = "select"),
                          add_attribs(selectInput("max_I2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 57, type = "select"),
                          add_attribs(selectInput("max_I1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 59, type = "select")
                        )
                      ),
                      div(role = "tabpanel", class = "tab-pane fade", id = "mandibular",
                        column_xs(width = 3,
                          add_attribs(numericInput("man_M3", "Molar 3", value = NA, min = 1, max = 13), tabindex = 61),
                          add_attribs(numericInput("man_M2", "Molar 2", value = NA, min = 1, max = 13), tabindex = 63),
                          add_attribs(numericInput("man_M1", "Molar 1", value = NA, min = 1, max = 13), tabindex = 65),
                          add_attribs(numericInput("man_PM2", "Premolar 2", value = NA, min = 1, max = 13), tabindex = 67),
                          add_attribs(numericInput("man_PM1", "Premolar 1", value = NA, min = 1, max = 13), tabindex = 69)

                        ),
                        column_xs(width = 3,
                          add_attribs(selectInput("man_M3_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 62, type = "select"),
                          add_attribs(selectInput("man_M2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 64, type = "select"),
                          add_attribs(selectInput("man_M1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 66, type = "select"),
                          add_attribs(selectInput("man_PM2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 68, type = "select"),
                          add_attribs(selectInput("man_PM1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 70, type = "select")

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("man_C", "Canine", value = NA, min = 1, max = 13), tabindex = 71),
                          add_attribs(numericInput("man_I2", "Incisor 2", value = NA, min = 1, max = 13), tabindex = 73),
                          add_attribs(numericInput("man_I1", "Incisor 1", value = NA, min = 1, max = 13), tabindex = 75)
                        ),
                        column_xs(width = 3,
                          add_attribs(selectInput("man_C_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 72, type = "select"),
                          add_attribs(selectInput("man_I2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 74, type = "select"),
                          add_attribs(selectInput("man_I1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 76, type = "select")
                        )
                      )
                    )
                  )
                )

              )
          )
      )
  )
})

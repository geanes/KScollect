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
                          add_attribs(numericInput("max_M3_L", "Molar 3L", value = NA, min = -1, max = 13), tabindex = 44),
                          add_attribs(numericInput("max_M2_L", "Molar 2L", value = NA, min = -1, max = 13), tabindex = 45),
                          add_attribs(numericInput("max_M1_L", "Molar 1L", value = NA, min = -1, max = 13), tabindex = 46),
                          add_attribs(numericInput("max_PM2_L", "Premolar 2L", value = NA, min = -1, max = 13), tabindex = 47),
                          add_attribs(numericInput("max_PM1_L", "Premolar 1L", value = NA, min = -1, max = 13), tabindex = 48)

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("max_M3_R", "Molar 3R", value = NA, min = -1, max = 13), tabindex = 52),
                          add_attribs(numericInput("max_M2_R", "Molar 2R", value = NA, min = -1, max = 13), tabindex = 53),
                          add_attribs(numericInput("max_M1_R", "Molar 1R", value = NA, min = -1, max = 13), tabindex = 54),
                          add_attribs(numericInput("max_PM2_R", "Premolar 2R", value = NA, min = -1, max = 13), tabindex = 55),
                          add_attribs(numericInput("max_PM1_R", "Premolar 1R", value = NA, min = -1, max = 13), tabindex = 56)
                          # add_attribs(selectInput("max_M3_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 45, type = "select"),
                          # add_attribs(selectInput("max_M2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 47, type = "select"),
                          # add_attribs(selectInput("max_M1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 49, type = "select"),
                          # add_attribs(selectInput("max_PM2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 51, type = "select"),
                          # add_attribs(selectInput("max_PM1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 53, type = "select")

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("max_C_L", "Canine L", value = NA, min = -1, max = 13), tabindex = 49),
                          add_attribs(numericInput("max_I2_L", "Incisor 2L", value = NA, min = -1, max = 13), tabindex = 50),
                          add_attribs(numericInput("max_I1_L", "Incisor 1L", value = NA, min = -1, max = 13), tabindex = 51)
                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("max_C_R", "Canine R", value = NA, min = -1, max = 13), tabindex = 57),
                          add_attribs(numericInput("max_I2_R", "Incisor 2R", value = NA, min = -1, max = 13), tabindex = 58),
                          add_attribs(numericInput("max_I1_R", "Incisor 1R", value = NA, min = -1, max = 13), tabindex = 59)
                          # add_attribs(selectInput("max_C_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 55, type = "select"),
                          # add_attribs(selectInput("max_I2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 57, type = "select"),
                          # add_attribs(selectInput("max_I1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 59, type = "select")
                        )
                      ),
                      div(role = "tabpanel", class = "tab-pane fade", id = "mandibular",
                        column_xs(width = 3,
                          add_attribs(numericInput("man_M3_L", "Molar 3L", value = NA, min = -1, max = 13), tabindex = 61),
                          add_attribs(numericInput("man_M2_L", "Molar 2L", value = NA, min = -1, max = 13), tabindex = 62),
                          add_attribs(numericInput("man_M1_L", "Molar 1L", value = NA, min = -1, max = 13), tabindex = 63),
                          add_attribs(numericInput("man_PM2_L", "Premolar 2L", value = NA, min = -1, max = 13), tabindex = 64),
                          add_attribs(numericInput("man_PM1_L", "Premolar 1L", value = NA, min = -1, max = 13), tabindex = 65)

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("man_M3_R", "Molar 3R", value = NA, min = -1, max = 13), tabindex = 66),
                          add_attribs(numericInput("man_M2_R", "Molar 2R", value = NA, min = -1, max = 13), tabindex = 67),
                          add_attribs(numericInput("man_M1_R", "Molar 1R", value = NA, min = -1, max = 13), tabindex = 68),
                          add_attribs(numericInput("man_PM2_R", "Premolar 2R", value = NA, min = -1, max = 13), tabindex = 69),
                          add_attribs(numericInput("man_PM1_R", "Premolar 1R", value = NA, min = -1, max = 13), tabindex = 70)
                          # add_attribs(selectInput("man_M3_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 62, type = "select"),
                          # add_attribs(selectInput("man_M2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 64, type = "select"),
                          # add_attribs(selectInput("man_M1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 66, type = "select"),
                          # add_attribs(selectInput("man_PM2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 68, type = "select"),
                          # add_attribs(selectInput("man_PM1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 70, type = "select")

                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("man_C_L", "Canine L", value = NA, min = -1, max = 13), tabindex = 71),
                          add_attribs(numericInput("man_I2_L", "Incisor 2L", value = NA, min = -1, max = 13), tabindex = 72),
                          add_attribs(numericInput("man_I1_L", "Incisor 1L", value = NA, min = -1, max = 13), tabindex = 73)
                        ),
                        column_xs(width = 3,
                          add_attribs(numericInput("man_C_R", "Canine R", value = NA, min = -1, max = 13), tabindex = 74),
                          add_attribs(numericInput("man_I2_R", "Incisor 2R", value = NA, min = -1, max = 13), tabindex = 75),
                          add_attribs(numericInput("man_I1_R", "Incisor 1R", value = NA, min = -1, max = 13), tabindex = 76)
                          # add_attribs(selectInput("man_C_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 72, type = "select"),
                          # add_attribs(selectInput("man_I2_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 74, type = "select"),
                          # add_attribs(selectInput("man_I1_side", "side", choices = c(" " = "", "Mixed" = "M", "Left" = "L", "Right" = "R"), selectize = TRUE), tabindex = 76, type = "select")
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

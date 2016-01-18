## panel_longbone.R ##

longbone_panel <- withTags({
  div(class = "col-xs-12 col-sm-6 col-lg-4",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              a(href = "#longbone-panel", "data-toggle" = "collapse", tabindex = "13",
                span(class = "badge pull-right", "0%"),
                h3(class = "panel-title", "Long bones")
              )
          ),

          # panel body
          div(class = "collapse", id = "longbone-panel",
              div(class = "panel-body",
                fluidRow(
                  column_xs(width = 4,
                    ul(class = "nav nav-pills nav-stacked", role = "tablist",
                      li(role = "presentation", class = "active",
                         a(href = "#humerus", role = "tab", `data-toggle` = "pill", tabindex = "14", "Humerus")
                      ),
                      li(role = "presentation",
                         a(href = "#radius", role = "tab", `data-toggle` = "pill", tabindex = "21", "Radius")
                      ),
                      li(role = "presentation",
                         a(href = "#ulna", role = "tab", `data-toggle` = "pill", tabindex = "26", "Ulna")
                      ),
                      li(hr()),
                      li(role = "presentation",
                         a(href = "#femur", role = "tab", `data-toggle` = "pill", tabindex = "29", "Femur")
                      ),
                      li(role = "presentation",
                         a(href = "#tibia", role = "tab", `data-toggle` = "pill", tabindex = "35", "Tibia")
                      ),
                      li(role = "presentation",
                         a(href = "#fibula", role = "tab", `data-toggle` = "pill", tabindex = "40", "Fibula")
                      )
                    )
                  ),
                  column_xs(width = 8,
                    div(class = "tab-content",
                        div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus",
                          add_attribs(numericInput("HDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 15),
                          add_attribs(numericInput("HPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = 16),
                          add_attribs(numericInput("HMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = 17),
                          add_attribs(numericInput("HDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = 18),
                          add_attribs(numericInput("HCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = 19),
                          add_attribs(numericInput("HIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = 20)
                        ),
                        div(role = "tabpanel", class = "tab-pane fade", id = "radius",
                            add_attribs(numericInput("RDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 22),
                            add_attribs(numericInput("RPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = 23),
                            add_attribs(numericInput("RMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = 24),
                            add_attribs(numericInput("RDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = 25),
                            add_attribs(numericInput("RCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("RIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly")
                        ),
                        div(role = "tabpanel", class = "tab-pane fade", id = "ulna",
                            add_attribs(numericInput("UDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 27),
                            add_attribs(numericInput("UPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("UMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = 28),
                            add_attribs(numericInput("UDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("UCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("UIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly")
                        ),
                        div(role = "tabpanel", class = "tab-pane fade", id = "femur",
                            add_attribs(numericInput("FDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 30),
                            add_attribs(numericInput("FPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("FMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = 31),
                            add_attribs(numericInput("FDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = 32),
                            add_attribs(numericInput("FCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = 33),
                            add_attribs(numericInput("FIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = 34)
                        ),
                        div(role = "tabpanel", class = "tab-pane fade", id = "tibia",
                            add_attribs(numericInput("TDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 36),
                            add_attribs(numericInput("TPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = 37),
                            add_attribs(numericInput("TMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = 38),
                            add_attribs(numericInput("TDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = 39),
                            add_attribs(numericInput("TCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("TIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly")
                        ),
                        div(role = "tabpanel", class = "tab-pane fade", id = "fibula",
                            add_attribs(numericInput("FBDL", "Diaphysial length", value = NA, min = 0, width = "100%"), tabindex = 41),
                            add_attribs(numericInput("FBPB", "Proximal breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("FBMSB", "Midshaft breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("FBDB", "Distal breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("FBCB", "Cortical breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly"),
                            add_attribs(numericInput("FBIB", "Intermedullary breadth", value = NA, min = 0, width = "100%"), tabindex = -1, readonly = "readonly")
                        )
                    )
                  )

                )
              )
          )
      )
  )
})

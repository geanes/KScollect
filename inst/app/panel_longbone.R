## panel_longbone.R ##

longbone_panel <- withTags({
  div(class = "col-xs-12 col-sm-6 col-md-5 col-lg-4",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              a(href = "#longbone-panel", "data-toggle" = "collapse", tabindex = "13",
                span(class = "badge pull-right", id = "longbone-badge", "0%"),
                h3(class = "panel-title", "Skeletal Metrics")
              )
          ),

          # panel body
          div(class = "collapse", id = "longbone-panel",
              div(class = "panel-body",
                fluidRow(
                  column_xs(width = 5,
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
                      ),
                      li(hr()),
                      li(role = "presentation",
                         a(href = "#pelvis", role = "tab", `data-toggle` = "pill", "Pelvis")
                      )
                    )
                  ),
                  column_xs(width = 7,
                    div(class = "tab-content",
                        div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 15)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 15)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 16)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 16)
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 17)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 17)
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 18)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 18)
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 19)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 19)
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("HIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 20)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("HIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 20)
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "radius",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 22)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 22)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 23)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 23)
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 24)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 24)
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 25)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 25)
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("RIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("RIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "ulna",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 27)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 27)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 28)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 28)
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("UIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("UIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "femur",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 30)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 30)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 31)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 31)
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 32)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 32)
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 33)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 33)
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 34)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 34)
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "tibia",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 36)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 36)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 37)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 37)
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 38)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 38)
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 39)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 39)
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("TIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("TIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "fibula",
                          h5(strong("Diaphyseal length"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBDL_L", NULL, value = NA, min = -1, width = "100%"), tabindex = 41)
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBDL_R", NULL, value = NA, min = -1, width = "100%"), tabindex = 41)
                            ),
                          h5(strong("Midshaft breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBMSB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBMSB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Proximal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBPB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBPB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Distal breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBDB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBDB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Cortical breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBCB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBCB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          h5(strong("Intermedullary breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                          column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                            add_attribs(numericInput("FBIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            ),
                          column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                            add_attribs(numericInput("FBIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1, readonly = "readonly")
                            )
                        ),

                        div(role = "tabpanel", class = "tab-pane fade", id = "pelvis",
                            h5(strong("Ilium height"), style = "margin-top: 0px; margin-bottom: 7px;", tabindex = -1),
                            column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                              add_attribs(numericInput("PIH_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1)
                              ),
                            column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                              add_attribs(numericInput("PIH_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1)
                              ),
                            h5(strong("Ilium breadth"), style = "margin-top: 7px; margin-bottom: 7px;", tabindex = -1),
                            column_xs(width = 6, style = "padding-left: 0px; padding-right: 2px;",
                              add_attribs(numericInput("PIB_L", NULL, value = NA, min = -1, width = "100%"), tabindex = -1)
                              ),
                            column_xs(width = 6, style = "padding-left: 2px; padding-right: 0px;",
                              add_attribs(numericInput("PIB_R", NULL, value = NA, min = -1, width = "100%"), tabindex = -1)
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

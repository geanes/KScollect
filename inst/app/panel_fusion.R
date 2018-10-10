## panel_fusion.R ##

fusion_panel <- withTags({
  div(class = "col-xs-12 col-lg-9",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              a(href = "#fusion-panel", "data-toggle" = "collapse", tabindex = "77",
                span(class = "badge pull-right", id = "fusion-badge", "0%"),
                h3(class = "panel-title", "Epiphyseal fusion and Ossification")
              )
          ),

          # panel body
          div(class = "collapse", id = "fusion-panel",
              div(class = "panel-body",
                  fluidRow(
                    column_xs(width = 12,
                              ul(class = "nav nav-pills", role = "tablist",
                                 li(role = "presentation", class = "active",
                                    a(href = "#humerus-ef", role = "tab", `data-toggle` = "pill", tabindex = "78", "Humerus")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#radius-ef", role = "tab", `data-toggle` = "pill", tabindex = "90", "Radius")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#ulna-ef", role = "tab", `data-toggle` = "pill", tabindex = "93", "Ulna")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#femur-ef", role = "tab", `data-toggle` = "pill", tabindex = "96", "Femur")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#tibia-ef", role = "tab", `data-toggle` = "pill", tabindex = "101", "Tibia")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#fibula-ef", role = "tab", `data-toggle` = "pill", tabindex = "104", "Fibula")
                                 ),
                                 li(role = "presentation",
                                    a(href = "#other-ef", role = "tab", `data-toggle` = "pill", tabindex = "107", "Other")
                                 )
                              )
                    )
                  ),
                  hr(),
                  fluidRow(
                    column_xs(width = 12,
                              div(class = "tab-content",
                                  div(role = "tabpanel", class = "tab-pane active fade in", id = "humerus-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HH_Oss_L", "Humeral head", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 79, type = "select"),
                                        add_attribs(selectInput("HH_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 79, type = "select"),
                                        add_attribs(selectInput("HGT_Oss_L", "Greater tubercle", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 80, type = "select"),
                                        add_attribs(selectInput("HGT_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 80, type = "select"),
                                        add_attribs(selectInput("HLT_Oss_L", "Lesser tubercle", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 81, type = "select"),
                                        add_attribs(selectInput("HLT_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 81, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 82, type = "select"),
                                        add_attribs(selectInput("HPE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 82, type = "select"),
                                        add_attribs(selectInput("HC_Oss_L", "Capitulum", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 83, type = "select"),
                                        add_attribs(selectInput("HC_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 83, type = "select"),
                                        add_attribs(selectInput("HT_Oss_L", "Trochlea", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 84, type = "select"),
                                        add_attribs(selectInput("HT_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 84, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HLE_Oss_L", "Lateral epicondyle", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 85, type = "select"),
                                        add_attribs(selectInput("HLE_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 85, type = "select"),
                                        add_attribs(selectInput("HME_EF_L", "Medial epicondyle", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 86, type = "select"),
                                        add_attribs(selectInput("HME_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 86, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("HCE1_EF_L", "Composite epiphysis 1", choices = c("(Left)" = "", "Unfused" = 0, "Fusing/Fused" = 1), selectize = TRUE), tabindex = 87, type = "select"),
                                        add_attribs(selectInput("HCE1_EF_R", NULL, choices = c("(Right)" = "", "Unfused" = 0, "Fusing/Fused" = 1), selectize = TRUE), tabindex = 87, type = "select"),
                                        add_attribs(selectInput("HCE2_EF_L", "Composite epiphysis 2", choices = c("(Left)" = "", "Unfused" = 0, "Fusing/Fused" = 1), selectize = TRUE), tabindex = 88, type = "select"),
                                        add_attribs(selectInput("HCE2_EF_R", NULL, choices = c("(Right)" = "", "Unfused" = 0, "Fusing/Fused" = 1), selectize = TRUE), tabindex = 88, type = "select"),
                                        add_attribs(selectInput("HDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 89, type = "select"),
                                        add_attribs(selectInput("HDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 89, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "radius-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("RPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 91, type = "select"),
                                        add_attribs(selectInput("RPE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 91, type = "select"),
                                        add_attribs(selectInput("RDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 92, type = "select"),
                                        add_attribs(selectInput("RDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 92, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "ulna-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("UPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 94, type = "select"),
                                        add_attribs(selectInput("UPE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 94, type = "select"),
                                        add_attribs(selectInput("UDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 95, type = "select"),
                                        add_attribs(selectInput("UDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 95, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "femur-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FH_EF_L", "Femoral head", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 97, type = "select"),
                                        add_attribs(selectInput("FH_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 97, type = "select"),
                                        add_attribs(selectInput("FGT_EF_L", "Greater trochanter", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 98, type = "select"),
                                        add_attribs(selectInput("FGT_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 98, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FLT_EF_L", "Lesser trochanter", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 99, type = "select"),
                                        add_attribs(selectInput("FLT_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 99, type = "select"),
                                        add_attribs(selectInput("FDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 100, type = "select"),
                                        add_attribs(selectInput("FDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 100, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "tibia-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("TPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 102, type = "select"),
                                        add_attribs(selectInput("TPE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 102, type = "select"),
                                        add_attribs(selectInput("TDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 103, type = "select"),
                                        add_attribs(selectInput("TDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 103, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "fibula-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("FBPE_EF_L", "Proximal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 105, type = "select"),
                                        add_attribs(selectInput("FBPE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 105, type = "select"),
                                        add_attribs(selectInput("FBDE_EF_L", "Distal epiphysis", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 106, type = "select"),
                                        add_attribs(selectInput("FBDE_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 106, type = "select")
                                      )
                                  ),
                                  div(role = "tabpanel", class = "tab-pane fade", id = "other-ef",
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("CT_EF_L", "Calcaneal tuberosity", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 108, type = "select"),
                                        add_attribs(selectInput("CT_EF_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1, "Early Active union" = 12, "Active union" = 2, "Active/Advanced union" = 23, "Advanced union" = 3, "Complete fusion" = 4), selectize = TRUE), tabindex = 108, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("CC_Oss", "Carpals (count)", choices = c("(Total)" = "", 0:8), selectize = TRUE), tabindex = 109, type = "select"),
                                        add_attribs(selectInput("TC_Oss", "Tarsals (count)", choices = c("(Total)" = "", 0:10), selectize = TRUE), tabindex = 110, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("ISPR_EF_L", "Ischio-pubic ramus", choices = c("(Left)" = "", "No union" = 0, "Partial union" = 1, "Complete union" = 2), selectize = TRUE), tabindex = 111, type = "select"),
                                        add_attribs(selectInput("ISPR_EF_R", NULL, choices = c("(Right)" = "", "No union" = 0, "Partial union" = 1, "Complete union" = 2), selectize = TRUE), tabindex = 111, type = "select"),
                                        add_attribs(selectInput("ILIS_EF_L", "Ilium-ischium", choices = c("(Left)" = "", "No union" = 0, "Partial union" = 1, "Complete union" = 2), selectize = TRUE), tabindex = 112, type = "select"),
                                        add_attribs(selectInput("ILIS_EF_R", NULL, choices = c("(Right)" = "", "No union" = 0, "Partial union" = 1, "Complete union" = 2), selectize = TRUE), tabindex = 112, type = "select")
                                      ),
                                      div(class = "col-xs-6 col-sm-4 col-md-3 col-lg-3",
                                        add_attribs(selectInput("PC_Oss_L", "Patella", choices = c("(Left)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 113, type = "select"),
                                        add_attribs(selectInput("PC_Oss_R", NULL, choices = c("(Right)" = "", "Absent" = 0, "Present" = 1), selectize = TRUE), tabindex = 113, type = "select")
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

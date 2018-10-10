## panel_records.R ##

records_panel <- withTags({
  div(class = "col-xs-12",
    div(class = "panel panel-primary",

      # panel header
      div(class = "panel-heading",
          a(href = "#records-panel", "data-toggle" = "collapse", tabindex = "-1",
            i(class = "fa fa-database fa-pull-left fa-lg"),
            h3(class = "panel-title", "Records")
          )
      ),

      # panel body
      div(class = "collapse in", id = "records-panel",
        div(class = "panel-body",
          div(id = "rectable", DT::dataTableOutput("responses"))
        )
      )
    )
  )
})

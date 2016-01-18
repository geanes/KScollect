## panel_metadata.R ##

metadata_panel <- withTags({
  div(class = "col-xs-12 col-sm-6 col-md-4 col-lg-3",
      div(class = "panel panel-primary",

          # panel header
          div(class = "panel-heading",
              a(href = "#metadata-panel", "data-toggle" = "collapse", tabindex = "114",
                i(class = "fa fa-cube fa-pull-left fa-lg"),
                h3(class = "panel-title", "Metadata")
              )
          ),

          # panel body
          div(class = "collapse", id = "metadata-panel",
              div(class = "panel-body",
                add_attribs(textInput("uid", label = "UID", value = "", width = "100%"), tabindex = -1, readonly = "readonly"),
                add_attribs(textInput("tstamp", label = "Timestamp", value = "", width = "100%"), tabindex = -1, readonly = "readonly")
              )
          )
      )
  )
})

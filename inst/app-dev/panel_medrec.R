## panel_medrec.R ##

withTags({
  div(class = "col-xs-12 col-sm-6 col-lg-4",
    div(class = "panel panel-primary",
      div(class = "panel-heading",
        a(href = "#medrec-panel", "data-toggle" = "collapse", tabindex = "2",
          span(class = "badge pull-right", id = "medrec-badge", "0%"),
          i(class = "fa fa-hospital-o fa-pull-left fa-lg"),
          h3(class = "panel-title", "Medical record")
        )
      ),
      div(class = "collapse in", id = "medrec-panel",
        div(class = "panel-body",
          # record number text input
          HTML('<div class="form-group shiny-input-container" style="width: 100%;">
               <label for="medrec"> Record number <span class="mandatory_star">*</span></label>
               <input id="medrec" type="text" class="form-control" value="" placeholder="Record #" tabindex=3 />
               </div>')
        )
      )

    )
  )
})

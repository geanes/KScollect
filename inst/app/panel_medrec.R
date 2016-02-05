## panel_medrec.R ##

medrec_panel <- withTags({
  div(class = "col-xs-12 col-sm-6 col-md-4 col-lg-3",
    div(class = "panel panel-primary",

      # panel header
      div(class = "panel-heading",
        a(href = "#medrec-panel", "data-toggle" = "collapse", tabindex = "2",
          span(class = "badge pull-right", id = "medrec-badge", "0%"),
          i(class = "fa fa-user-md fa-pull-left fa-lg"),
          h3(class = "panel-title", "Medical record")
        )
      ),

      # panel body
      div(class = "collapse in", id = "medrec-panel",
        div(class = "panel-body",
          # record number and location text inputs
          add_attribs(textInput("medrec", label = labelMandatory("Record number"), value = "", placeholder = "Record #", width = "100%"), tabindex = 3),
          div(class = "form-group",
            label(`for` = "location", labelMandatory("Location")),
            div(class = "input-group shiny-input-container", style = "width: 100%;",
              input(type = "text", id = "location", class = "form-control", placeholder = "Hospital", tabindex = 4),
              span(class = "input-group-btn",
                button(id = "recentLocation", class = "btn btn-default action-button", type = "button", i(class = "fa fa-bolt fa-fw"))
              )
            )
          ),
          # date inputs for birth and image
          fluidRow(
            column_xs(width = 6,
              add_attribs(dateInput("birth", label = "Birth date", startview = "year", max = Sys.Date(), width = "100%"), tabindex = 5)
            ),
            column_xs(width = 6,
              add_attribs(dateInput("image", label = "Image date", startview = "year", max = Sys.Date(), width = "100%"), tabindex = 6)
            )
          ),
          # calculated age fields
          fluidRow(
            column_xs(width = 6,
              div(class = "form-group",
                label(`for` = "aged", "Age (days)"),
                div(class = "input-group shiny-input-container", style = "width: 100%;",
                  span(class = "input-group-addon",
                    input(id = "calcAged", type = "checkbox", checked = "checked")
                  ),
                  input(type = "text", id = "aged", class = "form-control", tabindex = -1)
                )
              )
              # add_attribs(textInput("aged", label = "Age (days)", value = "", width = "100%"), tabindex = -1, readonly = "readonly")
            ),
            column_xs(width = 6,
              add_attribs(textInput("agey", label = "Age (years)", value = "", width = "100%"), tabindex = -1, readonly = "readonly")
            )
          ),
          # radio buttons for sex
          HTML('<div id="SEX" class="form-group shiny-input-radiogroup shiny-input-container shiny-input-container-inline">
               <label class="control-label" for="SEX">Sex</label>
               <div class="shiny-options-group">
               <label class="radio-inline">
               <input type="radio" name="SEX" value="M" tabindex=7 />
               <span>Male</span>
               </label>
               <label class="radio-inline">
               <input type="radio" name="SEX" value="F" tabindex=8 />
               <span>Female</span>
               </label>
               </div>
               </div>'),
          # height fields
          fluidRow(
            column_xs(width = 6,
              add_attribs(textInput("height_raw", "Height", value = NA, placeholder = "Height", width = "100%"), tabindex = 9)
            ),
            column_xs(width = 6,
              add_attribs(textInput("height", "(meters)", value = NA, width = "100%"), tabindex = -1, readonly = "readonly")
            )
          ),
          # weight fields
          fluidRow(
            column_xs(width = 6,
              add_attribs(textInput("weight_raw", "Weight", value = NA, placeholder = "Weight", width = "100%"), tabindex = 10)
            ),
            column_xs(width = 6,
              add_attribs(textInput("weight", "(kilograms)", value = NA, width = "100%"), tabindex = -1, readonly = "readonly")
            )
          ),
          add_attribs(textInput("COD", label = "Cause of death", value = NA, width = "100%", placeholder = "COD"), tabindex = 11),
          add_attribs(textInput("MOD", label = "Manner of death", value = NA, width = "100%", placeholder = "MOD"), tabindex = 12)
        )

      )
    )
  )
})

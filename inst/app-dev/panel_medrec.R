## panel_medrec.R ##

medrec_panel <- withTags({
  div(class = "col-xs-12 col-sm-6 col-lg-4",
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
          # record number text input
          HTML('<div class="form-group shiny-input-container" style="width: 100%;">
               <label for="medrec"> Record number <span class="mandatory_star">*</span></label>
               <input id="medrec" type="text" class="form-control" value="" placeholder="Record #" tabindex=3 />
               </div>'),
          HTML('<div class="form-group shiny-input-container" style="width: 100%;">
               <label for="location"> Location <span class="mandatory_star">*</span></label>
               <input id="location" type="text" class="form-control" value="" placeholder="Hospital" tabindex=4 />
               </div>'),
          # date inputs for birth and image
          fluidRow(
            div(class = "col-xs-6",
              HTML('<div id="birth" class="shiny-date-input form-group shiny-input-container">
                   <label class="control-label" for="birth">Birth date</label>
                   <div class = "input-group">
                   <input type="text" class="form-control datepicker" placeholder="yyyy-mm-dd" data-initial-date data-date-language="en" data-date-weekstart="0" data-date-format="yyyy-mm-dd" data-date-start-view="year" data-date-end-date="0d" tabindex=5 />
                   <span class="input-group-addon">
                   <span class="fa fa-calendar"></span>
                   </span>
                   </div>
                   </div>')
            ),
            div(class = "col-xs-6",
              HTML('<div id="image" class="shiny-date-input form-group shiny-input-container">
                   <label class="control-label" for="image">Image date</label>
                   <div class = "input-group">
                   <input type="text" class="form-control datepicker" placeholder="yyyy-mm-dd" data-initial-date data-date-language="en" data-date-weekstart="0" data-date-format="yyyy-mm-dd" data-date-start-view="year" data-date-end-date="0d" tabindex=6 />
                   <span class="input-group-addon">
                   <span class="fa fa-calendar"></span>
                   </span>
                   </div>
                   </div>')
            )
          ),
          # calculated age fields
          fluidRow(
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="aged">Age (days)</label>
                   <input id="aged" type="text" class="form-control" value="" readonly tabindex=-1 />
                   </div>')
            ),
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="agey">Age (years)</label>
                   <input id="agey" type="text" class="form-control" value="" readonly tabindex=-1/>
                   </div>')
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
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="height_raw">Height</label>
                   <input id="height_raw" type="text" class="form-control" placeholder="Height" value="" tabindex=9 />
                   </div>')
            ),
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="height">(meters)</label>
                   <input id="height" type="text" class="form-control" value="" readonly tabindex=-1 />
                   </div>')
            )
          ),
          # weight fields
          fluidRow(
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="weight_raw">Weight</label>
                   <input id="weight_raw" type="text" class="form-control" placeholder="Weight" value="" tabindex=10 />
                   </div>')
            ),
            div(class = "col-xs-6",
              HTML('<div class="form-group shiny-input-container">
                   <label for="weight">(kilograms)</label>
                   <input id="weight" type="text" class="form-control" value="" readonly tabindex=-1 />
                   </div>')
            )
          ),
          HTML('<div class="form-group shiny-input-container" style="width: 100%;">
               <label for="COD">Cause of death</label>
               <input id="COD" type="text" class="form-control" placeholder="COD" value="" tabindex=11 />
               </div>'),
          HTML('<div class="form-group shiny-input-container" style="width: 100%;">
               <label for="MOD">Manner of death</label>
               <input id="MOD" type="text" class="form-control" placeholder="MOD" value="" tabindex=12 />
               </div>')

        )

      )
    )
  )
})

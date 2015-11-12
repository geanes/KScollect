## server.R ##

# Mandatory fields list
fieldsMandatory <- c("collector", "name")

# Fill the input fields with the values of the selected record in the table
UpdateInputs <- function(data, session) {
  updateTextInput(session, "uid", value = unname(rownames(data)))
  updateTextInput(session, "name", value = unname(data["name"]))
  updateCheckboxInput(session, "used_shiny", value = as.logical(data["used_shiny"]))
  updateSliderInput(session, "r_num_years", value = as.integer(data["r_num_years"]))
  # updateTextInput(session, "collector", value = as.character(data["collector"]))
  # updateDateInput(session, "recdate", value = as.character(data["recdate"]))
  # updateDateInput(session, "birth", value = as.character(data["birth"]))
  # updateDateInput(session, "image", value = as.character(data["image"]))
  # updateTextInput(session, "aged", value = as.character(data["aged"]))
  # updateTextInput(session, "agey", value = as.character(data["agey"]))
}

## SHINY SERVER
server <- function(input, output, session) {

  # input fields are treated as a group
  formData <- reactive({
    sapply(names(GetTableMetadata()$fields), function(x) input[[x]])
  })

  # watch for filling of mandatory fields
  observe({
    # check if all mandatory fields have a value
    mandatoryFilled <- vapply(fieldsMandatory,
                              function(x) {
                                !is.null(input[[x]]) && input[[x]] != ""
                              }, logical(1))
    mandatoryFilled <- all(mandatoryFilled)
    # enable/disable the submit button
    shinyjs::toggleState(id = "submit", condition = mandatoryFilled)
  })

  # Click "Submit" button -> save data
  observeEvent(input$submit, {
    shinyjs::disable("submit")
    shinyjs::hide(id = "error")
    shinyjs::show(id = "submit_msg")

    tryCatch({
      if (input$uid != "") {
        UpdateData(formData())
      } else {
        CreateData(formData())
        UpdateInputs(CreateDefaultRecord(), session)
      }
      shinyjs::show(id = "success_msg", anim = TRUE, animType = "fade")
      shinyjs::delay(2000, shinyjs::hide(id = "success_msg", anim = TRUE, anuimType = "fade"))
    },
    error = function(err) {
      shinyjs::text("error_msg", err$message)
      shinyjs::show(id = "error", anim = TRUE, animType = "fade")
    },
    finally = {
      shinyjs::enable("submit")
      shinyjs::hide("submit_msg")
    })

  }, priority = 1)

  # Press "Reset" button -> display empty record
  observeEvent(input$reset, {
    UpdateInputs(CreateDefaultRecord(), session)
    shinyjs::text("submit", "<i class='fa fa-plus'></i> Add record")
    shinyjs::disable("delete")
  })

  # Press "Delete" button -> delete from data
  observeEvent(input$delete, {
    DeleteData(formData())
    UpdateInputs(CreateDefaultRecord(), session)
    shinyjs::text("submit", "<i class='fa fa-plus'></i> Add record")
    shinyjs::show(id = "delete_msg", anim = TRUE, animType = "fade")
    shinyjs::delay(2000, shinyjs::hide(id = "delete_msg", anim = TRUE, anuimType = "fade"))
    shinyjs::disable("delete")
  }, priority = 1)

  # Select row in table -> show details in inputs
  observeEvent(input$responses_rows_selected, {
    if (length(input$responses_rows_selected) > 0) {
      data <- ReadData()[input$responses_rows_selected, ]
      UpdateInputs(data, session)
      shinyjs::text("submit",  "<i class='fa fa-edit'></i> Edit record")
      shinyjs::enable("delete")
    }

  })

  # display table
  output$responses <- DT::renderDataTable({
    #update after submit is clicked
    input$submit
    #update after delete is clicked
    input$delete
    #update after reset is clicked
    input$reset
    ReadData()
  }, server = FALSE,
  selection = "single",
  rownames = FALSE,
  filter = list(position = "bottom", clear = TRUE, plain = FALSE),
  class = "cell-border stripe hover condensed",
  extensions = "ColVis",
  options = list(dom = 'C<"clear">lfrtip'),
  colnames = unname(GetTableMetadata()$fields)[-1]
  )

  session$onSessionEnded(function(){stopApp("Thank you for using KidnapR.")})

}

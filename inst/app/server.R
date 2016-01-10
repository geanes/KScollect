## server.R ##

# Mandatory fields list
fieldsMandatory <- c("collector", "medrec", "location")

# Fill the input fields with the values of the selected record in the table
UpdateInputs <- function(data, session) {
  updateTextInput(session, "uid", value = data[["uid"]])
  updateTextInput(session, "medrec", value = data[["medrec"]])
  updateRadioButtons(session, "SEX", selected = as.character(data[["SEX"]]))
  updateTextInput(session, "height_raw", value = data[["height_raw"]])
  updateTextInput(session, "weight_raw", value = data[["weight_raw"]])
  updateTextInput(session, "height", value = data[["height"]])
  updateTextInput(session, "weight", value = data[["weight"]])
  # updateTextInput(session, "collector", value = data[["collector"]])
  # updateTextInput(session, "location", value = data[["location"]])
  updateTextInput(session, "tstamp", value = data[["tstamp"]])
  updateDateInput(session, "birth", value = data[["birth"]])
  updateDateInput(session, "image", value = data[["image"]])
  updateTextInput(session, "aged", value = data[["aged"]])
  updateTextInput(session, "agey", value = data[["agey"]])
  updateTextInput(session, "COD", value = data[["COD"]])
  updateTextInput(session, "MOD", value = data[["MOD"]])
  # long bones
  updateNumericInput(session, "FDL", value = data[["FDL"]])
  updateNumericInput(session, "FMSB", value = data[["FMSB"]])
  updateNumericInput(session, "FDB", value = data[["FDB"]])
  updateNumericInput(session, "TDL", value = data[["TDL"]])
  updateNumericInput(session, "TPB", value = data[["TPB"]])
  updateNumericInput(session, "TMSB", value = data[["TMSB"]])
  updateNumericInput(session, "TDB", value = data[["TDB"]])
  updateNumericInput(session, "FBDL", value = data[["FBDL"]])
  updateNumericInput(session, "HDL", value = data[["HDL"]])
  updateNumericInput(session, "HPB", value = data[["HPB"]])
  updateNumericInput(session, "HMSB", value = data[["HMSB"]])
  updateNumericInput(session, "HDB", value = data[["HDB"]])
  updateNumericInput(session, "RDL", value = data[["RDL"]])
  updateNumericInput(session, "RPB", value = data[["RPB"]])
  updateNumericInput(session, "RMSB", value = data[["RMSB"]])
  updateNumericInput(session, "RDB", value = data[["RDB"]])
  updateNumericInput(session, "UDL", value = data[["UDL"]])
  updateNumericInput(session, "UMSB", value = data[["UMSB"]])
  # dentition maxillary
  updateNumericInput(session, "max_LM1", value = data[["max_LM1"]])
  updateNumericInput(session, "max_RM1", value = data[["max_RM1"]])
  updateNumericInput(session, "max_LM2", value = data[["max_LM2"]])
  updateNumericInput(session, "max_RM2", value = data[["max_RM2"]])
  updateNumericInput(session, "max_LM3", value = data[["max_LM3"]])
  updateNumericInput(session, "max_RM3", value = data[["max_RM3"]])
  updateNumericInput(session, "max_LPM1", value = data[["max_LPM1"]])
  updateNumericInput(session, "max_RPM1", value = data[["max_RPM1"]])
  updateNumericInput(session, "max_LPM2", value = data[["max_LPM2"]])
  updateNumericInput(session, "max_RPM2", value = data[["max_RPM2"]])
  updateNumericInput(session, "max_LC", value = data[["max_LC"]])
  updateNumericInput(session, "max_RC", value = data[["max_RC"]])
  updateNumericInput(session, "max_LI1", value = data[["max_LI1"]])
  updateNumericInput(session, "max_RI1", value = data[["max_RI1"]])
  updateNumericInput(session, "max_LI2", value = data[["max_LI2"]])
  updateNumericInput(session, "max_RI2", value = data[["max_RI2"]])
  # dentition mandibular
  updateNumericInput(session, "man_LM1", value = data[["man_LM1"]])
  updateNumericInput(session, "man_RM1", value = data[["man_RM1"]])
  updateNumericInput(session, "man_LM2", value = data[["man_LM2"]])
  updateNumericInput(session, "man_RM2", value = data[["man_RM2"]])
  updateNumericInput(session, "man_LM3", value = data[["man_LM3"]])
  updateNumericInput(session, "man_RM3", value = data[["man_RM3"]])
  updateNumericInput(session, "man_LPM1", value = data[["man_LPM1"]])
  updateNumericInput(session, "man_RPM1", value = data[["man_RPM1"]])
  updateNumericInput(session, "man_LPM2", value = data[["man_LPM2"]])
  updateNumericInput(session, "man_RPM2", value = data[["man_RPM2"]])
  updateNumericInput(session, "man_LC", value = data[["man_LC"]])
  updateNumericInput(session, "man_RC", value = data[["man_RC"]])
  updateNumericInput(session, "man_LI1", value = data[["man_LI1"]])
  updateNumericInput(session, "man_RI1", value = data[["man_RI1"]])
  updateNumericInput(session, "man_LI2", value = data[["man_LI2"]])
  updateNumericInput(session, "man_RI2", value = data[["man_RI2"]])
}

## SHINY SERVER
server <- function(input, output, session) {
  # input fields are treated as a group
  formData <- reactive({
    ages <- date_age(as.character(input[["birth"]]), as.character(input[["image"]]))
    length <- convert_height(input[["height_raw"]])
    weight <- convert_weight(input[["weight_raw"]])
    data <- list()
    for (i in names(GetTableMetadata())) {
      data[[i]] <- input[[i]]
    }
    data[["aged"]] <- ages[["aged"]]
    data[["agey"]] <- ages[["agey"]]
    data[["height"]] <- length
    data[["weight"]] <- weight
    data[["tstamp"]] <- human_time()
    # print(data)
    return(data)
  })

  # get/create input file
  root <- c(home = "~")
  shinyFiles::shinyFileSave(input, "saveFile", roots = root, session = session)
  filePath <- reactive({
    shinyFiles::parseSavePath(root, input$saveFile)$datapath
  })
  output$filePath <- renderUI({
    h6(filePath())
  })
  infile <- eventReactive(filePath(), {
    path <- as.character(isolate(filePath()))
    if (length(path) > 0) {
      .responses <<- readFile(file = path)
    }
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

  # Click "Most recent" button
  observeEvent(input$recent, {
    if (exists(".responses") && length(.responses) > 0) {
      last <- recents()
      updateTextInput(session, "collector", value = last[["collector"]])
      updateTextInput(session, "location", value = last[["location"]])
    }
  })

  # Click "Submit" button -> save data
  observeEvent(input$submit, {
    shinyjs::disable("submit")
    shinyjs::hide(id = "error")
    shinyjs::show(id = "submit_msg")

    tryCatch({
      if (input$uid != "") {
        UpdateData(formData())
        dat <- ReadData()[input$responses_rows_selected, ]
        UpdateInputs(dat, session)
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
      updateTextInput(session, "location", value = data[["location"]])
      shinyjs::text("submit",  "<i class='fa fa-edit'></i> Edit record")
      shinyjs::enable("delete")
    }
  })

  # display table
  output$responses <- DT::renderDataTable({
    infile()
    #update after submit is clicked
    input$submit
    #update after delete is clicked
    input$delete
    #update after reset is clicked
    input$reset
    ShowData()
  }, server = FALSE,
     selection = "single",
     rownames = FALSE,
     filter = list(position = "top", clear = TRUE, plain = FALSE),
     class = "cell-border stripe hover condensed",
     extensions = "ColVis",
     options = list(dom = 'C<"clear">lfrtip',
                    pageLength = 3,
                    lengthMenu = c(1, 3, 5, 10, 20),
                    order = list(list(4, 'desc'))),
     colnames = GetTableLabels(GetTableMetadata()[show()])
  )

  session$onSessionEnded(function() {
    path <- as.character(isolate(filePath()))
    if (length(path) > 0 && !identical(readFile(path), .responses)) {
      saveFile(.responses, path)
      msg <- paste0("Data saved to: ", path)
      print(msg)
    }
    rm(.responses, inherits = TRUE)
    stopApp("Thank you for using KidnapR.")
  })

}

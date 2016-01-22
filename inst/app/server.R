## server.R ##

source("model.R", local = TRUE)
source("crud.R", local = TRUE)
source("helpers.R", local = TRUE)
source("update.R", local = TRUE)

server <- function(input, output, session) {
  shinyjs::disable("delete")
  # input fields are treated as a group
  formData <- reactive({
    data <- list()
    for (i in names(GetTableMetadata())) {
      data[[i]] <- input[[i]]
    }
    if (input$COD == "") data[["COD"]] <- NA
    if (input$MOD == "") data[["MOD"]] <- NA
    if (input$height_raw == "") data[["height_raw"]] <- NA
    if (input$weight_raw == "") data[["weight_raw"]] <- NA
    if (input$birth == input$image) {
      data[["birth"]] <- NA
      data[["image"]] <- NA
    }
    if (input$aged == 0) {
      data[["aged"]] <- NA
      data[["agey"]] <- NA
    }
    data[["tstamp"]] <- human_time()
    return(data)
  })

  # set date input range
  observe({
    updateDateInput(session, "birth", max = as.Date(input$image))
    updateDateInput(session, "image", min = as.Date(input$birth))
  })

  # calculate age values
  observeEvent(input$calcAged, {
    shinyjs::toggleState("aged")
  })
  observe({
    if (input$calcAged) {
      ages <- date_age(as.character(input[["birth"]]), as.character(input[["image"]]))
      updateTextInput(session, "aged", value = ages[["aged"]])
      # updateTextInput(session, "agey", value = ages[["agey"]])
    }
  })
  observe({
      updateTextInput(session, "agey", value = round(as.integer(input$aged) / 365.25, digits = 2))
  })

  # calculate height and weight values
  observe({
    updateTextInput(session, "height", value = as.character(convert_height(input$height_raw)))
  })
  observe({
    updateTextInput(session, "weight", value = as.character(convert_weight(input$weight_raw)))
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
    if (length(path) > 0 && file.exists(path)) {
      .responses <<- readFile(file = path)
    } else if (length(path) > 0) {
      .responses <<- data.frame()
      saveFile(path, .responses)
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
    }
  })
  observeEvent(input$recentLocation, {
    if (exists(".responses") && length(.responses) > 0) {
      last <- recents()
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
      path <- as.character(isolate(filePath()))
      saveFile(path, .responses)
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
    path <- as.character(isolate(filePath()))
    saveFile(path, .responses)
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
    # path <- as.character(isolate(filePath()))
    # if (length(path) > 0 && !identical(readFile(path), .responses)) {
    #   saveFile(path, .responses)
    #   msg <- paste0("Data saved to: ", path)
    #   print(msg)
    # }
    if (exists(".responses")) {
      rm(.responses, inherits = TRUE)
    }
    stopApp("Thank you for using KidnapR.")
  })

}

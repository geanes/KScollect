## server.R ##

source("model.R", local = TRUE)
source("crud.R", local = TRUE)
source("helpers.R", local = TRUE)
source("update.R", local = TRUE)
source("validation.R", local = TRUE)
.responses <- renew()

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
    # if (input$birth == input$image) {
    #   data[["birth"]] <- NA
    #   data[["image"]] <- NA
    # }
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
  # root <- c(home = "~")
  root <- getVolumes()
  shinyFiles::shinyFileSave(input, "saveFile", roots = root, session = session)
  filePath <- reactive({
    shinyFiles::parseSavePath(root, input$saveFile)$datapath
  })
  fileName <- reactive({
    shinyFiles::parseSavePath(root, input$saveFile)$name
  })
  output$filePath <- renderUI({
    h6(fileName())
    # h6(filePath())
  })
  infile <- eventReactive(filePath(), {
    path <- as.character(isolate(filePath()))
    if (length(path) > 0 && file.exists(path)) {
      .responses <<- readFile(file = path)
      UpdateInputs(CreateDefaultRecord(), session)
      shinyjs::html("submit", "<i class='fa fa-plus'></i> Add record")
      shinyjs::disable("delete")
    } else if (length(path) > 0) {
      .responses <- renew()
      # .responses <<- data.frame()
      saveFile(path, .responses)
      UpdateInputs(CreateDefaultRecord(), session)
      shinyjs::html("submit", "<i class='fa fa-plus'></i> Add record")
      shinyjs::disable("delete")
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

  # Badge updates
  observe({
    date_fields <- c(input$birth, input$image)
    text_fields <- c(input$medrec, input$location, input$height_raw,
                     input$weight_raw, input$COD, input$MOD)
    date_count <- ifelse(input$birth == input$image, 0, valid_count(date_fields, "date"))
    age_count <- ifelse(input$aged > 0, 1, 0)
    text_count <- valid_count(text_fields, "default")
    valid <- valid_percent(sum(date_count, text_count, age_count), 9)
    shinyjs::html("medrec-badge", paste0(valid, "%"))
  })
  observe({
    num_fields <- c(input$FDL_L, input$FMSB_L, input$FDB_L, input$FCB_L, input$FIB_L,
                    input$TDL_L, input$TPB_L, input$TMSB_L, input$TDB_L,
                    input$FBDL_L,
                    input$HDL_L, input$HPB_L, input$HMSB_L, input$HDB_L, input$HCB_L, input$HIB_L,
                    input$RDL_L, input$RPB_L, input$RMSB_L, input$RDB_L,
                    input$UDL_L, input$UMSB_L,
                    input$FDL_R, input$FMSB_R, input$FDB_R, input$FCB_R, input$FIB_R,
                    input$TDL_R, input$TPB_R, input$TMSB_R, input$TDB_R,
                    input$FBDL_R,
                    input$HDL_R, input$HPB_R, input$HMSB_R, input$HDB_R, input$HCB_R, input$HIB_R,
                    input$RDL_R, input$RPB_R, input$RMSB_R, input$RDB_R,
                    input$UDL_R, input$UMSB_R)
    num_count <- valid_count(num_fields, "number")
    valid <- valid_percent(num_count, 44)
    shinyjs::html("longbone-badge", paste0(valid, "%"))
  })
  observe({
    num_fields <- c(input$max_M1_L, input$max_M2_L, input$max_M3_L, input$max_PM1_L, input$max_PM2_L, input$max_C_L, input$max_I1_L, input$max_I2_L,
                    input$max_M1_R, input$max_M2_R, input$max_M3_R, input$max_PM1_R, input$max_PM2_R, input$max_C_R, input$max_I1_R, input$max_I2_R,
                    input$man_M1_L, input$man_M2_L, input$man_M3_L, input$man_PM1_L, input$man_PM2_L, input$man_C_L, input$man_I1_L, input$man_I2_L,
                    input$man_M1_R, input$man_M2_R, input$man_M3_R, input$man_PM1_R, input$man_PM2_R, input$man_C_R, input$man_I1_R, input$man_I2_R)
    # side_fields <- c(input$max_M1_side, input$max_M2_side, input$max_M3_side, input$max_PM1_side, input$max_PM2_side, input$max_C_side, input$max_I1_side, input$max_I2_side,
    #                  input$man_M1_side, input$man_M2_side, input$man_M3_side, input$man_PM1_side, input$man_PM2_side, input$man_C_side, input$man_I1_side, input$man_I2_side)
    num_count <- valid_count(num_fields, "number", min = 0, max = 13)
    # side_count <- valid_count(side_fields, "default")
    valid <- valid_percent(num_count, 32)
    # valid <- valid_percent(sum(num_count, side_count), 32)
    shinyjs::html("dentition-badge", paste0(valid, "%"))
  })
  observe({
    drop_fields <- c(input$FH_EF_L, input$FGT_EF_L, input$FLT_EF_L, input$FDE_EF_L,
                     input$TPE_EF_L, input$TDE_EF_L,
                     input$FBPE_EF_L, input$FBDE_EF_L,
                     input$HH_Oss_L, input$HGT_Oss_L, input$HLT_Oss_L, input$HPE_EF_L, input$HC_Oss_L, input$HT_Oss_L, input$HLE_Oss_L, input$HCE1_EF_L, input$HCE2_EF_L, input$HDE_EF_L, input$HME_EF_L,
                     input$RPE_EF_L, input$RDE_EF_L,
                     input$UPE_EF_L, input$UDE_EF_L,
                     input$CT_EF_L, input$CC_Oss, input$TC_Oss, input$ISPR_EF_L, input$ILIS_EF_L, input$PC_Oss_L,

                     input$FH_EF_R, input$FGT_EF_R, input$FLT_EF_R, input$FDE_EF_R,
                     input$TPE_EF_R, input$TDE_EF_R,
                     input$FBPE_EF_R, input$FBDE_EF_R,
                     input$HH_Oss_R, input$HGT_Oss_R, input$HLT_Oss_R, input$HPE_EF_R, input$HC_Oss_R, input$HT_Oss_R, input$HLE_Oss_R, input$HCE1_EF_R, input$HCE2_EF_R, input$HDE_EF_R, input$HME_EF_R,
                     input$RPE_EF_R, input$RDE_EF_R,
                     input$UPE_EF_R, input$UDE_EF_R,
                     input$CT_EF_R, input$ISPR_EF_R, input$ILIS_EF_R, input$PC_Oss_R)
    drop_count <- valid_count(drop_fields, "default")
    valid <- valid_percent(drop_count, 56)
    shinyjs::html("fusion-badge", paste0(valid, "%"))
  })

  # Click "Most recent" button
  observeEvent(input$recent, {
    if (exists(".responses") && nrow(.responses) > 0) {
      last <- recents()
      updateTextInput(session, "collector", value = last[["collector"]])
    }
  })
  observeEvent(input$recentLocation, {
    if (exists(".responses") && nrow(.responses) > 0) {
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
        # UpdateInputs(dat, session)
        UpdateInputs(CreateDefaultRecord(), session)
        shinyjs::html("submit", "<i class='fa fa-plus'></i> Add record")
        shinyjs::disable("delete")
      } else {
        CreateData(formData())
        UpdateInputs(CreateDefaultRecord(), session)
      }
      shinyjs::show(id = "success_msg", anim = TRUE, animType = "fade")
      shinyjs::delay(2000, shinyjs::hide(id = "success_msg", anim = TRUE, animType = "fade"))
    },
    error = function(err) {
      shinyjs::html("error_msg", err$message)
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
    shinyjs::html("submit", "<i class='fa fa-plus'></i> Add record")
    shinyjs::disable("delete")
  })

  # Press "Delete" button -> delete from data
  observeEvent(input$delete, {
    DeleteData(formData())
    UpdateInputs(CreateDefaultRecord(), session)
    path <- as.character(isolate(filePath()))
    saveFile(path, .responses)
    shinyjs::html("submit", "<i class='fa fa-plus'></i> Add record")
    shinyjs::show(id = "delete_msg", anim = TRUE, animType = "fade")
    shinyjs::delay(2000, shinyjs::hide(id = "delete_msg", anim = TRUE, animType = "fade"))
    shinyjs::disable("delete")
  }, priority = 1)

  # Select row in table -> show details in inputs
  observeEvent(input$responses_rows_selected, {
    if (length(input$responses_rows_selected) > 0) {
      data <- ReadData()[input$responses_rows_selected, ]
      UpdateInputs(data, session)
      updateTextInput(session, "location", value = data[["location"]])
      shinyjs::html("submit",  "<i class='fa fa-edit'></i> Edit record")
      shinyjs::enable("delete")
    }
  })

  # display table
  output$responses <- DT::renderDataTable({
    filePath()
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
     # extensions = "ColVis",
     options = list(dom = 'C<"clear">lfrtip',
                    pageLength = 3,
                    lengthMenu = c(1, 3, 5, 10, 20),
                    order = list(list(4, 'desc'))),
     colnames = GetTableLabels(GetTableMetadata()[show()])
  )

  session$onSessionEnded(function() {
    if (exists(".responses")) {
      rm(.responses, inherits = TRUE)
    }
    stopApp("Thank you for using KScollect.")
  })

}

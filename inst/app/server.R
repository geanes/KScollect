################################################################################
####                          MODEL DEFINITION                              ####
################################################################################

# Get table metadata
GetTableMetadata <- function() {
  result <- list(
    uid = c(label = "UID", value = "", type = "character"),
    medrec = c(label = "Medical Record", value = "", type = "character"),
    SEX = c(label = "Sex", value = "M", type = "factor", levels = "F, M", ordered = FALSE),
    height_raw = c(label = "Height (raw)", value = "", type = "character"),
    height = c(label = "Height", value = "", type = "numeric"),
    weight_raw = c(label = "Weight (raw)", value = "", type = "character"),
    weight = c(label = "Weight", value = "", type = "numeric"),
    collector = c(label = "Collector", value = "", type = "character"),
    location = c(label = "Location", value = "", type = "character"),
    tstamp = c(label = "Timestamp", value = "", type = "character"),
    birth = c(label = "Birth Date", value = as.character(Sys.Date()), type = "character"),
    image = c(label = "Image Date", value = as.character(Sys.Date()), type = "character"),
    aged = c(label = "Age (days)", value = NA, type = "integer"),
    agey = c(label = "Age (years)", value = NA, type = "numeric"),
    COD = c(label = "Cause of death", value = NA, type = "character"),
    MOD = c(label = "Manner of death", value = NA, type = "chracter"),
    # femur
    FDL = c(label = "FDL", value = NA, type = "numeric"),
    FMSB = c(label = "FMSB", value = NA, type = "numeric"),
    FDB = c(label = "FDB", value = NA, type = "numeric"),
    FCB = c(label = "FCB", value = NA, type = "numeric"),
    FIB = c(label = "FIB", value = NA, type = "numeric"),
    # tibia
    TDL = c(label = "TDL", value = NA, type = "numeric"),
    TPB = c(label = "TPB", value = NA, type = "numeric"),
    TMSB = c(label = "TMSB", value = NA, type = "numeric"),
    TDB = c(label = "TDB", value = NA, type = "numeric"),
    # fibula
    FBDL = c(label = "FBDL", value = NA, type = "numeric"),
    # humerus
    HDL = c(label = "HDL", value = NA, type = "numeric"),
    HPB = c(label = "HPB", value = NA, type = "numeric"),
    HMSB = c(label = "HMSB", value = NA, type = "numeric"),
    HDB = c(label = "HDB", value = NA, type = "numeric"),
    HCB = c(label = "HCB", value = NA, type = "numeric"),
    HIB = c(label = "HIB", value = NA, type = "numeric"),
    # radius
    RDL = c(label = "RDL", value = NA, type = "numeric"),
    RPB = c(label = "RPB", value = NA, type = "numeric"),
    RMSB = c(label = "RMSB", value = NA, type = "numeric"),
    RDB = c(label = "RDB", value = NA, type = "numeric"),
    # ulna
    UDL = c(label = "UDL", value = NA, type = "numeric"),
    UMSB = c(label = "UMSB", value = NA, type = "numeric"),
    # dentition maxillary
    max_M1 = c(label = "max_M1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M1_side = c(label = "max_M1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_M2 = c(label = "max_M2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M2_side = c(label = "max_M2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_M3 = c(label = "max_M3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M3_side = c(label = "max_M3_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_PM1 = c(label = "max_PM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_PM1_side = c(label = "max_PM1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_PM2 = c(label = "max_PM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_PM2_side = c(label = "max_PM2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_C = c(label = "max_C", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_C_side = c(label = "max_C_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_I1 = c(label = "max_I1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_I1_side = c(label = "max_I1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_I2 = c(label = "max_I2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_I2_side = c(label = "max_I2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    # dentition mandibular
    man_M1 = c(label = "man_M1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M1_side = c(label = "man_M1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_M2 = c(label = "man_M2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M2_side = c(label = "man_M2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_M3 = c(label = "man_M3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M3_side = c(label = "man_M3_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_PM1 = c(label = "man_PM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_PM1_side = c(label = "man_PM1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_PM2 = c(label = "man_PM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_PM2_side = c(label = "man_PM2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_C = c(label = "man_C", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_C_side = c(label = "man_C_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_I1 = c(label = "man_I1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_I1_side = c(label = "man_I1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_I2 = c(label = "man_I2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_I2_side = c(label = "man_I2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE)
    # epiphyseal fusion
  )
  return(result)
}

################################################################################
####                        CRUD OPERATIONS                                 ####
################################################################################

### FILE OPERATIONS ###
saveFile <- function(path, obj = data.frame()) {
  con <- gzfile(path)
  saveRDS(obj, con)
  close(con)
}

readFile <- function(file) {
  con <- gzfile(file)
  result <- readRDS(con)
  close(con)
  return(result)
}

# Set table key
key <- function() "uid"
# Set which columns to show in DT
show <- function() c("medrec", "SEX", "birth", "image", "tstamp", "collector", "location")

# Get table labels
GetTableLabels <- function(x = GetTableMetadata()) {
  unname(purrr::map_chr(x, "label"))
}

# Convert input data to proper type
as.table_type <- function(name, x = GetTableMetadata()[[name]][["value"]]) {
  type <- GetTableMetadata()[[name]][["type"]]
  switch(type,
         "character" = return(as.character(x)),
         "logical" = return(as.logical(x)),
         "integer" = return(as.integer(x)),
         "numeric" = return(as.numeric(x)),
         "factor" = return(factor(x,
                                  levels = trimws(unlist(strsplit(GetTableMetadata()[[name]][["levels"]], ","))),
                                  ordered = GetTableMetadata()[[name]][["ordered"]])
         ),
         "date" = return(as.Date(x)),
         return(x)
  )
}

### DEFAULT/EMPTY RECORD ###
CreateDefaultRecord <- function() {
  default_record <- purrr::map(GetTableMetadata(), "value")
  my_default <- CastData(default_record)
  return(my_default)
}

# Cast from Inputs to a one-row data.frame
CastData <- function(data) {
  datar <- purrr::map2(names(data), data, as.table_type)
  names(datar) <- names(data)
  datar <- as.data.frame(datar, stringsAsFactors = FALSE)
  return(datar)
}

### CREATE ###
CreateData <- function(data) {
  data <- CastData(data)
  data[[key()]] <- UIDgen(paste(data[["collector"]], data[["location"]]))
  if (exists(".responses")) {
    .responses <<- rbind(.responses, data)
  } else {
    .responses <<- data
  }
}

### READ ###
ReadData <- function() {
  if (exists(".responses")) {
    result <- .responses
  }
  return(result)
}

### SHOW ###
ShowData <- function() {
  if (exists(".responses") && length(.responses) > 0) {
    result <- .responses[, show()]
    return(result)
  }
}

### UPDATE ###
UpdateData <- function(data) {
  data <- CastData(data)
  .responses[.responses[[key()]] == data[[key()]], ] <<- data
}

### DELETE ###
DeleteData <- function(data) {
  .responses <<- .responses[.responses[[key()]] != data[[key()]], ]
}

################################################################################
####                          HELPER FUNCTIONS                              ####
################################################################################

# Time as integer
epoch_time <- function() {
  as.integer(Sys.time())
}

# Generate a unique hash for the UID field.
UIDgen <- function(s) {
  x <- paste(epoch_time(), s, sep = " ")
  hash <- digest::digest(x, algo = "md5", serialize = FALSE)
  return(hash)
}

# Human-readable timestamp
human_time <- function() {
  format(Sys.time(), "%Y-%m-%d %H:%M:%OS")
}

# Calculate ages from dates
date_age <- function(start, end) {
  if (start == "" || end == "") return(list(aged = NA, agey = NA))
  age_days <- as.integer(lubridate::ymd(end) - lubridate::ymd(start))
  age_years <- as.numeric(round(age_days/365, digits = 2))
  result <- list(aged = age_days, agey = age_years)
  return(result)
}

# Recents
recents <- function() {
  result <- c(collector = .responses[which(.responses$tstamp == max(.responses$tstamp)), "collector"],
              location = .responses[which(.responses$tstamp == max(.responses$tstamp)), "location"])
  return(result)
}

# Convert length
convert_height <- function(height) {
  hgt <- tolower(height)
  hgt <- gsub(" ", "", hgt)
  meas <- as.numeric(unlist(strsplit(hgt, "(m|cm|ft|in|\"|')")))
  unit <- unlist(strsplit(hgt, "[0-9.]+"))
  unit <- unit[-1]
  if (length(unit) == 0) {
    return(meas[1])
  } else {
    result <- switch(unit[1],
                     "'" = meas[1] * 0.305 + ifelse(!is.na(meas[2]), meas[2] * 0.025, 0),
                     "ft" = meas[1] * 0.305 + ifelse(!is.na(meas[2]), meas[2] * 0.025, 0),
                     "\"" = meas[1] * 0.025,
                     "in" = meas[1] * 0.025,
                     "m" = meas[1] + ifelse(!is.na(meas[2]), meas[2] / 100, 0),
                     "cm" = meas[1] / 100,
                     NA
    )
    return(result)
  }
}

# Convert weight
convert_weight <- function(wt) {
  wt <- tolower(wt)
  wt <- gsub(" ", "", wt)
  meas <- as.numeric(unlist(strsplit(wt, "(kg|g|lb|lbs|oz)")))
  unit <- unlist(strsplit(wt, "[0-9.]+"))
  unit <- unit[-1]
  if (length(unit) == 0) {
    return(meas[1])
  } else {
    result <- switch(unit[1],
                     "lb" = meas[1] * 0.454 + ifelse(!is.na(meas[2]), meas[2] * 0.028, 0),
                     "lbs" = meas[1] * 0.454 + ifelse(!is.na(meas[2]), meas[2] * 0.028, 0),
                     "oz" = meas[1] * 0.028,
                     "g" = meas[1] / 1000,
                     "kg" = meas[1] + ifelse(!is.na(meas[2]), meas[2] / 1000, 0),
                     NA
    )
    return(result)
  }
}

################################################################################
####                          SHINY SERVER                                  ####
################################################################################

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
  updateNumericInput(session, "FCB", value = data[["FCB"]])
  updateNumericInput(session, "FIB", value = data[["FIB"]])
  updateNumericInput(session, "TDL", value = data[["TDL"]])
  updateNumericInput(session, "TPB", value = data[["TPB"]])
  updateNumericInput(session, "TMSB", value = data[["TMSB"]])
  updateNumericInput(session, "TDB", value = data[["TDB"]])
  updateNumericInput(session, "FBDL", value = data[["FBDL"]])
  updateNumericInput(session, "HDL", value = data[["HDL"]])
  updateNumericInput(session, "HPB", value = data[["HPB"]])
  updateNumericInput(session, "HMSB", value = data[["HMSB"]])
  updateNumericInput(session, "HDB", value = data[["HDB"]])
  updateNumericInput(session, "HCB", value = data[["HCB"]])
  updateNumericInput(session, "HIB", value = data[["HIB"]])
  updateNumericInput(session, "RDL", value = data[["RDL"]])
  updateNumericInput(session, "RPB", value = data[["RPB"]])
  updateNumericInput(session, "RMSB", value = data[["RMSB"]])
  updateNumericInput(session, "RDB", value = data[["RDB"]])
  updateNumericInput(session, "UDL", value = data[["UDL"]])
  updateNumericInput(session, "UMSB", value = data[["UMSB"]])
  # dentition maxillary
  updateNumericInput(session, "max_M1", value = data[["max_M1"]])
  updateSelectInput(session, "max_M1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_M1_side"]]), ""))
  updateNumericInput(session, "max_M2", value = data[["max_M2"]])
  updateSelectInput(session, "max_M2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_M2_side"]]), ""))
  updateNumericInput(session, "max_M3", value = data[["max_M3"]])
  updateSelectInput(session, "max_M3_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_M3_side"]]), ""))
  updateNumericInput(session, "max_PM1", value = data[["max_PM1"]])
  updateSelectInput(session, "max_PM1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_PM1_side"]]), ""))
  updateNumericInput(session, "max_PM2", value = data[["max_PM2"]])
  updateSelectInput(session, "max_PM2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_PM2_side"]]), ""))
  updateNumericInput(session, "max_C", value = data[["max_C"]])
  updateSelectInput(session, "max_C_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_C_side"]]), ""))
  updateNumericInput(session, "max_I1", value = data[["max_I1"]])
  updateSelectInput(session, "max_I1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_I1_side"]]), ""))
  updateNumericInput(session, "max_I2", value = data[["max_I2"]])
  updateSelectInput(session, "max_I2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["max_I2_side"]]), ""))
  # dentition mandibular
  updateNumericInput(session, "man_M1", value = data[["man_M1"]])
  updateSelectInput(session, "man_M1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_M1_side"]]), ""))
  updateNumericInput(session, "man_M2", value = data[["man_M2"]])
  updateSelectInput(session, "man_M2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_M2_side"]]), ""))
  updateNumericInput(session, "man_M3", value = data[["man_M3"]])
  updateSelectInput(session, "man_M3_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_M3_side"]]), ""))
  updateNumericInput(session, "man_PM1", value = data[["man_PM1"]])
  updateSelectInput(session, "man_PM1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_PM1_side"]]), ""))
  updateNumericInput(session, "man_PM2", value = data[["man_PM2"]])
  updateSelectInput(session, "man_PM2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_PM2_side"]]), ""))
  updateNumericInput(session, "man_C", value = data[["man_C"]])
  updateSelectInput(session, "man_C_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_C_side"]]), ""))
  updateNumericInput(session, "man_I1", value = data[["man_I1"]])
  updateSelectInput(session, "man_I1_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_I1_side"]]), ""))
  updateNumericInput(session, "man_I2", value = data[["man_I2"]])
  updateSelectInput(session, "man_I2_side", selected = ifelse(!is.na(data[["max_M1_side"]]), as.character(data[["man_I2_side"]]), ""))
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

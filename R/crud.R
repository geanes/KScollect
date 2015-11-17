## crud.R ##

# Set table key
key <- function() "uid"
# Set which columns to show in DT
show <- function() c("medrec", "SEX", "birth", "image", "tstamp", "collector", "location")

# Get table metadata
GetTableMetadata <- function() {
  result <- list(
    uid = c(label = "UID", value = "", type = "character"),
    medrec = c(label = "Medical Record", value = "", type = "character"),
    SEX = c(label = "Sex", value = "M", type = "factor", levels = "F, M"),
    collector = c(label = "Collector", value = "", type = "character"),
    location = c(label = "Location", value = "", type = "character"),
    tstamp = c(label = "Timestamp", value = "", type = "character"),
    birth = c(label = "Birth Date", value = as.character(Sys.Date()), type = "character"),
    image = c(label = "Image Date", value = as.character(Sys.Date()), type = "character"),
    aged = c(label = "Age (days)", value = NA, type = "integer"),
    agey = c(label = "Age (years)", value = NA, type = "numeric"),
    # femur
    FDL = c(label = "FDL", value = NA, type = "numeric"),
    FMSB = c(label = "FMSB", value = NA, type = "numeric"),
    FDB = c(label = "FDB", value = NA, type = "numeric"),
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
    # radius
    RDL = c(label = "RDL", value = NA, type = "numeric"),
    RPB = c(label = "RPB", value = NA, type = "numeric"),
    RMSB = c(label = "RMSB", value = NA, type = "numeric"),
    RDB = c(label = "RDB", value = NA, type = "numeric"),
    # ulna
    UDL = c(label = "UDL", value = NA, type = "numeric"),
    UMSB = c(label = "UMSB", value = NA, type = "numeric")
  )
  return(result)
}

GetTableLabels <- function(x = GetTableMetadata()) {
  unname(purrr::map_chr(x, "label"))
}

as.table_type <- function(name, x = GetTableMetadata()[[name]][["value"]]) {
  type <- GetTableMetadata()[[name]][["type"]]
  switch(type,
         "character" = return(as.character(x)),
         "logical" = return(as.logical(x)),
         "integer" = return(as.integer(x)),
         "numeric" = return(as.numeric(x)),
         "factor" = return(factor(x, levels = trimws(unlist(strsplit(GetTableMetadata()[[name]][["levels"]], ","))))),
         "date" = return(as.Date(x)),
         return(x)
  )
}

## DEFAULT/EMPTY RECORD ###
CreateDefaultRecord <- function() {
  default_record <- purrr::map(GetTableMetadata(), "value")
  my_default <- CastData(default_record)
  return(my_default)
}

# Cast from Inputs to a one-row data.frame
CastData <- function(data) {
  datar <- purrr::map2(names(data), data, as.table_type)
  names(datar) <- names(data)
  datar <- as.data.frame(datar[which(names(data) != key())], stringsAsFactors = FALSE)
  rownames(datar) <- data[key()]
  return(datar)
}

### CREATE ###
CreateData <- function(data) {
  data <- CastData(data)
  rownames(data) <- UIDgen(paste(data[["collector"]], data[["location"]]))
  if (exists("responses")) {
    responses <<- rbind(responses, data)
  } else {
    responses <<- data
  }
}

### READ ###
ReadData <- function() {
  if (exists("responses")) {
    result <- responses
  }
  return(result)
}

### SHOW ###
ShowData <- function() {
  if (exists("responses")) {
    result <- responses[, show()]
    return(result)
  }
}

### UPDATE ###
UpdateData <- function(data) {
  data <- CastData(data)
  responses[row.names(responses) == row.names(data), ] <<- data
}

### DELETE ###
DeleteData <- function(data) {
  responses <<- responses[row.names(responses) != unname(data[key()]), ]
}

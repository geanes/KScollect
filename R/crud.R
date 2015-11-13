## crud.R ##

# Set table key
key <- function() "uid"

# Get table metadata
GetTableMetadata <- function() {
  result <- list(
    uid = c(label = "UID", value = "", type = "character"),
    name = c(label = "Name", value = "", type = "character"),
    used_shiny = c(label = "Used Shiny", value = FALSE, type = "logical"),
    r_num_years = c(label = "R Years", value = 2, type = "integer"),
    collector = c(label = "Collector", value = "", type = "character"),
    tstamp = c(label = "Timestamp", value = "", type = "character"),
    birth = c(label = "Birth Date", value = as.character(Sys.Date()), type = "character"),
    image = c(label = "Image Date", value = as.character(Sys.Date()), type = "character"),
    aged = c(label = "Age (days)", value = NA, type = "integer"),
    agey = c(label = "Age (years)", value = NA, type = "numeric")
  )
  return(result)
}

GetTableLabels <- function() {
  unname(purrr::map_chr(GetTableMetadata(), "label"))
}

as.table_type <- function(name, x = GetTableMetadata()[[name]][["value"]]) {
  type <- GetTableMetadata()[[name]][["type"]]
  switch(type,
         "character" = return(as.character(x)),
         "logical" = return(as.logical(x)),
         "integer" = return(as.integer(x)),
         "numeric" = return(as.numeric(x)),
         "factor" = return(factor(x)),
         "date" = return(as.Date(x)),
         return(x)
  )
}

## DEFAULT/EMPTY RECORD ###
CreateDefaultRecord <- function() {
  default_record <- lapply(names(GetTableMetadata()), as.table_type)
  names(default_record) <- names(GetTableMetadata())
  my_default <- CastData(default_record)
  return(my_default)
}

# Cast from Inputs to a one-row data.frame
CastData <- function(data) {
  datar <- as.data.frame(data[which(names(data) != key())], stringsAsFactors = FALSE)
  rownames(datar) <- data[key()]
  return(datar)
}

### CREATE ###
CreateData <- function(data) {
  data <- CastData(data)
  rownames(data) <- UIDgen(data[["collector"]])
  if (exists("responses")) {
    responses <<- rbind(responses, data)
  } else {
    responses <<- data
  }
}

### READ ###
ReadData <- function() {
  if (exists("responses")) {
    responses
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

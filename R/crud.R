## crud.R ##

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
  datar <- as.data.frame(datar, stringsAsFactors = FALSE)
  return(datar)
}

### CREATE ###
CreateData <- function(data) {
  data <- CastData(data)
  data[[key()]] <- UIDgen(paste(data[["collector"]], data[["location"]]))
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
  responses[responses[[key()]] == data[[key()]], ] <<- data
}

### DELETE ###
DeleteData <- function(data) {
  responses <<- responses[responses[[key()]] != data[[key()]], ]
}

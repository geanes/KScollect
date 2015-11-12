## crud.R ##

# Get table metadata
GetTableMetadata <- function() {
  fields <- c(uid = "UID",
              name = "Name",
              used_shiny = "Used Shiny",
              r_num_years = "R Years",
              collector = "Collector",
              recdate = "Timestamp"#,
              # birth = "Birth Date",
              # image = "Image Date",
              # aged = "Age (days)",
              # agey = "Age (years)"
  )

  result <- list(fields = fields)
  return(result)
}

## DEFAULT/EMPTY RECORD ###
CreateDefaultRecord <- function() {
  mydefault <- CastData(list(uid = "",
                             name = "",
                             used_shiny = FALSE,
                             r_num_years = 2,
                             collector = "",
                             recdate = ""#,
                             # birth = as.character(Sys.Date()),
                             # image = as.character(Sys.Date()),
                             # aged = NA,
                             # agey = NA
  )
  )
  return(mydefault)
}

# Cast from Inputs to a one-row data.frame
CastData <- function(data) {
  # ages <- dateAge(start = data["birth"], end = data["image"])
  # aged <- ages[["aged"]]
  # agey <- ages[["agey"]]
  datar <- data.frame(name = data["name"],
                      used_shiny = as.logical(data["used_shiny"]),
                      r_num_years = as.integer(data["r_num_years"]),
                      collector = as.character(data["collector"]),
                      recdate = as.character(data["recdate"]),
                      # birth = as.character(data["birth"]),
                      # image = as.character(data["image"]),
                      # aged = as.integer(data["aged"]),
                      # agey = as.numeric(data["agey"]),
                      stringsAsFactors = FALSE)

  rownames(datar) <- data["uid"]
  return(datar)
}

# Find the next ID of a new record
# (in mysql, this could be done by an incremental index)
#GetNextId <- function() {
#if (exists("responses") && nrow(responses) > 0) {
#max(as.integer(rownames(responses))) + 1
#} else {
#  return(1)
#}
#}

### CREATE ###
CreateData <- function(data) {
  data <- CastData(data)
  rownames(data) <- UIDgen(as.character(data["collector"]))
  # data["recdate"] <- humanTime()
  #rownames(data) <- GetNextId()
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
  responses <<- responses[row.names(responses) != unname(data["uid"]), ]
}

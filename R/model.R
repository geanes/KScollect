## model.R ##

# Get table metadata
GetTableMetadata <- function() {
  result <- list(
    uid = c(label = "UID", value = "", type = "character"),
    medrec = c(label = "Medical Record", value = "", type = "character"),
    SEX = c(label = "Sex", value = "M", type = "factor", levels = "F, M"),
    length_raw = c(label = "Length (raw)", value = "", type = "character"),
    length = c(label = "Length", value = "", type = "numeric"),
    weight_raw = c(label = "Weight (raw)", value = "", type = "character"),
    weight = c(label = "Weight", value = "", type = "numeric"),
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

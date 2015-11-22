## model.R ##

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
    UMSB = c(label = "UMSB", value = NA, type = "numeric"),
    # dentition maxillary
    max_LM1 = c(label = "max_LM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RM1 = c(label = "max_RM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LM2 = c(label = "max_LM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RM2 = c(label = "max_RM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LM3 = c(label = "max_LM3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RM3 = c(label = "max_RM3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LPM1 = c(label = "max_LPM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RPM1 = c(label = "max_RPM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LPM2 = c(label = "max_LPM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RPM2 = c(label = "max_RPM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LC = c(label = "max_LC", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RC = c(label = "max_RC", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LI1 = c(label = "max_LI1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RI1 = c(label = "max_RI1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_LI2 = c(label = "max_LI2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_RI2 = c(label = "max_RI2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    # dentition mandibular
    man_LM1 = c(label = "man_LM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RM1 = c(label = "man_RM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LM2 = c(label = "man_LM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RM2 = c(label = "man_RM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LM3 = c(label = "man_LM3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RM3 = c(label = "man_RM3", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LPM1 = c(label = "man_LPM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RPM1 = c(label = "man_RPM1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LPM2 = c(label = "man_LPM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RPM2 = c(label = "man_RPM2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LC = c(label = "man_LC", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RC = c(label = "man_RC", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LI1 = c(label = "man_LI1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RI1 = c(label = "man_RI1", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_LI2 = c(label = "man_LI2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_RI2 = c(label = "man_RI2", value = NA, type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE)
  )
  return(result)
}

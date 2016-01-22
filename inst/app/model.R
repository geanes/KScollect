## model.R ##

# Get table metadata
GetTableMetadata <- function() {
  result <- list(
    uid = c(label = "UID", value = "", type = "character"),
    medrec = c(label = "Medical Record", value = "", type = "character"),
    SEX = c(label = "Sex", value = "M", type = "factor", levels = "F, M", ordered = FALSE),
    height_raw = c(label = "Height (raw)", value = NA, type = "character"),
    height = c(label = "Height", value = NA, type = "numeric"),
    weight_raw = c(label = "Weight (raw)", value = NA, type = "character"),
    weight = c(label = "Weight", value = NA, type = "numeric"),
    collector = c(label = "Collector", value = "", type = "character"),
    location = c(label = "Location", value = "", type = "character"),
    tstamp = c(label = "Timestamp", value = "", type = "character"),
    birth = c(label = "Birth Date", value = as.character(Sys.Date()), type = "character"),
    image = c(label = "Image Date", value = as.character(Sys.Date()), type = "character"),
    aged = c(label = "Age (days)", value = NA, type = "integer"),
    agey = c(label = "Age (years)", value = NA, type = "numeric"),
    COD = c(label = "Cause of death", value = NA, type = "character"),
    MOD = c(label = "Manner of death", value = NA, type = "chracter"),
    ## long bone measurements
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
    ## dentition
    # dentition maxillary
    max_M1 = c(label = "max_M1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M1_side = c(label = "max_M1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_M2 = c(label = "max_M2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M2_side = c(label = "max_M2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_M3 = c(label = "max_M3", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_M3_side = c(label = "max_M3_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_PM1 = c(label = "max_PM1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_PM1_side = c(label = "max_PM1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_PM2 = c(label = "max_PM2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_PM2_side = c(label = "max_PM2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_C = c(label = "max_C", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_C_side = c(label = "max_C_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_I1 = c(label = "max_I1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_I1_side = c(label = "max_I1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    max_I2 = c(label = "max_I2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    max_I2_side = c(label = "max_I2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    # dentition mandibular
    man_M1 = c(label = "man_M1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M1_side = c(label = "man_M1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_M2 = c(label = "man_M2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M2_side = c(label = "man_M2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_M3 = c(label = "man_M3", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_M3_side = c(label = "man_M3_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_PM1 = c(label = "man_PM1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_PM1_side = c(label = "man_PM1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_PM2 = c(label = "man_PM2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_PM2_side = c(label = "man_PM2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_C = c(label = "man_C", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_C_side = c(label = "man_C_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_I1 = c(label = "man_I1", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_I1_side = c(label = "man_I1_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    man_I2 = c(label = "man_I2", value = "", type = "factor", levels = paste(1:13, collapse = ", "), ordered = TRUE),
    man_I2_side = c(label = "man_I2_side", value = "", type = "factor", levels = paste(c("M", "L", "R"), collapse = ", "), ordered = FALSE),
    # epiphyseal fusion and ossification
    # femur
    FH_EF = c(label = "FH_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    FGT_EF = c(label = "FGT_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    FLT_EF = c(label = "FLT_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    FDE_EF = c(label = "FDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # tibia
    TPE_EF = c(label = "TPE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    TDE_EF = c(label = "TDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # fibula
    FBPE_EF = c(label = "FBPE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    FBDE_EF = c(label = "FBDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # humerus
    HH_Oss = c(label = "HH_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HGT_Oss = c(label = "HGT_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HLT_Oss = c(label = "HLT_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HPE_EF = c(label = "HPE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    HC_Oss = c(label = "HC_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HT_Oss = c(label = "HT_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HLE_Oss = c(label = "HLE_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HCE1_EF = c(label = "HCE1_EF", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HCE2_EF = c(label = "HCE2_EF", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE),
    HDE_EF = c(label = "HDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    HME_EF = c(label = "HME_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # radius
    RPE_EF = c(label = "RPE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    RDE_EF = c(label = "RDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # ulna
    UPE_EF = c(label = "UPE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    UDE_EF = c(label = "UDE_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    # other
    CT_EF = c(label = "CT_EF", value = "", type = "factor", levels = paste(c(0:2, 23, 3:4), collapse = ", "), ordered = TRUE),
    CC_Oss = c(label = "CC_Oss", value = "", type = "factor", levels = paste(c(0:8), collapse = ", "), ordered = TRUE),
    TC_Oss = c(label = "TC_Oss", value = "", type = "factor", levels = paste(c(0:7), collapse = ", "), ordered = TRUE),
    ISPR_EF = c(label = "ISPR_EF", value = "", type = "factor", levels = paste(c(0:2), collapse = ", "), ordered = TRUE),
    ILIS_EF = c(label = "ILIS_EF", value = "", type = "factor", levels = paste(c(0:2), collapse = ", "), ordered = TRUE),
    PC_Oss = c(label = "PC_Oss", value = "", type = "factor", levels = paste(c(0:1), collapse = ", "), ordered = TRUE)
  )
  return(result)
}

## helpers.R ##

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

## helpers.R ##

# Generate a unique hash for the UID field.
UIDgen <- function(name) {
  x <- paste(epochTime(), name, sep = " ")
  hash <- digest::digest(x, algo = "md5", serialize = FALSE)
  return(hash)
}

# human-readable timestamp
humanTime <- function() {
  format(Sys.time(), "%Y-%m-%d %H:%M:%OS")
}

# time as integer
epochTime <- function() {
  as.integer(Sys.time())
}

dateAge <- function(start, end) {
  age_days <- as.integer(lubridate::ymd(end) - lubridate::ymd(start))
  age_years <- as.numeric(round(age_days/365, digits = 2))
  result <- list(aged = age_days, agey = age_years)
  return(result)
}

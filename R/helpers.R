## helpers.R ##

# time as integer
epoch_time <- function() {
  as.integer(Sys.time())
}

# Generate a unique hash for the UID field.
UIDgen <- function(s) {
  x <- paste(epoch_time(), s, sep = " ")
  hash <- digest::digest(x, algo = "md5", serialize = FALSE)
  return(hash)
}

# human-readable timestamp
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
  result <- c(collector = responses[which(responses$tstamp == max(responses$tstamp)), "collector"],
              location = responses[which(responses$tstamp == max(responses$tstamp)), "location"])
  return(result)
}

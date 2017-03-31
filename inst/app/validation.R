## validation.R ##

# test for truthiness
isTruthy <- function(x)
{
if (inherits(x, "try-error"))
return(FALSE)
if (!is.atomic(x))
return(TRUE)
if (is.null(x))
return(FALSE)
if (length(x) == 0)
return(FALSE)
if (all(is.na(x)))
return(FALSE)
if (is.character(x) && !any(nzchar(stats::na.omit(x))))
return(FALSE)
if (inherits(x, "shinyActionButtonValue") && x == 0)
return(FALSE)
if (is.logical(x) && !any(stats::na.omit(x)))
return(FALSE)
return(TRUE)
}

# count valid for a list of inputs
valid_count <- function(values, type = "default", ...) {
  count <- 0
  elipses <- list(...)
  min <- ifelse("min" %in% names(elipses), elipses[["min"]], -1)
  max <- ifelse("max" %in% names(elipses), elipses[["max"]], 10000)
  count <- switch(type,
                  number = sum(sapply(values, validNumber, min = min, max = max)),
                  date = sum(sapply(values, validDate)),
                  default = sum(sapply(values, isTruthy))
            )
  return(count)
}
valid_percent <- function(count = 0, total = 100) {
  percent <- ceiling((count / total) * 100)
  return(percent)
}

# valiidate date format yyyy-mm-dd
validDate <- function(x) {
  isTruthy(grep(
    "(?:10|20)[0-9]{2}-(?:(?:0[1-9]|1[0-2])-(?:0[1-9]|1[0-9]|2[0-9])|(?:(?!02)(?:0[1-9]|1[0-2])-(?:30))|(?:(?:0[13578]|1[02])-31))",
    x, perl = TRUE))
}

# validate numeric
validNumber <- function(x, min = 0, max = 10000) {
  if (!isTruthy(x)) return(FALSE)
  if (!is.numeric(x)) return(FALSE)
  ifelse(x > min && x <= max, TRUE, FALSE)
}

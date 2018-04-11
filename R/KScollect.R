#' KScollect: Shiny application to collect data for future inclusion in the
#' KidStats package.
#'
#' \code{KScollect} Purpose built Shiny application to collect data.
#'
#' @docType package
#' @name KScollect
NULL

#' @import shiny shinyFiles
NULL

#' KScollect shiny app call
#' @examples
#' KScollect()
#' @export
KScollect <- function(new = NULL){
  # library(shinyFiles)
  if (length(new) > 0 && !file.exists(new)) {
    file.create(new)
    shinyOptions(newfile = TRUE)
    file_path <- new
  } else {
    shinyOptions(newfile = FALSE)
    file_path <- file.choose()
  }
  shinyOptions(file_path = file_path)
  shiny::runApp(system.file('app', package = 'KScollect'), launch.browser = TRUE)
}

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
KScollect <- function(){
  library(shinyFiles)
  shiny::runApp(system.file('app', package = 'KScollect'), launch.browser = TRUE)
}

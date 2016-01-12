#' kidnapr: Shiny application to collect data for future inclusion in the
#' kidstats package.
#'
#' \code{kidnapr} Purpose built Shiny application to collect data.
#'
#' @docType package
#' @name kidnapr
NULL

#' @import shiny shinyFiles
NULL

#' KidnapR shiny app call
#' @examples
#' kidnapr()
#' @export
kidnapr <- function(){
  # library(shinyFiles)
  requireNamespace("shinyFiles", quietly = TRUE)
  shiny::runApp(system.file('app', package = 'kidnapr'), launch.browser = TRUE)
}

renew <- function() {
  responses <- data.frame(matrix(ncol = length(names(GetTableMetadata())), nrow = 0))
  names(responses) <- names(GetTableMetadata())
  return(responses)
}

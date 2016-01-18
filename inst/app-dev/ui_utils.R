## ui_utils.R ##

# column_xs
column_xs <- function(width, ..., offset = 0)
{
  if (!is.numeric(width) || (width < 1) || (width > 12))
    stop("column width must be between 1 and 12")
  colClass <- paste0("col-xs-", width)
  if (offset > 0)
    colClass <- paste0(colClass, " col-xs-offset-")
  div(class = colClass, ...)
}

# add attributes to inputs
add_attribs <- function(tag, ..., type = "input") {
  switch(type,
    button = {
        tag$attribs <- c(tag$attribs, list(...))
      },
    input = {
        tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
      },
    select = {
        tag$children[[2]]$children[[1]]$attribs <- c(tag$children[[2]]$children[[1]]$attribs, list(...))
      },
    numeric = {
        tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
      },
    date = {
        tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
      },
    radio = {
      tag$children[[2]]$attribs <- c(tag$children[[2]]$attribs, list(...))
      }
  )
  tag
}

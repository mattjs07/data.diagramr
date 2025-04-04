#' Creates a unicode box this length matching text
#'
#' @param text A string
#' @param print Boolean, whether to print result or not
#'
#' @returns vector of 3 lines (top - text - bottom)
#' @export
#'
#' @examples create_box('Input A')
create_box <- function(text, print = FALSE) {
  lines <- strsplit(text, "\n")[[1]]
  max_length <- max(nchar(lines))
  top_bottom_border <- paste("┌", paste(rep("─", max_length + 2), collapse = ""), "┐", sep = "")
  side_borders <- paste("│ ", sprintf(paste("%-", max_length, "s", sep = ""), lines), " │", sep = "")
  box <- list(top_bottom_border, side_borders, paste("└", paste(rep("─", max_length + 2), collapse = ""), "┘", sep = ""))

  if(print){
    for (line in box) {
      cat(line, "\n")
    }
  } else{ return(box) }

}

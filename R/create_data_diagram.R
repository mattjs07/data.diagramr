#' Wrapper around create_data_diagram_horizontal and create_data_diagram_vertical
#'
#' @param inputs a vector of strings
#' @param outputs a vector of strings
#' @param shape
#'
#' @returns A Unicode horizontal or vertical data diagram
#' @export
#'
#' @examples create_data_diagram(inputs = c("Input A", "Input B"), outputs = c("Output A", "Output B"), shape = "horizontal")
create_data_diagram <- function(inputs, outputs, shape = 'horizontal'){

  if(shape == 'horizontal'){
    create_data_diagram_horizontal(inputs, outputs)
  } else if(shape == 'vertical'){
    create_data_diagram_vertical(inputs, outputs)
  } else {message(glue::glue("shape '{shape}' is not recognized, please choose 'horizontal' or 'vertical' "))}
}

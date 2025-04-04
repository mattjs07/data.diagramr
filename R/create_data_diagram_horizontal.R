#' Creates an horizontal data diagram
#'
#' @param inputs a vector of strings
#' @param outputs a vector of strings
#'
#' @returns A Unicode horizontal data diagram
#' @export
#'
#' @examples create_data_diagram_horizontal(inputs = c("Input A", "Input B"), outputs = c("Output A", "Output B"))
create_data_diagram_horizontal <- function(inputs, outputs) {
  input_boxes <- lapply(inputs, create_box)
  output_boxes <- lapply(outputs, create_box)

  max_length_inputs <- max(sapply(input_boxes, function(box) nchar(box[[1]])))
  max_length_outputs <- max(sapply(output_boxes, function(box) nchar(box[[1]])))

  # Standardiser les longueurs des boîtes
  input_boxes <- lapply(input_boxes, function(box) {
    box <- sapply(box, function(line) sprintf(paste0('%-', max_length_inputs, 's'), line))
    return(box)
  })

  output_boxes <- lapply(output_boxes, function(box) {
    box <- sapply(box, function(line) sprintf(paste0('%-', max_length_outputs, 's'), line))
    return(box)
  })

  max_lines_inputs <- max(sapply(input_boxes, length))
  max_lines_outputs <- max(sapply(output_boxes, length))
  max_lines <- max(max_lines_inputs, max_lines_outputs)

  # Étendre toutes les boîtes pour avoir le même nombre de lignes
  input_boxes <- lapply(input_boxes, function(box) c(box, rep("", max_lines - length(box))))
  output_boxes <- lapply(output_boxes, function(box) c(box, rep("", max_lines - length(box))))

  diagram_lines <- vector("character", max_lines)
  for (i in 1:max_lines) {
    input_line <- paste(sapply(input_boxes, function(box) box[[i]]), collapse = " ")
    output_line <- paste(sapply(output_boxes, function(box) box[[i]]), collapse = " ")
    if (i == ceiling(max_lines / 2)) {
      diagram_lines[i] <- paste0(input_line, " ==> ", output_line)
    } else {
      diagram_lines[i] <- paste0(input_line, "     ", output_line)
    }
  }

  for (line in diagram_lines) {
    cat(line, "\n")
  }
}

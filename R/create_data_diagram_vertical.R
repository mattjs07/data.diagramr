#' Creates a vertical data diagram
#'
#' @param inputs a vector of strings
#' @param outputs a vector of strings
#'
#' @returns A Unicode horizontal data diagram
#' @export
#'
#' @examples create_data_diagram_vertical(inputs = c("Input A", "Input B"), outputs = c("Output A", "Output B"))
create_data_diagram_vertical <- function(inputs, outputs) {
  input_boxes <- lapply(inputs, create_box)
  output_boxes <- lapply(outputs, create_box)

  max_lines_inputs <- max(sapply(input_boxes, length))
  max_lines_outputs <- max(sapply(output_boxes, length))

  diagram_lines <- list()

  # Ajouter les boîtes d'entrée
  for (box in input_boxes) {
    diagram_lines <- append(diagram_lines, box)
  }

  # Ajouter suffisamment d'espace pour aligner les boîtes de sortie
  max_length <- max(sapply(c(inputs, outputs), nchar))
  space_line <- sprintf("%-*s", max_length + 6, " ")

  # Ajout de la flèche centré vers le bas
  arrow_line <- paste(rep(" ", nchar(input_boxes[[1]][1])/2), collapse = "")
  arrow_line <- paste0(arrow_line, "⬇")
  diagram_lines <- append(diagram_lines, list(arrow_line))

  # Ajouter les boîtes de sortie
  for (box in output_boxes) {
    diagram_lines <- append(diagram_lines, box)
  }

  for (line in diagram_lines) {
    cat(line, "\n")
  }
}

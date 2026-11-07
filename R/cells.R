#' TODO
#' 
#' TODo
#' @param id TODO
#' @param type TODO
#' @param z TODO
#' @param attrs TODO
#' @returns TODO
#' @examples
#' # TODO
#' 
#' @export
jointjs_cell <- function(id, type, z, attrs) {
  structure(
    list(
      id    = id,
      type  = type,
      z     = z,
      attrs = attrs
    ),
    class = "jointjs_cell"
  )
}

#' TODO
#' 
#' TODO
#' @inheritParams jointjs_cell
#' @param body TODO
#' @param label TODO
#' @param position TODO
#' @param size TODO
#' @param angle TODO
#' @param ports TODO
#' @param ... TODO
#' @returns TODO
#' @examples
#' # TODO
#' @export
jointjs_element <- function(
    id,
    type     = "standard.Rectangle",
    z        = 1L,
    body     = list(
      stroke = "#000000",
      fill   = "#FFFFFF",
      rx     = 5L,
      ry     = 5L,
      magnet = TRUE
    ),
    label    = list(
      fontSize   = 13L,
      fill       = "#000000",
      text       = "Node",
      fontFamily = "sans-serif"
    ),
    position = list(x = 0, y = 0),
    size     = list(width = 120, height = 50),
    angle    = 0,
    ports    = list(),
    ...) {
  attrs <- list(
    body = body,
    label = label
  )
  cell <- jointjs_cell(id = id, type = type, z = z, attrs = attrs) |>
    unclass() |>
    c(
      list(
        position = position,
        size     = size,
        angle    = angle,
        ports    = ports
      ),
      list(...)
    )
  class(cell) <- c("jointjs_element", "jointjs_cell")
  cell
}
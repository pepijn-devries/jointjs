#' Create an Interactive JointJS Diagram
#'
#' TODO
#' @param paper TODO
#' @param graph TODO
#' @param width TODO
#' @param height TODO
#' @param elementId TODO
#' @returns TODO
#' @examples
#' if (interactive()) {
#'   jointjs(list(gridSize = 20, drawGrid = TRUE, backgroundColor = "#E9ECEF"))
#' }
#' @export
jointjs <- function(
    paper = list(
      gridSize = 20,
      drawGrid = TRUE,
      color = "#E9ECEF"
    ),
    graph = NULL,
    width = NULL,
    height = NULL,
    elementId = NULL) {
  
  htmlwidgets::createWidget(
    name      = "jointjs",
    list(
      paper = paper,
      graph = graph
    ),
    width     = width,
    height    = height,
    package   = "jointjs",
    elementId = elementId
  )
}

#' Shiny bindings for jointjs
#'
#' Output and render functions for using jointjs within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like `"100\%"`,
#'   `"400px"`, `"auto"`) or a number, which will be coerced to a
#'   string and have `"px"` appended.
#' @param expr An expression that generates a jointjs
#' @param env The environment in which to evaluate `expr`.
#' @param quoted Is `expr` a quoted expression (with `quote()`)? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name jointjs-shiny
#'
#' @export
jointjsOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "jointjs", width, height, package = "jointjs")
}

#' @rdname jointjs-shiny
#' @export
renderJointjs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  htmlwidgets::shinyRenderWidget(expr, jointjsOutput, env, quoted = TRUE)
}

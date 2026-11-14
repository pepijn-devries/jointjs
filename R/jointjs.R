#' Create an Interactive JointJS Diagram
#'
#' A wrapper around the JavaScript JointJS library to create an
#' interactive html widget. It can be used to draw and edit diagrams.
#' @param paper Either a named list with paper properties, or
#' a [jointjs_paper] class object.
#' @param graph Either a named list of cells to draw, or a
#' [jointjs_graph] class object
#' @inheritParams htmlwidgets::createWidget
#' @inherit htmlwidgets::createWidget return
#' @examples
#' if (interactive()) {
#'   graph <-
#'     jointjs_graph$new()$
#'       add_elements(
#'         jointjs_rectangle$new(id = "hello", label = list(text = "Hello"))$
#'           set_position(5, 5),
#'         jointjs_circle$new(id = "world", label = list(text = "World"))$
#'           set_position(70, 5),
#'         jointjs_doubleLink$new(source = list(id = "hello"),
#'                                target = list(id = "world"))
#'       )
#'   jointjs(graph = graph)
#' }
#' @export
jointjs <- function(
    paper = jointjs_paper$new(),
    graph = NULL,
    width = NULL,
    height = NULL,
    elementId = NULL) {

  if (inherits(paper, "jointjs_paper")) paper <- paper$get_list()
  if (inherits(graph, "jointjs_graph")) graph <- graph$get_list()
  
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
jointjsOutput <- function(outputId, width = "100%", height = "400px") {
  htmlwidgets::shinyWidgetOutput(outputId, "jointjs", width, height, package = "jointjs")
}

#' @rdname jointjs-shiny
#' @export
renderJointjs <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) }
  htmlwidgets::shinyRenderWidget(expr, jointjsOutput, env, quoted = TRUE)
}

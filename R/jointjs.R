#' Create an Interactive JointJS Diagram
#'
#' TODO
#' @param gridSize TODO
#' @param drawGrid TODO
#' @param backgroundColor TODO
#' @param width TODO
#' @param height TODO
#' @param elementId TODO
#' @returns TODO
#' @examples
#' if (interactive()) {
#'   jointjs(gridSize = 20, drawGrid = TRUE, backgroundColor = "#E9ECEF")
#' }
#' @export
jointjs <- function(gridSize = 20, drawGrid = TRUE, backgroundColor = "#E9ECEF", 
                    width = NULL, height = NULL, elementId = NULL) {
  
  x = list(
    gridSize = gridSize,
    drawGrid = drawGrid,
    backgroundColor = backgroundColor
  )
  
  htmlwidgets::createWidget(
    name      = "jointjs",
    x,
    width     = width,
    height    = height,
    package   = "jointjs",
    elementId = elementId
  )
}

#' Custom HTML Layout for JointJS Widget
#' 
#' This function is automatically recognized by htmlwidgets. 
#' It builds the menu and canvas container as a single unit.
#' @noRd
jointjs_html <- function(id, style, class, ...) {
  htmltools::tags$div(
    id = paste0("wrapper-", id),
    class = "jointjs-widget-wrapper",
    htmltools::tags$div(
      class = "jointjs-menu",
      style = "padding: 10px; background: #343a40; color: white; display: flex; gap: 10px; align-items: center;",
      htmltools::tags$h4("Controls:", style = "margin: 0; font-size: 14px; font-family: sans-serif;"),
      htmltools::tags$button(id = "btn-add-rect", "Add Rectangle", class = "btn"),
      htmltools::tags$button(id = "btn-clear", "Clear Canvas", class = "btn")
    ),
    htmltools::tags$div(id = id, style = style, class = class)
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

#' Create A JointJS Graph
#' 
#' Use the `jointjs_graph` class to define a diagram that can be rendered
#' with [jointjs()].
#' @export
#' @family root-classes
#' @include elements.R
jointjs_graph <- R6::R6Class(
  "jointjs_graph",
  public = list(
    #' @description
    #' Initialise a JointJS Graph
    #' @param x A named `list` of cell objects represented as `list`s.
    #' You can use the graph state object returned by a Shiny widget
    #' to initiate a graph class object.
    #' @param ... Ignored
    initialize = function(x, ...) {
      if (!missing(x) && length(x) > 0) {
        private$graph <- x
      }
    },
    #' @description
    #' Add elements to the graph. These can be any object that inherit
    #' from the [jointjs_cell] class. So, these can be shapes like
    #' [jointjs_rectangle] and [jointjs_image], but also links like
    #' [jointjs_doubleLink].
    #' @param ... Pass any number of items to be added to the graph
    #' here.
    add_elements = \(...) {
      cells <- list(...) |>
        lapply(\(y) y$get_list())
      private$graph$cells <- c(private$graph$cells, cells)
      self
    },
    #' @description
    #' This is just short for `jointjs(graph = x)`, where `x`
    #' is a `jointjs_graph` class object.
    #' @param ... Arguments passed to [jointjs()]
    get_widget = \(...) {
      jointjs(graph = private$graph, ...)
    },
    #' @description
    #' Returns the `list` of cells that define the graph.
    get_list = \() {
      private$graph
    }
  ),
  private = list(
    graph = list(cells = list())
  )
)
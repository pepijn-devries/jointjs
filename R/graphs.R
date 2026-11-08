#' TODO
#' 
#' TODO
#' @export
#' @include elements.R
jointjs_graph <- R6::R6Class(
  "jointjs_graph",
  public = list(
    #' @description
    #' TODO
    #' @param x TODO
    #' @param ... TODO
    initialize = function(x, ...) {
      
    },
    #' @description
    #' TODO
    #' @param ... TODO
    add_elements = \(...) {
      cells <- list(...) |>
        lapply(\(y) y$get_list())
      private$graph <- list(cells = cells)
      self
    },
    #' @description
    #' TODO
    #' @param ... TODO
    get_widget = \(...) {
      jointjs(graph = private$graph, ...)
    }
  ),
  private = list(
    graph = list()
  )
)
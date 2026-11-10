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
      if (!missing(x) && length(x) > 0) {
        private$graph <- x ## TODO do we need to check validity of x?
      }
    },
    #' @description
    #' TODO
    #' @param ... TODO
    add_elements = \(...) {
      cells <- list(...) |>
        lapply(\(y) y$get_list())
      private$graph$cells <- c(private$graph$cells, cells)
      self
    },
    #' @description
    #' TODO
    #' @param ... TODO
    get_widget = \(...) {
      jointjs(graph = private$graph, ...)
    },
    #' @description
    #' TODO
    get_list = \() {
      private$graph
    }
  ),
  private = list(
    graph = list()
  )
)
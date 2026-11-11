#' TODO
#' 
#' TODO
#' @export
jointjs_link <- R6::R6Class(
  "jointjs_link",
  inherit = jointjs_cell,
  public = list(
    #' @description
    #' TODO
    #' @param source TODO
    #' @param target TODO
    #' @param vertices TODO
    #' @param ... TODO
    initialize = \(source, target, vertices, ...) {
      super$initialize(...)
      private$source <- source
      private$target <- target
      private$type <- "standard.Link"
    }
  ),
  private = list(
    source = list(id = NULL),
    target = list(id = NULL)
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_doubleLink <- R6::R6Class(
  "jointjs_doubleLink",
  inherit = jointjs_link,
  public = list(
    #' @description
    #' TODO
    initialize = \(source, target, vertices, ...) {
      super$initialize(source, target, vertices, ...)
      private$type <- "standard.DoubleLink"
    }
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_shadowLink <- R6::R6Class(
  "jointjs_shadowLink",
  inherit = jointjs_link,
  public = list(
    #' @description
    #' TODO
    initialize = \(source, target, vertices, ...) {
      super$initialize(source, target, vertices, ...)
      private$type <- "standard.ShadowLink"
    }
  )
)

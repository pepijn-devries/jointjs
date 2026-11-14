#' Links Between Elements in a JointJS Diagram
#' 
#' Create a link between a source and target element or location
#' in a JointJS diagram.
#' @export
jointjs_link <- R6::R6Class(
  "jointjs_link",
  inherit = jointjs_cell,
  public = list(
    #' @description
    #' The link initialiser.
    #' @param source,target `source` and `target` indicate
    #' the route the link should take. It can be a point (a `list` with
    #' an `x` and `y` coordinate), or a `list` containing an `id` of
    #' the element that should be linked. You can also provide a `port`
    #' value to that list if you wish to connect to a specific port
    #' on the element.
    #' @param vertices A `list` of coordinates where the link should
    #' pass through. The list is unnamed and each element should
    #' be a list of and `x` and `y` value.
    #' @param ... Arguments passed to parent class initialiser.
    #' @examples
    #' jointjs_link$new(vertices = list(
    #'     list(x = 50, y = 50),
    #'     list(x = 40, y = 60)
    #'   ))
    initialize = \(source, target, vertices, ...) {
      super$initialize(...)
      if (!missing(source)) private$source <- source
      if (!missing(target)) private$target <- target
      if (!missing(vertices)) private$vertices <- vertices
      private$type <- "standard.Link"
    }
  ),
  private = list(
    source = list(id = NULL),
    target = list(id = NULL),
    vertices = NULL
  )
)

#' Double Links Between Elements in a JointJS Diagram
#' 
#' Create a double line link between a source and target element or location
#' in a JointJS diagram.
#' @export
jointjs_doubleLink <- R6::R6Class(
  "jointjs_doubleLink",
  inherit = jointjs_link,
  public = list(
    #' @description
    #' The link initialiser.
    initialize = \(source, target, vertices, ...) {
      super$initialize(source, target, vertices, ...)
      private$type <- "standard.DoubleLink"
    }
  )
)

#' Shadow Links Between Elements in a JointJS Diagram
#' 
#' Create a thicker line link with shadow between a source and
#' target element or location in a JointJS diagram.
#' @export
jointjs_shadowLink <- R6::R6Class(
  "jointjs_shadowLink",
  inherit = jointjs_link,
  public = list(
    #' @description
    #' The link initialiser.
    initialize = \(source, target, vertices, ...) {
      super$initialize(source, target, vertices, ...)
      private$type <- "standard.ShadowLink"
    }
  )
)

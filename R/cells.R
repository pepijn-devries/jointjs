#' @title jointjs_cell: The Basis for JointJS Elements
#' @description
#' TODO
#' @include helpers.R
#' @export
jointjs_cell <-
  R6::R6Class(
    "jointjs_cell",
    public = list(
      #' @description
      #' A short description...
      #' 
      #' @param id TODO
      #' @param type TODO
      #' @param z TODO
      #' @param ... TODO
      initialize = \(id, type, z, ...) {
        if (missing(id)) private$id <- .generate_hex_id() else
          private$id <- id
        if (!missing(type)) private$type <- type
        if (!missing(z)) private$z <- z
        attrs <- list(...)
        if (length(attrs) > 0) private$attrs <- attrs
      }
    ),
    private = list(
      id    = "",
      type  = "standard.Rectangle",
      z     = 1L,
      attrs = NULL
    )
  )

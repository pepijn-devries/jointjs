#' @title The Backbone of JointJS Elements
#' @description
#' It is a backbone structure used by jointjs to construct elements for a diagram.
#' Usually you don't initiate cells directly. Rather, it is more efficient to
#' create its children and grandchildren, e.g.:
#' [jointjs_circle], [jointjs_image], [jointjs_rectangle], etc.
#' @include helpers.R
#' @export
jointjs_cell <-
  R6::R6Class(
    "jointjs_cell",
    public = list(
      #' @description
      #' Initialise a jointjs_cell class object.
      #' @param id A unique identifier (`character`) used to identify the cell.
      #' It can be used to link cells together, by referring to these ids. By
      #' default a 16 character random hexadecimal code is generated as an id.
      #' @param type Specifies the type of cell this object represents. Its advised
      #' to create cells using its or grand-children
      #' (e.g. [jointjs_circle], [jointjs_rectangle], etc.). They will automatically
      #' assign the correct type for you. By default it will be set to
      #' `"standard.Rectangle"` (a rectangle).
      #' @param z A depth index. It will determine the plotting order on its
      #' parent container.
      #' @param ... Parameters that will be set as SVG attributes to this object.
      initialize = \(id, type, z, ...) {
        if (missing(id)) private$id <- .generate_hex_id() else
          private$id <- id
        if (!missing(type)) private$type <- type
        if (!missing(z)) private$z <- z
        attrs <- list(...)
        if (length(attrs) > 0) private$attrs <- attrs
      },
      #' @description
      #' Set attributes to the cell
      #' @param ... Any valid attributes to a JointJS cell.
      set_attrs = function(...) {
        attrs <- list(...)
        if (length(attrs) > 0) private$attrs[names(attrs)] <- attrs
        self
      },
      #' @description
      #' Coerce the `jointjs_cell` object to a named list.
      get_list = \() {
        result <- as.list(private)
        result[lengths(result) > 0]
      }
    ),
    private = list(
      id    = NULL,
      type  = "standard.Rectangle",
      z     = 1L,
      attrs = NULL
    )
  )

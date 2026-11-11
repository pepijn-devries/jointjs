#' Elements to Build a JointJS Diagram
#' 
#' A generic template to create shapes for a [jointjs_graph]. Shapes are
#' visualised by [https://www.w3.org/groups/wg/svg/](SVG) elements.
#' `jointjs_element` objects are R's representation of such elements.
#' This R class specifies the elements such that they can be used to
#' construct a [jointjs_graph]. It's usually more effective to initialise
#' a child class, such as [jointjs_rectangle], [jointjs_image], [jointjs_circle],
#' etc. #TODO Camel Case
#' @include cells.R
#' @param x,y Coordinates relative to its parent container.
#' @param fill Fill colour
#' @param stroke Stroke colour
#' @param strokeWidth Width of the stroke line
#' @param text A text to display
#' @param color Colour of the element
#' @param fontFamily Font family for the text to display
#' @param fontSize Font size for the text to display
#' @param href A Uniform Resource Identifier (URI) to locate a resource (e.g. image)
#' @param magnet TODO
#' @param ... Additional SVG attributes accepted by the specific SVG element
#' @export
jointjs_element <- R6::R6Class(
  "jointjs_element",
  inherit = jointjs_cell,
  public = list(
    #' @description
    #' Set the element's position relative to its parent container.
    set_position = \(x, y) {
      private$position <- list(x = x, y = y)
      self
    },
    #' @description
    #' Set image attributes for the element.
    set_image = function(href, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$image[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set border attributes for the element.
    set_border = function(fill, stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$border[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set background attributes for the element.
    set_background = function(fill, stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$background[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set top attributes for the element (used to visualise the top of
    #' a cylinder base).
    set_top = function(fill, stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$top[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set line attributes for the element.
    set_line = function(stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$line[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set shadow attributes for the element.
    set_shadow = function(stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$shadow[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set outline attributes for the element.
    set_outline = function(stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$outline[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set wrapper attributes for the element.
    set_wrapper = function(stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$wrapper[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set header attributes for the element.
    set_header = function(fill, stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$header[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set headerText attributes for the element.
    set_headerText = function(text, color, fontFamily, fontSize, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$headerText[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set bodyText attributes for the element.
    set_bodyText = function(text, color, fontFamily, fontSize, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$bodyText[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set body attributes for the element.
    set_body = function(fill, stroke, strokeWidth, magnet, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$body[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Set label attributes for the element.
    set_label = function(text, color, fontFamily, fontSize, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$label[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' Returns a named list representation of the element.
    get_list = \() {
      result <- lapply(private, \(x) x)
      result[!unlist(lapply(result, is.null))]
    }
  ),
  private = list(
    position   = list(x = 0, y = 0),
    angle      = 0,
    size       = list(width = 50, height = 50),
    attrs      = list(
      image      = NULL, ## SVGImageElement
      border     = NULL, ## SVGRectElement / SVGEllipseElement
      background = NULL, ## SVGRectElement / SVGEllipseElement
      top        = NULL, ## SVGEllipseElement
      line       = NULL, ## SVGPathElement
      shadow     = NULL, ## SVGPathElement
      outline    = NULL, ## SVGPathElement
      wrapper    = NULL, ## SVGPathElement
      header     = NULL, ## SVGRectElement
      headerText = NULL, ## SVGTextElement
      bodyText   = NULL, ## SVGTextElement
      body       = NULL, ## depends on parent cell type
      label      = NULL  ## SVGTextElement
    )
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_borderedImage <- R6::R6Class(
  "jointjs_borderedImage",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param href TODO
    #' @param ... TODO
    initialize = \(href, ...) {
      super$initialize(...)
      private$type <- "standard.BorderedImage"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_circle <- R6::R6Class(
  "jointjs_circle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Circle"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_cylinder <- R6::R6Class(
  "jointjs_cylinder",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Cylinder"
    },
    #' @description TODO
    #' @param topRy TODO
    set_body = function(fill, stroke, strokeWidth, magnet, topRy, ...) {
      if (missing(topRy)) {
        rlang::abort(c(
          x = "jointjs_cylinder needs 'topRy'!",
          i = "Try setting 'topRy' to '10%'"
        ))
      }
      non_missing <- .capture_r6_inputs()
      private$attrs$body[names(non_missing)] <- non_missing
      self
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_ellipse <- R6::R6Class(
  "jointjs_ellipse",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Ellipse"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_embeddedImage <- R6::R6Class(
  "jointjs_embeddedImage",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param href TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.EmbeddedImage"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_headeredRectangle <- R6::R6Class(
  "jointjs_headeredRectangle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param headerFill TODO
    #' @param headerText TODO
    #' @param bodyText TODO
    #' @param ... TODO
    initialize = \(headerFill, headerText, bodyText, ...) {
      super$initialize(...)
      private$type <- "standard.HeaderedRectangle"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_image <- R6::R6Class(
  "jointjs_image",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param href TODO
    #' @param ... TODO
    initialize = \(href, ...) {
      super$initialize(...)
      private$type <- "standard.Image"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_inscribedImage <- R6::R6Class(
  "jointjs_inscribedImage",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param href TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.InscribedImage"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_path <- R6::R6Class(
  "jointjs_path",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param refD TODO
    #' @param ... TODO
    initialize = \(refD, ...) {
      super$initialize(...)
      private$type <- "standard.Path"
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
jointjs_polygon <- R6::R6Class(
  "jointjs_polygon",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param refPoints TODO
    #' @param ... TODO
    initialize = \(refPoints, ...) {
      super$initialize(...)
      private$type <- "standard.Polygon"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_polyline <- R6::R6Class(
  "jointjs_polyline",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param refPoints TODO
    #' @param ... TODO
    initialize = \(refPoints, ...) {
      super$initialize(...)
      private$type <- "standard.Polyline"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_rectangle <- R6::R6Class(
  "jointjs_rectangle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Rectangle"
    }
  ),
  private = list(
    #TODO
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_textBlock <- R6::R6Class(
  "jointjs_textBlock",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param ... TODO
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.TextBlock"
    }
  ),
  private = list(
    #TODO
  )
)

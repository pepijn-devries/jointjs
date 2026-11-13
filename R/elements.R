#' Elements to Build a JointJS Diagram
#' 
#' A generic template to create shapes for a [jointjs_graph]. Shapes are
#' visualised by [https://www.w3.org/groups/wg/svg/](SVG) elements.
#' `jointjs_element` objects are R's representation of such elements.
#' This R class specifies the elements such that they can be used to
#' construct a [jointjs_graph]. It's usually more effective to initialise
#' a child class, such as [jointjs_rectangle], [jointjs_image], [jointjs_circle],
#' etc.
#' 
#' Parameters are all based on SVG attributes, you can use the
#' `...` arguments to pass other valid attributes. Note that the
#' attributes are renamed in camel-case conform the JointJS spefications.
#' So, SVG attribute `font-family` becomes `fontFamily`, `stroke-width`
#' becomes `strokeWidth`, etc.
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
#' @param magnet When set to `TRUE`, the element can be used as
#' source or target for a [jointjs_link].
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

#' An Image Element
#' 
#' An image with a label.
#' @param href A Uniform Resource Identifier (URI) to locate the image
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_image <- R6::R6Class(
  "jointjs_image",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(href, ...) {
      super$initialize(...)
      if (!missing(href)) private$attrs$image$href <- href
      private$type <- "standard.Image"
    }
  )
)

#' An Inscribed Image Element
#' 
#' An image inscribed in an ellipse with a label.
#' @export
jointjs_inscribedImage <- R6::R6Class(
  "jointjs_inscribedImage",
  inherit = jointjs_image,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(href, ...) {
      super$initialize(href, ...)
      private$type <- "standard.InscribedImage"
    }
  )
)

#' A Bordered Image Element
#' 
#' An image with a border and label.
#' @export
jointjs_borderedImage <- R6::R6Class(
  "jointjs_borderedImage",
  inherit = jointjs_image,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(href, ...) {
      super$initialize(href, ...)
      private$type <- "standard.BorderedImage"
    }
  )
)

#' A Embedded Image Element
#' 
#' An image embedded into a rectangle with a label.
#' @export
jointjs_embeddedImage <- R6::R6Class(
  "jointjs_embeddedImage",
  inherit = jointjs_image,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(href, ...) {
      super$initialize(href, ...)
      private$type <- "standard.EmbeddedImage"
    }
  )
)


#' A Circle Element
#' 
#' A circle shape.
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_circle <- R6::R6Class(
  "jointjs_circle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Circle"
    }
  )
)

#' A Cylinder Element
#' 
#' A cylinder with a vertical base and an elliptical top.
#' @param topRy The vertical radius of the exposed area of the cylinder base,
#' as an absolute value or a percentage.
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_cylinder <- R6::R6Class(
  "jointjs_cylinder",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Cylinder"
    },
    #' @description
    #' Set body attributes for the element.
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
  )
)

#' An Ellipse Element
#' 
#' An elliptical shape.
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_ellipse <- R6::R6Class(
  "jointjs_ellipse",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Ellipse"
    }
  )
)

#' A Headered Rectangle Element
#' 
#' A rectangle with a header.
#' @param header Either a [jointjs_rectangle] or a named `list` with
#' SVG rectangle attributes.
#' @param headerText A named `list` with SVG text element properties
#' @param bodyText A named `list` with SVG text element properties
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_headeredRectangle <- R6::R6Class(
  "jointjs_headeredRectangle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(header, headerText, bodyText, ...) {
      super$initialize(...)
      if (inherits(header, "jointjs_rectangle"))
        header <- header$get_list()
      private$attrs$header     <- header
      private$attrs$headerText <- headerText
      private$attrs$bodyText   <- bodyText
      private$type <- "standard.HeaderedRectangle"
    }
  )
)

#' A Path Element
#' 
#' A vector of vertices connected by lines.
#' @param refD A `character` string that is used to set the
#' `d` attribute of an SVG `path` element.
#' @param ... Arguments passed to parent class initialiser
#' @examples
#' jointjs_path$new('M 0 5 10 0 C 20 0 20 20 10 20 L 0 15 Z')
#' @export
jointjs_path <- R6::R6Class(
  "jointjs_path",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(refD, ...) {
      super$initialize(...)
      private$attrs$body$refD <- refD
      private$type <- "standard.Path"
    }
  ),
  private = list(
    source = list(id = NULL),
    target = list(id = NULL)
  )
)

#' A Polygon Element
#' 
#' A vector of vertices connected as a polygon.
#' @param refPoints A `character` string of
#' coordinates that is used to set the SVG `points` attribute
#' of `polygon` or `polyline` elements.
#' @param ... Arguments passed to parent class initialiser
#' @examples
#' jointjs_polygon$new("10,10 30,10 30,30")
#' @export
jointjs_polygon <- R6::R6Class(
  "jointjs_polygon",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(refPoints, ...) {
      super$initialize(...)
      private$attrs$body$refPoints <- refPoints
      private$type <- "standard.Polygon"
    }
  )
)

#' A Polyline Element
#' 
#' A polyline with a label.
#' @param refPoints A `character` string of
#' coordinates that is used to set the SVG `points` attribute
#' of `polygon` or `polyline` elements.
#' @param ... Arguments passed to parent class initialiser
#' @examples
#' jointjs_polyline$new("10,10 30,10 30,30")
#' @export
jointjs_polyline <- R6::R6Class(
  "jointjs_polyline",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(refPoints, ...) {
      super$initialize(...)
      private$attrs$body$refPoints <- refPoints
      private$type <- "standard.Polyline"
    }
  )
)

#' A Rectangle Element
#' 
#' A Rectangle shape.
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_rectangle <- R6::R6Class(
  "jointjs_rectangle",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(...) {
      super$initialize(...)
      private$type <- "standard.Rectangle"
    }
  )
)

#' A Text Block Element
#' 
#' A rectangle shape with text.
#' @param text A `character` string to be displayed.
#' @param ... Arguments passed to parent class initialiser
#' @export
jointjs_textBlock <- R6::R6Class(
  "jointjs_textBlock",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' Initialise the object
    initialize = \(text, ...) {
      super$initialize(...)
      private$attrs$label$text <- text
      private$type <- "standard.TextBlock"
    }
  )
)

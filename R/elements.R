#' TODO
#' 
#' TODO
#' @include cells.R
#' @export
jointjs_element <- R6::R6Class(
  "jointjs_element",
  inherit = jointjs_cell,
  public = list(
    #' @description
    #' TODO
    #' @param x,y TODO
    set_position = \(x, y) {
      private$position <- list(x = x, y = y)
      self
    },
    #' @description
    #' TODO
    #' @param text TODO
    #' @param color TODO
    #' @param fontFamily TODO
    #' @param fontSize TODO
    #' @param ... TODO
    set_label = function(text, color, fontFamily, fontSize, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$label[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' TODO
    #' @param fill TODO
    #' @param stroke TODO
    #' @param strokeWidth TODO
    #' @param magnet TODO
    #' @param ... TODO
    set_body = function(fill, stroke, strokeWidth, magnet, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$body[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' TODO
    #' @param stroke TODO
    #' @param strokeWidth TODO
    #' @param ... TODO
    set_line = function(stroke, strokeWidth, ...) {
      non_missing <- .capture_r6_inputs()
      private$attrs$line[names(non_missing)] <- non_missing
      self
    },
    #' @description
    #' TODO
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
      shaddow    = NULL, ## SVGPathElement
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
jointjs_circle <- R6::R6Class(
  "jointjs_element",
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
    
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_rectangle <- R6::R6Class(
  "jointjs_element",
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
    
  )
)

#' TODO
#' 
#' TODO
#' @export
jointjs_link <- R6::R6Class(
  "jointjs_element",
  inherit = jointjs_element,
  public = list(
    #' @description
    #' TODO
    #' @param source TODO
    #' @param target TODO
    #' @param ... TODO
    initialize = \(source, target, ...) {
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
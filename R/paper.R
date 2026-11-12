#' A Paper to Draw JointJS Diagrams on
#' 
#' Set up a sheet of paper to draw jointjs diagrams on. This class can be used
#' to define the paper specifications. These specifications are needed when
#' creating a widget with [jointjs()].
#' @param width Paper width in CSS units.
#' @param height Paper height in CSS units.
#' @param background A named list with background properties. The list can
#' contain the elements `color`, `image` (an URL for a background image),
#' `position` (`x` and `y` coordinate for the image), `size` of the
#' background image (`width` and `height`), `repeat` a CSS `background-repeat`
#' property, `quality` coefficient for image quality, `opacity` in the
#' range of 0-1, `watermarkAngle` in degrees. If set to `FALSE` no
#' background is drawn.
#' @param gridSize gridSize in CSS units
#' @param drawGrid A named list specifying how to draw a grid on the paper.
#' An element `name` can use any of these predefined grid patterns:
#' `"dot"` (default), `"fixedDot"`, `"mesh"`, or `"doubleMesh"`.
#' Use an element named `args` to specify pattern properties.
#' If set to `FALSE`, no grid is drawn.
#' @param interactive Use a `logical` value to enable or disable all
#' interactive elements. Or use a named list of interactions with
#' logical values to enable or disable specific interactions
#' @param snapLinks A `logical` value indicating if links should be snapped
#' to magnets. Or a named `list` with element `radius` in pixels, giving
#' the distance for snapping links.
#' @param defaultLink Default properties for links. A [jointjs_link] class
#' object.
#' @param validateConnection A JavaScript function that validates if
#' a connection between a specific source and target is allowed. It
#' should return a logical value.
#' @param ... Other options passed to the JointJS JavaScript library.
#' @export
jointjs_paper <- R6::R6Class(
  "jointjs_paper",
  public = list(
    #' @description
    #' Initiate a paper object
    initialize = function(
    width,
    height,
    background = list(color = "#E9ECEF"),
    gridSize = 20,
    drawGrid = list(
      name = "dot",
      args = list(color = "#808080",
                  thickness = 1)
    ),
    interactive = TRUE,
    snapLinks = list(radius = 20),
    defaultLink =
      jointjs::jointjs_cell$new(
        NULL, "standard.Link", 
        `.connection`    = list(stroke = "#2C3E50",
                                strokeWidth = 2),
        `.marker-target` = list(fill = "#2C3E50",
                                d = "M 10 0 L 0 5 L 10 10 z")
      ),
    validateConnection = htmlwidgets::JS("
        function(cellViewS, magnetS, cellViewT, magnetT, end, linkView) {
          if (cellViewS === cellViewT) return false;
          return cellViewT && cellViewT.model.isElement();
        }
      "),
    
    ...) {
      args <- .capture_r6_inputs()
      fun <- function(x) {
        if (is.list(x)) {
          lapply(x, fun)
        } else {
          if (inherits(x, "jointjs_cell")) x$get_list() else x
        }
      }
      private$options[names(args)] <- fun(args)
      self
    },
    #' @description
    #' Coerce JointJS paper options to a named list.
    get_list = \() {
      private$options[lengths(private$options) > 0L]
    }
  ),
  private = list(
    options = list(
      afterRender = NULL,
      allowLink = NULL,
      anchorNamespace = NULL,
      async = NULL,
      autoFreeze = NULL,
      background = NULL,
      beforeRender = NULL,
      cellViewNamespace = NULL,
      clickThreshold = NULL,
      connectionPointNamespace = NULL,
      connectionStrategy = NULL,
      connectorNamespace = NULL,
      defaultAnchor = NULL,
      defaultConnectionPoint = NULL,
      defaultConnector = NULL,
      defaultLink = NULL,
      defaultLinkAnchor = NULL,
      defaultRouter = NULL,
      drawGrid = NULL,
      drawGridSize = NULL,
      # el = NULL, # Should not be set by user, see jointjs.js
      elementView = NULL,
      embeddingMode = NULL,
      findParentBy = NULL,
      frontParentOnly = NULL,
      frozen = NULL,
      gridSize = NULL,
      guard = NULL,
      height = NULL,
      highlighterNamespace = NULL,
      highlighting = NULL,
      interactive = NULL,
      labelsLayer = NULL,
      linkAnchorNamespace = NULL,
      linkConnectionPoint = NULL,
      linkPinning = NULL,
      linkView = NULL,
      magnetThreshold = NULL,
      markAvailable = NULL,
      model = NULL,
      moveThreshold = NULL,
      multiLinks = NULL,
      origin = NULL,
      overflow = NULL,
      perpendicularLinks = NULL,
      preventContextMenu = NULL,
      preventDefaultBlankAction = NULL,
      preventDefaultViewAction = NULL,
      restrictTranslate = NULL,
      routerNamespace = NULL,
      snapLabels = NULL,
      snapLinks = NULL,
      snapLinksSelf = NULL,
      sorting = NULL,
      validateConnection = NULL,
      validateEmbedding = NULL,
      validateMagnet = NULL,
      validateUnembedding = NULL,
      viewport = NULL,
      width = NULL
    )
  )
)
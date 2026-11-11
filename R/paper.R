#' TODO
#' 
#' #TODO
#' @param width TODO
#' @param height TODO
#' @param background TODO
#' @param gridSize TODO
#' @param drawGrid TODO
#' @param interactive TODO
#' @param allowLink TODO
#' @param snapLinks TODO
#' @param defaultLink TODO
#' @param validateConnection TODO
#' @param ... TODO
#' @export
jointjs_paper <- R6::R6Class(
  "jointjs_paper",
  public = list(
    #' @description
    #' TODO
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
    allowLink = TRUE,
    snapLinks = list(radius = 20),
    defaultLink =
      jointjs::jointjs_cell$new(
        NULL, "standard.Link", 
        .connection = list(stroke = "#2C3E50",
                           strokeWidth = 2),
        `.marker-target` = list(fill = "#2C3E50",
                                d = "M 10 0 L 0 5 L 10 10 z")
      )$
      get_list(),
    validateConnection = htmlwidgets::JS("
        function(cellViewS, magnetS, cellViewT, magnetT, end, linkView) {
          if (cellViewS === cellViewT) return false;
          return cellViewT && cellViewT.model.isElement();
        }
      "),
    
    ...) {
      args <- .capture_r6_inputs()
      private$options[names(args)] <- args
      self
    },
    #' @description
    #' TODO
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
      el = NULL,
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
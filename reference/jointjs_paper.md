# A Paper to Draw JointJS Diagrams on

Set up a sheet of paper to draw jointjs diagrams on. This class can be
used to define the paper specifications. These specifications are needed
when creating a widget with
[`jointjs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs.md).

## Methods

### Public methods

- [`jointjs_paper$new()`](#method-jointjs_paper-initialize)

- [`jointjs_paper$get_list()`](#method-jointjs_paper-get_list)

- [`jointjs_paper$clone()`](#method-jointjs_paper-clone)

------------------------------------------------------------------------

### `jointjs_paper$new()`

Initiate a paper object

#### Usage

    jointjs_paper$new(
      width,
      height,
      background = list(color = "#E9ECEF"),
      gridSize = 20,
      drawGrid = list(name = "dot", args = list(color = "#808080", thickness = 1)),
      interactive = TRUE,
      snapLinks = list(radius = 20),
      defaultLink = jointjs::jointjs_cell$new(NULL, "standard.Link", .connection =
        list(stroke = "#2C3E50", strokeWidth = 2), `.marker-target` = list(fill = "#2C3E50",
        d = "M 10 0 L 0 5 L 10 10 z")),
      validateConnection =
        htmlwidgets::JS("\n        function(cellViewS, magnetS, cellViewT, magnetT, end, linkView) {\n          if (cellViewS === cellViewT) return false;\n          return cellViewT && cellViewT.model.isElement();\n        }\n      "),
      ...
    )

#### Arguments

- `width`:

  Paper width in CSS units.

- `height`:

  Paper height in CSS units.

- `background`:

  A named list with background properties. The list can contain the
  elements `color`, `image` (an URL for a background image), `position`
  (`x` and `y` coordinate for the image), `size` of the background image
  (`width` and `height`), `repeat` a CSS `background-repeat` property,
  `quality` coefficient for image quality, `opacity` in the range of
  0-1, `watermarkAngle` in degrees. If set to `FALSE` no background is
  drawn.

- `gridSize`:

  gridSize in CSS units

- `drawGrid`:

  A named list specifying how to draw a grid on the paper. An element
  `name` can use any of these predefined grid patterns: `"dot"`
  (default), `"fixedDot"`, `"mesh"`, or `"doubleMesh"`. Use an element
  named `args` to specify pattern properties. If set to `FALSE`, no grid
  is drawn.

- `interactive`:

  Use a `logical` value to enable or disable all interactive elements.
  Or use a named list of interactions with logical values to enable or
  disable specific interactions

- `snapLinks`:

  A `logical` value indicating if links should be snapped to magnets. Or
  a named `list` with element `radius` in pixels, giving the distance
  for snapping links.

- `defaultLink`:

  Default properties for links. A
  [jointjs_link](https://pepijn-devries.github.io/jointjs/reference/jointjs_link.md)
  class object.

- `validateConnection`:

  A JavaScript function that validates if a connection between a
  specific source and target is allowed. It should return a logical
  value.

- `...`:

  Other options passed to the JointJS JavaScript library.

------------------------------------------------------------------------

### `jointjs_paper$get_list()`

Coerce JointJS paper options to a named list.

#### Usage

    jointjs_paper$get_list()

------------------------------------------------------------------------

### `jointjs_paper$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_paper$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

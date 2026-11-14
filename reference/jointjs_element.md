# Elements to Build a JointJS Diagram

A generic template to create shapes for a
[jointjs_graph](https://pepijn-devries.github.io/jointjs/reference/jointjs_graph.md).
Shapes are visualised by
[https://www.w3.org/groups/wg/svg/](https://pepijn-devries.github.io/jointjs/reference/SVG)
elements. `jointjs_element` objects are R's representation of such
elements. This R class specifies the elements such that they can be used
to construct a
[jointjs_graph](https://pepijn-devries.github.io/jointjs/reference/jointjs_graph.md).
It's usually more effective to initialise a child class, such as
[jointjs_rectangle](https://pepijn-devries.github.io/jointjs/reference/jointjs_rectangle.md),
[jointjs_image](https://pepijn-devries.github.io/jointjs/reference/jointjs_image.md),
[jointjs_circle](https://pepijn-devries.github.io/jointjs/reference/jointjs_circle.md),
etc.

Parameters are all based on SVG attributes, you can use the `...`
arguments to pass other valid attributes. Note that the attributes are
renamed in camel-case conform the JointJS spefications. So, SVG
attribute `font-family` becomes `fontFamily`, `stroke-width` becomes
`strokeWidth`, etc.

## Super class

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\> `jointjs_element`

## Methods

### Public methods

- [`jointjs_element$set_position()`](#method-jointjs_element-set_position)

- [`jointjs_element$set_image()`](#method-jointjs_element-set_image)

- [`jointjs_element$set_border()`](#method-jointjs_element-set_border)

- [`jointjs_element$set_background()`](#method-jointjs_element-set_background)

- [`jointjs_element$set_top()`](#method-jointjs_element-set_top)

- [`jointjs_element$set_line()`](#method-jointjs_element-set_line)

- [`jointjs_element$set_shadow()`](#method-jointjs_element-set_shadow)

- [`jointjs_element$set_outline()`](#method-jointjs_element-set_outline)

- [`jointjs_element$set_wrapper()`](#method-jointjs_element-set_wrapper)

- [`jointjs_element$set_header()`](#method-jointjs_element-set_header)

- [`jointjs_element$set_headerText()`](#method-jointjs_element-set_headerText)

- [`jointjs_element$set_bodyText()`](#method-jointjs_element-set_bodyText)

- [`jointjs_element$set_body()`](#method-jointjs_element-set_body)

- [`jointjs_element$set_label()`](#method-jointjs_element-set_label)

- [`jointjs_element$get_list()`](#method-jointjs_element-get_list)

- [`jointjs_element$clone()`](#method-jointjs_element-clone)

Inherited methods

- [`jointjs_cell$initialize()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-initialize)
- [`jointjs_cell$set_attrs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-set_attrs)

------------------------------------------------------------------------

### `jointjs_element$set_position()`

Set the element's position relative to its parent container.

#### Usage

    jointjs_element$set_position(x, y)

#### Arguments

- `x, y`:

  Coordinates relative to its parent container.

------------------------------------------------------------------------

### `jointjs_element$set_image()`

Set image attributes for the element.

#### Usage

    jointjs_element$set_image(href, ...)

#### Arguments

- `href`:

  A Uniform Resource Identifier (URI) to locate a resource (e.g. image)

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_border()`

Set border attributes for the element.

#### Usage

    jointjs_element$set_border(fill, stroke, strokeWidth, ...)

#### Arguments

- `fill`:

  Fill colour

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_background()`

Set background attributes for the element.

#### Usage

    jointjs_element$set_background(fill, stroke, strokeWidth, ...)

#### Arguments

- `fill`:

  Fill colour

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_top()`

Set top attributes for the element (used to visualise the top of a
cylinder base).

#### Usage

    jointjs_element$set_top(fill, stroke, strokeWidth, ...)

#### Arguments

- `fill`:

  Fill colour

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_line()`

Set line attributes for the element.

#### Usage

    jointjs_element$set_line(stroke, strokeWidth, ...)

#### Arguments

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_shadow()`

Set shadow attributes for the element.

#### Usage

    jointjs_element$set_shadow(stroke, strokeWidth, ...)

#### Arguments

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_outline()`

Set outline attributes for the element.

#### Usage

    jointjs_element$set_outline(stroke, strokeWidth, ...)

#### Arguments

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_wrapper()`

Set wrapper attributes for the element.

#### Usage

    jointjs_element$set_wrapper(stroke, strokeWidth, ...)

#### Arguments

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_header()`

Set header attributes for the element.

#### Usage

    jointjs_element$set_header(fill, stroke, strokeWidth, ...)

#### Arguments

- `fill`:

  Fill colour

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_headerText()`

Set headerText attributes for the element.

#### Usage

    jointjs_element$set_headerText(text, color, fontFamily, fontSize, ...)

#### Arguments

- `text`:

  A text to display

- `color`:

  Colour of the element

- `fontFamily`:

  Font family for the text to display

- `fontSize`:

  Font size for the text to display

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_bodyText()`

Set bodyText attributes for the element.

#### Usage

    jointjs_element$set_bodyText(text, color, fontFamily, fontSize, ...)

#### Arguments

- `text`:

  A text to display

- `color`:

  Colour of the element

- `fontFamily`:

  Font family for the text to display

- `fontSize`:

  Font size for the text to display

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_body()`

Set body attributes for the element.

#### Usage

    jointjs_element$set_body(fill, stroke, strokeWidth, magnet, ...)

#### Arguments

- `fill`:

  Fill colour

- `stroke`:

  Stroke colour

- `strokeWidth`:

  Width of the stroke line

- `magnet`:

  When set to `TRUE`, the element can be used as source or target for a
  [jointjs_link](https://pepijn-devries.github.io/jointjs/reference/jointjs_link.md).

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$set_label()`

Set label attributes for the element.

#### Usage

    jointjs_element$set_label(text, color, fontFamily, fontSize, ...)

#### Arguments

- `text`:

  A text to display

- `color`:

  Colour of the element

- `fontFamily`:

  Font family for the text to display

- `fontSize`:

  Font size for the text to display

- `...`:

  Additional SVG attributes accepted by the specific SVG element

------------------------------------------------------------------------

### `jointjs_element$get_list()`

Returns a named list representation of the element.

#### Usage

    jointjs_element$get_list()

------------------------------------------------------------------------

### `jointjs_element$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_element$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

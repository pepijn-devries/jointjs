# A Cylinder Element

A cylinder with a vertical base and an elliptical top.

## Super classes

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\>
[`jointjs_element`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.md)
-\> `jointjs_cylinder`

## Methods

### Public methods

- [`jointjs_cylinder$new()`](#method-jointjs_cylinder-initialize)

- [`jointjs_cylinder$set_body()`](#method-jointjs_cylinder-set_body)

- [`jointjs_cylinder$clone()`](#method-jointjs_cylinder-clone)

Inherited methods

- [`jointjs_cell$set_attrs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-set_attrs)
- [`jointjs_element$get_list()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-get_list)
- [`jointjs_element$set_background()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_background)
- [`jointjs_element$set_bodyText()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_bodyText)
- [`jointjs_element$set_border()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_border)
- [`jointjs_element$set_header()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_header)
- [`jointjs_element$set_headerText()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_headerText)
- [`jointjs_element$set_image()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_image)
- [`jointjs_element$set_label()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_label)
- [`jointjs_element$set_line()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_line)
- [`jointjs_element$set_outline()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_outline)
- [`jointjs_element$set_position()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_position)
- [`jointjs_element$set_shadow()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_shadow)
- [`jointjs_element$set_top()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_top)
- [`jointjs_element$set_wrapper()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_wrapper)

------------------------------------------------------------------------

### `jointjs_cylinder$new()`

Initialise the object

#### Usage

    jointjs_cylinder$new(...)

#### Arguments

- `...`:

  Arguments passed to parent class initialiser

------------------------------------------------------------------------

### `jointjs_cylinder$set_body()`

Set body attributes for the element.

#### Usage

    jointjs_cylinder$set_body(fill, stroke, strokeWidth, magnet, topRy, ...)

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

- `topRy`:

  The vertical radius of the exposed area of the cylinder base, as an
  absolute value or a percentage.

- `...`:

  Arguments passed to parent class initialiser

------------------------------------------------------------------------

### `jointjs_cylinder$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_cylinder$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

# A Headered Rectangle Element

A rectangle with a header.

## Super classes

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\>
[`jointjs_element`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.md)
-\> `jointjs_headeredRectangle`

## Methods

### Public methods

- [`jointjs_headeredRectangle$new()`](#method-jointjs_headeredRectangle-initialize)

- [`jointjs_headeredRectangle$clone()`](#method-jointjs_headeredRectangle-clone)

Inherited methods

- [`jointjs_cell$set_attrs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-set_attrs)
- [`jointjs_element$get_list()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-get_list)
- [`jointjs_element$set_background()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_background)
- [`jointjs_element$set_body()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.html#method-set_body)
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

### `jointjs_headeredRectangle$new()`

Initialise the object

#### Usage

    jointjs_headeredRectangle$new(header, headerText, bodyText, ...)

#### Arguments

- `header`:

  Either a
  [jointjs_rectangle](https://pepijn-devries.github.io/jointjs/reference/jointjs_rectangle.md)
  or a named `list` with SVG rectangle attributes.

- `headerText`:

  A named `list` with SVG text element properties

- `bodyText`:

  A named `list` with SVG text element properties

- `...`:

  Arguments passed to parent class initialiser

------------------------------------------------------------------------

### `jointjs_headeredRectangle$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_headeredRectangle$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

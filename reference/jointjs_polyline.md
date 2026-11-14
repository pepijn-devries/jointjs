# A Polyline Element

A polyline with a label.

## Super classes

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\>
[`jointjs_element`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.md)
-\> `jointjs_polyline`

## Methods

### Public methods

- [`jointjs_polyline$new()`](#method-jointjs_polyline-initialize)

- [`jointjs_polyline$clone()`](#method-jointjs_polyline-clone)

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

### `jointjs_polyline$new()`

Initialise the object

#### Usage

    jointjs_polyline$new(refPoints, ...)

#### Arguments

- `refPoints`:

  A `character` string of coordinates that is used to set the SVG
  `points` attribute of `polygon` or `polyline` elements.

- `...`:

  Arguments passed to parent class initialiser

------------------------------------------------------------------------

### `jointjs_polyline$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_polyline$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
jointjs_polyline$new("10,10 30,10 30,30")
#> <jointjs_polyline>
#>   Inherits from: <jointjs_element>
#>   Public:
#>     clone: function (deep = FALSE) 
#>     get_list: function () 
#>     initialize: function (refPoints, ...) 
#>     set_attrs: function (...) 
#>     set_background: function (fill, stroke, strokeWidth, ...) 
#>     set_body: function (fill, stroke, strokeWidth, magnet, ...) 
#>     set_bodyText: function (text, color, fontFamily, fontSize, ...) 
#>     set_border: function (fill, stroke, strokeWidth, ...) 
#>     set_header: function (fill, stroke, strokeWidth, ...) 
#>     set_headerText: function (text, color, fontFamily, fontSize, ...) 
#>     set_image: function (href, ...) 
#>     set_label: function (text, color, fontFamily, fontSize, ...) 
#>     set_line: function (stroke, strokeWidth, ...) 
#>     set_outline: function (stroke, strokeWidth, ...) 
#>     set_position: function (x, y) 
#>     set_shadow: function (stroke, strokeWidth, ...) 
#>     set_top: function (fill, stroke, strokeWidth, ...) 
#>     set_wrapper: function (stroke, strokeWidth, ...) 
#>   Private:
#>     angle: 0
#>     attrs: list
#>     id: 410375e0512d08e1
#>     position: list
#>     size: list
#>     type: standard.Polyline
#>     z: 1
```

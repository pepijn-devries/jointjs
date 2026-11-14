# A Path Element

A vector of vertices connected by lines.

## Super classes

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\>
[`jointjs_element`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.md)
-\> `jointjs_path`

## Methods

### Public methods

- [`jointjs_path$new()`](#method-jointjs_path-initialize)

- [`jointjs_path$clone()`](#method-jointjs_path-clone)

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

### `jointjs_path$new()`

Initialise the object

#### Usage

    jointjs_path$new(refD, ...)

#### Arguments

- `refD`:

  A `character` string that is used to set the `d` attribute of an SVG
  `path` element.

- `...`:

  Arguments passed to parent class initialiser

------------------------------------------------------------------------

### `jointjs_path$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_path$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r
jointjs_path$new('M 0 5 10 0 C 20 0 20 20 10 20 L 0 15 Z')
#> <jointjs_path>
#>   Inherits from: <jointjs_element>
#>   Public:
#>     clone: function (deep = FALSE) 
#>     get_list: function () 
#>     initialize: function (refD, ...) 
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
#>     id: ec1d6ada44bc15ee
#>     position: list
#>     size: list
#>     source: list
#>     target: list
#>     type: standard.Path
#>     z: 1
```

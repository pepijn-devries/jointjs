# Links Between Elements in a JointJS Diagram

Create a link between a source and target element or location in a
JointJS diagram.

## Super class

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\> `jointjs_link`

## Methods

### Public methods

- [`jointjs_link$new()`](#method-jointjs_link-initialize)

- [`jointjs_link$clone()`](#method-jointjs_link-clone)

Inherited methods

- [`jointjs_cell$get_list()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-get_list)
- [`jointjs_cell$set_attrs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-set_attrs)

------------------------------------------------------------------------

### `jointjs_link$new()`

The link initialiser.

#### Usage

    jointjs_link$new(source, target, vertices, ...)

#### Arguments

- `source, target`:

  `source` and `target` indicate the route the link should take. It can
  be a point (a `list` with an `x` and `y` coordinate), or a `list`
  containing an `id` of the element that should be linked. You can also
  provide a `port` value to that list if you wish to connect to a
  specific port on the element.

- `vertices`:

  A `list` of coordinates where the link should pass through. The list
  is unnamed and each element should be a list of and `x` and `y` value.

- `...`:

  Arguments passed to parent class initialiser.

#### Examples

    jointjs_link$new(vertices = list(
        list(x = 50, y = 50),
        list(x = 40, y = 60)
      ))

------------------------------------------------------------------------

### `jointjs_link$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_link$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

## Examples

``` r

## ------------------------------------------------
## Method `jointjs_link$new()`
## ------------------------------------------------

jointjs_link$new(vertices = list(
    list(x = 50, y = 50),
    list(x = 40, y = 60)
  ))
#> <jointjs_link>
#>   Inherits from: <jointjs_cell>
#>   Public:
#>     clone: function (deep = FALSE) 
#>     get_list: function () 
#>     initialize: function (source, target, vertices, ...) 
#>     set_attrs: function (...) 
#>   Private:
#>     attrs: NULL
#>     id: c6be45eee35844e7
#>     source: list
#>     target: list
#>     type: standard.Link
#>     vertices: list
#>     z: 1
```

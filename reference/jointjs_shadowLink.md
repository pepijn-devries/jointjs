# Shadow Links Between Elements in a JointJS Diagram

Create a thicker line link with shadow between a source and target
element or location in a JointJS diagram.

## Super classes

[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
-\>
[`jointjs_link`](https://pepijn-devries.github.io/jointjs/reference/jointjs_link.md)
-\> `jointjs_shadowLink`

## Methods

### Public methods

- [`jointjs_shadowLink$new()`](#method-jointjs_shadowLink-initialize)

- [`jointjs_shadowLink$clone()`](#method-jointjs_shadowLink-clone)

Inherited methods

- [`jointjs_cell$get_list()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-get_list)
- [`jointjs_cell$set_attrs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.html#method-set_attrs)

------------------------------------------------------------------------

### `jointjs_shadowLink$new()`

The link initialiser.

#### Usage

    jointjs_shadowLink$new(source, target, vertices, ...)

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

------------------------------------------------------------------------

### `jointjs_shadowLink$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_shadowLink$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

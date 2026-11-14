# Create A JointJS Graph

Use the `jointjs_graph` class to define a diagram that can be rendered
with
[`jointjs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs.md).

## See also

Other root-classes:
[`jointjs_cell`](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md),
[`jointjs_paper`](https://pepijn-devries.github.io/jointjs/reference/jointjs_paper.md)

## Methods

### Public methods

- [`jointjs_graph$new()`](#method-jointjs_graph-initialize)

- [`jointjs_graph$add_elements()`](#method-jointjs_graph-add_elements)

- [`jointjs_graph$get_widget()`](#method-jointjs_graph-get_widget)

- [`jointjs_graph$get_list()`](#method-jointjs_graph-get_list)

- [`jointjs_graph$clone()`](#method-jointjs_graph-clone)

------------------------------------------------------------------------

### `jointjs_graph$new()`

Initialise a JointJS Graph

#### Usage

    jointjs_graph$new(x, ...)

#### Arguments

- `x`:

  A named `list` of cell objects represented as `list`s. You can use the
  graph state object returned by a Shiny widget to initiate a graph
  class object.

- `...`:

  Ignored

------------------------------------------------------------------------

### `jointjs_graph$add_elements()`

Add elements to the graph. These can be any object that inherit from the
[jointjs_cell](https://pepijn-devries.github.io/jointjs/reference/jointjs_cell.md)
class. So, these can be shapes like
[jointjs_rectangle](https://pepijn-devries.github.io/jointjs/reference/jointjs_rectangle.md)
and
[jointjs_image](https://pepijn-devries.github.io/jointjs/reference/jointjs_image.md),
but also links like
[jointjs_doubleLink](https://pepijn-devries.github.io/jointjs/reference/jointjs_doubleLink.md).

#### Usage

    jointjs_graph$add_elements(...)

#### Arguments

- `...`:

  Pass any number of items to be added to the graph here.

------------------------------------------------------------------------

### `jointjs_graph$get_widget()`

This is just short for `jointjs(graph = x)`, where `x` is a
`jointjs_graph` class object.

#### Usage

    jointjs_graph$get_widget(...)

#### Arguments

- `...`:

  Arguments passed to
  [`jointjs()`](https://pepijn-devries.github.io/jointjs/reference/jointjs.md)

------------------------------------------------------------------------

### `jointjs_graph$get_list()`

Returns the `list` of cells that define the graph.

#### Usage

    jointjs_graph$get_list()

------------------------------------------------------------------------

### `jointjs_graph$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_graph$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

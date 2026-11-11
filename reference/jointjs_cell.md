# jointjs_cell: The Basis for JointJS Elements

It is a backbone structure used by jointjs to construct elements for a
diagram. Usually you don't initiate cells directly. Rather, it is more
efficient to create its grandchildren:
[jointjs_circle](https://pepijn-devries.github.io/jointjs/reference/jointjs_circle.md),
[jointjs_image](https://pepijn-devries.github.io/jointjs/reference/jointjs_image.md),
[jointjs_rectangle](https://pepijn-devries.github.io/jointjs/reference/jointjs_rectangle.md),
etc.

## Methods

### Public methods

- [`jointjs_cell$new()`](#method-jointjs_cell-initialize)

- [`jointjs_cell$clone()`](#method-jointjs_cell-clone)

------------------------------------------------------------------------

### `jointjs_cell$new()`

Initialise a jointjs_cell class object.

#### Usage

    jointjs_cell$new(id, type, z, ...)

#### Arguments

- `id`:

  A unique identifier (`character`) used to identify the cell. It can be
  used to link cells together, by referring to these ids. By default a
  16 character random hexadecimal code is generated as an id.

- `type`:

  Specifies the type of cell this object represents. Its advised to
  create cells using its or grand-children (e.g.
  [jointjs_circle](https://pepijn-devries.github.io/jointjs/reference/jointjs_circle.md),
  [jointjs_rectangle](https://pepijn-devries.github.io/jointjs/reference/jointjs_rectangle.md),
  etc.). They will automatically assign the correct type for you. By
  default it will be set to `"standard.Rectangle"` (a rectangle).

- `z`:

  A depth index. It will determine the plotting order on its parent
  container.

- `...`:

  Parameters that will be set as SVG attributes to this object.

------------------------------------------------------------------------

### `jointjs_cell$clone()`

The objects of this class are cloneable with this method.

#### Usage

    jointjs_cell$clone(deep = FALSE)

#### Arguments

- `deep`:

  Whether to make a deep clone.

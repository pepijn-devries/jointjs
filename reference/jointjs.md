# Create an Interactive JointJS Diagram

A wrapper around the JavaScript JointJS library to create an interactive
html widget. It can be used to draw and edit diagrams.

## Usage

``` r
jointjs(
  paper = jointjs_paper$new(),
  graph = NULL,
  width = NULL,
  height = NULL,
  elementId = NULL
)
```

## Arguments

- paper:

  Either a named list with paper properties, or a
  [jointjs_paper](https://pepijn-devries.github.io/jointjs/reference/jointjs_paper.md)
  class object.

- graph:

  Either a named list of cells to draw, or a
  [jointjs_graph](https://pepijn-devries.github.io/jointjs/reference/jointjs_graph.md)
  class object

- width:

  Fixed width for widget (in css units). The default is `NULL`, which
  results in intelligent automatic sizing based on the widget's
  container.

- height:

  Fixed height for widget (in css units). The default is `NULL`, which
  results in intelligent automatic sizing based on the widget's
  container.

- elementId:

  Use an explicit element ID for the widget (rather than an
  automatically generated one). Useful if you have other JavaScript that
  needs to explicitly discover and interact with a specific widget
  instance.

## Value

An object of class `htmlwidget` that will intelligently print itself
into HTML in a variety of contexts including the R console, within R
Markdown documents, and within Shiny output bindings.

## Examples

``` r
if (interactive()) {
  graph <-
    jointjs_graph$new()$
      add_elements(
        jointjs_rectangle$new(id = "hello", label = list(text = "Hello"))$
          set_position(5, 5),
        jointjs_circle$new(id = "world", label = list(text = "World"))$
          set_position(70, 5),
        jointjs_doubleLink$new(source = list(id = "hello"),
                               target = list(id = "world"))
      )
  jointjs(graph = graph)
}
```

# Gallery

``` r

library(jointjs)
graph <-
  jointjs_graph$
  ## Create a new graph:
  new()$
  ## Add elements:
  add_elements(
    ## Add a rectangle:
    jointjs_rectangle$new(id = "hello")$
      set_body(rx = 5, ry = 5, magnet = TRUE)$
      set_label("Hello")$
      set_position(10, 10),
    ## Add a circle:
    jointjs_circle$new(id = "world")$
      set_body("white", "black", magnet = TRUE)$
      set_label("world")$
      set_position(100, 10),
    ## Add a link, joining the rectangle and circle:
    jointjs_doubleLink$new(list(id = "hello"), list(id = "world"))
  )
## Get and show widget:
graph$get_widget(width = "100%", height = "400px")
```

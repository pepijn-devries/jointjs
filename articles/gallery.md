# Gallery

JointJS Diagrams can use any [Scalable Vector Graphics
(SVG)](https://www.w3.org/groups/wg/svg/) element to represent elements
in a diagram. The same is true for links in a diagram. JointJS
JavaScript library (and this R package) comes with range of predefined
shapes that can be used out of the box.

Check documentation on
[`?jointjs_element`](https://pepijn-devries.github.io/jointjs/reference/jointjs_element.md)
and
[`?jointjs_link`](https://pepijn-devries.github.io/jointjs/reference/jointjs_link.md)
to learn more about customising the appearance of these shapes, or
creating your own.

The code chunk below demonstrates how to add these shapes to a diagram
and how to create an interactive html widget from it.

``` r

library(jointjs)
x_offset <- 20
y_offset <- 20
delta    <- 100

jointjs_graph$new()$
  
  ## Add elements:
  add_elements(
    
    ## Add a rectangle:
    jointjs_rectangle$new()$
      set_body(rx = 5, ry = 5, magnet = TRUE)$
      set_label("Rect")$
      set_position(x_offset, y_offset),
    
    ## Add a circle:
    jointjs_circle$new()$
      set_body("white", "black", magnet = TRUE)$
      set_label("Circle")$
      set_position(x_offset, y_offset + delta),
    
    ## Add a cylinder:
    jointjs_cylinder$new()$
      set_body(topRy = "10%", magnet = TRUE)$
      set_label("Cyl")$
      set_top("lightgrey")$
      set_position(x_offset, y_offset + 2*delta),
    
    ## Add a ellipse:
    jointjs_ellipse$new()$
      set_body(rx = 50, ry = 30, magnet = TRUE)$
      set_label("Ellip")$
      set_size(50, 30)$
      set_position(x_offset, y_offset + 3*delta),

    ## Add a headered rectangle:
    jointjs_headeredRectangle$new(list(fill = "lightblue"),
                                  list(text = "Head"),
                                  list(text = "Body"))$
      set_body("pink", "black", 1, magnet = TRUE)$
      set_position(x_offset + delta, y_offset),
    
    ## Add a path:
    jointjs_path$new("M 0 5 10 0 C 20 0 20 20 10 20 L 0 15 Z")$
      set_body(magnet = TRUE)$
      set_label("Path")$
      set_position(x_offset + delta, y_offset + delta),

    ## Add a polygon:
    jointjs_polygon$new("0,10 0,5 5,0 10,0 15,5 15,10 10,15 5,15")$
      set_body(magnet = TRUE)$
      set_label("Polyg")$
      set_position(x_offset + delta, y_offset + 2*delta),
    
    ## Add a polyline:
    jointjs_polyline$new("0,10 0,5 5,0 10,0 15,5 15,10 10,15 5,15")$
      set_body(magnet = TRUE)$
      set_label("Polyl")$
      set_position(x_offset + delta, y_offset + 3*delta),

    ## Add a rectangle:
    jointjs_rectangle$new(id = "rect")$
      set_body(magnet = TRUE)$
      set_label("Rect")$
      set_position(x_offset + 2*delta, y_offset),
    
    ## Add a text block:
    jointjs_textBlock$new("Text block", id = "tblock")$
      set_body(magnet = TRUE)$
      set_position(x_offset + 2*delta, y_offset + delta),

    ## Add an image:
    jointjs_image$new("https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true", id = "img")$
      set_body(magnet = TRUE)$
      set_size(width = 90)$
      set_label("Img")$
      set_position(x_offset + 2*delta, y_offset + 2*delta),

    ## Add a bordered image:
    jointjs_borderedImage$new(
      "https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true",
      border = list(color = "black"))$
      set_body(magnet = TRUE)$
      set_size(width = 90)$
      set_label("B img")$
      set_position(x_offset + 2*delta, y_offset + 3*delta),

    ## Add an embedded image:
    jointjs_embeddedImage$new("https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true")$
      set_body(magnet = TRUE)$
      set_size(width = 90)$
      set_label("E img")$
      set_position(x_offset + 3*delta, y_offset),
    
    ## Add an inscribed image:
    jointjs_inscribedImage$new(
      "https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true",
      id = "iimg",
      border = list(color = "black"))$
      set_body(magnet = TRUE)$
      set_size(width = 90)$
      set_label("I img")$
      set_position(x_offset + 3*delta, y_offset + delta),
    
    ## Add link
    jointjs_link$new(list(id = "rect"), list(id = "iimg")),

    ## Add double link
    jointjs_doubleLink$new(list(id = "tblock"), list(id = "iimg")),
    
    ## Add shadow link
    jointjs_shadowLink$new(list(id = "img"), list(id = "iimg"))

  )$
  
  ## Get and show widget
  get_widget(width = "100%", height = "400px")
```

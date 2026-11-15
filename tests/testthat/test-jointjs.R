test_that("jointjs() generates html correctly", {
  testthat::expect_snapshot_output({
    x_offset <- 20
    y_offset <- 20
    delta    <- 100
    set.seed(0)
    
    jointjs_graph$new()$
      add_elements(
        jointjs_rectangle$new(id = 1)$
          set_body(rx = 5, ry = 5, magnet = TRUE)$
          set_label("Rect")$
          set_position(x_offset, y_offset),
        jointjs_circle$new(id = 2)$
          set_body("white", "black", magnet = TRUE)$
          set_label("Circle")$
          set_position(x_offset, y_offset + delta),
        jointjs_cylinder$new(id = 3)$
          set_body(topRy = "10%", magnet = TRUE)$
          set_label("Cyl")$
          set_top("lightgrey")$
          set_position(x_offset, y_offset + 2*delta),
        jointjs_ellipse$new(id = 4)$
          set_body(rx = 50, ry = 30, magnet = TRUE)$
          set_label("Ellip")$
          set_size(50, 30)$
          set_position(x_offset, y_offset + 3*delta),
        jointjs_headeredRectangle$new(
          id = 5,
          list(fill = "lightblue"),
          list(text = "Head"),
          list(text = "Body"))$
          set_body("pink", "black", 1, magnet = TRUE)$
          set_position(x_offset + delta, y_offset),
        jointjs_path$new("M 0 5 10 0 C 20 0 20 20 10 20 L 0 15 Z",
                         id = 6)$
          set_body(magnet = TRUE)$
          set_label("Path")$
          set_position(x_offset + delta, y_offset + delta),
        jointjs_polygon$new("0,10 0,5 5,0 10,0 15,5 15,10 10,15 5,15",
                            id = 7)$
          set_body(magnet = TRUE)$
          set_label("Polyg")$
          set_position(x_offset + delta, y_offset + 2*delta),
        jointjs_polyline$new("0,10 0,5 5,0 10,0 15,5 15,10 10,15 5,15",
                             id = 8)$
          set_body(magnet = TRUE)$
          set_label("Polyl")$
          set_position(x_offset + delta, y_offset + 3*delta),
        jointjs_rectangle$new(id = "rect")$
          set_body(magnet = TRUE)$
          set_label("Rect")$
          set_position(x_offset + 2*delta, y_offset),
        jointjs_textBlock$new("Text block", id = "tblock")$
          set_body(magnet = TRUE)$
          set_position(x_offset + 2*delta, y_offset + delta),
        jointjs_image$new("https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true",
                          id = "img")$
          set_body(magnet = TRUE)$
          set_size(width = 90)$
          set_label("Img")$
          set_position(x_offset + 2*delta, y_offset + 2*delta),
        jointjs_borderedImage$new(
          "https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true",
          border = list(color = "black"))$
          set_body(magnet = TRUE)$
          set_size(width = 90)$
          set_label("B img")$
          set_position(x_offset + 2*delta, y_offset + 3*delta),
        jointjs_embeddedImage$new("https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true")$
          set_body(magnet = TRUE)$
          set_size(width = 90)$
          set_label("E img")$
          set_position(x_offset + 3*delta, y_offset),
        jointjs_inscribedImage$new(
          "https://github.com/pepijn-devries/jointjs/blob/main/man/figures/logo.png?raw=true",
          id = "iimg",
          border = list(color = "black"))$
          set_body(magnet = TRUE)$
          set_size(width = 90)$
          set_label("I img")$
          set_position(x_offset + 3*delta, y_offset + delta),
        jointjs_link$new(list(id = "rect"), list(id = "iimg")),
        jointjs_doubleLink$new(list(id = "tblock"), list(id = "iimg"),
                               id = 9),
        jointjs_shadowLink$new(list(id = "img"), list(id = "iimg"),
                               id = 10)
        
      )$
      get_widget(width = "100%", height = "400px") |>
      as.character()
  })
})
ui <- shiny::fluidPage(
  shiny::actionButton("btnAdd", "Add"),
  jointjs::jointjsOutput("my_jointjs"),
  shiny::textOutput("my_text")
)

server <- function(input, output, session) {
  graph <- shiny::reactiveVal(jointjs::jointjs_graph$new())
  
  shiny::observeEvent(input$btnAdd, {
    gr <-
      jointjs::jointjs_graph$new(input$my_jointjs_graph_state)$
      add_elements(
        jointjs::jointjs_rectangle$
          new()$
          set_body(fill = "white", stroke = "black", magnet = TRUE)$
          set_label(text = "Node", color = "black")
      )
    graph(gr)
  })
  
  output$my_jointjs <- jointjs::renderJointjs({
    graph()$get_widget()
  })
  
  output$my_text <- shiny::renderText({
    # shiny::req(input$my_jointjs_svg) #TODO
    jsonlite::toJSON(input$my_jointjs_graph_state, auto_unbox = TRUE)
  })
}

shiny::shinyApp(ui, server)
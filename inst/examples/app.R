ui <- shiny::fluidPage(
  jointjs::jointjsOutput("my_jointjs"),
  shiny::textOutput("my_text")
)

server <- function(input, output, session) {
  output$my_jointjs <- jointjs::renderJointjs({
    jointjs::jointjs()
  })
  
  output$my_text <- shiny::renderText({
    shiny::req(input$my_jointjs_svg)
    jsonlite::toJSON(input$my_jointjs_graph_state, auto_unbox = TRUE)
  })
}

shiny::shinyApp(ui, server)
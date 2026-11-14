test_that("For now just test if the app starts with no errors", {
  skip_if_not_installed("shiny")
  appFile <- system.file("examples", "app.R", package = "jointjs")
  app_obj <- shiny::shinyAppFile(appFile) |>
    suppressMessages()
  
  shiny::testServer(app_obj, {
    expect_no_error({})
  })
})
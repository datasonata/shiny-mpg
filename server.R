library(shiny)
library(datasets)

mpgData <- mtcars
fitModel <- lm(mpg ~ wt + factor(cyl) + factor(am), data=mpgData)

mpgResult <- function(cyl, hp, wt, tr) {
  newdata <- data.frame(cyl=cyl, hp=hp, wt=wt/1000, am=tr)
  predict(fitModel, newdata)

}
shinyServer(
  function(input, output) {
    output$modelInputValue <- renderText({paste("Model: ", input$model)})
    output$cylindersInputValue <- renderText({paste("Number of cylinders: ", input$cylinders)})
    output$hpInputValue <- renderText({paste("Horse power: ", input$hp)})
    output$weightInputValue <- renderText({paste("Weight: ", input$weight)})
    output$transmissionInputValue <- renderText({paste("Transmission: ", ifelse(input$transmission == 0, 'Automatic', 'Manual'))})
    output$mpgValue <- renderText({mpgResult(as.numeric(input$cylinders), as.numeric(input$hp), as.numeric(input$weight), as.numeric(input$transmission))})
  }
)
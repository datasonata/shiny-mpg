library(shiny)
shinyUI(
  pageWithSidebar(
    # Application title
    titlePanel("Miles Per Gallon Predictor"),
    sidebarPanel(
      h3("Input parameters"),
      # selectizeInput("model", "Car model", choices = row.names(mtcars),
      #               options = list(maxOptions = 500)
      #),
      textInput("model", "Make and Model"),
      selectInput("cylinders", "Number of cylinders:", c("4 cyl" = 4, "6 cyl" = 6, "8 cyl" = 8)),
      numericInput("hp", 'Horse Power', 1, min = 1, max = 500, step = 1),
      numericInput("weight", 'Weight (lb)', 3000, min = 100, step = 1),
      selectInput("transmission", "Transmission:", c("Automatic" = "0", "Manual" = "1")),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('Our input criteria'),
      verbatimTextOutput("modelInputValue"),
      verbatimTextOutput("cylindersInputValue"),
      verbatimTextOutput("hpInputValue"),
      verbatimTextOutput("weightInputValue"),
      verbatimTextOutput("transmissionInputValue"),
      h4('Out predicted MPG value '),
      verbatimTextOutput("mpgValue")
    )
  )
)
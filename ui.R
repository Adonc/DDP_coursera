

shinyUI(pageWithSidebar(
  headerPanel("Predicting Tree Volume"),
  sidebarPanel(
    h5(
      "This app is Used to predict Tree Volume, as well as comparing models when only a single predictore is used, or multiple predictors are Used, and comparing their perfomance"
    ),
    h5(
      "Please Use the Controls to see and control the information you are interested in"
    ),
    numericInput("observation", "Number of observations to view:", 4),
    sliderInput("girthval", "What is the Girth of the tree", 8, 25, value =
                  15),
    sliderInput("heightval", "What is the height of the tree", 60, 90, value =
                  75)
    
    
  ),
  
  
  mainPanel(
    h5("Predicted Tree Volume from a model with a single predictor"),
    textOutput("pred1"),
    h5(
      "Predicted Tree volume from a model with all the predictors in the dataset"
    ),
    textOutput("pred2"),
    checkboxInput("showdataset", "Show/Hide Data set", value = TRUE),
    conditionalPanel(condition="input.showdataset==true",tableOutput("view")),
    checkboxInput("showsummary1", "Show/Hide model1 summary", value = FALSE),
    conditionalPanel(condition="input.showsummary1==true",h4("Model with one Predictor summary"),verbatimTextOutput("summary1")),
    checkboxInput("showsummary2", "Show/Hide model2 summary", value = FALSE),
    conditionalPanel(condition="input.showsummary2==true",h4("Model with multiple Predictors summary"),verbatimTextOutput("summary2"))
  )
 
))
library(UsingR)
library(GGally)
data(cars)

shinyServer(function(input, output) {
  model1 <- lm(Volume ~ Girth, data = trees)
  model2 <- lm(Volume ~ Girth * Height, data = trees)
  
  model1pred <- reactive({
    girthinput <- input$girthval
    predict(model1, newdata = data.frame(Girth = girthinput))
  })
  
  model2pred <- reactive({
    girthinput <- input$girthval
    heightinput <- input$heightval
    predict(model2, newdata = data.frame(Girth = girthinput,
                                         Height = heightinput))
  })
  
  datasetshow<-reactive({
    head(trees,n=input$observation)
  })
  output$plot1 <- renderPlot({
    
    
  })
  
  output$pred1 <- renderText({
    model1pred()
  })
  output$pred2 <- renderText({
    model2pred()
  })
  
  
  output$view <- renderTable({
    head(trees, n = input$observation)
  })
  
  output$summary1 <- renderPrint({
    summary(model1)
  })
  
  output$summary2 <- renderPrint({
    summary(model2)
  })
  
  
  
  
})
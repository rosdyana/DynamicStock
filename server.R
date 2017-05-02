library(quantmod)
library(shiny)

shinyServer(
  function(input, output) {
    datasetInput <- reactive({
      getSymbols(input$symb, src = "yahoo", 
                 from = input$dates[1],
                 to = input$dates[2],
                 auto.assign = FALSE)
    })
    output$newHist <- renderPlot({
      candleChart(datasetInput(), 
                  theme=chartTheme('white',up.col='blue',dn.col='red'),TA=c(addBBands()))
      addMACD() 
    })
    # Generate a summary of the dataset
    output$summary <- renderPrint({
      dataset <- datasetInput()
      summary(dataset)
    }) 
    # Show the first "n" observations
    output$view <- renderTable({
      head(datasetInput(), n = 10)
    })
  })

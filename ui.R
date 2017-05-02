shinyUI(fluidPage(
  headerPanel("Stock dynamics"),
  sidebarPanel(
    textInput("symb", "Choose Stock Symbol", "GOOG"),
    dateRangeInput("dates", 
                   "Date range",
                   start = "2014-03-27", 
                   end = as.character(Sys.Date())),
    
    helpText("Note: Enter a stock symbol in the box below,
             choose the time period to display and 
             then press Update View botton. 
             Some stock symbols to get started TWTR, AAPL,WFM,SBUX"),
    submitButton('Update View')),
  mainPanel(
    plotOutput('newHist'),
    h4("Summary"),
    verbatimTextOutput("summary"),
    
    h4("Observations"),
    tableOutput("view")
  )
))

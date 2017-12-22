
#
# This is a Shiny web application help the house owners to estimate the house price based on the historical information in Sacramento, CA.
#


library(caret)
library(shiny)
library(UsingR)
data(Sacramento)

fit= lm(price ~ sqft, data = Sacramento)
slope <- coef(fit)[2]
names(slope)<- "US$ Dollars"

housePrice <- function(sqft) {sqft*slope + coef(fit)[1]}


shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$sqft})
    output$prediction <- renderPrint(housePrice(sqft=input$sqft))
  }
)



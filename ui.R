#
# This is a Shiny web application help the house owners to estimate the house price based on the historical information in Sacramento, CA.
#

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Prediction of House Price in Sacramento"),
  sidebarPanel(
    sliderInput(inputId = "sqft",
                label = "Enter total square feet:",
                min = 200, max = 5000, value = 2000, step = 100),
    submitButton('Submit')
    
  ),
  mainPanel(
    h3('Accroding to your inputs, price of the house is:'),
    verbatimTextOutput("prediction")
  )
))
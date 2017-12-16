#
# This is a Shiny web application help the house owners to estimate the house price based on the historical information in Sacramento, CA.
#

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Prediction of House Price in Sacramento"),
  sidebarPanel(
    selectInput('city', 'Select City:', levels(mydata$city)),
    selectInput('zip', 'Select the zipcode',levels(mydata$zip)),
    numericInput('beds', 'Select the number of bedrooms:',1 , min = 1, max = 6, step = 1 ),
    numericInput('baths', 'Select the number of bathrooms:', 1 , min = 1, max = 5, step = 1 ),
    selectInput('type', 'Select the type of house:', levels(mydata$type)),
    numericInput('sqft', 'Enter total square feet:',2000, min = 200, max = 5000),
    submitButton('Submit')
    
  ),
  mainPanel(
    h3('Accroding to your inputs, price of the house in USD is:'),
    verbatimTextOutput("prediction")
  )
))

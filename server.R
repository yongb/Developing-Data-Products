


library(caret)
library(randomForest)
data(Sacramento)
mydata <- Sacramento[,c(1:7)]
set.seed(955)
in_train <- createDataPartition(log10(mydata$price), p = .8, list = FALSE)
training <- mydata[ in_train,]
testing <- mydata[-in_train,]
model.forest <- train(price~., training, method = "rf", trControl = trainControl(method = "cv", number = 3))
testing$pred <- predict(model.forest, newdata = testing)

housePrice <- function(x){
  predict(model.forest, newdata = x)
}

library(shiny)
shinyServer(
  function(input, output) {
    output$prediction <- renderPrint(housePrice(x = data.frame(city=input$city, zip=input$zip,beds=input$beds, baths=input$baths, sqft=input$sqft, type=input$type)))
  }
)

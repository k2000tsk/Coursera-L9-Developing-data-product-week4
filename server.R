#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(randomForest)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  data(mtcars)
  
  # Separate the training data and testing data
  set.seed(135)
  library(caret)     # In order to use createDataPartition() function
  inTrain<-createDataPartition(mtcars$mpg,p=0.6,list=FALSE)
  training<-mtcars[inTrain,]
  testing<-mtcars[-inTrain,]
  dim(training)
  dim(testing)
  
  rf_training<-randomForest(mpg~.,data=training,importance=TRUE)
  rf_training

  pred<-reactive({
    input_value <- data.frame(
      cyl = input$cyl, 
      disp = input$disp, 
      hp = input$hp, 
      drat = input$drat, 
      wt = input$wt, 
      qsec = input$qsec, 
      vs = input$vs, 
      am = input$am, 
      gear = input$gear, 
      carb = input$carb)    
    
    predict(rf_training,input_value,type="class")
  })
  
  output$pred<-renderText({
    pred()
  })
})

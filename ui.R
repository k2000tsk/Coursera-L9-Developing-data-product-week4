#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
data(mtcars)

initial_value<-data.frame(cyl = 6, disp = 100, hp = 70, drat = 4.1, wt = 1.8, qsec = 24, vs = 1, am = 1, gear = 4, carb = 2)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("MPG Prediction about various variables"),
  
  sidebarLayout(
    sidebarPanel(
      
      h2("Please click input"),
      sliderInput("cyl","Cylinders:",min = min(mtcars$cyl),max = max(mtcars$cyl),value=initial_value$cyl,step=2),
      sliderInput("disp","Displacement:",min=min(mtcars$disp),max=max(mtcars$disp),value=initial_value$disp),
      sliderInput("hp","Horse power:",min=min(mtcars$hp),max=max(mtcars$hp),value=initial_value$hp),
      sliderInput("drat","Rear axle ratio",min=min(mtcars$drat),max=max(mtcars$drat),initial_value$drat),
      sliderInput("wt","Weight",min=min(mtcars$wt),max=max(mtcars$wt),value=initial_value$wt),
      sliderInput("qsec","1/4 mile time",min=min(mtcars$qsec),max=max(mtcars$qsec),value=initial_value$qsec),
      sliderInput("vs","Engine shape",min=min(mtcars$vs),max=max(mtcars$vs),value=initial_value$vs,step=1),
      sliderInput("am","Transmission",min=min(mtcars$am),max=max(mtcars$am),value=initial_value$am,step=1),
      sliderInput("gear","Gears",min=min(mtcars$gear),max=max(mtcars$gear),value=initial_value$gear,step=1),
      sliderInput("carb","Carburetors",min=min(mtcars$carb),max=max(mtcars$carb),value=initial_value$carb,step=1)
      ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h2("Predicted MPG:"),
      textOutput("pred")
    )
  )
))

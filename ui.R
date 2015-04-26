
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyUI( pageWithSidebar(
     headerPanel("MPG prediction"),
     sidebarPanel(
          selectInput("car.choice", label = "1. select a car", 
                      choices = list("AMC Javelin"="AMC Javelin",
                                     "Cadillac Fleetwood"="Cadillac Fleetwood",
                                     "Ferrari Dino"="Ferrari Dino",
                                     "Honda Civic"="Honda Civic",
                                     "Hornet Sportabout"="Hornet Sportabout",
                                     "Mazda RX4"="Mazda RX4",
                                     "Merc 450SL"="Merc 450SL",
                                     "Pontiac Firebird"="Pontiac Firebird",
                                     "Toyota Corolla"="Toyota Corolla",
                                     "Valiant"="Valiant"), selected = 1),
          
          checkboxGroupInput("predictors", "2. select your predictors",
                             c("cyl" = 2, "disp" = 3, "hp" = 4, "drat" = 5, 
                               "wt" = 6, "qsec" = 7, "vs" = 8, "am" = 9, 
                               "gear" = 10,"carb" = 11)),
          
          sliderInput('mpg.est', '3. estimate the mpg',value = 20, 
                      min = 1, max = 40, step = 1,),
          
          actionButton("goButton", "Go!")
     ), 
     mainPanel(
          h3('Here are your results'),
          h4('Your car'), 
          verbatimTextOutput("car.choice"),
          h4('Your predictors'), 
          verbatimTextOutput("predictors"),
          h4('Your estimate'), 
          verbatimTextOutput("mpg.est"), 
          h4('The predicted mpg was'), 
          verbatimTextOutput("predicted"),
          h4('The actual mpg was'), 
          verbatimTextOutput("actual")
     ))
)

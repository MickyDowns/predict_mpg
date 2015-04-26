
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

data=mtcars;mtcars$am=as.factor(mtcars$am);mtcars$vs=as.factor(mtcars$vs)

prediction <- function(car.choice,predictors) {
     dat=mtcars[-c(which(rownames(mtcars)==car.choice)),c(1,as.integer(predictors))]
     fit=lm(mpg~.,data=dat)
     predict(fit,mtcars[which(rownames(mtcars)==car.choice),
                        c(1,as.integer(predictors))])
}

actual <- function(car.choice) {
     mtcars$mpg[which(rownames(mtcars)==car.choice)]
}
shinyServer( 
     function(input, output) {
          output$car.choice <- renderPrint({input$car.choice})
          output$predictors <- renderPrint({input$predictors})
          output$mpg.est <- renderPrint({input$mpg.est})
          output$predicted <- renderPrint({
               if(input$goButton==0) "<<<---select car and predictors"
               else prediction(input$car.choice,input$predictors)
          })
          output$actual <- renderPrint({
               if(input$goButton==0) "<<<---select car and predictors"
               else actual(input$car.choice)
          })
     }
)
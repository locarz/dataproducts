
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
mydata <- mtcars
shinyServer(function(input, output) {
    myresult <- reactive({
        paste("mpg ~", "as.integer(", input$x,")")
    })
    mymodel <- reactive({
        lm(as.formula(myresult()),data=mydata)
    })
    output$summary <- renderPrint({
        predictor <- input$x
    })
    output$text <- renderText({
        paste("LM Model:", "mpg ~", input$x)
    })
    output$myplot <- renderPlot ({
        with(mydata, {plot(as.formula(myresult()),xlab=input$x,ylab="mpg")
            abline(mymodel(), )
        })
    })
})


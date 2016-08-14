
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#
library(shiny)
library(datasets)
shinyUI(fluidPage(
    sidebarPanel(
        p('This is a simple linerar model of mgp vs a number of choices of predictors'),
        p('Select the predictor variable:'),
        selectInput('x', label='Predictor', selected='carb', choices=names(mtcars)),
        h3('Notes'),
        p("I reused a previous project from the regresion class as the basis of this simple shiny app")),

    mainPanel(
        div(h3("Mtcars regression model")),
        plotOutput('myplot'))
    
))
#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Data Science Capstone Project: Text Predictor"),
    
    # 
    sidebarLayout(
        
        sidebarPanel(
            p("Instructions: Write a sentence and click on Predict the next word. The app will give you the next word (with highest probability), and a list of the 10 most likely words according to the written sentence. 
                         You can add the words you want, and press Predict the next word, to update the prediction.
                         By default, the application will initially display the 10 most likely words in the English language.", 
                         style = "font-family: 'Source Sans Pro';"),
            hr(),
            textInput("sentence","Sentence",value=""),
            submitButton("Predict the next word"),
            
        ),

        # Show a plot of the generated distribution
        mainPanel(
            
            tabsetPanel(
                 tabPanel(
                     #"Prediction",
                     h4("The predicted word is:"),
                     HTML("<span style='color:black'>"),
                     h3(textOutput("predictedText"), align="center"),
                     HTML("</span>"),
                     br(),
                     hr(),
                     #div(dataTableOutput("resultsPred"), style='font-size:150%')
                     DT::dataTableOutput("resultsPred")
                 )
             )
        )
            
        )
    )
)

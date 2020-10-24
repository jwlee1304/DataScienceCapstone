#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


## Data Science Capstone - Final Project


library(shiny)
#library(markdown)

shinyUI(fluidPage(
    
        titlePanel("Data Science Capstone - Final Project"),
        sidebarLayout(
            sidebarPanel(
                helpText("WORD PREDICTION: Input a word/phrase (multiple words) in a text box input and 
                         outputs a prediction of the next word"),
                hr(),
                textInput("inputText", "Input a word/phrase here:",value = ""),
                hr(),
                helpText("1 - After input the word, the next word predicted will be shown.", 
                         hr(),
                         "2 - After input the partial phrase(2/3 words), the next word predicted will be shown.",
                         hr(),
                         "3 - If no word is found, a default message will be shown"),
                hr(),
                hr()
            ),
            mainPanel(
                h2("The Next Word prediction result:"),
                verbatimTextOutput("prediction"),
                strong("Input Word/Phrase:"),
                strong(code(textOutput('sentence1'))),
                br(),
                strong("Searching N-GRAMS to show next word predicted:"),
                strong(code(textOutput('sentence2'))),
                hr(),
            )
        )
    )
)
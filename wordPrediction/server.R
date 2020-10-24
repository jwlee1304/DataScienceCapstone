#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#


## Data Science Capstone - Final Project

library(shiny); 
library(stringr); 
library(tm)

# Loading bigram, trigram and quadgram frequencies words matrix frequencies

bg <- readRDS("two_corpus.RData"); 
tg <- readRDS("thr_corpus.RData"); 
qd <- readRDS("fou_corpus.RData")


names(bg)[names(bg) == 'word1'] <- 'w1'; 
names(bg)[names(bg) == 'word2'] <- 'w2';
names(tg)[names(tg) == 'word1'] <- 'w1'; 
names(tg)[names(tg) == 'word2'] <- 'w2'; 
names(tg)[names(tg) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word1'] <- 'w1'; 
names(qd)[names(qd) == 'word2'] <- 'w2'; 
names(qd)[names(qd) == 'word3'] <- 'w3';
names(qd)[names(qd) == 'word4'] <- 'w4';

## Clear message
message <- "" 

## Function predicting the next word
predictWord <- function(the_word) {
    word_add <- stripWhitespace(removeNumbers(removePunctuation(tolower(the_word),preserve_intra_word_dashes = TRUE)))
    # testing print("word_add")
    the_word <- strsplit(word_add, " ")[[1]]
    # testing print("the_word")
    n <- length(the_word)
    # testing print(n)
    
    ########### check Bigram
    if (n == 1) {the_word <- as.character(tail(the_word,1)); functionBigram(the_word)}
    
    ################ check trigram
    else if (n == 2) {the_word <- as.character(tail(the_word,2)); functionTrigram(the_word)}
    
    ############### check quadgram
    else if (n >= 3) {the_word <- as.character(tail(the_word,3)); functionQuadgram(the_word)}
}
########################################################################
functionBigram <- function(the_word) {
    # testing print(the_word)
    if (identical(character(0),as.character(head(bg[bg$w1 == the_word[1], 2], 1)))) {
        # testing print(bg$w1)
        message<<-"If no word is found, a message will be returned." 
        as.character(head("No next word found",1))
    }
    else {
        message <<- "Predict Word using Bigram Freqeuncy Matrix  "
        as.character(head(bg[bg$w1 == the_word[1],2], 1))
        # testing print of bg$w1, the_word[1]
    }
}
########################################################################
functionTrigram <- function(the_word) {
    # # testing print(the_word)
    if (identical(character(0),as.character(head(tg[tg$w1 == the_word[1]
                                                    & tg$w2 == the_word[2], 3], 1)))) {
        as.character(predictWord(the_word[2]))
        # testing print tg$w1, tg$w2, the_word[1], the_word[2]
    }
    else {
        message<<- "Predict Word using Trigram Frequency Matrix "
        as.character(head(tg[tg$w1 == the_word[1]
                             & tg$w2 == the_word[2], 3], 1))
        # testing print of tg$w1, tg$w2, the_word[1], the_word[2]
    }
}
########################################################################
functionQuadgram <- function(the_word) {
    # testing print(the_word)
    if (identical(character(0),as.character(head(qd[qd$w1 == the_word[1]
                                                    & qd$w2 == the_word[2]
                                                    & qd$w3 == the_word[3], 4], 1)))) {
        # testing print of qd$w1, qd$w2, qd#w3, the_word[1], the_word[2], the_word3
        as.character(predictWord(paste(the_word[2],the_word[3],sep=" ")))
    }
    else {
        message <<- "Predict Word using Quadgram Frequency Matrix"
        as.character(head(qd[qd$w1 == the_word[1] 
                             & qd$w2 == the_word[2]
                             & qd$w3 == the_word[3], 4], 1))
        # testing print of qd$w1, qd$w2, qd#w3, the_word[1], the_word[2], the_word3
    }       
}
#################################################

## ShineServer code to call the function predictWord
shinyServer(function(input, output) {
    output$prediction <- renderPrint({
        result <- predictWord(input$inputText)
        output$sentence2 <- renderText({message})
        result
    });
    output$sentence1 <- renderText({
        input$inputText});
}
)

#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringi)
library(data.table)

word2code = function(w){
    l = list(w)
    codes[l]$code
}

code2word = function(a){
    where = sapply(a, function(x)which(codes$code == x))
    codes[where]$x
}

unigrams = readRDS("unigrams.Rds") #ngrams$unigrams
bigrams = readRDS("bigrams.Rds")
trigrams = readRDS("trigrams.Rds")
fourgrams = readRDS("fourgrams.Rds")
fivegrams = readRDS("fivegrams.Rds")
codes = readRDS("codes.Rds")
removeCodes = NULL

codes = rbindlist(list(codes, list(x="PROFANITY", cX=1, code=1000001)), use.names = TRUE, fill = TRUE)
setkey(codes, x)

source("FunctionsMP.R")

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$predictedText=renderText({
        pred=predictedWord(input$sentence)
        pred$words[1]
    })
    
    output$resultsPred=DT::renderDataTable({
        pred=predictedWord(input$sentence)
        aux=data.frame(Word=pred$words,Prob=round(pred$probs,3))
        DT::datatable(head(aux,10))
    })
    
})

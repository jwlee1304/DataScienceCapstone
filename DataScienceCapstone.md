Data Science Capstone - Final Project
========================================================
author: LJW
date: 24-OCT-2020
autosize: true


INTRODUCTION
========================================================
The goal of this exercise is to create a product to highlight the prediction algorithm that you have built and to provide an interface that can be accessed by others. For this project you must submit:

A Shiny app that takes as input a word/phrase (multiple words) in a text box input and outputs a prediction of the next word.

A slide deck consisting of no more than 5 slides created with R Studio Presenter pitching your algorithm and app as if you were presenting to your boss or an investor.

The data came from HC Corpora with three files (Blogs, News and Twitter). 

PRE-PROCESSING 
========================================================
In Week 2, the raw data has been pre-processed data. 

1. Loading the raw data

2. Cleaning the raw data

3. Building corpus and N-gram 

4. Ploting the graph.

The milestone report is available at <https://rpubs.com/jwlee/SwiftKey_MSReport>


APPROACH AND MODEL
========================================================
**Approach**

After loading the data, a sample data was created, cleaned and prepared and used as a corpus of text. 

The sample data was “tokenized” into n-grams to construct the predictive models 

- Tokenization is the process of breaking a stream of text up into words, phrases. 
- N-gram is a contiguous sequence of n items from a given sequence of text).

The n-grams files (unigram, bigram, trigram and quadgram) are matrices with frequencies of words, used into the algorithm to predict the next word based on the text entered by the user.

**Model**

* If there is trigram in list, prediction will use 2 words.
* If there no trigram, prediction will use Bigram.
* If there no bigram, prediction will use unigram.



LINKS FOR PROJECT DELIVERABLES
========================================================
**Data Product**

- The Shiny application "Word Prediction" is accesible in:

<https://jwlee1304.shinyapps.io/wordPrediction/>

- Source codes, milestone report, RDatas and preseentation can be found in the GitHub repo. 

<https://github.com/jwlee1304/DataScienceCapstone>

**Slide Deck**

- The Milestone Report is available in: 

<https://rpubs.com/jwlee/SwiftKey_MSReport>

- The Data Science Capstone presentation could be visualized in: 

<https://rpubs.com/jwlee/wordPrediction>

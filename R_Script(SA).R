rd <- read.csv("C:/Users/amans/OneDrive - Indian Institute of Technology (BHU), Varanasi/Desktop/Projects/Sentiment_Analayis by R/amother/Reddit_Data.csv")
str(rd)

#BUild Corpus
library(tm)
corpus <- iconv(rd$clean_comment, to = "UTF-8")
corpus <- Corpus(VectorSource(corpus))

corpus <- tm_map(corpus, tolower)
inspect(corpus[1:5])

corpus <- tm_map(corpus, removePunctuation)
inspect(corpus[1:5])

corpus <- tm_map(corpus, removeNumbers)
inspect(corpus[1:5])

# Term document matrix
tdm <- TermDocumentMatrix(cleanset)

cleanset <- tm_map(corpus ,removeWords , stopwords('english'))
inspect(cleanset[1:5])

cleanset <- tm_map(cleanset ,stripWhitespace)
inspect(cleanset[1:5])

tdm

tdm <- as.matrix(tdm)
tdm [1:10 ,1:20]

w <-rowSums(tdm)
w <-subset(w, w>=1000)
barplot(w,
        las =2,
        col=rainbow(50))
library(wordcloud)
w <- sort(rowSums(tdm), decreasing =TRUE)
set.seed(222)
wordcloud(words = names(w),
                        freq =w, max.words=150 ,
                         random.order = F, 
          min.Freq =5,
          colors =brewer.pal(8 ,"Dark2"))


#sentiment analysis

rd <- read.csv("C:/Users/amans/OneDrive - Indian Institute of Technology (BHU), Varanasi/Desktop/Projects/Sentiment_Analayis by R/amother/Reddit_Data.csv")
comments <- iconv(rd$clean_comment, to = "UTF-8")
library(syuzhet)
library(lubridate)
library(ggplot2)
library(scales)
library(reshape2)
library(dplyr)

s <- get_nrc_sentiment(comments)
head(s)

get_nrc_sentiment('delay')

barplot(colSums(s),
        las=2,
        ylab ='Count',
        main = 'Sentiment for Reddit Comments')


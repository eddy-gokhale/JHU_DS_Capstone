
SampleRawBlogs <- as_data_frame(SampleRawBlogs)
names(SampleRawBlogs) <- c("Text")


RemoveData <- function(x){
  x <- gsub("[0-9]"," ",x)    # REMOVE NUMBERS
  x <- gsub("\\.\\.+"," ",x) # REMOVE CONSECUTIVE DOTS.
  x <- gsub("[^a-zA-Z]"," ",x) # REMOVE NON-ALPHA Characters
  x <- gsub(" [ +]"," ",x)  # Convert Multiple Spaces to one
  #  x <- unlist(str_split(x," "))  ## 1112363 1027241
  #  x <- x[which(nchar(x)>1)]
  x <- tolower(x)
  x <- trimws(x)
  x <-as.data.frame(x, stringsAsFactors=FALSE)
}

SampleCleanDF <- as.data.frame(sapply(SampleRawBlogs,RemoveData, simplify = FALSE), stringsAsFactors = FALSE)


names(SampleCleanDF) <- c("Text")

tidybg <- SampleCleanDF %>% unnest_tokens(bg,Text,token = "ngrams",n=2) %>% separate(bg,into=c("Word1","Word2"),sep = " ")
%>% group_by(word1,word2) %>% summarise(Cnt=n())


tidybgcnt <- SampleCleanDF %>% unnest_tokens(bg,Text,token = "ngrams",n=2) %>% separate(bg,into=c("Word1","Word2"),sep = " ") %>% group_by(Word1,Word2) %>% summarise(Cnt=n())
tidybgcnt$Word1 <- as.factor(tidybgcnt$Word1)
tidybgcnt$Word2 <- as.factor(tidybgcnt$Word2)

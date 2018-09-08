library(tm)
library(readr)
library(stringr)
library(tidyverse)
library(tidytext)
library(widyr)


fl_en_blogs <- read_lines("../data/final/en_US/en_US.blogs.txt",locale = locale(encoding = "UTF-8"))
SampleRawBlogs <- iconv(sample(fl_en_blogs,length(fl_en_blogs)*0.8), "latin1","ASCII",sub="")
names(SampleRawBlogs) <- c("Text")

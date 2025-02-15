library(tidyverse)
library(tidygraph)
library(ggraph)
library(igraph)
library(dplyr)
library(ggplot2)
library(lpSolve)
library(lpSolveAPI)
library(RColorBrewer)

#
#
#
# extract raw Etherscan data

get_transaction = function(file_name){
  
  transactions <- file_name[, c("DateTime..UTC.", "Quantity")]
  
  datetime_set <- c()
  
  for (i in 1:nrow(transactions)){
    
    curr_date <- transactions$DateTime..UTC.[i]
    
    curr_date <- as.POSIXct( strptime(curr_date, format="%Y-%m-%d %H:%M:%S") )
    
    datetime_set <- append(datetime_set, curr_date)
  }
  
  value_set <- c()
  
  for (i in 1:nrow(file_name)){
    
    curr_value <- file_name$Quantity[i]
    
    curr_value <- as.numeric(gsub(",","",curr_value) )
    
    value_set <- append(value_set, curr_value)
  }
  
  value_set <- data.frame(value_set)
  value_set$index <- datetime_set
  value_set <- value_set[, c("index", "value_set")]
  
  return(value_set)
  
}


eth_raw_April3 <- read.csv("WrappedLUNC_April3.csv")
eth_raw_April3 <- data.frame(eth_raw_April3)

transactions_April3 <- get_transaction(eth_raw_April3)

ggplot(transactions_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
#19th April 2022

eth_raw_April19 <- read.csv("WrappedLUNC_April19.csv")
eth_raw_April19 <- data.frame(eth_raw_April19)

transactions_April19 <- get_transaction(eth_raw_April19)

ggplot(transactions_April19, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
#20th April 2022

eth_raw_April20 <- read.csv("WrappedLUNC_April19_April21.csv")
eth_raw_April20 <- data.frame(eth_raw_April20)

transactions_April20 <- get_transaction(eth_raw_April20)

ggplot(transactions_April20, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()


#5th May 2022
#7th May 2022
#8th May 2022
#9th May 2022
#10th May 2022
#12th May 2022
#13th May 2022 
#25th May 2022
#27th May 2022

ust_raw_April3 <- read.csv("WrappedUSTC_April3.csv")
ust_raw_April3 <- data.frame(ust_raw_April3)

ust_April3 <- get_transaction(ust_raw_April3)

ggplot(ust_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
#
ust_raw_April19<- read.csv("WrappedUSTC_April19.csv")
ust_raw_April19 <- data.frame(ust_raw_April19)

ust_April19 <- get_transaction(ust_raw_April19)

ggplot(ust_April19, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
# Etherscan daily closing prices
# from 01 May 2022 00:00 to 16 May 2022 23:00 (UTC)6.

# LUNC
date_interest <- seq(as.Date("2022-05-01"), as.Date("2022-05-16"), by = "day")
date_interest <- data.frame(date_interest)

date_interest$USTC <- c(1.002,
                        1.001,
                        1.001,
                        1.001,
                        NA,
                        1.00,
                        0.995,
                        0.995,
                        0.799,
                        0.781,
                        0.775,
                        0.37,
                        0.124,
                        0.185,
                        0.149,
                        0.097
                        )

date_interest$LUNC <- c(NA,
                        84.454,
                        NA,
                        86.136,
                        NA,
                        NA,
                        68.577,
                        NA,
                        33.144,
                        NA,
                        NA,
                        0.016,
                        NA,
                        0.001,
                        NA,
                        NA
                        )


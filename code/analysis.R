library(tidyverse)
library(tidygraph)
library(ggraph)
library(igraph)
library(dplyr)
library(ggplot2)
library(lpSolve)
library(lpSolveAPI)
library(RColorBrewer)
library(lubridate)
library(rjson)

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


eth_raw_April3 <- read.csv("etherscan/WrappedLUNC_April3.csv")
eth_raw_April3 <- data.frame(eth_raw_April3)

transactions_April3 <- get_transaction(eth_raw_April3)

ggplot(transactions_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
#19th April 2022

eth_raw_April19 <- read.csv("etherscan/WrappedLUNC_April19.csv")
eth_raw_April19 <- data.frame(eth_raw_April19)

transactions_April19 <- get_transaction(eth_raw_April19)

ggplot(transactions_April19, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
# 3rd April 2022
ust_raw_April3 <- read.csv("etherscan/WrappedUSTC_April3.csv")
ust_raw_April3 <- data.frame(ust_raw_April3)

ust_April3 <- get_transaction(ust_raw_April3)

ggplot(ust_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

#
#
#
#
ust_raw_April19<- read.csv("etherscan/WrappedUSTC_April19.csv")
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

#
#
#
#

View(eth_raw_April3)

blocknum_LUNC_April3 <- eth_raw_April3$Blockno
blocknum_LUNC_April3 <- unique(blocknum_LUNC_April3)
blocknum_LUNC_April3 <- data.frame(blocknum_LUNC_April3)
write.csv(blocknum_LUNC_April3, "LUNC_April3_blockno.csv")

#
#
#
#
View(eth_raw_April19)

blocknum_LUNC_April19 <- eth_raw_April19$Blockno
blocknum_LUNC_April19 <- unique(blocknum_LUNC_April19)
blocknum_LUNC_April19 <- data.frame(blocknum_LUNC_April19)
write.csv(blocknum_LUNC_April19, "LUNC_April19_blockno.csv")

#
#
#
# Luna Foundation Guard

LFG_raw_transactions <- read.csv("etherscan/LunaFoundationGuardReserveWallet_Transactions.csv")
LFG_raw_transactions <- data.frame(LFG_raw_transactions)
View(LFG_raw_transactions)

# no operazioni per il giorno 10 Maggio ?
# 

LFG_raw_token_transfers <- read.csv("etherscan/LunaFoundationGuardReserveWallet_Token_Transfers.csv")
LFG_raw_token_transfers <- data.frame(LFG_raw_token_transfers)

# no operazioni per il giorno 10 Maggio ?
#

LFG_raw_internal <- read.csv("etherscan/LunaFoundationGuardReserveWallet_Internal_Transactions.csv")
LFG_raw_internal <- data.frame(LFG_raw_internal)

# no operazioni per il giorno 10 Maggio ?
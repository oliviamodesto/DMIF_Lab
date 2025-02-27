# Etherscan API

prepare_dataframe = function(file_name){
  set <- c()
  index <- 1
  
  for (i in file_name$timestamp) {
    timestamp <- as.POSIXct(as_datetime(i, tz = "UTC"), format="%Y-%m-%d %H:%M:%S")
    set[index] <- toString(timestamp)
    print(timestamp)
    index <- index+1
  }
  
  file_name$date <- set
  
  colnames(file_name) <- c("ignore", "Quantity", "DateTime..UTC.")
  
  return(file_name)
}


# LUNC April3

ethAPI_raw_April3 <- read.csv("etherscan_API/LUNC_04_03_records.csv")
ethAPI_raw_April3 <- data.frame(ethAPI_raw_April3)

ethAPI_raw_April3 <- prepare_dataframe(ethAPI_raw_April3)

ethAPI_April3 <- get_transaction(ethAPI_raw_April3)

ggplot(ethAPI_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()


# LUNC April 19

ethAPI_raw_April19 <- read.csv("etherscan_API/LUNC_04_19_records.csv")
ethAPI_raw_April19 <- data.frame(ethAPI_raw_April19)

ethAPI_raw_April19 <- prepare_dataframe(ethAPI_raw_April19)

ethAPI_April19 <- get_transaction(ethAPI_raw_April19)

ggplot(ethAPI_April19, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()


# USTC April 3

ethAPI_ustc_raw_April3 <- read.csv("etherscan_API/USTC_04_03_records.csv")
ethAPI_ustc_raw_April3 <- data.frame(ethAPI_ustc_raw_April3)

ethAPI_ustc_raw_April3 <- prepare_dataframe(ethAPI_ustc_raw_April3)

ethAPI_ustc_April3 <- get_transaction(ethAPI_ustc_raw_April3)

ggplot(ethAPI_ustc_April3, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

# USTC April 19

ethAPI_ustc_raw_April19 <- read.csv("etherscan_API/USTC_04_19_records.csv")
ethAPI_ustc_raw_April19 <- data.frame(ethAPI_ustc_raw_April19)

ethAPI_ustc_raw_April19 <- prepare_dataframe(ethAPI_ustc_raw_April19)

ethAPI_ustc_April19 <- get_transaction(ethAPI_ustc_raw_April19)

ggplot(ethAPI_ustc_April19, aes(x=index, y=value_set)) +
  geom_line() +
  geom_point()

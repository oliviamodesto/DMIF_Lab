#
#
# Infura
#

# get dates

get_timestamp = function(file_name){
  
  set <- c()
  
  for (time in file_name$timestamp) {
    new_timestamp <- as_datetime(time, tz = "UTC")
    
    set <- append(set, new_timestamp)
  }
  
  return(set)
}

#
#
#
infura_lunc_time_3 <- read.csv("infura/LUNC_04_03_timestamps.csv")
infura_lunc_time_3 <- data.frame(infura_lunc_time_3)

LUNC_04_03_time <- get_timestamp(infura_lunc_time_3)
LUNC_04_03_time <- data.frame(LUNC_04_03_time)

rm(infura_lunc_time_3)

infura_lunc_data_3 <- read.csv("infura/LUNC_04_03_records.csv")
infura_lunc_data_3 <- data.frame(infura_lunc_data_3)

infura_lunc_data_3$timestamp <- LUNC_04_03_time$LUNC_04_03_time
colnames(infura_lunc_data_3) <- c("blockNumber", "data", "timestamp")

ggplot(infura_lunc_data_3, aes(x=timestamp, y=data)) +
  geom_line() +
  geom_point()


#
#
#
infura_lunc_time_19 <- read.csv("infura/LUNC_04_19_timestamps.csv")
infura_lunc_time_19 <- data.frame(infura_lunc_time_19)

LUNC_04_19_time <- get_timestamp(infura_lunc_time_19)
LUNC_04_19_time <- data.frame(LUNC_04_19_time)

rm(infura_lunc_time_19)

infura_lunc_data_19 <- read.csv("infura/LUNC_04_19_records.csv")
infura_lunc_data_19 <- data.frame(infura_lunc_data_19)

infura_lunc_data_19$timestamp <- LUNC_04_19_time$LUNC_04_19_time
colnames(infura_lunc_data_19) <- c("blockNumber", "data", "timestamp")

ggplot(infura_lunc_data_19, aes(x=timestamp, y=data)) +
  geom_line() +
  geom_point()


#
#
#
infura_ustc_time_3 <- read.csv("infura/USTC_04_03_timestamps.csv")
infura_ustc_time_3 <- data.frame(infura_ustc_time_3)

USTC_04_03_time <- get_timestamp(infura_ustc_time_3)
USTC_04_03_time <- data.frame(USTC_04_03_time)

rm(infura_ustc_time_3)

infura_ustc_data_3 <- read.csv("infura/USTC_04_03_records.csv")
infura_ustc_data_3 <- data.frame(infura_ustc_data_3)

infura_ustc_data_3$timestamp <- USTC_04_03_time$USTC_04_03_time
colnames(infura_ustc_data_3) <- c("blockNumber", "data", "timestamp")

ggplot(infura_ustc_data_3, aes(x=timestamp, y=data)) +
  geom_line() +
  geom_point()


#
#
#
infura_ustc_time_19 <- read.csv("infura/USTC_04_19_timestamps.csv")
infura_ustc_time_19 <- data.frame(infura_ustc_time_19)

USTC_04_19_time <- get_timestamp(infura_ustc_time_19)
USTC_04_19_time <- data.frame(USTC_04_19_time)

rm(infura_ustc_time_19)

infura_ustc_data_19 <- read.csv("infura/USTC_04_19_records.csv")
infura_ustc_data_19 <- data.frame(infura_ustc_data_19)

infura_ustc_data_19$timestamp <- USTC_04_19_time$USTC_04_19_time
colnames(infura_ustc_data_19) <- c("blockNumber", "data", "timestamp")

ggplot(infura_ustc_data_19, aes(x=timestamp, y=data)) +
  geom_line() +
  geom_point()



prepare_plot = function(LUNC_data, BSTC_data){
  
  data_points<-data.frame(DATE = LUNC_data$index, VALUE = LUNC_data$value_set, series = "LUNC") %>%
    bind_rows(data.frame(DATE = BSTC_data$index, VALUE = BSTC_data$value_set, series = "BSTC"))
  
  data_lines<-data.frame(
    x = head(LUNC_data$index, n=-1),
    y = head(LUNC_data$value_set, n=-1),
    xend = tail(LUNC_data$index, n=-1),
    yend = tail(LUNC_data$value_set, n=-1),
    series = "LUNC") %>%
    bind_rows(
      data.frame(
        x = head(BSTC_data$index, n=-1), 
        y = head(BSTC_data$value_set, n=-1), 
        xend = tail(BSTC_data$index, n=-1),
        yend = tail(BSTC_data$value_set, n=-1), 
        series = "BSTC")
    )
 
  data_set <- list(data_points=data_points, data_lines=data_lines)
  return (data_set) 
}

#
#
#
# April 3, 2022

data_April3 <- prepare_plot(transactions_April3, ust_April3)

# assoluto
data_April3$data_points %>% 
  ggplot(aes(x=DATE, y=VALUE, color=series)) +
  geom_point() + 
  geom_segment(data = data_April3$data_lines,
               aes(x = x, y = y, xend = xend, yend = yend, 
                   color = series)) +
  scale_color_manual( values = c('red', 'blue'))


# con log
data_April3$data_points %>% 
  ggplot(aes(x=DATE, y=VALUE, color=series)) +
  scale_y_continuous(trans='log10') + 
  geom_point() + 
  geom_segment(data = data_April3$data_lines,
               aes(x = x, y = y, xend = xend, yend = yend, 
                   color = series)) +
  scale_color_manual( values = c('red', 'blue'))


#
#
#
# April 19, 2022

data_April19 <- prepare_plot(transactions_April19, ust_April19)

# assoluto
data_April19$data_points %>% 
  ggplot(aes(x=DATE, y=VALUE, color=series)) +
  geom_point() + 
  geom_segment(data = data_April19$data_lines,
               aes(x = x, y = y, xend = xend, yend = yend, 
                   color = series)) +
  scale_color_manual( values = c('red', 'blue'))


# con log
data_April19$data_points %>% 
  ggplot(aes(x=DATE, y=VALUE, color=series)) +
  scale_y_continuous(trans='log10') + 
  geom_point() + 
  geom_segment(data = data_April19$data_lines,
               aes(x = x, y = y, xend = xend, yend = yend, 
                   color = series)) +
  scale_color_manual( values = c('red', 'blue'))

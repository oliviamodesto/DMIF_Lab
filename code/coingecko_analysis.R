# coingecko data

#
# Analizza 
# 234 - 598
# ustc-usd-max

ustc_prices <- read.csv("coingecko/ustc-usd-max.csv")
ustc_prices <- data.frame(ustc_prices)

ggplot(ustc_prices, aes(x=snapped_at, y=price)) +
  geom_point( color="lightblue", size=0.5, alpha=0.9 ) +
  xlab("datetime") +
  ylab("price USD") +
  geom_line() +
  ggtitle("Wrapped USTC Token Historical Price")

#

# lunc-usd-max

lunc_prices <- read.csv("coingecko/lunc-usd-max.csv")
lunc_prices <- data.frame(lunc_prices)

ggplot(lunc_prices, aes(x=snapped_at, y=price)) +
  geom_point( color="lightblue", size=0.5, alpha=0.9 ) +
  xlab("datetime") +
  ylab("price USD") +
  geom_line() +
  ggtitle("Wrapped LUNC Token Historical Price")


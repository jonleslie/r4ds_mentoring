library(tidyverse)

# This plot is based on this: https://rpubs.com/MarkusLoew/226759
ggplot(Six_small, aes(Date)) +
  geom_line(aes(y = n, colour = "Count")) +
  geom_line(aes(y = close * 40, colour = "Close")) +
  scale_y_continuous(sec.axis = sec_axis(~./40, name = "Closing price")) +
  ggtitle("Six-Flags: Footfall and closing price") +
  labs(colour = "Parameter") +
  theme(legend.position = c(0.1, 0.9))



x <- mtcars %>% group_by(cyl) %>%
  summarise(mean_mpg = mean(mpg), mean_wt = mean(wt))


ggplot(x, aes(x= as.factor(cyl), y=mean_mpg))+geom_bar(stat="identity")+
  scale_y_continuous(sec.axis = sec_axis (~mean_wt))

ggplot(x, aes(x = as.factor(cyl), y = mean_mpg)) +
  geom_col()

ggplot(x, aes(x = as.factor(cyl))) +
  geom_col(aes(y = mean_mpg, colour = "MPG"), position = 'dodge') +
  geom_col(aes(y = mean_wt, colour = "Weight"), position = 'dodge')

ggplot(x, aes(as.factor(cyl))) +
  geom_point(aes(y = mean_mpg, colour = "MPG")) +
  geom_point(aes(y = mean_wt, colour = "Weight"))
ggplot(x, aes(as.factor(cyl))) +
  geom_bar(aes(y = mean_mpg, colour = "MPG")) +
  geom_bar(aes(y = mean_wt, colour = "Weight"))

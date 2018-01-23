library(tidyverse)

var1 <- runif(10, 1, 10)
var2 <- runif(10, 1, 10)
var3 <- runif(10, 1, 10)

df <- tibble(var1 = var1, 
             var2 = var2, 
             var3 = var3) 

my_f <- function(var1, var2, var3) {
  
  case_when(is.na(var1) ~ NA_integer_, 
            TRUE ~ order(c(var1,var2,var3))[2])
}

mutate(df, test = pmap_int(df, my_f)) 

df

?case_when
x <- 1:50
case_when(
  x %% 35 == 0 ~ "fizz buzz",
  x %% 5 == 0 ~ "fizz",
  x %% 7 == 0 ~ "buzz",
  TRUE ~ as.character(x)
)
case_when(TRUE ~ 1:10)

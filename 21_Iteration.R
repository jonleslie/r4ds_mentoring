library(tidyverse)

# 2. For loops -------------------------------------------------------------

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)

output <- vector("double", ncol(df))

for(i in seq_along(df)) {
  output[[i]] <- median(df[[i]])
}
output


# 3. For loop variations --------------------------------------------------

# 3.1 Modifying an existing object

df <- tibble(
  a = rnorm(10),
  b = rnorm(10),
  c = rnorm(10),
  d = rnorm(10)
)
rescale01 <- function(x) {
  rng <- range(x, na.rm = TRUE)
  (x - rng[1]) / (rng[2] - rng[1])
}

df$a <- rescale01(df$a)
df$b <- rescale01(df$b)
df$c <- rescale01(df$c)
df$d <- rescale01(df$d)

for (i in seq_along(df)) {
  df[[i]] <- rescale01(df[[i]])
}

# Exercises
# 3
print_mean <- function(df) {
  for (i in seq_along(df)) {
    if(is.numeric(df[[i]]) == TRUE) {
      temp_mean <- mean(df[[i]])
      cat("Mean ", names(df)[i], " ", temp_mean, "\n")
    }
  }
}
print_mean(iris)
cat("Mean ", mean(iris$Sepal.Length))
names(iris)
is.numeric(iris$Species)


# 4. ----------------------------------------------------------------------

?apply

df
map_dbl(df, mean)
map_dbl(df, median)
df %>% map_dbl(mean)
?mean
map_dbl(df, mean, trim = 0.5)
z <- list(x = 1:3,
          y = 4:5)
z
map_int(z, length)

models <- mtcars %>% 
  split(.$cyl) %>% 
  map(function(df) lm(mpg ~ wt, data = df))

models <- mtcars %>% 
  split(.$cyl) %>% 
  map(~lm(mpg ~ wt, data = .))
models

models %>% 
  map(summary) %>% 
  map_dbl(~.$r.squared)

models %>% 
  map(summary) %>% 
  map_dbl("r.squared")

x <- list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9))
x %>% map_dbl(2)
x[[1]]
x[1]
x[[1]][[2]]

# 5.3 Exercises -----------------------------------------------------------

# Compute the mean of every column in mtcars.
mtcars %>% 
  map_dbl(mean)

# The type of every column in nycflights13::flights.
nycflights13::flights

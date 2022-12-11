n <- 100
muestra <- rexp(n, rate = 2)
sum_m <- sum(muestra)
f <- function(lambda) {
    n * log(lambda) - lambda * sum_m
}
optimize(f, interval = c(1, 3), maximum = TRUE)
1 / mean(muestra)

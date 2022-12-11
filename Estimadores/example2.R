n <- 500
x <- rgamma(n, shape = 2, rate = 3)
x <- read.table(file = "data.txt")
x <- x[[1]]
png("example2.png")
hist(x, breaks = 15, freq = FALSE, col = "cyan")
dev.off()
###### E. MM
a <- mean(x)^2 / var(x)
b <- mean(x) / var(x)
c1gamma <- function(y) dgamma(y, a, b)
hist(x, breaks = 15, freq = FALSE, col = "cyan")
curve(c1gamma, lwd = 2,  add = TRUE)

###### E. M. V
xbar <- mean(x)
epsilon <- 0.0001 # criterio de detencion
f <- function(a) {
    n * (1 + log(a) - log(xbar)) - n * digamma(a) - n + sum(log(x))
}
df <- function(a) { # derivada de f
    n / a - n * trigamma(a)
}
aux <- 1.5 # aproximacion inicial
for (i in 1:100){
    temp <- aux
    aux <- aux - f(aux) / df(aux)
    if (abs(aux - temp) < epsilon)
        break
}
c2gamma <- function(y) dgamma(y, aux, aux / mean(x))
hist(x, breaks = 15, freq = FALSE, col = "cyan")
curve(c2gamma, lwd = 2,  add = TRUE)

loglh <- function(a) {
    n * a * log(a / xbar) - n * log(gamma(a)) - a * n + (a - 1) * sum(log(x))
}
optimize(loglh, interval = c(1, 3), maximum = TRUE)
a <- 1.882421
b <- a / mean(x)
c3gamma <- function(y) dgamma(y, a, b)
png("optim.png")
hist(x, breaks = 15, freq = FALSE, col = "cyan")
curve(c3gamma, lwd = 2,  add = TRUE)
dev.off()



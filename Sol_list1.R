# 1.
X <- rnorm(n = 50, mean = 5, sd = 2)
# 2.
A <- matrix(data = x, nrow = 10, ncol = 5, byrow = TRUE)
A.df <- as.data.frame(a)
# 3.
hist(X, main = "50 realizaciones simuladas de una variable normal",
            xlab = "x", ylab = "Frecuencia")
# 4.
rownames(A) <- paste("Fila ", 1:10)
colnames(A) <- paste("Col ", 1:5)
# 5.
A.df <- as.data.frame(A) # se conservan nombres de la matriz
colnames(A.df) <- paste("Var", 1:5)
row.names(A.df) <- paste("Obs", 1:10)
head(A.df) # resultado
# 6.
A[2, c(1, 2)] <- NA
A[5, c(3, 5)] <- NA
mean(A, na.rm = TRUE)
# 7.
x2 <- rnorm(n = 25, mean = 10, sd = 1) # muestra dos
B <- matrix(data = x2, nrow = 5, byrow = TRUE) # as matrix
C <- rbind(A, B)
(dim(C))
# 8.
det(B) # det(B) distinto de 0, entonces invertible
t(B)
solve(B)
t(B) == B # no es simetrica, puesto que la matriz no es igual a su transpuesta
# 9.
dim(B)[2] == dim(A)[1] # no, num de columnas de B, distinto a num de filas de A
dim(A)[2] == dim(B)[1] # si, num de columnas de B igual a num filas de A
# 10.
for (i in 1:15){
    print(sum(C[i, ] > 5 & C[i, ] < 10))
}
rowMeans(C, na.rm = TRUE)
colMeans(C, na.rm = TRUE)
D <- C
for (i in 1:15){
    for (I in 1:5){
        if (is.na(D[i, I]))
            D[i, I] = colMeans(C, na.rm = TRUE)[I]
    }
}
# 11.
Y <- rnorm(n = 50, mean = 5, sd = 2)
data <- data.frame(X, Y)
mahalanobis(data, colMeans(data), cov(data))
# 12.
M <- rexp(n = 2000, rate = 0.5) # distribucion exponencial
data <- matrix(data = M, ncol = 2)
mah_dist <- mahalanobis(data, colMeans(data), cov(data))
data[which(mah_dist == min(mah_dist)), ] # mas cercana
data[which(mah_dist == max(mah_dist)), ] # mas lejana
# 13.
x <- 1:4
y <- c(5:3, 1)
z <- c(4, 3, 1, 2)
pmin(x, y, z)
apply(cbind(x, y, z), MARGIN = 1, min)
# 14.
# https://www.geeksforgeeks.org/selection-sort/
# "traducido" de lenguaje C a lenguaje R
testeo <- c(1, -9, 5, -1, 3)
ordenar <- function(data, desc) {
    n <- length(data)
    for (i in 1:(n - 1)){
        min_index <- i
        for (j in (i + 1):n){
            if (data[j] < data[min_index]) {
                min_index <- j
            }
        }
        if (min_index != i) {
            temp <- data[i]
            data[i] <- data[min_index]
            data[min_index] <- temp
        }
    }
    if (desc == FALSE)
        return(data)
    else
        return(data[n:1])
}
ordenar(data = testeo, desc = TRUE)

producto <- function(A, B){
    mat = matrix(0, nrow = dim(A)[1], ncol = dim(B)[2])
    for(i in 1:dim(A)[1]){
        for(j in 1:dim(B)[2]){
            temp = 0
            for(k in 1:dim(A)[1])
                temp = temp + A[i, k]*B[k, j]
            mat[i, j] = temp
        }
    }
    print(mat)
}
D = matrix(data = c(1, 1, 1, 1,
                    2, 2, 2, 2,
                    3, 3, 3, 3,
                    4, 4, 4, 4), 4, 4, byrow = T)
D1 = matrix(data = c(0, 1, 0, 0,
                     1, 0, 0, 0,
                     0, 0, 1, 0,
                     0, 0, 0, 1), 4, 4, byrow = T)
D1 %*% D # propio de R
producto(D1, D) # nuestra funcion
for(i in 1:dim(D)[2])
    print(i)

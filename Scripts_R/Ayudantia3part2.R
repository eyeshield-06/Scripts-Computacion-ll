## 2)
Det <- function(A){ # A es una matriz
    if(length(A) == 1){
        return(A)
    }
    else{
        temp <- 0
        for(j in 1:sqrt(length(A))){ # dimension de una matriz cuadrada
            temp <- temp + (-1)^(1+j)*A[1,j]*Det(A[-1, -j])
        }
        return(temp)
    }
}
# Falta mejorar para que reconozca que se le
# estan ingresando otras estructuras de datos.
# ademas de verificar que la matriz no es cuadrada.
testeo <- matrix(data = c(-1, 1, 1, 1,
                         1, -1, 1, 1,
                         1, 1, -1, 1,
                         1, 1, 1, -1), nrow = 4, ncol = 4)
det(testeo) # funcion propia de R
Det(testeo) # nuestra funcion



# 1.
v = c(seq(from = 1, to = 15, by = 2), vector("numeric", 7) + 11) # revisar ?vector

# 2.
x = 1:10
y = x^2
plot(x, y) # esencial
plot(x, y, col = "blue", type = "p", pch = 20,
	main = "f(x) = x^2 tq x = 1,...,10") # con mas argumentos graficos

# 3.
P = matrix(0, ncol = 4, nrow = 9)
for(i in 1:9)
	P[i, 1] = Fibo(i)

P[,2] = 2*1:9
for(i in 1:9){
	if(i%%2 == 0)
		P[i, 2] = -1 * P[i, 2]
}

for(i in 1:9){
	P[i, 3] = (1/2)^i
	if(i%%2 != 0)
		P[i, 3] = -1 * P[i, 3]

}

P[1, 4] = 1
P[2, 4] = -1
for(i in 2:8){
	if(i%%2 == 0)
		P[i+1, 4] = 2^i+1
	else
		P[i+1, 4] = -1*2^i-1
}

# 4.
X = matrix(c(1, -2,
			 1, -1,
			 1, 0,
			 1, 1,
			 1, 2), ncol = 2, byrow = T)
Y = as.matrix(c(0, 0, 1, 1, 3))

(B = X%*%t(X))
det(B) # No es invertible, su determinante es nulo
(C = -1*t(X)%*%Y) # no es invertible, no es cuadrada

# 5.
# Este ejercicio se puede resolver de diversas maneras.
# En este caso lo resolveremos de forma matricial Ax = b
A = matrix(c(1, 5,
			-2, -7), nrow = 2, byrow = TRUE)
# Aqui es importante poner byrow = TRUE, ya que por defecto completa
# por columnas.
b = c(7, -5)
(x = solve(A) %*% b) 

# 6.
squaref_sol = function(a, b, c){
	if(a == 0 & b != 0){
		print("Funcion lineal")
		return(-c/b)
	}
	else if(a == 0 & b == 0){
		if(c != 0)
			print("Incongruencia")
	}
	else{
		DET = b^2-4*a*c
		if(DET <= 0){
			if(DET == 0)
				print("reales iguales")
			else
				print("complejas conjugadas")
		}
		else
			print("reales distintas")
		x1 = (-b + sqrt(DET+0i))/(2*a)
		x2 = (-b - sqrt(DET+0i))/(2*a)
		return(c(x1, x2))

	}
}

# 7.
Tria = function(mat){
	plot(mat, main = "Triangulo",
		xlab = "EjeX", ylab = "EjeY")
	lines(mat[1:2,1], mat[1:2,2])
	lines(mat[2:3,1], mat[2:3,2])
	lines(mat[c(1,3),1], mat[c(1,3),2])
	ones = 1+vector("numeric", 2)
	Mones = ones %*% t(ones)
	if(sum(cor(mat) == Mones) == 4){
		print("Colineales")
	}
	else{
		D = dist(mat, method = "euclidian", diag = T)
		SortD = round(sort(c(D[1], D[2], D[3])),2)
		if(sum(SortD[1] == SortD[2:3]) == 2)
			print("Triangulo Equilatero")
		if(round(SortD[3]^2, 2)==(SortD[1]^2+SortD[2]^2))
			print("Triangulo Rectangulo")
		if(sum(SortD[2] == SortD[c(1,3)]) == 1)
			print("Triangulo Isosceles")
		else
			print("Triangulo Escaleno")
	}
	return(SortD)
 }
SortD=Tria(cbind(c(0,4,2),c(0,0,5)))

# 8.
Fibo = function(n){
	if(n == 1 || n == 2)
		return(1)
	else
		return(Fibo(n-1) + Fibo(n-2))
}

# 9.
Primo = function(n){
	primos = vector("numeric", n)
	count = 2
	i = 3
	primos[1] = 2
	while(count <= n){
        # iteration to check c is prime or not
        for(c in 2:i){
            if(i %% c == 0){
            	break
            }
        }
        if(c == i){ # c is prime
            primos[count] = i
            count = count + 1 # increment the count of prime numbers
        }
        i = i + 1
    }
    return(primos)
}
Primo(15)

# 10.

# pregunta 1
resp <- factor(c(rep("Excelente", 6),
               rep("Bueno", 18),
               rep("Regular", 15),
               rep("Malo", 7)))
table(resp)

pie(table(resp))
barplot(table(resp))

# pregunta 3
summary(iris[1:50, ])
summary(iris[51:100, ])
summary(iris[101:150, ])

library(pastecs)
stat.desc(iris[1:50, ])
stat.desc(iris[51:100, ])
stat.desc(iris[101:150, ])

# pregunta 4
head(trees)
str(trees)
sum(trees$Girth > 10 & trees$Girth < 15)
sum(trees$Height > 60 & trees$Height < 70)
sum(trees$Volume > 20 & trees$Volume < 60)

a <- trees$Girth > 10 & trees$Girth < 15
b <- trees$Height > 60 & trees$Height < 70
c <- trees$Volume > 20 & trees$Volume < 60
d <- a + b + c
trees[which(d > 1), ]
plot(trees)
# notamos de la grafica que hay una alta
# correlacion entre Girth y Volume
cor(trees)
# coefiente de correlacion entre las variable de 0.96
# lo que es bastante bueno
install.packages("ggplot2")
library(ggplot2)
gg_lm <- ggplot(trees, aes(x = Volume, y = Girth)) +
    ggtitle("Modelo Lineal") +
    geom_point() +
    stat_smooth(method = "lm", col = "blue")
gg_lm

# pregunta 5
# a)
datos <- read.csv("datos_titanic.csv")
ggplot(datos, aes(x = Age)) +
    geom_histogram(aes(fill = Sex))

table(factor(datos$Sex))
# b)
datos_fix <- datos[which(datos$Embarked != ""), ]
ggplot(datos_fix, aes(x = Embarked)) +
    geom_bar()
table(factor(datos$Embarked))
# c)
hist(datos$Fare)
# d)
sobrevivientes <- datos[which(datos$Survived == 1 & datos$Embarked != ""), ]
ggplot(sobrevivientes, aes(x = Embarked)) +
    geom_bar(aes(fill = Sex))

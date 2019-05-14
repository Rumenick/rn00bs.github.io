## Exemplo 2.1 - Mainly 2006

amostra <- c(3.56, 0.69, 0.10, 1.84, 3.93, 1.25, 0.18, 1.13, 0.27, 0.50, 0.67,
             0.01, 0.61, 0.82, 1.70, 0.39, 0.11, 1.20, 1.21, 0.72); amostra
n  <-  length(amostra); n

matrizjack <- matrix(NA, n, (n-1))
for ( i in 1:n){
  amostrajack <-amostra[-i]
  matrizjack[i, ] <- amostra[-i]
}

head(matrizjack)

theta_chapeu <- function(x){ 
  xbarra <- mean(x)
  desvio <- x-mean(x)
  n <- length(x)
  return(sqrt(sum(desvio^2)/n)) 
} 

t_amostra <- theta_chapeu(amostra); t_amostra

t_par <- apply(matrizjack, 1 , theta_chapeu) 
print(t_par)

pseudov <- n * t_amostra-(n-1) * t_par 
print(pseudov)

estjack <- mean(pseudov)
print(estjack)

alfa <- 1-0.95  
s <- sd(pseudov)

L <- estjack - qt(1-alfa/2,df = n-1) * s/sqrt(n) 
U <- estjack + qt(1-alfa/2,df = n-1) * s/sqrt(n) 
c("L"=L,"U"=U) 

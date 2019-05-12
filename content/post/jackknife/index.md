Jackknife
---------

Em estatística, o nome jacknife foi usado por Tukey (1958) para
descrever uma perspectiva geral para realizar testes de hipóteses e
calcular intervalos de confiança. O método é particularmente útil em
situações em que a distribuição do estimador é desconhecida e não é
possível obter outras amostras da população alvo.

A alcunha *jackknife* (“canivete”) remete à portabilidade e a
possibilidade de uso em diversas situações. A ideia básica do Jackknife
consiste em recalcular um particular estimador, eliminando
sistematicamente cada observação individual, similar à validação cruzada
*leave-one-out*, deixa-se sempre de fora uma (ou algumas) observações da
amostra.

-   Estimativa Parcial

A estimativa parcial *θ̂*<sub> − *j*</sub> consiste em simplesmente
recalcular o estimador para cada amostra Jack!

*θ̂*<sub> − *j*</sub> = *θ̂*(*X*<sub>1</sub>, *X*<sub>2</sub>, …, *X*<sub>*j* − 1</sub>, *X*<sub>*j* + 1</sub>, …, *X*<sub>*n*</sub>)

-   Pseudo-valores

Os pseudo-valores *θ̂*<sub>*j*</sub><sup>\*</sup> farão parte do cáculo
da estimativa pontual abaixo
*θ̂*<sub>*j*</sub><sup>\*</sup> = *n**θ̂* − (*n* − 1)*θ̂*<sub> − *j*</sub>

-   Estimativa Pontual Jackknife

A estimativa pontual Jack é a média dos pseudo-valores.
$$\\hat\\theta^\* = \\frac{\\sum\\limits\_{i= 1}^n \\hat\\theta\_j^\*}{n}$$

Exemplo 2.1 do Manly (2006a): Suponha que seja extraída uma amostra
aleatória de tamanho 20 de uma certa população na qual o desvio-padrão
*σ* é o parâmeto de interesse. Suponha que você decide utilizar o
estimador
$\\hat{\\sigma} = \\frac{\\sum\\limits\_{i=1}^n(X\_i-\\bar{X})^2}{n}$
para *σ*.

    amostra <- c(3.56, 0.69, 0.10, 1.84, 3.93, 1.25, 0.18, 1.13, 0.27, 0.50, 0.67,
    0.01, 0.61, 0.82, 1.70, 0.39, 0.11, 1.20, 1.21, 0.72)
    n  <-  length(amostra); n

    ## [1] 20

No R:

    estimador <- function(x){ 
      xbarra <- mean(x)
      desvio <- x-mean(x)
      n <- length(x)
      return(sum(desvio^2)/n) 
    } 

Estimativa para a amostra original:

    est <- estimador(amostra); est

    ## [1] 1.066775

    matrizjack<- matrix(NA, n, (n-1))
    pseudov=numeric(n)

    # for ( i in 1:n){
    #   amostrajack <-amostra[-i] 
    #   matrizjack[i, ] <- amostra[-i]
    #   medjack<-sigma(amostrajack) 
    #   print(medjack)
    #   pseudov[i]=n*medamostra-(n-1)*medjack  
    # }
    # 
    # alfa<-1-0.95 
    # L<-epj-qt(1-alfa/2,df=n-1)*erj 
    # U<-epj+qt(1-alfa/2,df=n-1)*erj 
    # list("epj"=epj,"erj"=erj,"L"=L,"U"=U) 
    # 

Métodos Bootstrap
=================

O método bootstrap de reamostragem foi introduzido pelo estatístico
estadunidense Bradley Efron em 1979 e desenvolvido anos depois.

-   *Bootstrap methods: another look at the jackknife*, Efron (1979).

O termo Bootstrap
-----------------

Em inglês, Bootstrap é a alça da bota, ou seja, é algo que precisa ser
alavancado por esforço próprio.

“Boot” é uma forma abreviada da palavra “bootstrap” e refere-se aos
comandos iniciais necessários para carregar o restante do sistema
operacional do computador. Assim, o sistema é “inicializado” ou “puxado
por seus próprios bootstraps (alças)”.

Em estatística, os métodos de bootstrap são uma classe de métodos que
estimam a distribuição de uma população por reamostragem. Segundo Manly
(2006b), o termo escolhido por Efron faz analogia a alguém se retirando
da lama com seus bootstraps.

O bootstrap foi uma das primeiras técnicas estatísticas intensivas para
computar a variância de um conjunto de dados estatísticos, construir
intervalos de confiança e realizar testes de hipóteses sobre parâmetros
de interesse.

 

> “The bootstrap is rarely the star of statistics, but it is the best
> supporting actor”, Bradley Efron.

A ideia do método
-----------------

-   A amostra observada é tratada como uma população finita e amostras
    aleatórias com reposição são geradas (reamostradas) a partir dela.

-   Com o bootstrap ou bootstrapping é possível estudar características
    da população a partir da pseudo-população e extrair inferências.

![](bootstrapping.png)

Distribuição da Amostra Bootstrap
---------------------------------

Suponha que
**x** = (*x*<sub>1</sub>, …, *x*<sub>*n*</sub>)<sup>*T*</sup> ∈ ℝ<sup>*n*</sup>
é uma a.a. observada de uma distribuição *F*<sub>*X*</sub>. Se
*X*<sup>\*</sup> é selecionado aleatoriamente de **x**, então,

$$P(X^\* = x\_i) = \\frac{1}{n}, ~~~i=1,\\dots,n.$$

Logo, gera-se uma a.a.
*X*<sub>1</sub><sup>\*</sup>, *X*<sub>2</sub><sup>\*</sup>, …, *X*<sub>*n*</sub><sup>\*</sup>
i.i.d com distribuição uniforme no conjunto
{*x*<sub>1</sub>, …, *x*<sub>*n*</sub>}.

Distribuição Empírica *F*<sub>*n*</sub>
---------------------------------------

*F*<sub>*n*</sub> é uma distribuição discreta com pesos iguais para cada
ponto amostral. *F*<sub>*n*</sub> é definida como uma proporção
amostral.

$$F\_n(t) = \\sum \\limits\_{i=1}^n \\frac{\\\#\\{x\_i \\le t \\}}{n} I\_{(x\_i \\le t)}$$

-   A função de distribuição empírica *F*<sub>*n*</sub>(*x*) é um
    estimador de *F*<sub>*X*</sub> e pode ser mostrado que
    *F*<sub>*n*</sub> é uma estatística suficiente para
    *F*<sub>*X*</sub>;

-   Reamostrar de **x** é equivalente a gerar da distribuição
    *F*<sub>*n*</sub>(*x*).

Exemplo de *F*<sub>*n*</sub>
----------------------------

![](index_files/figure-markdown_strict/unnamed-chunk-5-1.png)

Exemplo de *F*<sub>*n*</sub>
----------------------------

![](index_files/figure-markdown_strict/unnamed-chunk-6-1.png)

Suposições
----------

A função de distribuição empírica *F*<sub>*n*</sub> coincide com
*F*<sub>*X*<sup>\*</sup></sub>. Logo, há duas grandes suposições no
método **bootstrap**.

-   A função de distribuição empírica *F*<sub>*n*</sub> é uma boa
    aproximação para *F*<sub>*X*</sub>, então a distribuição de
    *θ̂*<sup>\*</sup> é similar a distribuição de *θ̂*.

-   A distribuição empírica das réplicas bootstrap é uma boa aproximação
    para *F*<sub>*n*</sub>.

Portanto, a tarefa de fazer inferências sobre *θ* se reduz a aprender
sobre a distribuição bootstrap de *θ̂*<sup>\*</sup>.

Na pratica usa-se o método de simulação Monte Carlo para aproximar a
distribuição das amostras bootstrap.

Algoritmo
---------

Suponha *θ̂* o estimador para o parâmetro de interesse *θ*.

-   Para cada amostra **bootstrap** indexada por *b* = 1, …, *B*.
    -   Gere uma amostra
        *x*<sup>\*</sup>(*b*) = *x*<sub>1</sub><sup>\*</sup>, …, *x*<sub>*n*</sub><sup>\*</sup>
        a partir de
        *x*<sub>1</sub>, *x*<sub>2</sub>, …, *x*<sub>*n*</sub>
    -   Calcule *θ̂*<sup>(*b*)</sup> com a b-ésima amostra bootstrap.
-   A estimativa bootstrap de *F*<sub>*θ̂*</sub>(.) é a distribuição
    empírica das réplicas *θ̂*<sup>(1)</sup>, …, *θ̂*<sup>(*B*)</sup>.

Exemplo 1
---------

Exemplo 7.1, Rizzo (2007). Suponha
**x** = {2, 2, 1, 1, 5, 4, 4, 3, 1, 2} uma a.a. observada de tamanho 10.

Exemplo 1 | Distribuição Empírica *F*<sub>*n*</sub>
---------------------------------------------------

![](index_files/figure-markdown_strict/unnamed-chunk-7-1.png)

Exemplo 1 | Distribuição Booststrap *F*<sub>*X*</sub><sup>\*</sup>
------------------------------------------------------------------

Dado **x** = {2, 2, 1, 1, 5, 4, 4, 3, 1, 2}, note que há 5 valores
possíveis para formar uma reamostra *X*<sup>\*</sup> de **x**.

![](index_files/figure-markdown_strict/unnamed-chunk-8-1.png)

Exemplo 1
---------

$$F\_n(x) = F\_{X^\*}(x) = \\begin{cases}
0, \\text{ se } x &lt; 1\\\\
0.3, \\text{ se } 1 \\le x &lt; 2\\\\
0.6, \\text{ se } 2 \\le x &lt; 3 \\\\
0.7, \\text{ se } 3 \\le x &lt; 4 \\\\
0.9, \\text{ se } 4 \\le x &lt; 5\\\\
1, \\text{ se } x \\ge 5.
\\end{cases}$$

Exemplo 1 | Comentário
----------------------

> “Note que se *F*<sub>*n*</sub> não for uma boa aproximação de
> *F*<sub>*X*</sub> então a distribuição das réplicas não se aproxima de
> *F*<sub>*X*</sub>. A amostra **x** acima é na verdade uma amostra de
> *X* ∼ *P**o**i**s**s**o**n*(2). Reamostragem de x um grande número de
> réplicas produz uma boa estimativa de *F*<sub>*n*</sub>, mas não uma
> boa estimativa de *F*<sub>*X*</sub>, porque independentemente do
> número de réplicas, as amostras de bootstrap nunca incluirão 0.”,
> traduzido de Rizzo (2007).

Erro Padrão Bootstrap
---------------------

$$\\widehat{se}(\\hat\\theta) = \\sqrt{\\frac{1}{B-1}\\sum \\limits\_{b = 1}^B \[\\hat\\theta^{(b)} - \\bar\\theta\]^2}$$

Com
$\\bar\\theta = \\frac{1}{B}\\sum \\limits\_{b=1}^B\\hat\\theta^{(b)}$.
*B* = 50 é suficiente, raramente temos *B* &gt; 200.

Vício Estimado por Bootstrap
----------------------------

O vício ou viés é dado por,
*B*(*θ̂*) = *E*\[*θ̂*\] − *θ*
.

A estimativa Bootstrap é,
$$\\hat B(\\hat{\\theta}) = \\bar{\\hat\\theta^\*} - \\hat\\theta.$$

Com
$\\bar{\\hat{\\theta}^\*} = \\frac{1}{B} \\sum \\limits\_{b = 1}^B \\hat\\theta^{(b)}$
e *θ̂* = *θ̂*(**x**) é a estimativa calculada na amostra original.

No bootstrap amostra-se de *F*<sub>*n*</sub> no lugar de
*F*<sub>*X*</sub>, logo substitui-se *θ* por *θ̂* para estimação do
vício.

Introdução aos Intervalos de Confiança Bootstrap
------------------------------------------------

-   Intervalo de Confiança Bootstrap Normal Padrão

$$(\\theta-z\_{\\alpha/2}\\widehat{se}(\\theta),\\theta+z\_{\\alpha/2}\\widehat{se}(\\theta) )$$

-   Intervalo de Confiança Bootstrap Percentílico
    (*θ̂*<sub>*α*/2</sub>, *θ̂*<sub>1 − *α*/2</sub>)
-   Intervalo de Confiança Bootstrap Básico

(2*θ̂* − *θ̂*<sub>1 − *α*/2</sub>, 2*θ̂* − *θ̂*<sub>*α*/2</sub>)

Testes de Hipótese Bootstrap
----------------------------

-   Os testes de bootstrap dão resultados semelhantes aos testes de
    permutação quando ambos estão disponíveis.

-   Os testes de bootstrap são mais amplamente aplicáveis, embora menos
    precisos.

Comentários
-----------

-   The jackknife can fail when the statist theta is not “smooth.” The
    statistic is a function of the data. Smoothness means that small
    changes in the data correspond to small changes in the statistic.
    The median is an example of a statistic that is not smooth.

-   A distribuição da população finita representada pela amostra pode
    ser considerada uma pseudo-população com características semelhantes
    às da verdadeira população.

-   Através da geração repetida de amostras aleatórias desta
    pseudo-população (reamostragem), a distribuição amostral de uma
    estatística pode ser estimada.

-   As propriedades de um estimador, como viés ou erro padrão, podem ser
    estimadas reamostragem.

-   As estimativas de bootstrap de uma distribuição de amostragem são
    análogas à ideia de estimativa de densidade. Construímos um
    histograma de uma amostra para obter uma estimativa da forma da
    função de densidade.

-   O histograma não é a densidade, mas para um problema
    não-paramétrico, pode ser visto como uma estimativa razoável. Temos
    métodos para gerar amostras aleatórias de completamente densidades
    especificadas; bootstrap gera amostras aleatórias a partir do
    empírico distribuição da amostra.

Exemplo 1
---------

Os seguintes valores formam uma a.a. observada de uma população com
média *μ* desconhecida. Estime *μ* pela mediana amostral
*m* = *m**e**d*(*x*<sub>1</sub>, …, *x*<sub>12</sub>) e obtenha a
estimativa do erro padrão de *m* via bootstrap não-paramétrico.

    dados <- c(2.0312960, 0.7514885, 1.4671803, 
                0.4668357, 1.1065014, 0.4144307,
                0.4013687, 1.0668076, 0.9493365, 
                0.3120167, 0.6832330, 2.1614897)
    m.hat <- median(dados); m.hat

    ## [1] 0.8504125

Exemplo 1
---------

     n <- length(dados)
     B <- 1000 # número de réplicas bootstrap
     m.ast <- NULL
    for(j in 1:B){
     amostra.boot <- sample(dados,n,replace=T)
     m.ast[j] <- median(amostra.boot)
    }

    ep.boot <- sd(m.ast); ep.boot # estimativa do erro padrão

    ## [1] 0.2265786

    c(quantile(m.ast,0.025),quantile(m.ast,0.975))

    ##      2.5%     97.5% 
    ## 0.4406332 1.2868408

Histograma Bootstrap
--------------------

![](index_files/figure-markdown_strict/unnamed-chunk-11-1.png)

Bootstrap Paramétrico
---------------------

O termo “bootstrap” pode se referir a bootstrap não paramétrico ou
paramétrico. O bootstrap não paramétrico foi abordado nos slides
anteriores. Métodos de Monte Carlo que envolvem amostragem a partir de
uma distribuição de probabilidade, como os métodos do Capítulo 6, às
vezes são chamados bootstrap paramétrico.

Bradley Efron
=============

![](2014_Efron-outdoors.jpg "Stanford University (2014)")

<http://statweb.stanford.edu/~ckirby/brad/>

> “The bootstrap is rarely the star of statistics, but it is the best
> supporting actor”, Bradley Efron.
> </div>

[Vídeo](https://www.youtube.com/watch?v=H2tOhMaXWvI)

Contribuições:
--------------

-   *Bootstrap methods: another look at the jackknife*, (<span
    class="citeproc-not-found"
    data-reference-id="Efron:1992">**???**</span>). (Em 1979 foi a 1ª
    publicação)
-   *The Jackknife, the Bootstrap and Other Resampling Plans* ,
    Efron (1982).
-   *An Introduction to the Bootstrap*, Efron and Tibshirani (1994).

Orientandos notáveis:
---------------------

-   Robert Tibshirani (LASSO),
-   Norman Edward Breslow (Estimador Não paramétrico para função base de
    risco).

Dica: Trevor Hastie e Rob Tibshirani - [Statistical
Learning](https://lagunita.stanford.edu/courses/HumanitiesSciences/StatLearning/Winter2016/about).

Referências
===========

Efron, B. 1979. “Bootstrap Methods: Another Look at the Jackknife.” *The
Annals of Statistics*, 1–26.

Efron, Bradley. 1982. *The Jackknife, the Bootstrap, and Other
Resampling Plans*. Vol. 38. Siam.

Efron, Bradley, and Robert J Tibshirani. 1994. *An Introduction to the
Bootstrap*. CRC press.

Manly, Bryan FJ. 2006a. *Randomization, Bootstrap and Monte Carlo
Methods in Biology*. Chapman; Hall/CRC.

———. 2006b. *Randomization, Bootstrap and Monte Carlo Methods in
Biology*. Chapman; Hall/CRC.

Rizzo, Maria L. 2007. *Statistical Computing with R*. Chapman; Hall/CRC.

Tukey, John. 1958. “Bias and Confidence in Not Quite Large Samples.”
*Ann. Math. Statist.* 29: 614.

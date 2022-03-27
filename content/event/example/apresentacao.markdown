---
title: "Saídas gráficas no R"
subtitle: "introdução ao pacote ggplot2"
author: "Henrique José de Paula Alves"
institute: "Diest - Ipea"
date: "21-03-2022"
output:
  xaringan::moon_reader:
    lib_dir: libs
    nature:
      highlightStyle: github
      highlightLines: true
      countIncrementalSlides: false
---
<style>
body {
  text-align: justify;
  font-size: 20pt;
  }
code.r{
  font-size: 10px;
}
pre {
  font-size: 12px
}
</style>


# Material de apoio


[Material](http://localhost:4321/courses/example/python/)

---

## O que você vai aprender

- Habilidades fundamentais de programação R
- Conceitos estatísticos e resultados gráficos: como aplicá-los
- Ganhe experiência com o R:  visualização de dados com o pacote ggplot2 e mineração de dados com o pacote tidyverse

---


## Visão geral do curso

- Grande demanda por profissionais em estatística aplicada
- Mineração de dados e as saídas gráficas: passo fundamental em estatística aplicada
- Objetivo:  apresentar duas importantes ferramentas disponíveis no software R: os pacotes tidyverse e ggplot2

---

## Pré-requisitos

- É desejável que o aluno tenha algum conhecimento de programação em linguagem R
- É também desejável que o aluno tenha conhecimentos básicos de Estatística e Probabilidades

---

## Introdução

- Todo e qualquer resultado estatístico deve ser bem compreendido
- Saídas gráficas representam um resultado estatístico
- Apresentação do comportamento dos dados de forma resumida
- Não é uma tarefa fácil nem corriqueira

---

## Introdução

- Uma forma direta de obter saídas gráficas: pacotes esquisse e ggplotgui
- Esse não é o nosso objetivo
- Apresentar o pacote ggplot2 de forma lenta e gradativa
- O seu diferencial com relação a outros pacotes
- Funções de saídas gráficas: base do R

---

## Pacotes necessários

- Instalação e carregamento dos pacotes no R

Código:



```r
 #nomes dos pacotes
 packages <- c("dplyr","tidyverse","lattice",  "rgdal", "rgeos",
 "maptools", "plyr", "sf", "covid19br", "RColorBrewer")

 # instala os pacotes que não estão instalados
 installed_packages <- packages %in% rownames(installed.packages())
 if (any(installed_packages == FALSE)) {
   install.packages(packages[!installed_packages])
 }

# carrega os pacotes
invisible(lapply(packages, library, character.only = TRUE))
```

---

## Base de dados

- Base de dados disponível no R: [mtcars](https://gist.github.com/seankross/a412dfbd88b3db70b74b)
- Coletados da revista "Motor Trend US (1974)"
- 32 modelos de automóveis: consumo de combustível e outros 10 aspectos de design e desempenho

---

## Base de dados

- Preparando a base de dados


```r
mtcars <- within(mtcars, {
   vs <- factor(vs, labels = c("V", "S"))
   am <- factor(am, labels = c("automatica", "manual"))
   cyl  <- ordered(cyl)
   gear <- ordered(gear)
   carb <- ordered(carb)})
summary(mtcars)
```

```
##       mpg        cyl         disp             hp             drat      
##  Min.   :10.40   4:11   Min.   : 71.1   Min.   : 52.0   Min.   :2.760  
##  1st Qu.:15.43   6: 7   1st Qu.:120.8   1st Qu.: 96.5   1st Qu.:3.080  
##  Median :19.20   8:14   Median :196.3   Median :123.0   Median :3.695  
##  Mean   :20.09          Mean   :230.7   Mean   :146.7   Mean   :3.597  
##  3rd Qu.:22.80          3rd Qu.:326.0   3rd Qu.:180.0   3rd Qu.:3.920  
##  Max.   :33.90          Max.   :472.0   Max.   :335.0   Max.   :4.930  
##        wt             qsec       vs              am     gear   carb  
##  Min.   :1.513   Min.   :14.50   V:18   automatica:19   3:15   1: 7  
##  1st Qu.:2.581   1st Qu.:16.89   S:14   manual    :13   4:12   2:10  
##  Median :3.325   Median :17.71                          5: 5   3: 3  
##  Mean   :3.217   Mean   :17.85                                 4:10  
##  3rd Qu.:3.610   3rd Qu.:18.90                                 6: 1  
##  Max.   :5.424   Max.   :22.90                                 8: 1
```


---


## Porque o pacote ggplot2

- Vamos construir algumas saídas gráficas
- Utilzar as funções do pacote graphics: base do R
- Pacote lattice

---

## Porque o pacote ggplot2 (base)

.pull-left[

```r
hist(mtcars$mpg,
     col = "lightblue",
     main = "Função hist (base)",
     xlab = "Milhas por galão (mpg)",
     ylab = "Frequência absoluta")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig1-1.svg" width="100%" style="display: block; margin: auto;" />
]



---

## Porque o pacote ggplot2 (lattice)


.pull-left[

```r
library(lattice)
histogram(~mpg,data=mtcars, 
          type ="count", 
          xlab ="Milhas por galão (mpg)",
       ylab = "Frequência absoluta", 
       main ="Função histogram (lattice)",
       col = "lightblue", breaks = 5)
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig2-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Porque o pacote ggplot2 (base)

.pull-left[

```r
tab <- table(mtcars$cyl)
barplot(tab, 
        col = "lightblue",
        main = "Função barplot (base)", 
  xlab = "Número de cilindros por motor (cyl)", 
  ylab = "Frequência absoluta")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig3-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Porque o pacote ggplot2 (lattice)

.pull-left[

```r
library(lattice)
tabela <- xtabs(~cyl, data = mtcars)
barchart(tabela,
         horizontal = FALSE, 
         main = "Função barchart (lattice)",
         xlab = "Número de cilindros por motor (cyl)", 
         ylab = "Frequência absoluta", 
         col = "lightblue")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig4-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Porque o pacote ggplot2

Não é necessário:

- comandos específicos para cada gráfico gerado

- funções adicionais (table ou xtabs)

- conhecimento prévio de cada uma das funções

- sintaxe fixa e única

---

## O pacote ggplot2

Estatístico, cientista computacional e professor adjunto norte-americano

- Leland Wilkinson (2005)
- "The grammar of Graphics"
- mapeamento dos dados em atributos estéticos (posição, cor, forma, tamanho, etc)
- formas geométricas (pontos, linhas, barras, caixas, etc)
- Hadley Wickham (2008)
- Respondeu a pergunta: "O que é um gráfico estatístico?"
- Livro "A Layered Grammar of Graphics"

---

## O pacote ggplot2

Vantagens:

- Os gráficos construídos são mais bonitos e apresentáveis
- Fácil personalização
- Apresentam uma estrutura (sintaxe) única e padronizada

---

## O pacote ggplot2

- Elementos de um gráfico: dados, sistema de coordenadas, rótulos, anotações
- Sobreposição de camadas
- Criou o pacote ggplot2
- Essência: construir um gráfico estatístico camada por camada

---

## A gramática em camada de gráficos

Descrevendo um gráfico estatístico:

| Elementos | Exemplos |
|----------------|-----------------------------------------------------------------------|
| **aes**tética$^*$ | cor, formato|
| **geom**etrias$^*$ | barra, ponto|
| e**stat**ísticas (modelos) | mediana, máximo|
| **facet**as | facetas|
| **coord**enadas | polar, cartesiana|
| **them**as | eixos, títulos|

---

## Passos

Primeiro passo:


.pull-left[

```r
ggplot(mtcars)
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig5-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Passos

Segundo passo: gráfico de dispersão

.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig6-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Os tipos de geometrias (geom)

Principais:

- point (pontos); line (dispersão);
- bar (barras); col (colunas); errorbar (barra de erros)
- boxplot; histogram(histogramas), density (densidades), sf (mapas)

---

## Argumentos de estética (aes)

Principais:

- variáveis (x, y, z)
- cores (color, colour, fill)
- tonalidade (alpha)
- formas (shape, linetype)
- tamanhos (size)

---

## A escolha das cores

Argumento color (colour):

- Objetos geométricos que não possuem área
- Pontos, linhas, borda de gráficos e mapas, etc

Argumento fill :

- Preenchimento
- Objetos geométricos que possuem área não nula
- Caixas, colunas, círculos, polígonos, etc

---

## O argumento color

Exemplo: Gráfico de dispersão


.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, 
                           y=mpg, 
                           color=as.factor(am)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig7-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento color

Exemplo: Gráfico de dispersão


.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, 
                           y=mpg),
             color=c("red"))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig8-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento fill

Exemplo: gráfico de barras


.pull-left[

```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(aes(fill=as.factor(am)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig9-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento fill

Exemplo: gráfico de barras


.pull-left[

```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(fill = "red")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig10-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento alpha (tonalidade das cores)

Exemplo: gráfico de barras


.pull-left[

```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(aes(alpha = as.factor(cyl),
               fill = as.factor(cyl)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig11-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento forma (shape)

Exemplo: Gráfico de dispersão (Exclusivo)


.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, 
                           y=mpg,
                           color=as.factor(am), 
                           shape = as.factor(carb)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig12-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento forma (linetype)

Exemplo: Gráfico de linhas (Exclusivo)


.pull-left[

```r
ggplot(mtcars) +
  geom_line(mapping = aes(x= disp, 
                          y=mpg, 
                          linetype = as.factor(am), 
                          color = as.factor(am)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig13-1.svg" width="100%" style="display: block; margin: auto;" />
]


---

## O argumento tamanho (size)

Exemplo: Gráfico de dispersão

.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, 
                           y=mpg, 
                           color=as.factor(am), 
        shape = as.factor(carb), 
        size = as.factor(cyl)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig14-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O argumento tamanho (size)

Exemplo: Gráfico de linhas


.pull-left[

```r
ggplot(mtcars) +
  geom_line(mapping = aes(x= disp,
                          y=mpg, 
                          linetype = as.factor(am), 
              color = as.factor(am), 
              size = as.factor(cyl)))
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig15-1.svg" width="100%" style="display: block; margin: auto;" />
]


---

## Retirando variáveis da legenda (guides)

Linha de comando: guides(nome = "none)

- guides(color = "none")
- guides(fill = "none)
- guides(shape = "none")
- guides(size = "none")

---

## A escolha dos rótulos dos eixos (labs)

Linha de comando: labs()

- labs(x="nome", y= "nome", color="nome", fill="nome",...)
- labs(size="none") (não rotula)

---


## A escala dos eixos (scale)

Linha de comando: scale_eixo_tipo

- eixo x: scale_x_discrete
- eixo y: scale_y_discrete
- eixo x: scale_x_continuous
- eixo y: scale_y_continuous

---


## A escolha dos temas (theme)

Linha de comando: theme_nome()

- theme_gray; theme_bw()
- theme_linedraw(); theme_light
- theme_dark(); theme_minimal
- theme_classic(); theme_void()

---


## A escolha do título (ggtitle)

Linha de comando: ggtitle("nome")

Exemplo:

- ggtitle("Média de casos de COVID-19 - Brasil - 2021")

---


# Gráficos mais elaborados

---

## Exemplo (Gráfico de dispersão)

.pull-left[

```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, 
                           y=mpg, 
                           color = as.factor(am),
                           shape = as.factor(am)))+
  guides(shape = "none")+
  labs(x = "Distância percorrida (disp)", 
       y = "Milhas percorridas por galão (mpg)", 
    color = "Tipo de Transmissão", 
    size ="Número de Carburadores (motor)")+
  theme_classic()+
  ggtitle("mpg vs disp: tipo de transmissão")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig16-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Gráfico de barras


.pull-left[

```r
ggplot(mtcars) +
  geom_bar(mapping = aes(x= as.factor(carb), 
                         y = (..count..), 
                         fill = as.factor(am)),
         position = "dodge", 
         color = "black")+
  scale_y_continuous(limits = c(0,8))+
  labs(x = "Número de Carburadores (motor)", 
       y = "Frequência absoluta", 
       fill = "Tipo de Transmissão")+
  theme_classic()+
  ggtitle("Número de carburadores (motor): tipo de transmissão")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig17-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Histograma


.pull-left[

```r
ggplot(mtcars) +
  geom_histogram(mapping = aes(x = mpg, 
                               y = (..count..)/100, 
                               fill = as.factor(carb)),
           bins= 5, color = "black") +
  labs(x = "Milhas percorridas por galão (mpg)",
       y = "Frequência relativa",
       fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Milhas percorrida por galão (mpg)")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig18-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Histograma

.pull-left[

```r
ggplot(mtcars) +
  geom_histogram(mapping = aes(x = mpg, 
                               y = (..count..)/100, 
                               fill = as.factor(carb)),
           bins= 5, color = "black") +
  labs(x = "Milhas percorridas por galão (mpg)",
       y = "Frequência relativa",
       fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Milhas percorrida por galão (mpg)")+
  facet_wrap(~as.factor(carb))# facetas
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig19-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Box-plot


.pull-left[

```r
ggplot(mtcars) +
  geom_boxplot(mapping = aes(x = as.factor(carb),
                             y=mpg, 
                             fill = as.factor(am)),
               color = "black")+
  labs(x = "Número de carburadores (carb)", 
       y = "Milhas percorridas v.s. galão (mpg)", 
       fill = "Tipo de transmissão")+
  theme_classic()+
  ggtitle("Distribuição mpg por carb: tipo de transmissão")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig20-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Densidades

.pull-left[

```r
ggplot(mtcars) +
  geom_density(mapping = aes(x = mpg, 
                             fill = as.factor(carb)), 
               color = "black", 
               alpha = 0.1) +
  labs(x = "Milhas percorridas por galão (mpg)", y = "Densidades", 
       fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Densidade mpg")
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig21-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

# Segunda parte

---

## Data mining

- Minerar um conjunto de dados original 
- pacotes tydyverse, tibble e dplyr do R.

---

## Pacote covid19br

- Criado por pesquisadores da UFMG
- permite a coleta, em tempo real, de algumas informações sobre a doença COVID-19
- nas unidades de saúde do Brasil
- unidade de federação (states), por municípios (cities), regiões (regions)
- no mundo por país (country)
- informações como número de casos e mortes novos e acumulados diários
- separadas por semana epidemiológica, datas, entre outros

---

## Apresentando o conjunto de dados


```r
data <- downloadCovid19("states")# dados por municípios brasileiros
glimpse(data)
```

```
## Rows: 28,539
## Columns: 12
## $ region       <chr> "North", "North", "North", "North", "North", "North", "No~
## $ state        <chr> "RO", "RO", "RO", "RO", "RO", "RO", "RO", "RO", "RO", "RO~
## $ date         <date> 2020-02-25, 2020-02-26, 2020-02-27, 2020-02-28, 2020-02-~
## $ epi_week     <int> 9, 9, 9, 9, 9, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11~
## $ newCases     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
## $ accumCases   <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
## $ newDeaths    <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
## $ accumDeaths  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
## $ newRecovered <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
## $ newFollowup  <int> NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, N~
## $ pop          <dbl> 1777225, 1777225, 1777225, 1777225, 1777225, 1777225, 177~
## $ state_code   <int> 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 11, 1~
```

---

## A estrutura (tibble)

- um data frame com algumas particularidades
- dimensão dos dados
- o tipo de variável (categórica, inteiro, caractere, etc.)

| Representação | Tipo de variável | 
|----------------|-----------------------------------------------------------------------|
| int | números inteiros|
| dbl | doubles (números reais)|
| chr | vetores de caracteres (strings)|
| dttm | datas-tempos (uma data + um horário)|
| fctr | valores lógicos (TRUE ou FALSE)|
| date | datas|

---

## Caracteres lógicos necessários

| Caractere lógico | Representação |
|----------------|-----------------------------------------------------------------------|
| == | igual|
| & | conectivo "e" (interseção)|
| \ | conectivo "ou" (união)|
| > | maior do que|
| < | menor do que|
| >= | maior do que ou igual a|
| <= | menor do que ou igual a|
| != | diferente|
| %in% | concatenar|

---

## Funções básicas do pacote dplyr

| Funções | Resultados |
|----------------|-----------------------------------------------------------------------|
| filter() | seleciona observações das variáveis por seus valores assumidos|
| arrange() | reordena as linhas (observações)|
| select() | seleciona variáveis por seus nomes (rótulos)|
| mutate() | cria novas variáveis com funções de variáveis existentes|
| summarize() | reune muitos valores em um único resumo|
| group_by() | muda o escopo de cada função anterior em todo o conjunto de dados para operar grupo por grupo.|

---

## Exemplificando


```r
filter(data, 
       date >= "2022-02-20" &  state == "SP" & epi_week == 8)
```

```
##       region state       date epi_week newCases accumCases newDeaths
## 1: Southeast    SP 2022-02-20        8     6424    4935771        26
## 2: Southeast    SP 2022-02-21        8     2470    4938241        23
## 3: Southeast    SP 2022-02-22        8    15999    4954240       310
## 4: Southeast    SP 2022-02-23        8    15427    4969667       298
## 5: Southeast    SP 2022-02-24        8    15228    4984895       303
## 6: Southeast    SP 2022-02-25        8    14764    4999659       211
## 7: Southeast    SP 2022-02-26        8    11290    5010949       211
##    accumDeaths newRecovered newFollowup      pop state_code
## 1:      163160           NA          NA 45919049         35
## 2:      163183           NA          NA 45919049         35
## 3:      163493           NA          NA 45919049         35
## 4:      163791           NA          NA 45919049         35
## 5:      164094           NA          NA 45919049         35
## 6:      164305           NA          NA 45919049         35
## 7:      164516           NA          NA 45919049         35
```

---

## Exemplificando


```r
arrange(data, 
        state)
```

```
##        region state       date epi_week newCases accumCases newDeaths
##     1:  North    AC 2020-02-25        9        0          0         0
##     2:  North    AC 2020-02-26        9        0          0         0
##     3:  North    AC 2020-02-27        9        0          0         0
##     4:  North    AC 2020-02-28        9        0          0         0
##     5:  North    AC 2020-02-29        9        0          0         0
##    ---                                                               
## 28535:  North    TO 2022-03-15       11      215     301172         2
## 28536:  North    TO 2022-03-16       11      124     301296         0
## 28537:  North    TO 2022-03-17       11      128     301424         2
## 28538:  North    TO 2022-03-18       11      116     301540         2
## 28539:  North    TO 2022-03-19       11      107     301647         2
##        accumDeaths newRecovered newFollowup     pop state_code
##     1:           0           NA          NA  881935         12
##     2:           0           NA          NA  881935         12
##     3:           0           NA          NA  881935         12
##     4:           0           NA          NA  881935         12
##     5:           0           NA          NA  881935         12
##    ---                                                        
## 28535:        4134           NA          NA 1572866         17
## 28536:        4134           NA          NA 1572866         17
## 28537:        4136           NA          NA 1572866         17
## 28538:        4138           NA          NA 1572866         17
## 28539:        4140           NA          NA 1572866         17
```

---

## Exemplificando


```r
select(data, 
       region,
       date,
       state,
       newCases,
       accumCases)
```

```
##        region       date state newCases accumCases
##     1:  North 2020-02-25    RO        0          0
##     2:  North 2020-02-26    RO        0          0
##     3:  North 2020-02-27    RO        0          0
##     4:  North 2020-02-28    RO        0          0
##     5:  North 2020-02-29    RO        0          0
##    ---                                            
## 28535:  North 2022-02-19    RO        0          0
## 28536:  North 2022-02-20    RO        0          0
## 28537:  North 2022-02-21    RO        0          0
## 28538:  North 2022-02-22    RO        0          0
## 28539:  North 2022-02-23    RO        0          0
```

---

## Exemplificando


```r
mutate(data, 
       rate_newcases = newCases/pop*100000)
```

```
##        region state       date epi_week newCases accumCases newDeaths
##     1:  North    RO 2020-02-25        9        0          0         0
##     2:  North    RO 2020-02-26        9        0          0         0
##     3:  North    RO 2020-02-27        9        0          0         0
##     4:  North    RO 2020-02-28        9        0          0         0
##     5:  North    RO 2020-02-29        9        0          0         0
##    ---                                                               
## 28535:  North    RO 2022-02-19        7        0          0         0
## 28536:  North    RO 2022-02-20        8        0          0         0
## 28537:  North    RO 2022-02-21        8        0          0         0
## 28538:  North    RO 2022-02-22        8        0          0         0
## 28539:  North    RO 2022-02-23        8        0          0         0
##        accumDeaths newRecovered newFollowup     pop state_code rate_newcases
##     1:           0           NA          NA 1777225         11             0
##     2:           0           NA          NA 1777225         11             0
##     3:           0           NA          NA 1777225         11             0
##     4:           0           NA          NA 1777225         11             0
##     5:           0           NA          NA 1777225         11             0
##    ---                                                                      
## 28535:           0           NA          NA      NA         11            NA
## 28536:           0           NA          NA      NA         11            NA
## 28537:           0           NA          NA      NA         11            NA
## 28538:           0           NA          NA      NA         11            NA
## 28539:           0           NA          NA      NA         11            NA
```

---

## Exemplificando


```r
summarize(data, 
          mean_newdeaths=mean(newDeaths), 
          desv_pad= sd(newDeaths),
          standard_error=desv_pad/sqrt(length(data)))
```

```
##   mean_newdeaths desv_pad standard_error
## 1       23.18823 64.04652       18.48864
```

---

## Exemplificando


```r
group_by(data, 
         region,
         epi_week)
```

```
## # A tibble: 28,539 x 12
## # Groups:   region, epi_week [265]
##    region state date       epi_week newCases accumCases newDeaths accumDeaths
##    <chr>  <chr> <date>        <int>    <int>      <int>     <int>       <int>
##  1 North  RO    2020-02-25        9        0          0         0           0
##  2 North  RO    2020-02-26        9        0          0         0           0
##  3 North  RO    2020-02-27        9        0          0         0           0
##  4 North  RO    2020-02-28        9        0          0         0           0
##  5 North  RO    2020-02-29        9        0          0         0           0
##  6 North  RO    2020-03-01       10        0          0         0           0
##  7 North  RO    2020-03-02       10        0          0         0           0
##  8 North  RO    2020-03-03       10        0          0         0           0
##  9 North  RO    2020-03-04       10        0          0         0           0
## 10 North  RO    2020-03-05       10        0          0         0           0
## # ... with 28,529 more rows, and 4 more variables: newRecovered <int>,
## #   newFollowup <int>, pop <dbl>, state_code <int>
```

---

## Situação real

- Conhecer quantas mortes por COVID-19
- Cada uma das UF's brasileiras
- dia 20-02-2022 e na oitava semana epidemiológica


.pull-left[

```r
Dados <- select(data, 
                epi_week , 
                state, 
                newDeaths, 
                date)
resultados <- filter(Dados, 
                     epi_week == 8 & date == "2022-02-20")
head(resultados)
```
]

.pull-right[

```
##    epi_week state newDeaths       date
## 1:        8    RO         5 2022-02-20
## 2:        8    AC         3 2022-02-20
## 3:        8    AM         6 2022-02-20
## 4:        8    RR         1 2022-02-20
## 5:        8    PA        23 2022-02-20
## 6:        8    AP         0 2022-02-20
```
]

---

## Saída gráfica


.pull-left[

```r
ggplot(resultados)+
geom_col(aes(x=as.factor(state),
             y=newDeaths,
             fill=as.factor(state)),
alpha=0.65, position = "stack")+
labs(x = "Unidades da federação",
     y = "Novas mortes",
     fill = "UF")+
  ggtitle("Situação COVID-19 - Brasil - 20-02-2022")+
theme_classic()
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig23-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## O operador pipe (%>%)

- atribuímos dois labels: Dados e resultados
- para um único gráfico
- pacote magrittr
- Informalmente: %>% pode ser entendido como "vem mais coisas por ai"
- Formalmente: f(a) = y, então: g(.) tem como primeiro argumento de entrada f(a)
- g(f(a),...)

---

## Saída gráfica

.pull-left[

```r
Dados <- select(data, 
                epi_week,
                state, 
                newDeaths, 
                date) %>%
  filter(epi_week == 8 & date == "2022-02-20")
ggplot(Dados)+
geom_col(aes(x=as.factor(state), 
             y=newDeaths, 
             fill=as.factor(state)),
alpha=0.65, position = "stack")+
labs(x = "Unidades da federação",
     y = "Novas mortes",
     fill = "UF")+
  ggtitle("Situação COVID-19 - Brasil - 20-02-2022")+
theme_classic()
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig24-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Comprações entre as UF's

- taxas de novas mortes
- devido a heterogeneidade populacional
- mutate: criar a variável rate_newDeaths
- constante IBGE: 100000

---

## Saída gráfica

.pull-left[

```r
Dados <- select(data, 
                epi_week ,
                state, 
                newDeaths, 
                date, 
                pop) %>%
  filter(epi_week == 8 & date == "2022-02-20")%>%
  mutate(rate_newDeaths = newDeaths/pop*100000)
ggplot(Dados)+
geom_col(aes(x=as.factor(state), 
             y=rate_newDeaths, 
             fill=as.factor(state)),
alpha=0.65, position = "stack")+
labs(x = "Unidades da federação", 
     y = "Taxa de novas mortes",
     fill = "UF")+
  ggtitle("Situação COVID-19 - Brasil - 20-02-2022")+
theme_classic()
```

]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig25-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Situação real

- conhecer a evolução diária dos novos casos
- entre as semanas epidemiológicas 1 e 8
- anos: 2021 e 2022
- região: sudeste
- UF's

---

## Saída gráfica


.pull-left[

```r
cor <- heat.colors(4, rev = TRUE)
resultados <- data %>%
mutate(year = as.numeric(format(date, "%Y")),
       rate = newCases/pop*100000)%>%
select(newDeaths, 
       epi_week, 
       state, 
       year, 
       rate)%>%
filter(epi_week>= 1 & epi_week <= 8 & state %in% c("SP", "RJ", "MG", "ES") & year %in% c(2021, 2022))
ggplot(resultados, 
       aes(x=as.factor(epi_week), 
                       y = rate, 
                       fill=as.factor(state)))+
facet_wrap(~year)+
geom_bar(stat="identity", 
         position = "dodge", 
         alpha=0.45) +
labs(x = "Semana de infecção", 
     y = "Novas mortes - Sudeste") +
  ggtitle(paste("Nvos casos: COVID-19 - Região Sudeste", 
                "\n",
                "semanas epidemiológicas: 1 a 8 - 2021 e 2022"))+
theme_classic()
```

]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig26-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Produção de mapas

- pacote geobr: Ipea
- mapas: representam o meio onde estamos
- arquivo que contenha as coordenadas da região estudada
- shape.file, raster
- formato dos dados: sf (simple features ou recursos simples)

---

## Preparando os dados


.pull-left[

```r
library(geobr)
uf <- data %>%
  select(state, 
         newDeaths, 
         newCases, 
         accumDeaths, 
         accumCases,
         pop, 
         date)%>%
  filter(date == "2022-02-23")%>%
  mutate(ratenewcases = newCases/pop*100000,
            rateaccumcases = accumCases/pop*100000,
            ratenewdeaths = newDeaths/pop*100000,
            rateaccumdeaths = accumDeaths/pop*100000)
dados_mapa <- read_state(year=2019, showProgress = FALSE)
colnames(dados_mapa)[2] <- "state"
dados_final <- left_join(dados_mapa, uf, "state")
dados_final
```

]

.pull-right[

```
## Simple feature collection with 28 features and 15 fields
## Geometry type: MULTIPOLYGON
## Dimension:     XY
## Bounding box:  xmin: -73.99045 ymin: -33.75118 xmax: -28.84784 ymax: 5.271841
## Geodetic CRS:  SIRGAS 2000
## First 10 features:
##    code_state state name_state code_region name_region newDeaths newCases
## 1          11    RO   Rondônia           1       Norte        16     2741
## 2          11    RO   Rondônia           1       Norte         0        0
## 3          12    AC       Acre           1       Norte         4      654
## 4          13    AM   Amazônas           1       Norte         3      575
## 5          14    RR    Roraima           1       Norte         1      361
## 6          15    PA       Pará           1       Norte        17     2476
## 7          16    AP      Amapá           1       Norte         2       52
## 8          17    TO  Tocantins           1       Norte         2      723
## 9          21    MA   Maranhão           2    Nordeste        14     1283
## 10         22    PI      Piauí           2    Nordeste         5      645
##    accumDeaths accumCases     pop       date ratenewcases rateaccumcases
## 1         7036     366864 1777225 2022-02-23   154.229206      20642.519
## 2            0          0      NA 2022-02-23           NA             NA
## 3         1966     119090  881935 2022-02-23    74.155125      13503.263
## 4        14101     571174 4144597 2022-02-23    13.873484      13781.171
## 5         2126     152146  605761 2022-02-23    59.594461      25116.506
## 6        17716     709489 8602865 2022-02-23    28.781110       8247.125
## 7         2100     160025  845731 2022-02-23     6.148527      18921.501
## 8         4095     296677 1572866 2022-02-23    45.967044      18862.192
## 9        10739     410211 7075181 2022-02-23    18.133812       5797.887
## 10        7619     364093 3273227 2022-02-23    19.705324      11123.365
##    ratenewdeaths rateaccumdeaths                           geom
## 1     0.90027993        395.8981 MULTIPOLYGON (((-65.3815 -1...
## 2             NA              NA MULTIPOLYGON (((-65.3815 -1...
## 3     0.45354816        222.9189 MULTIPOLYGON (((-71.07772 -...
## 4     0.07238339        340.2261 MULTIPOLYGON (((-69.83766 -...
## 5     0.16508161        350.9635 MULTIPOLYGON (((-63.96008 2...
## 6     0.19760859        205.9314 MULTIPOLYGON (((-51.43248 -...
## 7     0.23648181        248.3059 MULTIPOLYGON (((-50.45011 2...
## 8     0.12715641        260.3528 MULTIPOLYGON (((-48.23163 -...
## 9     0.19787480        151.7841 MULTIPOLYGON (((-44.5383 -2...
## 10    0.15275445        232.7672 MULTIPOLYGON (((-42.91539 -...
```
]

---

## Produção mapa (Taxa de novos casos)

.pull-left[

```r
  ggplot(dados_final) +
  geom_sf(aes(fill = ratenewcases), 
          color = "black") +
  geom_sf_text(aes(label = state), 
               size = 2, 
               color = "white")+
  labs(title = paste("Novos casos - COVID-19", 
                     "\n", 
                     "Brasil - 23-02-2022"), 
       fill = "Taxa") +
  theme_minimal()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig28-1.svg" width="100%" style="display: block; margin: auto;" />
]

---

## Produção mapa (Taxa de novas mortes)

.pull-left[

```r
  ggplot(dados_final) +
  geom_sf(aes(fill = ratenewdeaths), 
          color = "black") +
  geom_sf_text(aes(label = state), 
               size = 2, 
               color = "white")+
  labs(title = paste("Novas mortes - COVID-19", 
                     "\n", 
                     "Brasil - 23-02-2022"), 
       fill = "Taxa") +
  theme_minimal()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig29-1.svg" width="100%" style="display: block; margin: auto;" />
]


---

## Produção mapa (Taxa de casos acumulados)

.pull-left[

```r
  ggplot(dados_final) +
  geom_sf(aes(fill = rateaccumcases), 
          color = "black") +
  geom_sf_text(aes(label = state), 
               size = 2, 
               color = "white")+
  labs(title = paste("Casos acumulados - COVID-19", 
                     "\n", 
                     "Brasil - 23-02-2022"), 
       fill = "Taxa") +
  theme_minimal()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig30-1.svg" width="100%" style="display: block; margin: auto;" />
]


---

## Produção mapa (Taxa de casos acumulados)

.pull-left[

```r
  ggplot(dados_final) +
  geom_sf(aes(fill = rateaccumdeaths), 
          color = "black") +
  geom_sf_text(aes(label = state), 
               size = 2, 
               color = "white")+
  labs(title = paste("Mortes acumuladas - COVID-19", 
                     "\n", 
                     "Brasil - 23-02-2022"), 
       fill = "Taxa") +
  theme_minimal()+
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid = element_blank())
```
]

.pull-right[
<img src="/event/example/apresentacao_files/figure-html/fig31-1.svg" width="100%" style="display: block; margin: auto;" />
]


---

# Material de apoio

[ggplot2: elegant graphics for data analysis](https://ggplot2-book.org/)

[R for Data Science](https://r4ds.had.co.nz/)

[R Graphics Cookbook](https://r-graphics.org/)





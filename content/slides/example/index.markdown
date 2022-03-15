---
title: []
categories: []
date: '2019-02-05T00:00:00Z'
slides:
  highlight_style: dracula
  theme: black
summary: An introduction to using Wowchemy's Slides feature.
tags: []
authors: []
---

# Pacote ggplot2: um curso introdutório

Henrique José de Paula Alves 

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

## Controles

- Próximo: `Seta para a direita ou Espaço`
- Anterior: `Seta para a esquerda`
- Início: `Home`
- Fim: `End`
- Visão geral: `Esc`
- Tela cheia: `F`
- Zoom: 'Alt + Clique'


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

Código:


```r
mtcars <- within(mtcars, {
   vs <- factor(vs, labels = c("V", "S"))
   am <- factor(am, labels = c("automatica", "manual"))
   cyl  <- ordered(cyl)
   gear <- ordered(gear)
   carb <- ordered(carb)})
```

--- 

## Base de dados

- Preparando a base de dados

Código:

```r
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

## Porque o pacote ggplot2

Código (graphics):


```r
hist(mtcars$mpg, col = "lightblue", main = "Função hist (base)", 
     xlab = "Milhas por galão (mpg)", ylab = "Frequência absoluta")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="50%" style="display: block; margin: auto;" />

---

## Porque o pacote ggplot2

Código (lattice):


```r
library(lattice)
histogram(~mpg,data=mtcars,
       type ="count",
       xlab ="Milhas por galão (mpg)",
       ylab = "Frequência absoluta",
       main ="Função histogram (lattice)",
       col = "lightblue",
       breaks = 5)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-1.png" width="45%" style="display: block; margin: auto;" />

---

## Porque o pacote ggplot2

Código (base):


```r
tab <- table(mtcars$cyl);tab
```

```
## 
##  4  6  8 
## 11  7 14
```

```r
barplot(tab, col = "lightblue", main = "Função barplot (base)", xlab = "Número de cilindros por motor (cyl)", ylab = "Frequência absoluta")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-5-1.png" width="45%" style="display: block; margin: auto;" />

---

## Porque o pacote ggplot2

Código (lattice):


```r
library(lattice)
tabela <- xtabs(~cyl, data = mtcars);tabela
```

```
## cyl
##  4  6  8 
## 11  7 14
```

```r
barchart(tabela,
         horizontal = FALSE,
         main = "Função barchart (lattice)",
         xlab = "Número de cilindros por motor (cyl)",
         ylab = "Frequência absoluta",
         col = "lightblue")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-6-1.png" width="45%" style="display: block; margin: auto;" />

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

---

## O pacote ggplot2

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


```r
ggplot(mtcars)
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-7-1.png" width="672" style="display: block; margin: auto;" />

--- 

## Passos

Segundo passo: gráfico de dispersão


```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-8-1.png" width="672" style="display: block; margin: auto;" />

---

# Os tipos de geometrias (geom)

Principais:

- point (pontos); line (dispersão); 
- bar (barras); col (colunas); errorbar (barra de erros)
- boxplot; histogram(histogramas), density (densidades), sf (mapas)


---

# Argumentos de estética (aes)

Principais:
- variáveis (x, y, z)
- cores (color, colour, fill)
- tonalidade (alpha)
- formas (shape, linetype)
- tamanhos (size)
- entre outros

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

### O argumento color

Exemplo: Gráfico de dispersão


```r
 ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg, color=as.factor(am)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-1.png" width="672" style="display: block; margin: auto;" />

---

### O argumento color

Exemplo: Gráfico de dispersão


```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg), color=c("red")) 
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-10-1.png" width="672" style="display: block; margin: auto;" />

---

### O argumento fill

Exemplo: gráfico de barras



```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(aes(fill=as.factor(am)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" style="display: block; margin: auto;" />

---

### O argumento fill

Exemplo: gráfico de barras


```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(fill = "red")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-12-1.png" width="672" style="display: block; margin: auto;" />


---

## O argumento alpha (tonalidade das cores)

Exemplo: gráfico de barras


```r
ggplot(mtcars, aes(x = as.factor(cyl))) +
  geom_bar(aes(alpha = as.factor(cyl), fill = as.factor(cyl)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-13-1.png" width="672" style="display: block; margin: auto;" />


--- 

## O argumento forma (shape)

Exemplo: Gráfico de dispersão (Exclusivo)


```r
 ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg, color=as.factor(am), shape = as.factor(carb)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-14-1.png" width="672" style="display: block; margin: auto;" />

--- 

## O argumento forma (linetype)

Exemplo: Gráfico de linhas (Exclusivo)


```r
 ggplot(mtcars) +
  geom_line(mapping = aes(x= disp, y=mpg, linetype = as.factor(am), color = as.factor(am)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-15-1.png" width="672" style="display: block; margin: auto;" />


---

## O argumento tamanho (size)

Exemplo: Gráfico de dispersão


```r
 ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg, color=as.factor(am), shape = as.factor(carb),
                           size = as.factor(cyl)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-16-1.png" width="672" style="display: block; margin: auto;" />

---

## O argumento tamanho (size)

Exemplo: Gráfico de linhas 


```r
 ggplot(mtcars) +
  geom_line(mapping = aes(x= disp, y=mpg, linetype = as.factor(am), color = as.factor(am), size = as.factor(cyl)))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-17-1.png" width="672" style="display: block; margin: auto;" />

---

# Retirando variáveis da legenda (guides)

Linha de comando: guides(nome = "none)
- guides(color = "none")
- guides(fill = "none)
- guides(shape = "none")
- guides(size = "none")


---


# A escolha dos rótulos dos eixos (labs)

Linha de comando: labs()

- x = "nome" (eixo x); y = "nome" (eixo y)
- color = "nome"; colour = "nome"
- shape = "nome"; size = "nome"

---

# A escala dos eixos (scale)

Linha de comando: scale_eixo_tipo

- eixo x, variável discreta: scale_x_discrete
- eixo y, variável discreta: scale_y_discrete
- eixo x, variável contínua: scale_x_continuous
- eixo y, variável contínua: scale_y_continuous

---

# A escolha dos temas (theme)

Linha de comando: theme_nome()

- theme_gray; theme_bw()
- theme_linedraw(); theme_light
- theme_dark(); theme_minimal
- theme_classic(); heme_void()

---

# A escolha do título (ggtitle)

Linha de comando: ggtitle("nome")

Exemplo:
- ggtitle("Média de casos de COVID-19 - Brasil - 2021")

---

# Gráficos mais elaborados 

## Exemplos

---

Gráfico de dispersão


```r
ggplot(mtcars) +
  geom_point(mapping = aes(x= disp, y=mpg, color = as.factor(am),
                           shape = as.factor(am)))+
  guides(shape = "none")+
  labs(x = "Distância percorrida (disp)", y = "Milhas percorridas por galão de combustível (mpg)", color = "Tipo de Transmissão", 
       size ="Número de Carburadores (motor)")+
  theme_classic()+
  ggtitle("mpg vs disp: tipo de transmissão")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-18-1.png" width="672" style="display: block; margin: auto;" />


---

Gráfico de barras


```r
ggplot(mtcars) +
  geom_bar(mapping = aes(x= as.factor(carb), y = (..count..), fill = as.factor(am)),
         position = "dodge", color = "black")+
  scale_y_continuous(limits = c(0,8))+
  labs(x = "Número de Carburadores (motor)", y = "Frequência absoluta", fill = "Tipo de Transmissão")+
  theme_classic()+
  ggtitle("Número de carburadores (motor): tipo de transmissão")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-19-1.png" width="672" style="display: block; margin: auto;" />


---

Histograma


```r
ggplot(mtcars) +
  geom_histogram(mapping = aes(x = mpg, y = (..count..)/100, fill = as.factor(carb)),
           bins= 5, color = "black") +
  labs(x = "Milhas percorridas por galão (mpg)", y = "Frequência relativa", fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Milhas percorrida por galão (mpg)")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-20-1.png" width="672" style="display: block; margin: auto;" />


---

Histograma


```r
ggplot(mtcars) +
  geom_histogram(mapping = aes(x = mpg, y = (..count..)/100, fill = as.factor(carb)),
           bins= 5, color = "black") +
  labs(x = "Milhas percorridas por galão (mpg)", y = "Frequência relativa", fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Milhas percorrida por galão (mpg)")+
  facet_wrap(~as.factor(carb))# facetas
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-21-1.png" width="672" style="display: block; margin: auto;" />


---

Box-plot


```r
ggplot(mtcars) +
  geom_boxplot(mapping = aes(x = as.factor(carb), y=mpg, fill = as.factor(am)), color = "black") +
  labs(x = "Número de carburadores (carb)", y = "Milhas percorridas por galão (mpg)", fill = "Tipo de transmissão")+
  theme_classic()+
  ggtitle("Distribuição mpg por carb: tipo de transmissão")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-22-1.png" width="672" style="display: block; margin: auto;" />


---

Densidades


```r
ggplot(mtcars) +
  geom_density(mapping = aes(x = mpg, fill = as.factor(carb)), color = "black", alpha = 0.1) +
  labs(x = "Milhas percorridas por galão (mpg)", y = "Densidades", fill = "Número de carburadores")+
  theme_classic()+
  ggtitle("Densidade mpg")
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-23-1.png" width="672" style="display: block; margin: auto;" />

---

# Segunda parte

---

# Material de apoio

[ggplot2: elegant graphics for data analysis](https://ggplot2-book.org/)

[R for Data Science](https://r4ds.had.co.nz/)

[R Graphics Cookbook](https://r-graphics.org/)

---

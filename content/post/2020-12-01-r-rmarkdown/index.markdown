---
title: Non-linear growth models
date: 2019-07-12
---





## Non-linear models 

Nonlinear models (NLM) usually go back to obtaining some information about the relationship between variables Y and X. Such information is linked to different degrees of knowledge as
- an analysis of a scatterplot of Y v.s. X
- shape constraints of the function (monotone, sigmoid)
- the solution of a differential equation supported by some
principle or theory
- the interpretation of its parameters.

Whatever the degree of knowledge, the choice of a nonlinear model is rarely empirical.

A growing number of researchers share the feeling that relationships between biological variables are best described by nonlinear functions. Processes such as growth, decay, birth, mortality, competition and production are rarely linearly related to explanatory variables (SCHABENBERGER; PIERCE, 2002).

In this sense, it can be said that MNL best
they describe mechanistic processes and are useful in accommodating constraints regarding such processes. In summary, MNLs have the following advantages over
linear models (ML)
- your choice is supported by theory or mechanistic principles (physical, chemical or biological) or any other prior information
- certain parameters are amount of interest to the researcher provided with interpretation
- predictions can be made outside the observed domain of x
- are parsimonious as they typically have fewer parameters
- depart from the researcher's knowledge of the target phenomenon.

On the other hand, the disadvantages are:
- require iterative estimation procedures based on providing initial values for parameters
 Inference methods are approximate
- Require knowledge of the researcher about the target phenomenon.

### Parameter interpretation 

When assuming MNL to describe a process, it is essential to know the meaning of its parameters. In addition to dimensionality, the study of parametric space is equally important as it allows recognizing the values that a parameter assumes. Many processes involve positive variables, such as time, dose, production, speed, and limited variables, typically represented in percentage, such as content (%), concentration (%) and yield (%).

Relevant properties of a function are things like having points
characteristics (critical, inflection), their behavior (concavity, monoticity) or appear specific patterns (sigmoid, parabolic).

Some of these properties, starting with the characteristic points related to the coordinate (Y) axis, are known as
- **ASS**: upper asymptote
- **ASI**: lower asymptote
- **PO**: point of origin or intercept.

Among the characteristic points on the abscissa axis (X) are:
- **PC**: critical point
- **PI**: inflection point
- **PS**: point of symmetry

The symbol for each of these parameters will depend on the model considered. Sometimes it is faster to recognize the properties of a function by its appearance with some specific pattern. Among the most common is
- **SIG**: sigmoid, being monotonous increasing (MC) or decreasing (MD). The curve has an inverted S or S shape. Every sigmoid has **PI**, **ASS** and **ASI**.


## Code R 

To install and load it in IDE's R or rstudio, just run the following command lines.



```r
library(covid19br)
library(tidyverse)
library(dplyr)
```


```r
data <- downloadCovid19("world") %>%
  filter(country == "Italy")%>%
  select(date, country, accumCases, accumDeaths)
glimpse(data)
```

```
## Rows: 798
## Columns: 4
## $ date        <date> 2020-01-22, 2020-01-23, 2020-01-24, 2020-01-25, 2020-01-2~
## $ country     <chr> "Italy", "Italy", "Italy", "Italy", "Italy", "Italy", "Ita~
## $ accumCases  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3~
## $ accumDeaths <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0~
```

### Behavior of accumulated deaths (Italy)


```r
ggplot(data)+
  geom_point(aes(x = as.Date(date), y = accumDeaths), colour = "steelblue")+
  labs(x = "Date (day)", y = "Accumulated deaths")+
  theme_classic()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-3-1.png" width="672" />


Suggests double sigmoid model


```r
ggplot(data)+
  geom_point(aes(x = as.Date(date), y = accumDeaths), colour = "steelblue")+
  geom_vline(aes(x = as.Date(date), y = accumDeaths, xintercept = as.Date("2020-10-20")),
             colour="brown", linetype = "longdash")+
  geom_vline(aes(x = as.Date(date), y = accumDeaths, xintercept = as.Date("2021-12-15")),
             colour="brown", linetype = "longdash")+
 annotate("text", label = "sigmoid behavior", x = as.Date("2020-05-1"), y = 100000, size = 5,
          colour = "gray")+
 annotate("text", label = "sigmoid behavior", x = as.Date("2021-08-1"), y = 100000, size = 5, 
          colour = "gray")+
  labs(x = "Date (day)", y = "Accumulated deaths")+
  theme_classic()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-4-1.png" width="672" />


### Double sigmoid model adjustment

- Transforming the date variable into numeric.


```r
n <- nrow(data)
data <- data %>%
  mutate(data = c(seq(1,n,1)))
glimpse(data)
```

```
## Rows: 798
## Columns: 5
## $ date        <date> 2020-01-22, 2020-01-23, 2020-01-24, 2020-01-25, 2020-01-2~
## $ country     <chr> "Italy", "Italy", "Italy", "Italy", "Italy", "Italy", "Ita~
## $ accumCases  <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3~
## $ accumDeaths <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0~
## $ data        <dbl> 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17,~
```


- Changing the data scale to avoid over/under-flow issues.


```r
data_mod <- data %>%
  select(accumDeaths, data) %>%
  mutate(accumDeathscorr = accumDeaths/10000,
         data = data/100)
glimpse(data_mod)
```

```
## Rows: 798
## Columns: 3
## $ accumDeaths     <int> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
## $ data            <dbl> 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, ~
## $ accumDeathscorr <dbl> 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, ~
```

- Behavior of the transformed data


```r
ggplot(data_mod)+
  geom_point(aes(x = data, y = accumDeathscorr), colour = "steelblue")+
  geom_vline(aes(x = data, y = accumDeathscorr, xintercept = 3),
             colour="brown", linetype = "longdash")+
  geom_vline(aes(x = data, y = accumDeathscorr, xintercept = 7),
             colour="brown", linetype = "longdash")+
 annotate("text", label = "sigmoid behavior", x = 1.5, y = 10, size = 5,
          colour = "gray")+
 annotate("text", label = "sigmoid behavior", x = 5.5, y = 10, size = 5, 
          colour = "gray")+
  labs(x = "Day", y = "Accumulated deaths corrected")+
  theme_classic()
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-7-1.png" width="672" />


## Starting kicks for each sigmoid

- model one: logistic model


```r
apropos("^SS")
```

```
##  [1] "SSasymp"     "SSasympOff"  "SSasympOrig" "SSbiexp"     "SSD"        
##  [6] "SSfol"       "SSfpl"       "SSgompertz"  "SSlogis"     "SSmicmen"   
## [11] "SSweibull"
```

```r
n0 <- nls(accumDeathscorr ~ SSlogis(data, A, M, S), data = data_mod, 
          subset = data < 3)
coef(n0)
```

```
##         A         M         S 
## 3.5857409 0.8126909 0.1364505
```



```r
data_modn0 <- data_mod %>%
  filter(data < 3) %>%
  mutate(predict = predict(n0))
ggplot(data_modn0)+
geom_point(aes(x = data, y = accumDeathscorr, color = "blue"))+
  geom_line(aes(x = data, y = predict, color = "red"))+
  labs(x = "data", y = "Accumulated deaths")+
  theme_bw()+
  theme(legend.position="right", 
        legend.box = "horizontal",legend.title=element_text(size=15), 
        legend.text=element_text(size=15), axis.text=element_text(size=20),
        axis.title=element_text(size=20), axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) +
  scale_color_manual(values=c("blue", "red"), 
                       name="Accumulated deaths",
                     breaks = c("blue", "red"),
                       labels=c("Observed", "Predict"))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-9-1.png" width="672" />



- model two: logistic model


```r
apropos("^SS")
```

```
##  [1] "SSasymp"     "SSasympOff"  "SSasympOrig" "SSbiexp"     "SSD"        
##  [6] "SSfol"       "SSfpl"       "SSgompertz"  "SSlogis"     "SSmicmen"   
## [11] "SSweibull"
```

```r
n1 <- nls(accumDeathscorr ~ SSlogis(data, A, M, S), data = data_mod, 
          subset = data > 3 & data < 7)
coef(n1)
```

```
##          A          M          S 
## 13.3237430  3.3364864  0.6323343
```



```r
data_modn1 <- data_mod %>%
  filter(data > 3 & data < 7) %>%
  mutate(predict = predict(n1))
ggplot(data_modn1)+
geom_point(aes(x = data, y = accumDeathscorr, color = "blue"))+
  geom_line(aes(x = data, y = predict, color = "red"))+
  labs(x = "data", y = "Accumulated deaths")+
  theme_bw()+
  theme(legend.position="right", 
        legend.box = "horizontal",legend.title=element_text(size=15), 
        legend.text=element_text(size=15), axis.text=element_text(size=20),
        axis.title=element_text(size=20), axis.line = element_line(colour = "black"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        panel.border = element_blank(),
        panel.background = element_blank()) +
  scale_color_manual(values=c("blue", "red"), 
                       name="Accumulated deaths",
                     breaks = c("blue", "red"),
                       labels=c("Observed", "Predict"))
```

<img src="{{< blogdown/postref >}}index_files/figure-html/unnamed-chunk-11-1.png" width="672" />


## Aim
- find models that can fit this data
- seek partnerships
- Publication



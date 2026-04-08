#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)
library(shinydashboardPlus)
library(shinydashboard)
library(shinythemes)
library(dplyr)
# library(readxl)
library(ECharts2Shiny)
library(tidyverse)
library(forcats)
library(viridis)
library(plotly)
library(ggthemes)


dados <- readRDS("dados.rds")
# saveRDS(dados, "dados.rds")
# dados <- dados %>% mutate_if(is.character,
#                                        list(~enc2utf8(.)))
# 
# writexl::write_xlsx(dados, "C:\\Users\\jpahe\\Dropbox\\PC\\Documents\\shiny_app\\my first shiny\\teste_sinespe\\app_sinespe\\teste\\dados.xlsx")

dados <- as.data.frame(dados)%>%
  mutate(id = if_else(Mes == "Janeiro", 1,
                      if_else(Mes == "Fevereiro", 2,
                              if_else(Mes == "Marco", 3,
                                      if_else(Mes == "Abril", 4,
                                              if_else(Mes == "Maio", 5,
                                                      if_else(Mes == "Junho", 6,
                                                              if_else(Mes == "Julho", 7,
                                                                      if_else(Mes == "Agosto", 8,
                                                                              if_else(Mes == "Setembro", 9,
                                                                                      if_else(Mes == "Outubro", 10,
                                                                                              if_else(Mes == "Novembro", 11, 12))))))))))))



# choice_mun <- levels(as.factor(dados$Municipio))

choices_UF <- levels(as.factor(dados$UF))


choices_AC <- dados%>%
  filter(UF == "AC")%>%
  select(Municipio)

choices_AL <- dados %>%
  filter(UF == "AL")%>%
  select(Municipio)

choices_AM <- dados %>%
  filter(UF == "AM")%>%
  select(Municipio)

choices_AP <- dados %>%
  filter(UF == "AP")%>%
  select(Municipio)

choices_BA <- dados %>%
  filter(UF == "BA")%>%
  select(Municipio)

choices_CE <- dados %>%
  filter(UF == "CE")%>%
  select(Municipio)

choices_DF <- dados %>%
  filter(UF == "DF")%>%
  select(Municipio)

choices_ES <- dados %>%
  filter(UF == "ES")%>%
  select(Municipio)

choices_GO <- dados %>%
  filter(UF == "GO")%>%
  select(Municipio)

choices_MA <- dados %>%
  filter(UF == "MA")%>%
  select(Municipio)

choices_MG <- dados %>%
  filter(UF == "MG")%>%
  select(Municipio)

choices_MS <- dados %>%
  filter(UF == "MS")%>%
  select(Municipio)

choices_MT <- dados %>%
  filter(UF == "MT")%>%
  select(Municipio)

choices_PA <- dados %>%
  filter(UF == "PA")%>%
  select(Municipio)

choices_PB <- dados %>%
  filter(UF == "PB")%>%
  select(Municipio)

choices_PE <- dados %>%
  filter(UF == "PE")%>%
  select(Municipio)

choices_PI <- dados %>%
  filter(UF == "PI")%>%
  select(Municipio)

choices_PR <- dados %>%
  filter(UF == "PR")%>%
  select(Municipio)

choices_RJ <- dados %>%
  filter(UF == "RJ")%>%
  select(Municipio)

choices_RN <- dados %>%
  filter(UF == "RN")%>%
  select(Municipio)

choices_RO <- dados %>%
  filter(UF == "RO")%>%
  select(Municipio)

choices_RR <- dados %>%
  filter(UF == "RR")%>%
  select(Municipio)

choices_RS <- dados %>%
  filter(UF == "RS")%>%
  select(Municipio)

choices_SC <- dados %>%
  filter(UF == "SC")%>%
  select(Municipio)

choices_SE <- dados %>%
  filter(UF == "SE")%>%
  select(Municipio)

choices_SP <- dados %>%
  filter(UF == "SP")%>%
  select(Municipio)

choices_TO <- dados %>%
  filter(UF == "TO")%>%
  select(Municipio)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  
  output$ui <- renderUI({
    if (is.null(input$selectUF))
      return()
    
    switch(input$selectUF,
           "AC" = selectInput(c("selectMun"), label = c("Municipio"),
                                choices = choices_AC),
           "AL" = selectInput("selectMun", label = "Municipio",
                                   choices = choices_AL),
           "AM" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_AM),
           "AP" = selectInput("selectMun", label = "Municipio",
                                    choices = choices_AP),
           "BA" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_BA),
           "CE" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_CE),
           "DF" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_DF),
           "ES" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_ES),
           "GO" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_GO),
           "MA" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_MA),
           "MG" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_MG),
           "MS" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_MS),
           "MT" = selectInput("selectMun", label = "Municipio",
                                 choices = choices_MT),
           "PA" = selectInput("selectMun", label = "Municipio",
                                choices = choices_PA),
           "PB" = selectInput("selectMun", label = "Municipio",
                                choices = choices_PB),
           "PE" = selectInput("selectMun", label = "Municipio",
                               choices = choices_PE),
           "PI" = selectInput("selectMun", label = "Municipio",
                               choices = choices_PI),
           "PR"= selectInput("selectMun", label = "Municipio",
                              choices = choices_PR),
           "RJ" = selectInput("selectMun", label = "Municipio",
                              choices = choices_RJ),
           "RN" = selectInput("selectMun", label = "Municipio",
                              choices = choices_RN),
           "RR" = selectInput("selectMun", label = "Municipio",
                              choices = choices_RR),
           "RR" = selectInput("selectMun", label = "Municipio",
                              choices = choices_RR),
           "RS" = selectInput("selectMun", label = "Municipio",
                              choices = choices_RS),
           "SC" = selectInput("selectMun", label = "Municipio",
                              choices = choices_SC),
           "SE" = selectInput("selectMun", label = "Municipio",
                              choices = choices_SE),
           "SP" = selectInput("selectMun", label = "Municipio",
                              choices = choices_SP),
           "TO" = selectInput("selectMun", label = "Municipio",
                              choices = choices_TO)
    )
    
  })
  
  
  observeEvent(input$filtrar, {
    opcaoselecionadaUF <- input$selectUF
    opcaoSelecionadaMUN <- input$selectMun
    dadosFiltradosMUN <- dados[dados$Municipio == opcaoSelecionadaMUN & dados$UF == opcaoselecionadaUF, ]
    dadosFiltradosMUN <- data.frame(dadosFiltradosMUN)
    
    
    dadosFiltradosUF <- dados[dados$UF == opcaoselecionadaUF, ]
    dadosFiltradosUF <- data.frame(dadosFiltradosUF) %>%
      group_by(Ano)%>%
      select(UF, Ano, Vitimas)%>%
      summarise(Vitimas = sum(Vitimas),
                Media = mean(Vitimas))%>%
      mutate(idano = if_else(Ano == 2018, 1,
                             if_else(Ano == 2019, 2,
                                     if_else(Ano == 2019, 3,
                                             if_else(Ano == 2020, 4,
                                                     if_else(Ano == 2021, 5, 6))))))
    
    

    output$plot1 <-  renderPlotly({
      ggplotly(ggplot(dadosFiltradosMUN, aes(fct_reorder(Mes, id, min), Vitimas,
                                   text = paste("Municipio:", Municipio, "\n",
                                     "Ano: ", Ano, "\n",
                                                "Mes: ", Mes, "\n",
                                                "Vitimas: ", Vitimas)))+
                 geom_col(aes(fill = fct_reorder(Mes, id, min)), alpha = 0.65,
                          show.legend = FALSE)+
                 geom_point(alpha = 0.65,
                            show.legend = FALSE, size = 2)+
                 labs(x = "", y = "Vitimas")+
                 facet_wrap(. ~as.factor(Ano), ncol = 5)+
                 theme_economist()+
                 theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1, size = 8)), tooltip = "text")
    }
    )

    output$plot2 <-  renderPlotly({
      ggplotly(ggplot(dadosFiltradosUF, aes(fct_reorder(Ano, idano, min), Vitimas,
                                             text = paste("Ano: ", Ano, "\n",
                                                          "Vitimas: ", Vitimas)))+
                 geom_col(aes(fill = fct_reorder(Ano, idano, min)),alpha = 0.65,
                           show.legend = FALSE)+
                 labs(x = "", y = "Vitimas")+
                 # facet_wrap(. ~as.factor(Ano), ncol = 2)+
                 theme_economist()+
                 theme(axis.text.x = element_text(angle = 0, vjust = 0.5, hjust=1, size = 8)), tooltip = "text")
    }
    )
    
    output$tableMUN <- renderDataTable(dadosFiltradosMUN[,1:7], 
                                       options = list(pageLength = 5, autoWidth = TRUE, 
                                                      rownames= FALSE))
    
    output$tableUF <- renderDataTable(dadosFiltradosUF[,1:3], 
                                      options = list(pageLength = 5, autoWidth = TRUE, 
                                                     rownames= FALSE))
    
  })
}


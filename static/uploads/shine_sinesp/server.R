library(shiny)
library(shinyWidgets)
library(shinydashboardPlus)
library(shinydashboard)
library(shinythemes)
library(dplyr)
library(readxl)
library(ECharts2Shiny)
library(tidyverse)
library(forcats)
library(viridis)
library(plotly)

#lendo os dados
dados <- read_xlsx("base_sinesp.xlsx")

dados <- as.data.frame(dados)%>%
  mutate(id = if_else(Mês == "janeiro", 1,
                      if_else(Mês == "fevereiro", 2,
                              if_else(Mês == "março", 3,
                                      if_else(Mês == "abril", 4,
                                              if_else(Mês == "maio", 5,
                                                      if_else(Mês == "junho", 6,
                                                              if_else(Mês == "julho", 7,
                                                                      if_else(Mês == "agosto", 8,
                                                                              if_else(Mês == "setembro", 9,
                                                                                      if_else(Mês == "outubro", 10,
                                                                                              if_else(Mês == "novembro", 11, 12))))))))))))
choices_UF <- levels(as.factor(dados$UF))

choices_AC <- dados %>%
  filter(UF == "Acre")%>%
  select(Crime)

choices_AM <- dados %>%
  filter(UF == "Amazonas")%>%
  select(Crime)

choices_AL <- dados %>%
  filter(UF == "Alagoas")%>%
  select(Crime)

choices_AP <- dados %>%
  filter(UF == "Amapá")%>%
  select(Crime)

choices_BA <- dados %>%
  filter(UF == "Bahia")%>%
  select(Crime)

choices_CE <- dados %>%
  filter(UF == "Ceará")%>%
  select(Crime)

choices_DF <- dados %>%
  filter(UF == "Distrito Federal")%>%
  select(Crime)

choices_ES <- dados %>%
  filter(UF == "Espírito Santo")%>%
  select(Crime)

choices_GO <- dados %>%
  filter(UF == "Goiás")%>%
  select(Crime)

choices_MA <- dados %>%
  filter(UF == "Maranhão")%>%
  select(Crime)

choices_MG <- dados %>%
  filter(UF == "Minas Gerais")%>%
  select(Crime)

choices_MS <- dados %>%
  filter(UF == "Mato Grosso do Sul")%>%
  select(Crime)

choices_MT <- dados %>%
  filter(UF == "Mato Grosso")%>%
  select(Crime)

choices_PA <- dados %>%
  filter(UF == "Pará")%>%
  select(Crime)

choices_PB <- dados %>%
  filter(UF == "Paraíba")%>%
  select(Crime)

choices_PE <- dados %>%
  filter(UF == "Pernambuco")%>%
  select(Crime)

choices_PI <- dados %>%
  filter(UF == "Piauí")%>%
  select(Crime)

choices_PR <- dados %>%
  filter(UF == "Paraná")%>%
  select(Crime)

choices_RJ <- dados %>%
  filter(UF == "Rio de Janeiro")%>%
  select(Crime)

choices_RN <- dados %>%
  filter(UF == "Rio Grande do Norte")%>%
  select(Crime)

choices_RO <- dados %>%
  filter(UF == "Rondônia")%>%
  select(Crime)

choices_RR <- dados %>%
  filter(UF == "Roraima")%>%
  select(Crime)

choices_RS <- dados %>%
  filter(UF == "Rio Grande do Sul")%>%
  select(Crime)

choices_SC <- dados %>%
  filter(UF == "Santa Catarina")%>%
  select(Crime)

choices_SE <- dados %>%
  filter(UF == "Sergipe")%>%
  select(Crime)

choices_SP <- dados %>%
  filter(UF == "São Paulo")%>%
  select(Crime)

choices_TO <- dados %>%
  filter(UF == "Tocantins")%>%
  select(Crime)

server <- function(input, output, session) {
  
  output$ui <- renderUI({
    if (is.null(input$selectUF))
      return()
    
    switch(input$selectUF,
           "Acre" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_AC),
           "Alagoas" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_AM),
           "Amapá" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_AL),
           "Amazonas" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_AP),
           "Bahia" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_BA),
           "Ceará" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_CE),
           "Distrito Federal" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_DF),
           "Espírito Santo" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_ES),
           "Goiás" = selectInput("selectCrime", label = "Tipo de Crime",
                             choices = choices_GO),
           "Maranhão" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_MA),
           "Minas Gerais" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_MG),
           "Mato Grosso do Sul" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_MS),
           "Mato Grosso" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_MT),
           "Pará" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_PA),
           "Paraíba" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_PB),
           "Paraná" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_PE),
           "Pernambuco" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_PI),
           "Piauí"= selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_PR),
           "Rio de Janeiro" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_RJ),
           "Rio Grande do Norte" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_RN),
           "Rio Grande do Sul" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_RO),
           "Rondônia" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_RR),
           "Roraima" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_RS),
           "Santa Catarina" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_SC),
           "São Paulo" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_SE),
           "Sergipe" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_SP),
           "Tocantins" = selectInput("selectCrime", label = "Tipo de Crime",
                              choices = choices_TO)
    )
    
  })
  
  
  observeEvent(input$filtrar, {
    opcaoselecionadaUF <- input$selectUF
    opcaoSelecionadacrime <- c(input$selectCrime)
    dadosFiltrados <- dados[dados$Crime == opcaoSelecionadacrime & dados$UF == opcaoselecionadaUF, ]
    # dadosFiltrados <- dados[dados$Crime == opcaoSelecionadacrime, ]
    dadosFiltrados <- data.frame(dadosFiltrados)
    

    output$plot1 <-  renderPlot(
      ggplot(dadosFiltrados, aes(fct_reorder(Mês, id, min), Ocorrências, fill = as.factor(Ano),
                      label = Ocorrências))+
        geom_col(alpha = 0.65,
                 show.legend = FALSE, position = "dodge", stat="identity")+
        geom_text(position = position_dodge(width = 0.9), vjust = -0.5)+
        labs(x = "Mês", y = "Ocorrências")+
        facet_wrap(. ~as.factor(Ano), ncol = 2)+
        theme_classic()+
        theme(axis.text.x = element_text(angle = 30, vjust = 0.5, hjust=1))+
        scale_fill_viridis_d()
    
      )
    
    output$plot2 <-  renderPlotly({
      ggplotly(ggplot(dadosFiltrados, aes(fct_reorder(Mês, id, min), as.factor(Ano), fill = Ocorrências,
                                          text = paste("Ano: ", Ano, "\n",
                                                       "Mês: ", Mês, "\n",
                                                       "Ocorrências: ", Ocorrências))) + 
        # geom_point(aes(size="NA"), shape = NA, colour = "gray95")+
        # guides(size=guide_legend("Missing values", override.aes=list(shape=15, size = 10)))+
        geom_tile(alpha = 1, color = "white", lwd = 1.5, linetype = 1)+
        labs(x = "Mês", y = "Ano", fill = paste("UF -", opcaoselecionadaUF))+
        scale_fill_distiller(palette = "Spectral")+
        theme(axis.text.x = element_text(angle = 30, vjust = 0.5, hjust=1)),
        tooltip = 'text')
      }
      )
    
  
  })
}

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

# choice_mun <- levels(as.factor(dados$Município))

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


ui <- dashboardPage(skin = "blue", 
                    dashboardHeader(
                      title = "Base de dados - Sinesp - Homicidios dolosos - UF",
                      titleWidth = 500
                    ),
                    dashboardSidebar(
                      tags$p(),
                      selectInput("selectUF", label = "Selecione a UF", choices = choices_UF),
                      uiOutput("ui"),
                      tags$div(class = "alinhamento",
                               actionButton("filtrar", "Filtrar"))                
                    )
                    ,
                    dashboardBody(
                      tags$style(type="text", ".alinhamento {color: black;
                                 height:40px;display:flex;align-items: center;
                                 justify-content: left;}"),
                      tabsetPanel(
                        navbarMenu("Contato: jpahenrique@gmail.com",
                                   tabPanel(
                                     title = "Dados municipios",
                                     value = "page1"
                                     
                                   )
                        )
                      ),
                      fluidPage(
                      
                      fluidRow(
                        box(
                          title = "Municipios - Mensal", width = 6, solidHeader = TRUE, status = "primary", collapsible = TRUE,
                          plotlyOutput("plot1"))
                        ,
                        box(
                          title = "UF - Anual", width = 6, solidHeader = TRUE, status = "primary",  collapsible = TRUE,
                          plotlyOutput("plot2"))
                      ),
                      fluidRow(
                        column(
                        dataTableOutput('tableMUN'), width = 6)
                        ,
                        
                        column(
                          dataTableOutput('tableUF'), width = 6)
                        
                      )

                      )
                      
                    )
)

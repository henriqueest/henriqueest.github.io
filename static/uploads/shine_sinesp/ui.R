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
# library(leaflet)
# library(rgdal)
# library(sf)
# install.packages('rsconnect')

#lendo os dados
dados <- readRDS("dados.rds")

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


ui <- dashboardPage(skin = "blue", 
                    dashboardHeader(
                      title = "Base de dados - Sinesp - Ocorrências criminais - UF",
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
                      # tabsetPanel(
                      #   navbarMenu("Menu",
                      #              tabPanel(
                      #                title = "Ocorrências criminais",
                      #                value = "page1"
                      #                
                      #              )
                      #   )
                      # )
                      # ,
                      
                      fluidPage(
                        
                        loadEChartsLibrary(),
                        loadEChartsTheme('shine'),
                        loadEChartsTheme('vintage'),
                        loadEChartsTheme('dark-digerati'),
                        loadEChartsTheme('roma'),
                        loadEChartsTheme('infographic'),
                        loadEChartsTheme('macarons'),
                        loadEChartsTheme('caravan'),
                        loadEChartsTheme('jazz'),
                        loadEChartsTheme('london'),
                        
                        
                        
                        fluidRow(
                          # column(6,
                          box(
                            title = "Evolução mensal  - Ocorrências criminais - UF - Sinesp", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                            plotlyOutput("plot1")
                          )
                          # )
                          ,
                          
                          # column(6,
                          box(
                            title = "Missing Values - - Ocorrências criminais - UF - Sinesp", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                            plotlyOutput("plot2"))
                          # )
                          
                        )
                        ,
                        
                        fluidRow(
                          column(
                            dataTableOutput('tableUF'), width = 6)
                          ,
                          
                          column(
                            dataTableOutput('tableUF2'), width = 6)
                          
                          
                        )
                      )
                    )
)

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

# uf <- list("AC - Acre" = 1, "AM - Amazonas" = 2,"AL - Alagoas" = 3,
#             "AP - Amapá" = 4, "BA - Bahia" = 5, "CE - Ceará" = 6, "DF - Distrito Federal" = 7,
#             "ES - Espírito Santo" = 8, "GO - Goiás" = 9, "MA - Maranhão" = 10, "MG - Minas Gerais" = 11,
#             "MS - Mato Grosso do Sul" = 12, "MT - Mato Grosso" = 13, "PA - Pará" = 14, "PB - Paraíba" = 15,
#             "PE - Pernambuco" = 16, "PI - Piauí" = 17, "PR - Paraná" = 18, "RJ - Rio de Janeiro" = 19,
#             "RN - Rio Grande de Norte" = 20, "RO - Rondônia" = 21, "RR - Roraima" = 22,
#             "RS - Rio Grande do Sul" = 23, "SC - Santa Catarina" = 24, "SE - Sergipe" = 25,
#             "SP - São Paulo" = 26, "TO - Tocantins" = 27)



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
                            plotOutput("plot1")
                          )
                          # )
                           ,
                          
                          # column(6,
                          box(
                            title = "Missing Values - - Ocorrências criminais - UF - Sinesp", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                            plotlyOutput("plot2"))
                          # )
                          
                        )
                        
                      )
                    )
)

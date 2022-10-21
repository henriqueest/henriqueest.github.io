library(shiny)
library(shinyWidgets)
library(shinydashboardPlus)
library(shinydashboard)
library(shinythemes)
library(dplyr)
library(readxl)
library(ECharts2Shiny)
library(leaflet)
library(rgdal)
library(sf)
library(geobr)
# install.packages('rsconnect')

#lendo os dados
dados <- read_xlsx(path = "Homicidios_populacao_taxa_media_2010a2020.xlsx")
# dados <- load("~/shiny_app/my first shiny/teste/dados.RData")
dados <- as.data.frame(dados)
colnames(dados)[32] <- "Txmean200810"
colnames(dados)[33] <- "Txmean200911"
colnames(dados)[34] <- "Txmean201012"
colnames(dados)[35] <- "Txmean201113"
colnames(dados)[36] <- "Txmean201214"
colnames(dados)[37] <- "Txmean201315"
colnames(dados)[38] <- "Txmean201416"
colnames(dados)[39] <- "Txmean201517"
colnames(dados)[40] <- "Txmean201618"
colnames(dados)[41] <- "Txmean201719"
colnames(dados)[42] <- "Txmean201820"

dadosMUn <- dados %>%
  select(uf, nome_munic,populacao.2009, populacao.2010, populacao.2011,
         populacao.2012, populacao.2013, populacao.2014, populacao.2015, 
         populacao.2016, populacao.2017, populacao.2018, populacao.2019, populacao.2020, 
         Txmean200810, Txmean200911, Txmean201012, Txmean201113, Txmean201214, Txmean201315,
         Txmean201416, Txmean201517, Txmean201618, Txmean201719, Txmean201820)

colnames(dadosMUn)[1] <- "UF"
colnames(dadosMUn)[2] <- "Município"
colnames(dadosMUn)[3] <- "População2009"
colnames(dadosMUn)[4] <- "População2010"
colnames(dadosMUn)[5] <- "População2011"
colnames(dadosMUn)[6] <- "População2012"
colnames(dadosMUn)[7] <- "População2013"
colnames(dadosMUn)[8] <- "População2014"
colnames(dadosMUn)[9] <- "População2015"
colnames(dadosMUn)[10] <- "População2016"
colnames(dadosMUn)[11] <- "População2017"
colnames(dadosMUn)[12] <- "População2018"
colnames(dadosMUn)[13] <- "População2019"
colnames(dadosMUn)[14] <- "População2020"
colnames(dadosMUn)[15] <- "Taxamédia20082010"
colnames(dadosMUn)[16] <- "Taxamédia20092011"
colnames(dadosMUn)[17] <- "Taxamédia20102012"
colnames(dadosMUn)[18] <- "Taxamédia20112013"
colnames(dadosMUn)[19] <- "Taxamédia20122014"
colnames(dadosMUn)[20] <- "Taxamédia20132015"
colnames(dadosMUn)[21] <- "Taxamédia20142016"
colnames(dadosMUn)[22] <- "Taxamédia20152017"
colnames(dadosMUn)[23] <- "Taxamédia20162018"
colnames(dadosMUn)[24] <- "Taxamédia20172019"
colnames(dadosMUn)[25] <- "Taxamédia20182020"

# mapa <- st_read("shapefinal.shp")
mapa <- geobr::read_municipality(year = 2015)
colnames(mapa)[2] <- "Município"
colnames(mapa)[4] <- "uf"

head(mapa)
head(dados)

# uf <- list("AC - Acre" = 1, "AM - Amazonas" = 2,"AL - Alagoas" = 3,
#            "AP - Amapá" = 4, "BA - Bahia" = 5, "CE - Ceará" = 6, "DF - Distrito Federal" = 7,
#            "ES - Espírito Santo" = 8, "GO - Goiás" = 9, "MA - Maranhão" = 10, "MG - Minas Gerais" = 11,
#            "MS - Mato Grosso do Sul" = 12, "MT - Mato Grosso" = 13, "PA - Pará" = 14, "PB - Paraíba" = 15,
#            "PE - Pernambuco" = 16, "PI - Piauí" = 17, "PR - Paraná" = 18, "RJ - Rio de Janeiro" = 19,
#            "RN - Rio Grande de Norte" = 20, "RO - Rondônia" = 21, "RR - Roraima" = 22, 
#            "RS - Rio Grande do Sul" = 23, "SC - Santa Catarina" = 24, "SE - Sergipe" = 25, 
#            "SP - São Paulo" = 26, "TO - Tocantins" = 27)

choice_mun <- as.factor(levels(dados$nome_munic))

# choice_micro <- dadosMUn$  $Nome_Microrregião

choice_UF <- levels(as.factor(dados$uf))

# choice_MUN <- "Selecione o Município"

choices_AC <- dados %>%
  filter(uf == "AC") %>%
  select(nome_munic)

choices_AM <- dados %>%
  filter(uf == "AM") %>%
  select(nome_munic)

choices_AL <- dados %>%
  filter(uf == "AL")%>%
  select(nome_munic)

choices_AP <- dados %>%
  filter(uf == "AP")%>%
  select(nome_munic)

choices_BA <- dados %>%
  filter(uf == "BA")%>%
  select(nome_munic)

choices_CE <- dados %>%
  filter(uf == "CE")%>%
  select(nome_munic)

choices_DF <- dados %>%
  filter(uf == "DF")%>%
  select(nome_munic)

choices_ES <- dados %>%
  filter(uf == "ES")%>%
  select(nome_munic)

choices_GO <- dados %>%
  filter(uf == "GO")%>%
  select(nome_munic)

choices_MA <- dados %>%
  filter(uf == "MA")%>%
  select(nome_munic)

choices_MG <- dados %>%
  filter(uf == "MG")%>%
  select(nome_munic)

choices_MS <- dados %>%
  filter(uf == "MS")%>%
  select(nome_munic)

choices_MT <- dados %>%
  filter(uf == "MT")%>%
  select(nome_munic)

choices_PA <- dados %>%
  filter(uf == "PA")%>%
  select(nome_munic)

choices_PB <- dados %>%
  filter(uf == "PB")%>%
  select(nome_munic)

choices_PE <- dados %>%
  filter(uf == "PE")%>%
  select(nome_munic)

choices_PI <- dados %>%
  filter(uf == "PI")%>%
  select(nome_munic)

choices_PR <- dados %>%
  filter(uf == "PR")%>%
  select(nome_munic)

choices_RJ <- dados %>%
  filter(uf == "RJ")%>%
  select(nome_munic)

choices_RN <- dados %>%
  filter(uf == "RN")%>%
  select(nome_munic)

choices_RO <- dados %>%
  filter(uf == "RO")%>%
  select(nome_munic)

choices_RR <- dados %>%
  filter(uf == "RR")%>%
  select(nome_munic)

choices_RS <- dados %>%
  filter(uf == "RS")%>%
  select(nome_munic)

choices_SC <- dados %>%
  filter(uf == "SC")%>%
  select(nome_munic)

choices_SE <- dados %>%
  filter(uf == "SE")%>%
  select(nome_munic)

choices_SP <- dados %>%
  filter(uf == "SP")%>%
  select(nome_munic)

choices_TO <- dados %>%
  filter(uf == "TO")%>%
  select(nome_munic)


ui <- dashboardPage(skin = "blue",
                    dashboardHeader(
                      title = "Seleção",
                      titleWidth = 186
                    ),
                    dashboardSidebar(
                      tags$p(),
                      selectInput("selectUF", label = "UF", choices = choice_UF),
                      uiOutput("ui"),
                      tags$div(class = "alinhamento",
                               actionButton("filtrar", "filtrar"))                
                    )
                    ,
                    dashboardBody(
                      # tags$style(type="text", ".alinhamento {color: black;
                      #            height:40px;display:flex;align-items: center;
                      #            justify-content: left;}"),
                      tabsetPanel(
                        navbarMenu("Contato: jpahenrique@gmail.com",
                                   tabPanel(
                                     title = "Dados municípios",
                                     value = "page1"
                                     
                                   )
                        )
                      )
                      ,
                      
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
                          column(6,
                                 tags$div(id="test_2", style="width:100%;height:300px;"),
                                 deliverChart(div_id = "test_2")
                          )
                          ,
                          
                          box(
                            title = "Mapa municípios - Brasil", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                            leafletOutput("plot",width="1100", height="800")
                          )
                          
                        )
                        # ,
                        # 
                        # fluidRow(
                        #   column(6,
                        #          tags$div(id="test_2", style="width:100%;height:300px;"),
                        #          deliverChart(div_id = "test_2")
                        #   )
                        #   
                        # )
                        
                        # fluidRow(
                        #   column(6,
                        #          tags$div(id="test_1", style="width:100%;height:300px;"),  # Specify the div for the chart.
                        #          deliverChart(div_id = "test_1")  # Deliver the plotting
                        #   ),
                        #   column(6,
                        #          tags$div(id="test_2", style="width:100%;height:300px;"),
                        #          deliverChart(div_id = "test_2")
                        #   )
                        # ),
                        # fluidRow(
                        #   box(
                        #     title = "Mapa municípios - Brasil", status = "primary", solidHeader = TRUE, collapsible = TRUE,
                        #     leafletOutput("plot",width="700",height="235")
                        #   )
                        #   
                        # )
                      )
                    )
)

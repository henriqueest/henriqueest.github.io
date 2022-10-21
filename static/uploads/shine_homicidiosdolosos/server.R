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
# dados <- as.data.frame(dados)
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

mapa <- geobr::read_municipality(year = 2015)
colnames(mapa)[2] <- "Município"
colnames(mapa)[4] <- "uf"
head(dados)


# uf <- list("AC - Acre" = 1, "AM - Amazonas" = 2,"AL - Alagoas" = 3,
#            "AP - Amapá" = 4, "BA - Bahia" = 5, "CE - Ceará" = 6, "DF - Distrito Federal" = 7,
#            "ES - Espírito Santo" = 8, "GO - Goiás" = 9, "MA - Maranhão" = 10, "MG - Minas Gerais" = 11,
#            "MS - Mato Grosso do Sul" = 12, "MT - Mato Grosso" = 13, "PA - Pará" = 14, "PB - Paraíba" = 15,
#            "PE - Pernambuco" = 16, "PI - Piauí" = 17, "PR - Paraná" = 18, "RJ - Rio de Janeiro" = 19,
#            "RN - Rio Grande de Norte" = 20, "RO - Rondônia" = 21, "RR - Roraima" = 22,
#            "RS - Rio Grande do Sul" = 23, "SC - Santa Catarina" = 24, "SE - Sergipe" = 25,
#            "SP - São Paulo" = 26, "TO - Tocantins" = 27)


# dadosmicro <- dados %>%
#   group_by(uf, nome_munic)%>%
#   summarise(sum(populacao.2018), sum(populacao.2019), sum(populacao.2020), sum(homicidios.2018), sum(homicidios.2019), sum(homicidios.2020),
#             mean(Txmean201618), mean(Txmean201719), mean(Txmean201820))
# 
# uf <- list("AC - Acre" = 1, "AM - Amazonas" = 2,"AL - Alagoas" = 3,
#            "AP - Amapá" = 4, "BA - Bahia" = 5, "CE - Ceará" = 6, "DF - Distrito Federal" = 7,
#            "ES - Espírito Santo" = 8, "GO - Goiás" = 9, "MA - Maranhão" = 10, "MG - Minas Gerais" = 11,
#            "MS - Mato Grosso do Sul" = 12, "MT - Mato Grosso" = 13, "PA - Pará" = 14, "PB - Paraíba" = 15,
#            "PE - Pernambuco" = 16, "PI - Piauí" = 17, "PR - Paraná" = 18, "RJ - Rio de Janeiro" = 19,
#            "RN - Rio Grande de Norte" = 20, "RO - Rondônia" = 21, "RR - Roraima" = 22, 
#            "RS - Rio Grande do Sul" = 23, "SC - Santa Catarina" = 24, "SE - Sergipe" = 25, 
#            "SP - São Paulo" = 26, "TO - Tocantins" = 27)

# choice_mun <- dados$nome_munic

choice_mun <- as.factor(levels(dados$nome_munic))

choice_UF <- levels(as.factor(dados$uf))

# choice_micro <- dados$Nome_Microrregião

# choice_UF <- "Selecione a UF"

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

server <- function(input, output, session) {
  
  output$ui <- renderUI({
    if (is.null(input$selectUF))
      return()
    
    switch(input$selectUF,
           "AC" = selectInput("selectMun", label = "Município",
                             choices = choices_AC),
           "AL" = selectInput("selectMun", label = "Município",
                             choices = choices_AL),
           "AM" = selectInput("selectMun", label = "Município",
                             choices = choices_AM),
           "AP" = selectInput("selectMun", label = "Município",
                             choices = choices_AP),
           "BA" = selectInput("selectMun", label = "Município",
                             choices = choices_BA),
           "CE" = selectInput("selectMun", label = "Município",
                             choices = choices_CE),
           "DF" = selectInput("selectMun", label = "Município",
                             choices = choices_DF),
           "ES" = selectInput("selectMun", label = "Município",
                             choices = choices_ES),
           "GO" = selectInput("selectMun", label = "Município",
                             choices = choices_GO),
           "MA" = selectInput("selectMun", label = "Município",
                              choices = choices_MA),
           "MG" = selectInput("selectMun", label = "Município",
                              choices = choices_MG),
           "MS" = selectInput("selectMun", label = "Município",
                              choices = choices_MS),
           "MT" = selectInput("selectMun", label = "Município",
                              choices = choices_MT),
           "PA" = selectInput("selectMun", label = "Município",
                              choices = choices_PA),
           "PB" = selectInput("selectMun", label = "Município",
                              choices = choices_PB),
           "PE" = selectInput("selectMun", label = "Município",
                              choices = choices_PE),
           "PI" = selectInput("selectMun", label = "Município",
                              choices = choices_PI),
           "PR" = selectInput("selectMun", label = "Município",
                              choices = choices_PR),
           "RJ" = selectInput("selectMun", label = "Município",
                              choices = choices_RJ),
           "RN" = selectInput("selectMun", label = "Município",
                              choices = choices_RN),
           "RO" = selectInput("selectMun", label = "Município",
                              choices = choices_RO),
           "RR" = selectInput("selectMun", label = "Município",
                              choices = choices_RR),
           "RS" = selectInput("selectMun", label = "Município",
                              choices = choices_RS),
           "SC" = selectInput("selectMun", label = "Município",
                              choices = choices_SC),
           "SE" = selectInput("selectMun", label = "Município",
                              choices = choices_SE),
           "SP" = selectInput("selectMun", label = "Município",
                              choices = choices_SP),
           "TO" = selectInput("selectMun", label = "Município",
                              choices = choices_TO)
    )
    
  })
  
  
  observeEvent(input$filtrar, {
    opcaoSelecionadaUF <- input$selectUF
    opcaoSelecionada <- input$selectMun
    dadosFiltrados <- dados[dados$nome_munic == opcaoSelecionada & dados$uf == opcaoSelecionadaUF, ]
    dadosFiltrados <- as.data.frame(dadosFiltrados)
    column2 <- c(dadosFiltrados[1,32], dadosFiltrados[1,33], dadosFiltrados[1,34], 
                 dadosFiltrados[1,35], dadosFiltrados[1,36], dadosFiltrados[1,37],
                 dadosFiltrados[1,38], dadosFiltrados[1,39], dadosFiltrados[1,40],
                 dadosFiltrados[1,41], dadosFiltrados[1,42])
    dat_2 <- as.data.frame(column2)
    names(dat_2) <- c("Taxa média - Homicídios dolosos - SIM - Data - SUS")
    row.names(dat_2) <- c("2008 - 2010","2009 - 2011", "2010 - 2012", "2011 - 2013",
                          "2012 - 2014", "2013 - 2015", "2014 - 2016", "2015 - 2017", 
                          "2016 - 2018", "2017 - 2019", "2018 - 2020")
    
    column1 <- c(dadosFiltrados[1,20], dadosFiltrados[1,21], dadosFiltrados[1,22],
                 dadosFiltrados[1,23], dadosFiltrados[1,24], dadosFiltrados[1,25],
                 dadosFiltrados[1,26], dadosFiltrados[1,27], dadosFiltrados[1,28],
                 dadosFiltrados[1,29], dadosFiltrados[1,30], dadosFiltrados[1,31])
    dat_1 <- as.data.frame(column1)
    names(dat_1) <- c("População")
    row.names(dat_1) <- c("2009", "2010", "2011", "2012", "2013", "2014",
                          "2015", "2016", "2017", "2018", "2019", "2020")
    
    # output$População2018 <- renderText({
    #   dadosFiltrados[1,29]
    # })
    # 
    # output$População2019  <- renderText({ 
    #   dadosFiltrados[1,30] 
    # })
    # 
    # output$População2020 <- renderText({ 
    #   dadosFiltrados[1,31] 
    # })
    # 
    # output$Taxamedia20162018 <- renderText({ 
    #   dadosFiltrados[1,40] 
    # })
    # 
    # output$Taxamedia20172019 <- renderText({ 
    #   dadosFiltrados[1,41] 
    # })
    # 
    # output$Taxamedia20182020 <- renderText({ 
    #   dadosFiltrados[1,42] 
    # })
    
    
    # renderBarChart(div_id = "test_1", theme = "dark-digerati", direction = "vertical", grid_left = "10%", data = dat_1,
    #                bar.max.width = 15)
    
    renderLineChart(div_id = "test_2", theme = "dark-digerati", data = dat_2,  line.width = 10,
                    point.size = 12, point.type = "emptyCircle")
    
    # colnames(mapa)[1] <- "Município"
    mapaFiltrado <- mapa %>%
      filter(Município == opcaoSelecionada & uf == opcaoSelecionadaUF)
    
    
    mapaFiltrado <- sf::as_Spatial(mapaFiltrado)
    
    output$plot <-  renderLeaflet(
      leaflet(mapaFiltrado) %>%
        addProviderTiles("Esri.WorldStreetMap") %>% 
        addPolygons(weight = 2, color = "gray", fillColor = "blue") %>%
        addTiles()%>%
        addMiniMap()
    )
  })
}

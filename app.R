# From an application task from an interview  


library(tidyverse)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(rsconnect)
library(dplyr)

# setwd(...) in console when working locally
LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]  # remove unnecessary columns, I am using deciles not ranked positions
LA_List <- unique(LA_Dep$LA_name)
Dep_List <- colnames(LA_Dep)
Dep_List <- Dep_List[-1]    # first column is LA (Local Authority) name


ui <- fluidPage(
  titlePanel("Comparing deprivation scores between English local authorities"),
  sidebarLayout(
    sidebarPanel(
    selectInput(inputId = "First_LA_name", label = "First local authority",
            choices = LA_List, selected = "Kingston upon Hull, City of"),
    selectInput(inputId = "Second_LA_name", label = "Second local authority", 
            choices = LA_List, selected = "Watford"),
    selectInput(inputId = "Dep_Compare", label = "Type of deprivation", 
                choices = Dep_List, selected = "health"),
    helpText("Are you expecting local authorities across England to display similar distributions of education, health, crime etc, even when ordered by rank rather than scalar values?  Most histograms here do display similar and acceptable patterns that fit with my experience of living in Ealing, Manchester, Liverpool, Wandsworth and Winchester over the past four decades.  Many areas (LSOAs) in any local authority are struggling in one way or another, but overall it balances out.  Then I saw the health deciles for Blackpool ... and could not argue with the RT\'s RSS feed from 15th July 2021, \"The UK is the most unequal society in the developed world.\"  (The widely used IMD is represented here as \"combined\".  Data downloaded in July 2021 from https://www.gov.uk/ government/statistics/ english-indices-of-deprivation-2019)"),
        ),
  mainPanel(plotOutput("First_Plot"),
            plotOutput("Second_Plot")
            )
  )
)

server <- function(input, output) {
  output$First_Plot <- renderPlot({

    LA_Dep_Compare <- filter(LA_Dep, LA_name %in% c(input$First_LA_name, input$Second_LA_name))
    rownames(LA_Dep_Compare)<-1:nrow(LA_Dep_Compare)
    LA_Dep_Compare <- data.frame(LA_Dep_Compare)
    
    Min_Decile <- min(LA_Dep_Compare[,2])   # finessing bin numbers along the eventual y-axis
    Max_Decile <- max(LA_Dep_Compare[,2])        
    nBins <- 1 + Max_Decile - Min_Decile

    ggplot(LA_Dep_Compare, aes_string( x = input$Dep_Compare )) +
      geom_histogram(bins = nBins, colour = "#CC0000", fill = "#EE000060",
                   data = LA_Dep_Compare[LA_Dep_Compare$LA_name %in% input$First_LA_name,]) +
      geom_histogram(bins = nBins, colour = "#00CC00", fill = "#00EE0060",
                     data = LA_Dep_Compare[LA_Dep_Compare$LA_name %in% input$Second_LA_name,]) +
      scale_x_continuous( breaks = seq(Min_Decile, Max_Decile, 1) ) +
      coord_flip() +
      labs(title = paste("Comparing peoples\'", input$Dep_Compare,"deprivation levels between", input$First_LA_name, "(red) and", input$Second_LA_name, "(green)"),  
        x = "Decile rank in England  (higher is better)",
        y = "LSOA (small district) count" ) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_rect( fill = "white", colour = "white" ),
        axis.line = element_line( colour = "#5A5A7A" ))
  })
}

shinyApp(ui = ui, server = server)
# later expansions:  
#     allow domains other than health, eg income or IMD, to be selected

library(tidyverse)
library(ggplot2)
library(shiny)
library(shinydashboard)
library(rsconnect)
library(dplyr)


LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]  # remove columns, I am using deciles not ranked positions
LA_List <- unique(LA_Dep$LA_name)

ui <- fluidPage(
  titlePanel("Comparing deprivation scores between English local authorities"),
  sidebarLayout(
    sidebarPanel(
    selectInput(inputId = "First_LA_name", label = "First local authority",
            choices = LA_List, selected = "Kingston upon Hull, City of"),
    selectInput(inputId = "Second_LA_name", label = "Second local authority", 
            choices = LA_List, selected = "Watford"),
    helpText("Are you expecting local authorities across England to display similar distributions of education, health, crime etc, even when ordered by rank rather than scalar values?  Most histograms do display similar and acceptable patterns that fit with my experience of living in Ealing, Manchester, Liverpool, Wandsworth and Winchester over the past four decades.  Many areas (LSOAs) in any local authority are struggling in one way or another, but overall it balances out. \n \n  Then I saw the health deciles for Blackpool ... and could not argue with the RSS feed from RT broadcast on 15th July 2021, \'The UK is the most unequal society in the developed world.\'  (Data downloaded in July 2021 from https://www.gov.uk/ \n government/statistics/ \n english-indices-of-deprivation-2019)"),
        ),
  mainPanel(plotOutput("First_Plot"),
            plotOutput("Second_Plot")
            )
  )
)

server <- function(input, output) {
  # extract max and min decile values here to pass to scale_x_continuous(breaks = seq(EitherMin, EitherMax, 1))
  output$First_Plot <- renderPlot({
    # prepare to print correct range of integers for decile values
    Filtered_Dep <- filter(LA_Dep, LA_name %in% c(input$First_LA_name, input$Second_LA_name))
    Min_Decile <- min(Filtered_Dep$Health_decile)
    Max_Decile <- max(Filtered_Dep$Health_decile)
    nBins <- 1 + Max_Decile - Min_Decile
    
    ggplot(LA_Dep, aes(x = Health_decile)) +
    geom_histogram(bins = nBins, colour = "#CC0000", fill = "#EE000060",
                   data = LA_Dep[LA_Dep$LA_name %in% input$First_LA_name,]) +
      geom_histogram(bins = nBins, colour = "#00CC00", fill = "#00EE0060",
                     data = LA_Dep[LA_Dep$LA_name %in% input$Second_LA_name,]) +
    scale_x_continuous(breaks = seq(Min_Decile, Max_Decile, 1)) +
    coord_flip() +
    labs(title = paste("Comparing health of population in", input$First_LA_name, "(red) with", input$Second_LA_name, "(green)"),
      x = "Decile rank in England  (higher is better)",
      y = "LSOA (small district) count" ) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = 'white', colour = 'white'),
      axis.line = element_line(colour = "#5A5A7A"))
  })
}

shinyApp(ui = ui, server = server)
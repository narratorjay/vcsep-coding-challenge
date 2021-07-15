# later expansions:  
#     allow domains other than health, eg income or IMD, to be selected

library(tidyverse)
library(ggplot2)
library(shiny)
library(rsconnect)
library(dplyr)
setwd("C:\\Users\\Jay\\c3\\redcross")   # if needed

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]  # remove columns, using deciles not ranked positions
LA_List <- unique(LA_Dep$LA_name)

ui <- fluidPage(
  titlePanel("Comparing deprivation scores between English local authorities"),
  sidebarLayout(
    sidebarPanel(
    selectInput(inputId = "First_LA_name", label = "First local authority",
            choices = LA_List, selected = "Kingston upon Hull, City of"),
    selectInput(inputId = "Second_LA_name", label = "Second local authority", 
            choices = LA_List, selected = "Watford"),
    ),
  mainPanel(plotOutput("First_Plot"),
            plotOutput("Second_Plot")
            )
  )
)

server <- function(input, output) {
  output$First_Plot <- renderPlot({
    ggplot(LA_Dep, aes(x = Health_decile)) +
    geom_histogram(bins = 10, colour = "#CC0000", fill = "#EE000060",
                   data = LA_Dep[LA_Dep$LA_name %in% input$First_LA_name,]) +
    coord_flip() +
    labs(title = paste("Relative health of population in local authority district", input$First_LA_name),
      x = "Decile score in England  (higher is better)",
      y = "LSOA count with that health score" ) +
    theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
      panel.background = element_rect(fill = 'white', colour = 'white'),
      axis.line = element_line(colour = "#BB0000"))
  })
  output$Second_Plot <- renderPlot({
    ggplot(LA_Dep, aes(x = Health_decile)) +
      geom_histogram(bins = 10, colour = "#0000CC", fill = "#0000EE60",
                     data = LA_Dep[LA_Dep$LA_name %in% input$Second_LA_name,]) +
      coord_flip() +
      labs(title = paste("Relative health of population in local authority district", input$Second_LA_name),
           x = "Decile score in England  (higher is better)",
           y = "LSOA count with that health score" ) +
      theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
            panel.background = element_rect(fill = 'white', colour = 'white'),
            axis.line = element_line(colour = "#0000BB"))
  })  
}

shinyApp(ui = ui, server = server)
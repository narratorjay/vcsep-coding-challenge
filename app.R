# Shiny task  # run setwd("C:\\Users\\Jay\\c3\\redcross"), plot.new()  if needed 

#library(tidyverse)
library(ggplot2)
library(shiny)
library(rsconnect)


# later expansions:  
  # display two charts side-by-side because people like comparing things
  # allow domains other than health, eg income or IMD, to be selected

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')

# remove unwanted columns and prepare Local Authority list to select from 
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]
LA_List <- unique(unlist(LA_Dep$LA_name))  # was unique(unlist(LA_Dep$LA_name, use.names = FALSE))


ui <- fluidPage(
  title("Compare the Health of Two English Local Authorities"),
  inputPanel(
    selectInput("First_LA_name", label = "First local authority",
            choices = LA_List, selected = "Kingston upon Hull, City of"),
    selectInput("Second_LA_name", label = "Second local authority", 
            choices = LA_List, selected = "Watford")
  ),
  
  mainPanel(plotOutput("First_Plot"))
) 


server <- function(input, output) {

output$First_Plot <- renderPlot({
  
#ggplot(mpg, aes_string(x = input$x)

  First_LA_scores <- data.frame(filter(LA_Dep, LA_List %in% input$First_LA_name))
  #First_LA_scores <- data.frame(filter(LA_Dep, "Watford" %in% input$First_LA_name))
  
  '''
  ggplot(First_LA_scores, aes(First_LA_scores$Health_decile)) + 
  geom_histogram(bins=10, colour = "#0000CC", fill = "#0000EE60") + 
  coord_flip() + 
  labs(title = paste("Relative health of population in local authority district", input$First_LA_name),
       x = "Decile score in England  (higher is better)",
       y = "LSOA count with that health score" ) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
        panel.background = element_rect(fill = 'white', colour = 'white'), 
        axis.line = element_line(colour = "#0000BB")) 
  '''
  })

}
shinyApp(ui = ui, server = server)
# Shiny task   
library(tidyverse)
library(ggplot2)
library(shiny)
library(rsconnect)
library(dplyr)
setwd("C:\\Users\\Jay\\c3\\redcross")   # plot.new()  if needed

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]
plot.new()




# later expansions:  
  # display two charts side-by-side because people like comparing things
  # allow domains other than health, eg income or IMD, to be selected

# remove unwanted columns from Local Authority list to display from


ui <- fluidPage(
  titlePanel("Comparing English Local Authorities"),
  flowLayout(
    selectInput(inputId = "First_LA_name", label = "First local authority",
            choices = unique(LA_Dep$LA_name), selected = "Kingston upon Hull, City of"),
    selectInput(inputId = "Second_LA_name", label = "Second local authority", 
            choices = unique(LA_Dep$LA_name), selected = "Watford"),
  #),
  mainPanel()
  ),
) 



server <- function(input, output) {

}

shinyApp(ui = ui, server = server)



# insert what follows into function(input, output)
# output$First_Plot <- renderPlot({
# 
# #ggplot(mpg, aes_string(x = input$x)
# 
#   First_LA_scores <- data.frame(filter(LA_Dep, LA_List %in% input$First_LA_name))
#   #First_LA_scores <- data.frame(filter(LA_Dep, "Watford" %in% input$First_LA_name))
# 
# 
#   ggplot(First_LA_scores, aes(First_LA_scores$Health_decile)) +
#   geom_histogram(bins=10, colour = "#0000CC", fill = "#0000EE60") +
#   coord_flip() +
#   labs(title = paste("Relative health of population in local authority district", input$First_LA_name),
#        x = "Decile score in England  (higher is better)",
#        y = "LSOA count with that health score" ) +
#   theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
#         panel.background = element_rect(fill = 'white', colour = 'white'),
#         axis.line = element_line(colour = "#0000BB"))
# 
# })



#this is copied from the barley seed demo:
# ui <- fluidPage(
#   titlePanel("Le pain se lève"),
#   sidebarLayout(
#     sidebarPanel(                   #inputPanel(  # was used across the top
#       selectInput(inputId = "gen", label = "1. Select genotype",
#                   choices = unique(Barley$gen), selected = "a"),
#       selectInput(inputId = "colour", label = "2. Select colour",
#                   choices = c("blue", "green", "red", "purple", "grey"),
#                   selected = "grey"),
#       sliderInput(inputId = "bin", label = "3. Select histogram bin quantity",
#                   min = 1, max = 25, value = c(10)),
#       textInput(inputId = "text",
#                 label = "Some explanatory sentences should appear here.")
#     ),
#     mainPanel()
#   )
# )

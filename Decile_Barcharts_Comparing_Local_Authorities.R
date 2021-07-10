library(tidyverse)
library(dplyr)
library(ggplot2)
setwd("C:\\Users\\Jay\\c3\\redcross")          # remove before uploading

LA_Dep <- read.csv('Edited_Domains_of_Deprivation.csv')

# use only deciles for barcharts, remove all odd (and one even-numbered) columns containing rank info etc
LA_Dep <- LA_Dep[, -c(2, seq(1, 19, 2))]

# user will select two values from LA_name to compare deprivation between two areas
area_A = "Adur"
area_B = "Birmingham"

#area_A_stats <-  filter(LA_Dep, LA_name == area_A)
#area_A_DF <- data.frame(area_A_stats)
#area_A_health <- area_A_stats$Health_decile

area_A_scores <- data.frame(filter(LA_Dep, LA_name == area_A))

#ggplot(area_A_health, aes(area_A_stats$Health_decile)) +
ggplot(area_A_scores, aes(Health_decile)) +
  geom_histogram(bins=10) + 
  coord_flip() + 
  labs(title = paste("Relative health scores of population in Local Authority District", area_A),
       x = "Health decile relative all of England, \"1\" is worst",
       y = "LSOA count  (an LSOA is electoral ward-sized or smaller)" )
       #theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
      #       panel.background = element_rect(fill = 'white', colour = 'white')))


#ggplot(df,aes(x))+geom_histogram(bins=30)+coord_flip()


#LA_Dep %>% filter(LA_name == area_A) 
#LA_a <- LA_Dep[LA_Dep$LA_name == "Adur", ]

# suggest stick to health for now to keep display clean
# bring out noise over bias after reading Daniel Kahneman's book
# and add comments that intervention would likely be effective anywhere


#CleanBase <- 
#  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
#        panel.background = element_rect(fill = 'white', colour = 'white'), 
#        axis.line = element_line(colour = "white"), legend.position = "none",
#        axis.text.x = element_blank(), axis.ticks.x = element_blank(),
#        axis.text.y = element_blank(), axis.ticks.y = element_blank())

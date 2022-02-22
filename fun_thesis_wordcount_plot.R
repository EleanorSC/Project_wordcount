## ---------------------------
##
## Notes: Thesis word count plot
##        Takes excel document with word count per day and creates a plot
##        Similiar to github's contribution page, Inspired by Example Viridis Plot
##   
##   
##
## Packages: install.packages("season")
##   
##   
##   
## ---------------------------


thesis_wordcount <- readxl::read_excel("thesis_wordcount.xlsx")

library(ggplot2)
library(viridis)
library(season)
library(gridExtra)
library(tidyverse)
library(magrittr)

#thesis_wordcount <- select(-(""))
#thesis_wordcount <- thesis_wordcount[-c(247), ]

###
plot <- thesis_wordcount

# reorder 
plot %<>% mutate(day = factor(day, levels=c("Sunday",
                                            "Saturday",
                                            "Friday",
                                            "Thursday",
                                            "Wednesday",
                                            "Tuesday",
                                            "Monday")))

#group_by(month, week)
##
#concatenate month and week
plot$month_week <- paste(plot$month, plot$week)

plot %<>% mutate(month_week = factor(month_week,
                                     levels = c(
                                       "Oct 4",
                                       "Oct 3",
                                       "Oct 2",
                                       "Oct 1",
                                       "Sep 4",
                                       "Sep 3",
                                       "Sep 2",
                                       "Sep 1",
                                       "Aug 4",
                                       "Aug 3",
                                       "Aug 2",
                                       "Aug 1",
                                       "July",
                                       "July 4",
                                       "July 3",
                                       "July 2",
                                       "July 1",
                                       "Jun 4",
                                       "Jun 3",
                                       "Jun 2",
                                       "Jun 1",
                                       "May 4",
                                       "May 3",
                                       "May 2",
                                       "May 1",
                                       "Apr 4",
                                       "Apr 3",
                                       "Apr 2",
                                       "Apr 1",
                                       "Mar 4",
                                       "Mar 3",
                                       "Mar 2",
                                       "Mar 1",
                                       "Feb 4",
                                       "Feb 3",
                                       "Feb 2",
                                       "Feb 1")))




ggplot(plot, 
       aes(fct_rev(month_week),
           day, 
           fill = wordcount_day)) +
  
  geom_tile(colour="gray20", 
            size=1.5, 
            stat="identity") + 
  
  viridis::scale_fill_viridis(option="A") +
  xlab("Month") + 
  ylab("") +
  
  theme(
    plot.title = element_text(color="white",hjust=0,vjust=1, size=rel(2)),
    plot.background = element_rect(fill="gray20"),
    panel.background = element_rect(fill="gray20"),
    panel.border = element_rect(fill=NA,color="gray20", size=0.5, linetype="solid"),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_blank(),
    axis.ticks = element_blank(), 
    axis.text = element_text(color="white", size=rel(1.5)),
    axis.text.y  = element_text(hjust=1),
    legend.text = element_text(color="white", size=rel(1.3)),
    legend.background = element_rect(fill="gray20"),
    legend.position = "bottom",
    legend.title=element_blank()
  )










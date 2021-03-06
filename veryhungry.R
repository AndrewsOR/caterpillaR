#------------- Read the text into a table ----------------
library(data.table)

data_wide <- fread( file = 'food.txt', 
                    sep = ':', 
                    header = FALSE,
                    col.names = c('weekday','food')
                    )

#------------- Reshape the data ---------------------------

data_long <- data_wide[, .( day_number = .I, 
                            food = trimws( 
                                     unlist( 
                                       strsplit(food, '\\|') 
                                       ) 
                                     )
                            ), by = weekday ]

to_factor <- function(s) factor(s, levels=unique(s))

data_long[, `:=`( weekday = to_factor(weekday) ,
                  food    = to_factor(food)    
                  )]

#------------- Summarize the data --------------------------

food_count <- data_long[, .( food_count = .N 
                             ), keyby = .(day_number, weekday, food) ]

daily_total <- food_count[, .(items_eaten = sum(food_count)
                              ), keyby= .(day_number, weekday)]

#------------ Plot the data --------------------------------

library(ggplot2)
source('style.R')

max_items <- daily_total[, max(items_eaten) ]

p <- 
  ggplot(data=food_count, 
         aes(x=weekday,y=food_count, fill=food)) + 
    geom_bar(stat='identity') +
    scale_fill_manual(values = food_colors, breaks = names(food_colors)) +
    scale_y_continuous(breaks=1:max_items,
                       minor_breaks = NULL) +
    labs(title='What did the Caterpillar Eat?', 
         x='Day',
         y='Total Items') + 
    barplot_style

library(plotly)
ggplotly(p)


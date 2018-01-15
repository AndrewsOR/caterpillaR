library(ggplot2)
library(plotly)
source('working_with_data.R')
source('style.R')


#------ What did the caterpillar eat? -------------------

plot_bar <- 
  ggplot(data=food_count, 
         aes(x=weekday,y=food_count, fill=food)) + 
    geom_bar(stat='identity') +
    scale_fill_manual(values = food_colors) +
    scale_y_continuous(breaks=1:max_items,
                       minor_breaks = NULL) +
    labs(title='What did the caterpillar eat?', 
         x='Day',
         y='Number of items') + 
    theme1

ggplotly(plot_bar)


#------ How many items did the caterpillar eat? ----------

plot_line <- 
  ggplot(data=daily_total,
         aes(x=day_number, y=items_eaten))+
  geom_point(col=caterpillar_colors['body1'],size=6) +
  geom_line(col=caterpillar_colors['body2'],size=2) + 
  scale_y_continuous(limits=c(0,max_items),
                     breaks=0:max_items,
                     minor_breaks = NULL) +
  scale_x_continuous(breaks=daily_total$day_number,
                     labels=as.character(daily_total$weekday) )+
  labs(title='How much did the caterpillar eat?', 
       x='Day',
       y='Number of items') +
  theme1

ggplotly(plot_line)


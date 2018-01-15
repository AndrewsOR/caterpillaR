library(data.table)

#------------- Read the text into a table ----------------

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

max_items <- daily_total[, max(items_eaten) ]

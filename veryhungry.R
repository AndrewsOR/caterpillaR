#------------- Read the data into a table ----------------
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

#------------- Summarize the data --------------------------

food_count <- data_long[, .( things_eaten = .N 
                             ), keyby = .(day_number, weekday) ]

food_colors = c(apple='red4',
                pear='chartreuse',
                plum='purple',
                strawberry = 'red1',
                orange=
                )
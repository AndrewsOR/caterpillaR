library(ggplot2)

#' Color palette for foods eaten by The Very Hungry Caterpillar
#' Vector of colors indexed to food names
#' (same names as in food.txt)
food_colors <- c( apple             = 'red4'        ,
                  pear              = 'chartreuse'  ,
                  plum              = 'purple'      ,
                  strawberry        = 'red2'        ,
                  orange            = 'darkorange1' ,
                  pickle            = 'chartreuse4' ,
                  `chocolate cake`  = 'chocolate'   ,
                  `ice cream cone`  = 'beige'       , 
                  `swiss cheese`    = 'yellow'      ,
                  salami            = 'darksalmon'  ,
                  lollipop          = 'blue'        ,
                  `cherry pie`      = 'red3'        ,
                  sausage           = 'saddlebrown' ,
                  cupcake           = 'pink'        ,
                  watermelon        = 'red1'        ,
                  `nice green leaf` = 'darkgreen'   )

#' Color palette for drawing a caterpillar
#' Vector of colors indexed to caterpillar part names
#' (same indices as caterpillar_scale)
caterpillar_colors <- c( body1 = 'darkgreen'   ,
                         body2 = 'chartreuse4' ,
                         head  = 'red'         ,
                         eye   = 'yellow'      ,
                         pupil = 'brown'       )

#' Part size for drawing a caterpillar
#' Vector of numeric indexed to caterpillar part names
#' (same indices as caterpillar_colors)
caterpillar_scale <- c( 'body1' = 50,
                        'body2' = 50,
                        'head'  = 50,
                        'eye'   = 15,
                        'pupil' =  8 )

theme1 <- 
  theme_minimal(base_size=20) + 
  theme( 
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()
  )
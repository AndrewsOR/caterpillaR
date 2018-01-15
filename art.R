library(ggplot2)
source('style.R')

#------- Draw a caterpillar with dots! --------------

# n is number of dots you want in the body, then the head
n <- 11 
body      <- data.frame(x=seq(-n,n,2)/n) 
body$y    <- (cos(body$x*pi)/2+1/2)^1.5
body$type <- c(rep(c('body1','body2'), 
                   length.out=nrow(body)-1),
               'head')

# Now add eyes (with pupils) to the head
eye_offset <- diff(body$x)[1]/1.6

eyes <- data.frame(x=1+eye_offset*c(-1,1),
                   y=0+eye_offset,
                   type=rep('eye',2) )

# Pupils are centered on eyes, but different size
pupils      <- eyes 
pupils$type <- 'pupil'


# Since these are all just dots of different colors and sizes,
# we can combine them into a single data.frame
dots <- rbind(body, eyes, pupils)

# Plot statement
caterplot <- 
  ggplot( data = dots, aes(x, y) ) + 
    geom_point( aes(col=type, size=type) ) +
    scale_color_manual( values = caterpillar_colors, guide=FALSE) +
    scale_size_manual(  values = caterpillar_scale,  guide=FALSE) +
    xlim( range(body$x) + c(-1,1)/4 ) +
    ylim( range(body$y) + c(-1,1)/2 ) +
    theme_void()

# Output to a graphics device (jpeg image file)
jpeg(file='caterplot.jpg', width=600, height=400) # size of image
  print(caterplot)
dev.off()
  
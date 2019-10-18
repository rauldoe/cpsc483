install.packages("ggplot2")
library(ggplot2) # load the ggplot library
#Add Data
x <-c(	45,	36,	37,	43,	38,	49,	39,	43,	44,	38,	42,	40)
y <-c(	43,	35,	34,	41,	44,	44,	42,	46,	39,	39,	47,	39)
t <- data.frame("x" = x, "y" = y)
fun.1 <- function(x) 16.426 + 0.599 * x
myplot <- ggplot(data=t) + 
    geom_point(mapping=aes(x=x,y=y)) + 
    stat_function(fun = fun.1) + 
    ggtitle("Survey of Students Interest in a Class") + 
    theme(plot.title = element_text(hjust = 0.5)) +
    xlab("# of Students Interested in a Class") + 
    ylab("# of Students that Actually Enrolled")
myplot


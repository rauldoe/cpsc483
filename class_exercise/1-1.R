
library(ggplot2)
library(tidyverse)

parialDeriveJ <- function(){
  
}

# setwd("/Users/mikedo/Desktop")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_483_data_mining/class_exercise")
# setwd("C:/temp/cpsc483/class_exercise")

data <- read.csv("dataSetLogisticRegression.txt", header = FALSE)
colnames(data) <- c("x", "y", "z")

xyMatrix = data.matrix(data[,1:2])
colnames(xyMatrix) <- c("x", "y")

clMatrix = data.matrix(data[,3])
colnames(clMatrix) <- c("z")

# matrix(c(c(2, 4, 3), c(1, 5, 7)), nrow=2, ncol=3, byrow=TRUE)
thetaMatrix <- matrix(c(0, 0, 0), nrow=3, ncol=1, byrow=TRUE)
p <- ggplot(data = data)
graph = 
  p +
  geom_point(mapping=aes(x=x, y=y, color=z))

graph

hFunction <- function(x, theta0, theta1) {
  return (theta0 + theta1*x);  
}

itemCostFunction <- function(x, y, theta0, theta1) {
  return (hFunction(x, theta0, theta1) - y)^2;
}

itemCostTheta0Function <- function(x, y, theta0, theta1) {
  return (hFunction(x, theta0, theta1) - y);
}

itemCostTheta1Function <- function(x, y, theta0, theta1) {
  #print(paste("x: ", x, " y: ", y))
  return ((hFunction(x, theta0, theta1) - y)*x);
}

costFunction <- function(matrixDataFrame, theta0, theta1) {
  m <- nrow(matrixDataFrame)
  preJ = 1/(2*m)
  itemList <- matrixDataFrame %>% mutate(itemCost = itemCostFunction(x, y, theta0, theta1)) %>% select(itemCost)
  return (preJ*sum(itemList$itemCost));
}

gradientDescentTheta0Function <- function(matrixDataFrame, theta0, theta1, alpha) {
  m <- nrow(matrixDataFrame)
  #print(paste("m: ", m, " alpha: ", alpha))
  itemList <- matrixDataFrame %>% mutate(itemCost = itemCostTheta0Function(x, y, theta0, theta1)) %>% select(itemCost)
  #print(paste("sum0: ", sum(itemList$itemCost)))
  return (alpha*(1/m)*sum(itemList$itemCost));
}

gradientDescentTheta1Function <- function(matrixDataFrame, theta0, theta1, alpha) {
  m <- nrow(matrixDataFrame)
  itemList <- matrixDataFrame %>% mutate(itemCost = itemCostTheta1Function(x, y, theta0, theta1)) %>% select(itemCost)
  #print(paste("sum1: ", sum(itemList$itemCost)))
  return (alpha*(1/m)*sum(itemList$itemCost));
}

gradientDescentStepFunction <- function(matrixDataFrame, theta0, theta1, alpha) {
  
  cost <- costFunction(matrixDataFrame, theta0, theta1)

  oldTheta0 <- theta0
  oldTheta1 <- theta1
  
  theta0 <- oldTheta0 - gradientDescentTheta0Function(matrixDataFrame, oldTheta0, oldTheta1, alpha)
  theta1 <- oldTheta1 - gradientDescentTheta1Function(matrixDataFrame, oldTheta0, oldTheta1, alpha)
  
  gds <- c(cost, theta0, theta1, oldTheta0, oldTheta1)

  return (gds);
}

gradientDescentFunction <- function(matrixDataFrame, theta0, theta1, alpha, maxRun) {
  for (i in 1:maxRun) {
    gd <- gradientDescentStepFunction(matrixDataFrame, theta0, theta1, alpha)
    print(gd)
    theta0 <- gd[2]
    theta1 <- gd[3]
  }
  
  return (gd);
}

# setwd("/Users/mikedo/Desktop")
setwd("C:/Users/kdo1/Google Drive/School/CSUF_Class/CPSC_483_data_mining/class_exercise")

data1 <- read.csv("dataSet1.txt", header = FALSE)
colnames(data1) <- c("x", "y")

p <- ggplot(data = data1)
graph = 
  p +
  geom_point(mapping=aes(x=data1$x, y=data1$y))

theta0 <- 0
theta1 <- 0
alpha <- 0.01
maxRun <- 200
gd <- gradientDescentFunction(data1, theta0, theta1, alpha, maxRun)
theta0 <- gd[2]
theta1 <- gd[3]
graph


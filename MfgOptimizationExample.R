setwd("C:/Users/sakusuma/Downloads")

# install.packages("lpSolve")
library(lpSolve)

# Setting up of coefficients of decision variables
objective.in= c(25, 20)

#Constraint Matrix
const.mat = matrix(c(20,12,5,5), nrow = 2, byrow = T)

#defining constraints
const_time = 540
const_res = 2000

#RHS for constraints
const.rhs = c(const_res, const_time)

#Direction for constraints
const.dir=c("<=","<=")

#Finding the optimum solution:
opt=lp(direction = "max",objective.in, const.mat, const.dir, const.rhs)
summary(opt)

#Objective values of x and y
opt$solution

#Value of objective function at optimal point
opt$objval
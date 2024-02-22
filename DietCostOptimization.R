# Problem Statement: https://www.analyticsvidhya.com/blog/2017/02/lintroductory-guide-on-linear-programming-explained-in-simple-english/
# diet should have atleast 500 cal, 6 grma sof protein, 10 gms of carbs, 8 gms of fat
#Obj function is to minimize the cost

# Min Z = 0.5A+0.2B+0.3C+0.8D
# Setting up of coefficients of decision variables
objective.in= c(0.5, 0.2, 0.3, 0.8)

# 4A+2B+1.5C+5D>=5
# 3A+2B>=6
# A+B+2C+2D>=5
# 2A+4B+C+5D>=8

#Constraint Matrix
const.mat = matrix(c(4,2,1.5,5,3,2,0,0,1,1,2,2,2,4,1,5), nrow = 4, byrow = T)

#defining constraints
const_cal = 5
const_prot = 6
const_carb = 5
const_fat = 8
#RHS for constraints
const.rhs = c(const_cal, const_prot, const_carb, const_fat)

#Direction for constraints
const.dir=c(">=",">=",">=",">=")

#Finding the optimum solution: Minimize the cost
opt=lp(direction = "min",objective.in, const.mat, const.dir, const.rhs)
summary(opt)

#Objective values of x and y
opt$solution

#Value of objective function at optimal point
opt$objval
# Load the libraries
library(Matrix)
library(grid)
#install.packages("arules")
library(arules)
#install.packages("arulesViz")
library(arulesViz)
# Load the data set
Groceries <-read.csv('Users/IllaMelo/Área de Trabalho/Data Mining/Apriori/Groceries.csv')
# Get the rules
rules <- apriori(Groceries, parameter = list(supp = 0.001, conf = 0.8))
# Create an item frequency plot for the top 20 items
itemFrequencyPlot(items(rules) ,topN=20,type="absolute")
# Show the top 5 rules, but only 2 digits
options(digits=2)
inspect(rules[1:5])
# Show the graphics
plot(rules,method="graph",shading=NA)
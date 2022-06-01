library(ordinal)
# The package ordinal provides the dataset 'wine'
model <- clm(rating ~ temp * contact, scale=~contact, data=wine)
anova(model)

# Simple Linear Regression

# Importing the dataset
dataset = read.csv('Salary_Data.csv')
# dateset = dataset[,2:3]

# Siplitting the dataset into the Training set and Test set
# install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)

# Feature Scaling
# training_set[,2:3] = scale(training_set[,2:3])
# test_set[,2:3] = scale(test_set[,2:3])

# Fitting Simple Linear Regression to the Training Set
regressor = lm(formula = Salary ~ YearsExperience,
               data = training_set)

# Predicting the Test Set Results
y_pred = predict(regressor, newdata = test_set)

# Visualising the Training Set Results 
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             colour = 'red') +
  geom_line(aes(x= training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Training Set)') + 
  xlab('Year of Experience') + 
  ylab('Salary')

# Visualising the Test Set Results 
# install.packages('ggplot2')
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             colour = 'red') +
  geom_line(aes(x= training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            colour = 'blue') +
  ggtitle('Salary vs Experience(Test Set)') + 
  xlab('Year of Experience') + 
  ylab('Salary')
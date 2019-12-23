# Prediction-of-premature-birth-due-to-smoking-and-maternal-malnutrition
According to the web site http://www.keepkidshealthy.com, risk factors associated with premature births
include smoking and maternal malnutrition. A birth is consider premature if the gestation period is less than 37 full
weeks. Also note that the body mass index(BMI) can be used as a measure of malnutrition. Do you find this to be
true with the data in babies provided in the UsingR package?<br>
## Objectives:
- Extract the variables of interest: gestation, smoking status, mother’s height and weight, and birth weight of the
babies. 
- Clean the data set as there are some missing values coded as 9, 99, or 999. 
- Calculate the BMI of mothers.
- Create indicator variable( 1 for premature and 0 for not premature) babies.
- Fit a logistic regression model with smoke and BMI as a predictor variable and premature as a response variable.

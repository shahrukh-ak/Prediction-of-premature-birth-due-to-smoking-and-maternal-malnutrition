#Based on the R code below it appears that there are 27 variables included in the dataset.

library(MASS)
data(Cars93)
attach(Cars93)
dim(Cars93)
[1] 93 27

#We use R code below to estimate the model parameters

library(MASS)
data(Cars93)
attach(Cars93)
model=lm(MPG.city~EngineSize+Weight+Passengers+Price)
model
Call:
  lm(formula = MPG.city ~ EngineSize + Weight + Passengers + Price)

Coefficients:
  (Intercept)   EngineSize       Weight   Passengers        Price  
    46.389413     0.196119    -0.008207     0.269622    -0.035804  

#Hence, the desired regression model is
    
#MPG.city = 46.3894+0.1961×EngineSize−0.0082×Weight+0.2696×Passengers−0.0358×Price

#We use R code below to test the significance of the model parameters
library(MASS)
data(Cars93)
attach(Cars93)
model=lm(MPG.city~EngineSize+Weight+Passengers+Price)
summary(model)
Call:
  lm(formula = MPG.city ~ EngineSize + Weight + Passengers + Price)

Residuals:
  Min      1Q  Median      3Q     Max 
-6.1207 -1.9098  0.0522  1.1294 13.9580 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 46.389413   2.097516  22.116  < 2e-16 ***
  EngineSize   0.196119   0.588880   0.333    0.740    
Weight      -0.008207   0.001343  -6.111 2.63e-08 ***
  Passengers   0.269622   0.424951   0.634    0.527    
Price       -0.035804   0.049179  -0.728    0.469    
---
  Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 3.06 on 88 degrees of freedom
Multiple R-squared:  0.7165,	Adjusted R-squared:  0.7036 
F-statistic: 55.59 on 4 and 88 DF,  p-value: < 2.2e-16

#It appears that the Weight is the significance variable to determine the City MPG.

#Using R code below we can perform the model selection using AIC criteria

best=stepAIC(model)
Start:  AIC=212.87
MPG.city ~ EngineSize + Weight + Passengers + Price

Df Sum of Sq     RSS    AIC
- EngineSize  1      1.04  824.89 210.99
- Passengers  1      3.77  827.62 211.29
- Price       1      4.96  828.82 211.43
<none>                     823.85 212.87
- Weight      1    349.67 1173.52 243.77

Step:  AIC=210.99
MPG.city ~ Weight + Passengers + Price

Df Sum of Sq     RSS    AIC
- Passengers  1      3.20  828.10 209.35
- Price       1      4.84  829.74 209.53
<none>                     824.89 210.99
- Weight      1    627.12 1452.01 261.57

Step:  AIC=209.35
MPG.city ~ Weight + Price

Df Sum of Sq     RSS    AIC
- Price   1     11.96  840.05 208.68
<none>                 828.10 209.35
- Weight  1   1050.34 1878.44 283.52

Step:  AIC=208.68
MPG.city ~ Weight

Df Sum of Sq     RSS    AIC
<none>                 840.05 208.68
- Weight  1    2065.5 2905.57 322.09

#It appears that the model containing only regressor variable Weight is the best model
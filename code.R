#We use R code below to extract the variables of interest

library(UsingR)
data(babies)
data=subset(babies,select=c("gestation","smoke","wt1","ht","wt"))
dim(data)
[1] 1236 5
head(data,5)

gestation smoke wt1 ht wt
1 284 0 100 62 120
2 282 0 135 64 113
3 279 1 115 64 128
4 999 3 190 69 123
5 282 1 125 67 108

#We clean the data set using the following R code:

library(UsingR)
data(babies)
data=subset(babies,select=c("gestation","smoke","wt1","ht","wt"))
Clean=subset(data, gestation !=999&smoke!=9 & wt1!=999 & ht!=99 & wt!=999)
dim(Clean)
[1] 1175 5

#We calculate the BMI of mothers using R code below

library(UsingR)
data(babies)
data=subset(babies,select=c("gestation","smoke","wt1","ht","wt"))
Clean=subset(data, gestation !=999&smoke!=9 & wt1!=999 & ht!=99 & wt!=999)
attach(Clean)
BMI=wt1/(ht)^2*703
BMI[1:10]
[1] 18.28824 23.17017 19.73755 19.57563 17.00806 32.55307 23.29467 22.86030
[9] 21.94858 18.24394

#We create an indicator variable premature using the R code below.
library(UsingR)
data(babies)
data=subset(babies,select=c("gestation","smoke","wt1","ht","wt"))
Clean=subset(data, gestation !=999&smoke!=9 & wt1!=999 & ht!=99 & wt!=999)
dim(Clean)
[1] 1175 5
preemie=as.numeric(Clean$gestation<7*37)
table(preemie)
preemie
0 1
1079 96

#We can now model the variable preemie by the levels of smoke and the variable BMI.

model=glm(preemie~factor(Clean$smoke)+BMI, family=binomial)
summary(model)
Call:
  glm(formula = preemie ~ factor(Clean$smoke) + BMI, family = binomial)
Coefficients:
  Estimate Std. Error z value Pr(>|z|)
(Intercept) -3.42458 0.71159 -4.813 1.49e-06 ***
  factor(Clean$smoke)1 0.19353 0.23569 0.821 0.412
factor(Clean$smoke)2 0.31370 0.38896 0.806 0.420
factor(Clean$smoke)3 0.10114 0.40499 0.250 0.803
BMI 0.04023 0.03050 1.319 0.187
---
  (Dispersion parameter for binomial family taken to be 1)
Null deviance: 664.83 on 1174 degrees of freedom
Residual deviance: 662.34 on 1170 degrees of freedom
AIC: 672.34
Number of Fisher Scoring iterations: 5

#Note that none of the variables are flagged as significant. This indicates that the model with no effect is, perhaps,
#preferred. In order to check which model is preferred by AIC we use R code below

library(MASS)
stepAIC(model)

Start: AIC=672.34
preemie ~ factor(Clean$smoke) + BMI
Df Deviance AIC
- factor(Clean$smoke) 3 663.35 667.35
- BMI 1 663.98 671.98
<none> 662.34 672.34
Step: AIC=667.35
preemie ~ BMI
Df Deviance AIC
- BMI 1 664.83 666.83
<none> 663.35 667.35
Step: AIC=666.83
preemie ~ 1
Call: glm(formula = preemie ~ 1, family = binomial)
Coefficients:
  (Intercept)
-2.419
Degrees of Freedom: 1174 Total (i.e. Null); 1174 Residual
Null Deviance: 664.8
Residual Deviance: 664.8 AIC: 666.8

#Since, the model of constant mean is chosen, this data indicate that neither smoking status nor BMI are the risk
factors for premature babies.




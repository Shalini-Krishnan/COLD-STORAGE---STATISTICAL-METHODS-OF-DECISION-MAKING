# COLD-STORAGE---STATISTICAL-METHODS-OF-DECISION-MAKING
Performing descriptive and inferential statistics on Cold Storage dataset and making decisions based on the statistical outputs.

PROJECT OBJECTIVE :

The main objective of this report is to explore COLD STORAGE dataset in R and derive insights about the same.  
The exploration report comprises the following: 

•	Importing the datasets in R(2 datasets are dealt with) 

•	Understanding the structure of the dataset 

•	Graphical exploration 

•	Descriptive Statistics 

•	Probability Distribution

•	Hypothesis Testing(Statistical Inference)

•	Reading insights from the dataset 

PROBLEM STATEMENT : 

1. Cold Storage started its operations in Jan 2016. They are in the business of storing Pasteurized Fresh Whole or Skimmed Milk, Sweet Cream, Flavoured Milk Drinks. To ensure that there is no change of texture, body appearance, separation of fats the optimal temperature to be maintained is between 2 - 4 C.

In the first year of business they outsourced the plant maintenance work to a professional company with stiff penalty clauses. It was agreed that if the it was statistically proven that probability of temperature going outside the 2 - 4 C during the one-year contract was above 2.5% and less than 5% then the penalty would be 10% of AMC (annual maintenance case). In case it exceeded 5% then the penalty would be 25% of the AMC fee. 

Assesing mean cold storage temperature for Summer, Winter and Rainy Season, overall mean for the full year, Standard Deviation for the full year, assuming Normal distribution, the probability of temperature having fallen below 2 C,  the probability of temperature having gone above 4 C, Penalty for the company are in the scope of the Analysis.


2. In Mar 2018, Cold Storage started getting complaints from their Clients that they have been getting complaints from end consumers of the dairy products going sour and often smelling. On getting these complaints, the supervisor pulls out data of last 35 days’ temperatures. As a safety measure, the Supervisor decides to be vigilant to maintain the temperature 3.9 C or below.

Assume 3.9 C as upper acceptable value for mean temperature and at alpha = 0.1 do you feel that there is need for some corrective action in the Cold Storage Plant or is it that the problem is from procurement side from where Cold Storage is getting the Dairy Products.

Stating hypothesis, performing hypothesis test and determining p-value to check the if corrective action is needed at the cold storage plant and thereby providing inferences.


ASSUMPTIONS :

•	Unlike population distribution, the sample distribution always follows a normal distribution with increasing sample size (CENTRAL LIMIT THEOREM). 
 
•	Sample estimate will be the reflection of the reality. 
 
•	Low standard error (sigma/sqrt (n)) in turn leads to low sampling error (xbar-mu) which provides more accuracy in the measurements.  
sigma - sample standard deviation ,n - sample size  xbar - sample mean, mu - population mean  

EXPLORATORY DATA ANALYSIS : 

With employing the above functions in R we can simply derive the skeleton and characteristics of the given datasets. COLD STORAGE dataset is a data frame with 365 rows and 4 columns. The variables are of appropriate datatypes. Another dataset MARCH is a data frame with 35 rows and 4 columns.  
The variable names are Season, Month, Date and Temperature which are common for both the datasets. 
The 5 point summary is generated for the variables which provides the minimum value, maximum value, 1st quadrant, 3rd quadrant, mean and median (refer source code). To calculate the t.test static we need to input the confidence level (1-alpha). The dataset is a combination of factor, integer and numeric variables .All categorical variables are represented by factor datatype in R. Histogram shows the pattern distribution of the Temperature variable whereas the boxplot shows the centre, spread and shape of the variables. 

UNIVARIATE ANALYSIS : 

The variable Temperature is the crucial measurement for this analysis. Season and Month are categorical variables. The data is recorded for a year and the same is given along with its months and dates.
The temperature distribution seems to be slightly right skewed with minimum value 1.5C to maximum value 4.5C.The boxplot shows the presence of an outlier. The plot for the seasons shows that the temperatures are recorded for all the 3 seasons, where the readings of rainy and winter season ascends slightly than of the readings of summer season. 

BIVARIATE ANALYSIS : 

Upon analysing Temperature Vs Season, the outlier however is in rainy season. The seasons have most of their temperature readings recorded between 2C - 4.5C. 

MISSING VALUE & OUTLIER IDENTIFICATION : There are no missing values in the given dataset. Hence it doesn’t require any of the missing value treatments. Temperature value 5 seem to be an outlier.Not all extreme values are outliers, hence the data is retained for further analysis.

DESCRIPTIVE STATISTICS :

•	MEAN - Measure of Central tendency 
 
## THE OVERALL MEAN TEMPERATURE IS: 2.9627 
 
•	STANDARD DEVIATION - Measure of dispersion 
 
## THE OVERALL STANDARD DEVIATION OF THE TEMPERATURE IS: 0.5086 
 
•	The mean temperature for all the individual seasons 
 
## THE MEAN TEMPERATURE OF SUMMER SEASON IS: 3.1533 
 
 
## THE MEAN TEMPERATURE OF WINTER SEASON IS: 2.7008 


## THE MEAN TEMPERATURE OF RAINY SEASON IS: 3.0393 

INFERENTIAL STATISTICS : 

The probability distribution is calculated for values lesser than 2C and greater than 4C temperature. Assuming normal distribution, the probabilities of the sample distribution are calculated as shown below. 
 
1.	P(X<2) = 0.0292 

Approximately 2.9% of the values falls under the range of 2C temperature.

2.	P(X>4) = 0.0207 
 
 Approximately 2% of the values falls above the range of 4C temperature. 
 
With the given conditions the penalty for the AMC Company could be easily proved. The temperature falling below 2C and above 4C are the values which are outbound and will further lead to penalty constraint.95% values falls within the range (2C4C) and approximately 5% values fall out of the range. 

PENALTY FOR THE AMC COMPANY :

CLAUSE :

•	If the temperature values falling under 2C and above 4C is between 2.5%-5% then the penalty for the AMC Company is 10% of the annual maintenance fee.

•	If the temperature values are more than 5% then the penalty would be 25% of the annual maintenance fee. 
Since the outbound values (4.9%) are lesser than 5%, there is only 10% penalty for the AMC Company. 

STATISTICAL HYPOTHESIS TESTING : 

A statistical hypothesis test is a method of statistical inference. It is a hypothesis that is testable on the basis of observing a process that is modeled via a set of random variables. The 6 step approach for the hypothesis testing are as follows: 

1.	Specify the Null hypothesis (H0) 

2.	Specify the alternate hypothesis (H1) 

3.	Set the significance level (alpha) 

4.	Check the sample size and decide which test to be performed 

5.	Calculate the test statistic and corresponding p value 

6.	Drawing a conclusion 

For the given MARCH dataset, the hypothesis testing can be done as, 

Null hypothesis H0: Mean temperature (mu) <= 3.9C 
Alternate hypothesis HA: Mean temperature (mu) > 3.9C

Let’s start the Z test

Hypothesis for Z-Test
H0:μO <= 3.9[Temperature is maintained below or equal to 3.9 Degree and hence no corrective action is required].
HA:μO > 3.9[Temperature is above 3.9 Degree and hence corrective action is required].
Where  μO is mean of the sample data set.
As alternate hypothesis is with a greater sign, it is a Right tailed test,As mentioned standard deviation of the complete dataset calculated  would  be  used  as  a  Population  standard  deviation.
Hence population SD ( σ ) = 0.4658319
# Z Scorez <-(mean -mu)/(sd_temp/(sqrt(n)))
mean of the sample is mean <-mean(cold_mar_data$Temperature)
mean[1] 3.974286
Mu=3.9 ; n=35
Substituting these values in the above mentioned formula we get a Z score as 0.9434308
Given value of alpha =0.1 
P value ispValue = pnorm(z,lower.tail = FALSE)
pValue[1] 0.1727303

Let’s perform the t test

Hypothesis for T-Test 
H0:μO<= 3.9[Temperature is maintained below or equal to 3.9Degree and hence no corrective action is required]
HA:μO> 3.9[Temperature is above 3.9Degree and hence corrective action is required].
Where  μO is mean of the sample data set
As alternate hypothesis is with a greater sign, it is a Right tailed test, With alpha=0.1, confidence interval is .9, mu=3.9
t.test(cold_mar_data$Temperature, mu= mu,alternative = "greater",conf.level = conf)
One Sample t-testdata:  
cold_mar_data$Temperaturet = 2.7524, df = 34, p-value = 0.004711
alternative hypothesis: true mean is greater than 3.990
percent confidence interval:3.939011      
Infsample estimates:mean of x 3.974286P  value  is  <  alpha  and  hence Null  Hypothesis  is  rejected which  indicates  that temperature of  the cold storage  has  gone  above  3.9  and  hence  corrective  action  is required.

INFERENCE :

A test statistic is a numerical summary of the data that is compared to what would be expected under the null hypothesis. Test statistics can take on many forms such as the z-tests (usually used for large datasets) or t-tests (usually used when datasets are small). Even  though  we  have  adequate  sample  size  to  perform  Z  test,  we  don't  know  the standard deviation of the population. So,Z test is not appropriate here. Hence the output obtained through t-test would be appropriate and hence corrective action is recommended for cold storage.

With subject to the above analysis, we come to a conclusion that the mean temperature level maintained in the COLD STORAGE in the month of March is greater than or equal to 3.9C.Though the supervisor was vigilant with the temperature maintained, he has to further notice that it is the month of summer where the atmospheric temperature is very high. So the maintained temperature level (>=3.9C) in the plant may not prove beneficial, which may lead to the products turning sour. 


With the given data we conclude that, 
 
•	Statistically the maintained temperature (>=3.9C) may not prove beneficial in humid months like summer. 
 
 
•	If the dairy products turns sour even after maintaining the temperature level to <= 3.9C, then we strictly need to watch the temperature level in the plant for some more days with more number of samples. 
 
•	If everything works fine with the maintenance plant but if the customers are not satisfied with the products, the COLD STORAGE supplies, then necessary action can be taken against the vendor, from where all the dairy products are procured. 
 
•	The supervisor should be able to solve the problem immediately with the above cause - effect scenarios. If all these things taken into consideration, then no further problems may arise in the customer end. 



















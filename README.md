**🎮 Gaming vs Academic Performance Analysis**

**📊 Data Analysis Project (R)**

This project explores how gaming behavior and lifestyle factors influence academic performance using statistical analysis in R. The goal is to identify meaningful relationships between student habits and grades, and build a predictive regression model.

**🎯 Project Objective**

To determine how factors such as gaming habits, study time, sleep, stress, and social behavior impact student academic performance.

This project demonstrates skills in:

- Data cleaning and preprocessing
- Exploratory data analysis (EDA)
- Correlation analysis
- Multiple linear regression
- Model diagnostics and interpretation
- Data visualization in R

**🧰 Tools & Technologies**
- ggplot2
- dplyr
- readr
  
**📂 Dataset**

**Dataset Overview**
Observations: 8000
Variables: 14

**Key Variables**

| Variable        | Description                            |
| --------------- | -------------------------------------- |
| gaming_hours    | Time spent gaming                      |
| study_hours     | Time spent studying                    |
| sleep_hours     | Daily sleep duration                   |
| attendance      | Class attendance rate                  |
| social_activity | Social engagement level                |
| device_usage    | Screen/device usage                    |
| addiction_score | Gaming addiction index                 |
| stress_level    | Psychological stress category          |
| grades          | Academic performance (target variable) |

**🧹 Data Cleaning**

The dataset was cleaned and prepared using R:

- Checked structure and data types using str()
- Verified missing values using colSums(is.na())
- Converted categorical variables into factors
  
         Gaming_Academic_Performance <- Gaming_Academic_Performance %>%
              mutate(
                  gender = as.factor(gender),
                  gaming_genre = as.factor(gaming_genre),
                  stress_level = as.factor(stress_level)
              )
✔ No missing values were found in the dataset.

**📊 Exploratory Data Analysis (EDA)**

The analysis focused on the relationship between grades and key predictors.

**Key Visualizations**
- Scatter plots for numerical variables
- Boxplots for categorical variables
- Trend lines using linear smoothing
Example: 
  
      ggplot(Gaming_Academic_Performance,
             aes(x = gaming_hours, y = grades)) +
          geom_point(alpha = 0.3) +
          geom_smooth(method = "lm")
                                                   
**📌 Key Insights from EDA**

| Factor          | Impact on Grades               |
| --------------- | ------------------------------ |
| Study hours     | Strong positive relationship   |
| Gaming hours    | Strong negative relationship   |
| Sleep hours     | Moderate positive relationship |
| Attendance      | Positive relationship          |
| Device usage    | Negative relationship          |
| Social activity | Weak negative relationship     |
| Addiction score | Negative relationship          |
| Reaction time   | Positive relationship          |

**📦 Categorical Analysis**

Variables analyzed:
- Gender
- Gaming genre
- Stress level
  
**Key Findings**
- Gender: No significant difference in academic performance
- Gaming genre: No strong variation in grades
- Stress level: Strong relationship with performance

| Stress Level | Median Grade |
| ------------ | ------------ |
| High         | ~80          |
| Medium       | ~70–75       |
| Low          | ~45–50       |

📌 Observation: Higher stress levels were associated with higher academic performance.

**🔗 Correlation Analysis**

Correlation was computed among numerical variables.

**Strong Relationships**

Study hours → strong positive correlation (0.733)
Gaming hours → strong negative correlation (-0.551)
Addiction score → negative correlation (-0.495)
Sleep hours → mild positive correlation (0.250)

**📈 Regression Analysis**

A multiple linear regression model was built to predict academic performance.

    model <- lm(grades ~ gaming_hours + study_hours + sleep_hours +
              attendance + social_activity + device_usage +
              reaction_time_ms + addiction_score +
              gender + gaming_genre + stress_level,
            data = Gaming_Academic_Performance)

**📊 Model Performance**

| Metric      | Value     | Interpretation                          |
| ----------- | --------- | ---------------------------------------- |
| R-squared   | 0.9125    | Model explains 91.25% of grade variation |
| Adjusted R² | 0.9123    | Strong model with no overfitting issues  |
| Residual SE | 6.64      | Average prediction error (~±6.6 grades)  |
| F-statistic | 5945      | Model is highly significant              |
| p-value     | < 2.2e-16 | Results are statistically valid          |

**📌 Significant Predictors**

**Positive Effects**

- Study hours (strongest predictor)
- Sleep hours
- Attendance
  
**Negative Effects**

- Gaming hours
- Stress level (low and medium groups)

**⚠️ Not Statistically Significant**

- Gender
- Gaming genre
- Social activity
- Device usage
- Reaction time
- Addiction score

**🔍 Regression Diagnostics**

Model assumptions were checked using diagnostic plots:

- Residuals vs Fitted → slight non-linearity
- Q-Q plot → mostly normal residuals
- Scale-Location → mild heteroscedasticity
- Leverage plot → no major influential outliers

Overall, assumptions are reasonably satisfied.

**💡 Key Findings**

- Study habits are the strongest predictor of academic success
- Excessive gaming negatively affects grades
- Sleep and attendance improve performance
- Stress level shows an unexpected positive association with grades
- The model is highly predictive and statistically strong

**📊 Model Summary**

- Explains over 91% of variation in grades
- Low prediction error (~6.6 grade points)
- Statistically significant across all major tests
- Strong fit for real-world behavioral analysis

**👤 About Me**

Alfred Kisavi

Computer Science Student

Data Analyst (R, Statistics, Data Visualization, PowerBI)

Web Developer (HTML, CSS, XML, Java)

**📌 Portfolio Note**

This project demonstrates practical data analysis skills including:

- Statistical modeling
- Data preprocessing
- Interpretation of regression output
- Communication of insights

It is part of my growing portfolio in data analytics and applied statistics.

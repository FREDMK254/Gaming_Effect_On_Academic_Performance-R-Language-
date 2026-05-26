library(readr)
library(dplyr)
library(ggplot2)

#################################################################
########       0.1 Loading and Cleaning Dataset         #########
#################################################################

Gaming_Academic_Performance <- read_csv("R/Analyzed Data/Gaming Effect on Academic Performance/Dataset/Gaming_Academic_Performance.csv")

head(Gaming_Academic_Performance) # shows a small preview of 10 rows of our dataset
str(Gaming_Academic_Performance) # checks the type of variables we have in the dataset
summary(Gaming_Academic_Performance) # Shows descriptive statistics of how our data is distributed in each variable

colSums(is.na(Gaming_Academic_Performance)) # checking if dataset has null values (NA)

# Modifying the categorical data as factors
Gaming_Academic_Performance <- Gaming_Academic_Performance %>%
  mutate(
    gender = as.factor(gender),
    gaming_genre = as.factor(gaming_genre),
    stress_level = as.factor(stress_level)
  )

str(Gaming_Academic_Performance) # checks the type of variables we have in the dataset


#################################################################
########        0.2 Exploratory Data Analysis (EDA)     #########
#################################################################

# grades is our dependent variable in this dataset, and we need to determine what affects it from our data

ggplot(Gaming_Academic_Performance, aes(x = gaming_hours, y = grades)) + # negative relationship
  geom_point(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = study_hours, y = grades)) + # positive relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = sleep_hours, y = grades)) + # positive relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = attendance, y = grades)) + # positive relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = social_activity, y = grades)) + # negative relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = device_usage, y = grades)) + # negative relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = reaction_time_ms, y = grades)) + # positive relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = addiction_score, y = grades)) + # negative relationship
  geom_smooth(alpha = 0.3) +
  geom_smooth(method = "lm", se = TRUE)

ggplot(Gaming_Academic_Performance, aes(x = gender, y = grades))+ # there is no significant difference in grades distribution in diffferent gender
  geom_boxplot(fill = "lightblue")

ggplot(Gaming_Academic_Performance, aes(x = gaming_genre, y = grades)) + # no significant difference between gaming genre and grades
  geom_boxplot(fill = "orange") +
  coord_flip()

ggplot(Gaming_Academic_Performance, aes(x = stress_level, y = grades)) + # High stress - high grades (Median 80), Medium Stress - Moderate Grades ( Median 70 - 75 ), Low Stress - Low Grades (Median 45 - 50)
  geom_boxplot(fill = "red") # Low stress contains outlier above 100 grades and medium outlier at 16 - 20




#################################################################
########     0.3 Modelling (Correlation & Regression)   #########
#################################################################

cor_data <- Gaming_Academic_Performance %>%  # we select all numeric values
  select(where(is.numeric))

cor_matrix <- cor(cor_data, use = "complete.obs") # shows the correlation between grades and numerical variables in the dataset
cor_matrix["grades",] 

model <- lm(grades ~ gaming_hours + study_hours + sleep_hours +
              attendance + social_activity + device_usage +
              reaction_time_ms + addiction_score +
              gender + gaming_genre + stress_level,
            data = Gaming_Academic_Performance)

summary(model)

par(mfrow = c(2,2))
plot(model)




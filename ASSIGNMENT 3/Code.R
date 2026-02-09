#23BAD122

#Thiruvarasu.P

X3_healthcare_data

health_data$AgeGroup <- cut(

health_data$Age,

breaks = c(0, 30, 50, 100),

labels = c("Young", "Middle-aged", "Senior")

)

pairs(

X3_healthcare_data[, c("BMI", "Glucose_Level", "Blood_Pressure")],

main = "Scatter Plot Matrix of Health Indicators"

)

colors <- c("blue", "green", "red")

pairs(

X3_healthcare_data[, c("BMI", "Glucose_Level", "Blood_Pressure")],

col = colors[X3_healthcare_data$AgeGroup],

pch = 19,

main = "Scatter Plot Matrix Colored by Age Group"

)

X3_healthcare_data$AgeGroup <- factor(

X3_healthcare_data$AgeGroup,

levels = c("Young", "Middle-aged", "Senior")

)

colors <- c(

"Young" = "blue",

"Middle-aged" = "green",

"Senior" = "red"

)

# Step 4: Add legend

legend(

"topright",

legend = names(colors),

col = colors,

pch = 19,

title = "Age Group"

)

cor(

X3_healthcare_data[, c("BMI", "Glucose_Level", "Blood_Pressure")],

use = "complete.obs"

)

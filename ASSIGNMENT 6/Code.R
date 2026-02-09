# Roll No: 23BAD122

# Load required libraries
library(ggplot2)
library(GGally)
library(dplyr)

# Load dataset
retail_data <- read.csv("retail_business.csv")

# Remove NA values
retail_data <- na.omit(retail_data)

# -------------------------------
# 1. Parallel Coordinate Plot
# -------------------------------
ggparcoord(
  data = retail_data,
  columns = which(names(retail_data) %in% c("Sales", "Profit")),
  groupColumn = which(names(retail_data) == "Customer_Segment"),
  scale = "uniminmax",
  showPoints = TRUE
) +
  labs(
    title = "Parallel Coordinate Plot for Sales and Profit",
    color = "Customer Segment"
  ) +
  theme_minimal()

# -------------------------------
# 2. Bubble Chart: Sales vs Profit
# -------------------------------
ggplot(retail_data, aes(
  x = Sales,
  y = Profit,
  size = Sales,
  color = Customer_Segment
)) +
  geom_point(alpha = 0.7) +
  labs(
    title = "Bubble Chart: Sales vs Profit",
    x = "Sales",
    y = "Profit",
    size = "Sales",
    color = "Customer Segment"
  ) +
  theme_minimal()

# -------------------------------
# 3. Trellis Display by Region
# -------------------------------
ggplot(retail_data, aes(
  x = Sales,
  y = Profit,
  color = Customer_Segment
)) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ Region) +
  labs(
    title = "Trellis Display of Sales vs Profit by Region",
    x = "Sales",
    y = "Profit",
    color = "Customer Segment"
  ) +
  theme_minimal()

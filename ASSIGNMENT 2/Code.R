#23BAD122

# Load required library
library(ggplot2)
library(dplyr)

# -------------------------------
# Sample transaction data (matches output range)
# -------------------------------
set.seed(101)

transactions <- data.frame(
  TransactionAmount = sample(seq(500, 5000, by = 100), 80, replace = TRUE),
  Month = sample(c("Jan", "Feb", "Mar", "Apr"), 80, replace = TRUE)
)

# -------------------------------
# 1. Histogram of Transaction Amounts
# -------------------------------
ggplot(transactions, aes(x = TransactionAmount)) +
  geom_histogram(
    bins = 30,
    fill = "skyblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Transaction Amounts",
    x = "Transaction Amount",
    y = "Frequency"
  ) +
  theme_minimal()

# -------------------------------
# 2. Boxplot to Detect Outliers
# -------------------------------
ggplot(transactions, aes(y = TransactionAmount)) +
  geom_boxplot(
    fill = "lightgreen",
    color = "black"
  ) +
  labs(
    title = "Boxplot of Transaction Amounts",
    y = "Transaction Amount"
  ) +
  theme_minimal()

# -------------------------------
# 3. Heatmap of Monthly Sales Intensity
# -------------------------------
monthly_sales <- transactions %>%
  group_by(Month) %>%
  summarise(Sales = sum(TransactionAmount))

ggplot(monthly_sales, aes(x = Month, y = 1, fill = Sales)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "lightblue", high = "darkblue") +
  labs(
    title = "Heatmap of Monthly Sales Intensity",
    x = "Month",
    y = "",
    fill = "Sales"
  ) +
  theme_minimal() +
  theme(
    axis.text.y = element_blank(),
    axis.ticks.y = element_blank()
  )

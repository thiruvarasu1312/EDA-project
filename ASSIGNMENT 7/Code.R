# ==========================================================
# EXPT NO: 7 - OVER-PLOTTING REDUCTION TECHNIQUES
# ROLL NO: 23BAD122
# ==========================================================
 
if (!require(ggplot2)) install.packages("ggplot2", dependencies = TRUE)
if (!require(readr)) install.packages("readr", dependencies = TRUE)
 
library(ggplot2)
library(readr)
 
df <- read_csv("7.social_media_interactions.csv")
 
print(head(df))
 
x_col <- "Likes"
y_col <- "Comments"
 
df_clean <- df[!is.na(df[[x_col]]) & !is.na(df[[y_col]]), ]
 
cat("✅ Rows in dataset:", nrow(df_clean), "\n")
 
# ==========================================================
# TASK 1: ALPHA BLENDING
# ==========================================================
p_alpha <- ggplot(df_clean, aes(x = Likes, y = Comments)) +
  geom_point(alpha = 0.2) +
  ggtitle("Alpha Blending (Likes vs Comments)") +
  xlab("Likes") + ylab("Comments")
 
print(p_alpha)
 
# Save output
ggsave("Alpha_Blending_Output.png", p_alpha, width = 7, height = 5)
 
# ==========================================================
# TASK 2: JITTERING
# ==========================================================
p_jitter <- ggplot(df_clean, aes(x = Likes, y = Comments)) +
  geom_jitter(width = 30, height = 10, alpha = 0.3) +
  ggtitle("Jittering (Likes vs Comments)") +
  xlab("Likes") + ylab("Comments")
 
print(p_jitter)
 
# Save output
ggsave("Jittering_Output.png", p_jitter, width = 7, height = 5)
 
# ==========================================================
# TASK 3: AGGREGATION AND BINNING (2D BIN PLOT)
# ==========================================================
p_bin <- ggplot(df_clean, aes(x = Likes, y = Comments)) +
  geom_bin2d(bins = 20) +
  ggtitle("Aggregation & Binning (Likes vs Comments)") +
  xlab("Likes") + ylab("Comments")
 
print(p_bin)
 
# Save output
ggsave("Aggregation_Binning_Output.png", p_bin, width = 7, height = 5)
 
cat("\n✅ All 3 plots generated and saved successfully!\n")
cat("Saved files:\n")
cat("1) Alpha_Blending_Output.png\n")
cat("2) Jittering_Output.png\n")
cat("3) Aggregation_Binning_Output.png\n")

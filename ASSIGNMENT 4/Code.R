#23BAD122
# Load required library
library(ggplot2)
# --------------------------------
accident_data <- data.frame(
  Location = c("City Road", "City Road", "City Road",
               "Highway", "Highway", "Highway",
               "Junction", "Junction", "Junction"),
  
  Severity = c(1, 3, 3,
               1, 3, 3,
               1, 3, 3),
  
  Vehicles_Involved = c(1, 2, 3,
                        1, 3, 4,
                        2, 3, 4),
  
  Accident_Type = c("Collision", "Overturn", "Skid",
                    "Collision", "Overturn", "Skid",
                    "Collision", "Overturn", "Skid")
)

# --------------------------------
# Traffic Accident Severity Analysis Plot
# --------------------------------
ggplot(accident_data,
       aes(x = Location,
           y = Severity,
           color = Severity,
           size = Vehicles_Involved,
           shape = Accident_Type)) +
  geom_point() +
  scale_color_gradient(low = "lightblue", high = "darkred") +
  scale_y_continuous(breaks = c(1, 2, 3),
                     labels = c("1", "2", "3")) +
  labs(
    title = "Traffic Accident Severity Analysis",
    x = "Location",
    y = "Severity Level (Minor → Fatal)",
    color = "Severity",
    size = "Vehicles Involved",
    shape = "Accident Type"
  ) +
  theme_minimal()

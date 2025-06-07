# public_health_summary.R
# Simulated R script for public health outcome visualization

# Load packages
library(tidyverse)

# Simulated dataset
data <- tibble(
  region = rep(c("North", "South", "East", "West"), each = 25),
  program_type = sample(c("Nutrition", "Mental Health", "After School"), 100, replace = TRUE),
  graduation_rate = round(runif(100, 60, 100), 1),
  demographic_group = sample(c("Group A", "Group B", "Group C"), 100, replace = TRUE)
)

# Basic summary by region
summary_by_region <- data %>%
  group_by(region) %>%
  summarize(avg_grad_rate = mean(graduation_rate))

print(summary_by_region)

# Visualize disparities by program type
ggplot(data, aes(x = program_type, y = graduation_rate, fill = demographic_group)) +
  geom_boxplot() +
  labs(
    title = "Graduation Rates by Program Type and Demographic Group",
    x = "Program Type",
    y = "Graduation Rate (%)"
  ) +
  theme_minimal() 

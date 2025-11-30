# Pastikan data numeric
data$pendapatan = as.numeric(data$pendapatan)
data$kebahagiaan = as.numeric(data$kebahagiaan)

# Visualisasi regresi dengan ggplot2
regression_plot = ggplot(data, aes(x = pendapatan, y = kebahagiaan)) +
  # 1. Plot data points
  geom_point(color = "blue", size = 3, alpha = 0.7) +
  
  # 2. Tambahkan garis regresi linear
  geom_smooth(method = "lm", formula = y ~ x, 
              color = "red", se = TRUE, fill = "lightpink", alpha = 0.3) +
  
  # 3. Tambahkan persamaan garis linear
  stat_regline_equation(aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~~")),
                        label.x = mean(data$pendapatan),
                        label.y = max(data$kebahagiaan)) +
  
  # 4. Beri judul dan label yang sesuai
  labs(title = "Regresi Linear: Pengaruh Pendapatan terhadap Kebahagiaan",
       subtitle = "Pendapatan dalam satuan 10.000 unit",
       x = "Pendapatan",
       y = "Tingkat Kebahagiaan") +
  
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold", size = 14),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        axis.title = element_text(size = 12),
        axis.text = element_text(size = 10))

# Tampilkan plot
print(regression_plot)

# Alternatif dengan base R
par(mfrow = c(1, 1))
plot(data$pendapatan, data$kebahagiaan,
     main = "Regresi Linear: Pengaruh Pendapatan terhadap Kebahagiaan",
     xlab = "Pendapatan", 
     ylab = "Tingkat Kebahagiaan",
     pch = 19, 
     col = "blue",
     cex = 1.2)
abline(model, col = "red", lwd = 2)
grid()

# Tambahkan persamaan manual
r2 = round(summary_model$r.squared, 3)
adj_r2 = round(summary_model$adj.r.squared, 3)
eq = paste("y =", round(coef(model)[1], 3), "+", round(coef(model)[2], 3), "x")
r2_text = paste("R² =", r2)
adj_r2_text = paste("Adj R² =", adj_r2)
legend("topleft", 
       legend = c(eq, r2_text, adj_r2_text), 
       bty = "n",
       cex = 1.1)
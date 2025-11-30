# Pastikan kedua variabel numeric
if (!is.numeric(data$pendapatan)) data$pendapatan = as.numeric(data$pendapatan)
if (!is.numeric(data$kebahagiaan)) data$kebahagiaan = as.numeric(data$kebahagiaan)

# Scatter plot antara pendapatan dan kebahagiaan
scatter_plot = ggplot(data, aes(x = pendapatan, y = kebahagiaan)) +
  geom_point(color = "blue", size = 3, alpha = 0.7) +
  labs(title = "Scatter Plot: Hubungan Pendapatan dan Kebahagiaan",
       subtitle = "Pendapatan dalam satuan 10.000 unit",
       x = "Pendapatan (dalam 10.000 unit)",
       y = "Tingkat Kebahagiaan") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5, face = "bold"),
        plot.subtitle = element_text(hjust = 0.5))

print(scatter_plot)

# Korelasi Pearson
cor_test = cor.test(data$pendapatan, data$kebahagiaan, method = "pearson")
print("Hasil Uji Korelasi Pearson:")
print(cor_test)

# Interpretasi scatter plot
cat("Interpretasi Scatter Plot:\n")
cat("• Titik-titik data menunjukkan hubungan antara pendapatan dan kebahagiaan\n")
cat("• Jika titik-titik membentuk pola linear (naik/turun konsisten), terdapat hubungan linear\n")
cat("• Koefisien korelasi =", round(cor_test$estimate, 3), "\n")
cat("• Arah hubungan:", ifelse(cor_test$estimate > 0, "positif", "negatif"), "\n")
cat("• Signifikansi: p-value =", round(cor_test$p.value, 4), 
    ifelse(cor_test$p.value < 0.05, "(signifikan)", "(tidak signifikan)"), "\n")
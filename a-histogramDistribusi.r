# Pastikan variabel kebahagiaan adalah numeric
if (!is.numeric(data$kebahagiaan)) {
  data$kebahagiaan = as.numeric(data$kebahagiaan)
}

# Histogram untuk variabel kebahagiaan
hist(data$kebahagiaan, 
     main = "Histogram Distribusi Kebahagiaan",
     xlab = "Tingkat Kebahagiaan", 
     ylab = "Frekuensi",
     col = "lightblue",
     border = "black",
     breaks = 10)

# Tambahkan garis densitas normal
x = seq(min(data$kebahagiaan), max(data$kebahagiaan), length = 100)
y = dnorm(x, mean = mean(data$kebahagiaan), sd = sd(data$kebahagiaan))
lines(x, y * length(data$kebahagiaan) * 0.5, col = "red", lwd = 2)

# Tambahkan legenda
legend("topright", legend = "Kurva Normal", col = "red", lwd = 2)

# Uji normalitas Shapiro-Wilk
shapiro_test = shapiro.test(data$kebahagiaan)
print("Hasil Uji Normalitas Shapiro-Wilk:")
print(shapiro_test)

# Interpretasi
if(shapiro_test$p.value > 0.05) {
  cat("Kesimpulan: Variabel kebahagiaan berdistribusi normal (p-value =", 
      round(shapiro_test$p.value, 4), "> 0.05)\n")
} else {
  cat("Kesimpulan: Variabel kebahagiaan TIDAK berdistribusi normal (p-value =", 
      round(shapiro_test$p.value, 4), "≤ 0.05)\n")
}
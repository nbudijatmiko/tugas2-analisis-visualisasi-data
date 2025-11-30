# Plot diagnostik untuk homoskedastisitas
par(mfrow = c(2, 2))
plot(model, main = "Diagnostic Plots untuk Model Regresi")

# Plot khusus untuk residu vs fitted values
par(mfrow = c(1, 1))
plot(model$fitted.values, model$residuals,
     main = "Residuals vs Fitted Values",
     xlab = "Fitted Values (Nilai Prediksi)",
     ylab = "Residuals (Sisaan)",
     col = "blue", pch = 19)
abline(h = 0, col = "red", lwd = 2)
grid()

# Uji Breusch-Pagan untuk homoskedastisitas
bptest_result = bptest(model)
print("Hasil Uji Breusch-Pagan untuk Homoskedastisitas:")
print(bptest_result)

# Interpretasi
cat("\n=== INTERPRETASI HOMOSKEDASTISITAS ===\n")
if(bptest_result$p.value > 0.05) {
  cat("• Berdasarkan uji Breusch-Pagan: Homoskedastisitas terpenuhi (p-value =", 
      round(bptest_result$p.value, 4), "> 0.05)\n")
  cat("• Variansi residual konstan\n")
} else {
  cat("• Berdasarkan uji Breusch-Pagan: Heteroskedastisitas terdeteksi (p-value =", 
      round(bptest_result$p.value, 4), "≤ 0.05)\n")
  cat("• Variansi residual tidak konstan\n")
}
cat("• Pada plot Residuals vs Fitted: Jika titik-titik tersebar acak di sekitar garis nol, homoskedastisitas terpenuhi\n")
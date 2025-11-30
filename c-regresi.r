# Pastikan data sudah numeric
data$pendapatan = as.numeric(data$pendapatan)
data$kebahagiaan = as.numeric(data$kebahagiaan)

# Hapus NA values
data = na.omit(data)

# Melakukan regresi linear
model = lm(kebahagiaan ~ pendapatan, data = data)

# Menampilkan hasil regresi
summary_model = summary(model)
print("Hasil Regresi Linear:")
print(summary_model)

# Menampilkan koefisien dalam format yang rapi
tidy_model = tidy(model)
print("Koefisien Regresi:")
print(tidy_model)

# Interval kepercayaan 95% untuk koefisien
confint_model = confint(model)
print("Interval Kepercayaan 95%:")
print(confint_model)

# Interpretasi hasil regresi
cat("\n=== INTERPRETASI HASIL REGRESI ===\n")
cat("Persamaan Regresi: kebahagiaan =", 
    round(coef(model)[1], 4), "+", round(coef(model)[2], 4), "× pendapatan\n")
cat("Intercept (", round(coef(model)[1], 4), "): Nilai kebahagiaan ketika pendapatan = 0\n")
cat("Koefisien pendapatan (", round(coef(model)[2], 4), "): Kenaikan kebahagiaan untuk setiap kenaikan 1 unit pendapatan\n")
cat("R-squared =", round(summary_model$r.squared, 4), 
    ": Proporsi variasi kebahagiaan yang dijelaskan oleh pendapatan =", 
    round(summary_model$r.squared * 100, 2), "%\n")
cat("Adjusted R-squared =", round(summary_model$adj.r.squared, 4), "\n")
cat("p-value =", format.pval(summary_model$coefficients[2,4], digits = 4), 
    ifelse(summary_model$coefficients[2,4] < 0.05, 
           "(signifikan pada α = 0.05)", 
           "(tidak signifikan pada α = 0.05)"), "\n")
# Install packages jika belum terinstal
if (!require(ggplot2)) install.packages("ggplot2")
if (!require(dplyr)) install.packages("dplyr")
if (!require(broom)) install.packages("broom")
if (!require(ggpubr)) install.packages("ggpubr")
if (!require(readxl)) install.packages("readxl")
if (!require(lmtest)) install.packages("lmtest")
if (!require(car)) install.packages("car")

# Load packages
library(ggplot2)
library(dplyr)
library(broom)
library(ggpubr)
library(readxl)
library(lmtest)
library(car)

# Load data dari file Excel dengan path yang ditentukan
data = read_excel("D:/kuliah UT/semester 6/tugas3/Tugas2-data_pendapatan.xlsx")

# Cek apakah data berhasil dimuat
if (nrow(data) == 0) {
  stop("Data tidak berhasil dimuat. Periksa path file.")
}

print("Data berhasil dimuat!")
print(paste("Jumlah baris:", nrow(data)))
print(paste("Jumlah kolom:", ncol(data)))

# Konversi variabel ke numeric
data$pendapatan = as.numeric(data$pendapatan)
data$kebahagiaan = as.numeric(data$kebahagiaan)

# Cek apakah ada missing values setelah konversi
print("Missing Values setelah Konversi:")
print(paste("Missing values pendapatan:", sum(is.na(data$pendapatan))))
print(paste("Missing values kebahagiaan:", sum(is.na(data$kebahagiaan))))

# Hapus baris dengan missing values jika ada
data = na.omit(data)

print(paste("Jumlah data setelah menghapus NA:", nrow(data)))

# Lihat struktur data setelah konversi
print("Struktur Data Setelah Konversi:")
str(data)

# Lihat 6 baris pertama
print("6 Baris Pertama Data:")
head(data)
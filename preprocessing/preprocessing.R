# ============================================
# PREPROCESSING DATA
# Klasifikasi Efisiensi Belajar Mahasiswa
# ============================================

# Library
library(caret)

# Membaca dataset
data_stres <- read.csv("../dataset/Dataset_10.csv")

# Melihat data awal
head(data_stres)

# Melihat struktur data
str(data_stres)

# Melihat jumlah data
nrow(data_stres)

# Membersihkan nama kolom
names(data_stres) <- make.names(names(data_stres))

# Melihat nama kolom setelah dibersihkan
names(data_stres)

# Mengubah variabel target menjadi factor
data_stres$Skor.Efisiensi <- as.factor(data_stres$Skor.Efisiensi)

# Melihat distribusi kelas
table(data_stres$Skor.Efisiensi)

# Melihat proporsi kelas
prop.table(table(data_stres$Skor.Efisiensi))

# Membagi data menjadi training dan testing
set.seed(123)

index_train <- createDataPartition(
  data_stres$Skor.Efisiensi,
  p = 0.8,
  list = FALSE
)

train_data <- data_stres[index_train, ]
test_data <- data_stres[-index_train, ]

# Menampilkan jumlah data
cat("Jumlah data training:", nrow(train_data), "\n")
cat("Jumlah data testing:", nrow(test_data), "\n")

# Melihat distribusi kelas training
cat("\nDistribusi Training:\n")
print(table(train_data$Skor.Efisiensi))

# Melihat distribusi kelas testing
cat("\nDistribusi Testing:\n")
print(table(test_data$Skor.Efisiensi))

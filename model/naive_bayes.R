# ============================================
# NAIVE BAYES
# Klasifikasi Efisiensi Belajar Mahasiswa
# ============================================

library(caret)
library(e1071)

# Membaca dataset
data_stres <- read.csv("../dataset/Dataset_10.csv")

# Membersihkan nama kolom
names(data_stres) <- make.names(names(data_stres))

# Mengubah target menjadi factor
data_stres$Skor.Efisiensi <- as.factor(
  data_stres$Skor.Efisiensi
)

# Membagi data training dan testing
set.seed(123)

index_train <- createDataPartition(
  data_stres$Skor.Efisiensi,
  p = 0.8,
  list = FALSE
)

train_data <- data_stres[index_train, ]
test_data <- data_stres[-index_train, ]

# Membuat model Naive Bayes
model_nb <- naiveBayes(
  Skor.Efisiensi ~ .,
  data = train_data
)

# Melakukan prediksi
prediksi <- predict(
  model_nb,
  test_data
)

# Confusion Matrix
hasil_cm <- confusionMatrix(
  prediksi,
  test_data$Skor.Efisiensi
)

# Menampilkan hasil
print(hasil_cm)

# Menampilkan akurasi
cat("\nAccuracy:",
    hasil_cm$overall["Accuracy"],
    "\n")

# Menampilkan Kappa
cat("Kappa:",
    hasil_cm$overall["Kappa"],
    "\n")

# Menampilkan Sensitivity
cat("Sensitivity:",
    hasil_cm$byClass["Sensitivity"],
    "\n")

# Menampilkan Specificity
cat("Specificity:",
    hasil_cm$byClass["Specificity"],
    "\n")

# Menampilkan Balanced Accuracy
cat("Balanced Accuracy:",
    hasil_cm$byClass["Balanced Accuracy"],
    "\n")

# ============================================
# DECISION TREE
# ============================================

library(caret)
library(rpart)

# Membaca dataset
data_stres <- read.csv("../dataset/Dataset_10.csv")

# Membersihkan nama kolom
names(data_stres) <- make.names(names(data_stres))

# Mengubah target menjadi factor
data_stres$Skor.Efisiensi <- as.factor(
  data_stres$Skor.Efisiensi
)

# Membagi data
set.seed(123)

index_train <- createDataPartition(
  data_stres$Skor.Efisiensi,
  p = 0.8,
  list = FALSE
)

train_data <- data_stres[index_train, ]
test_data <- data_stres[-index_train, ]

# Membuat model Decision Tree
model_dt <- rpart(
  Skor.Efisiensi ~ .,
  data = train_data,
  method = "class"
)

# Prediksi
prediksi_dt <- predict(
  model_dt,
  test_data,
  type = "class"
)

# Evaluasi
hasil_dt <- confusionMatrix(
  prediksi_dt,
  test_data$Skor.Efisiensi
)

print(hasil_dt)

cat("\nAccuracy:",
    hasil_dt$overall["Accuracy"],
    "\n")

cat("Kappa:",
    hasil_dt$overall["Kappa"],
    "\n")

# ============================================
# RANDOM FOREST
# ============================================

library(caret)
library(randomForest)

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

# Membuat model Random Forest
model_rf <- randomForest(
  Skor.Efisiensi ~ .,
  data = train_data,
  ntree = 100,
  importance = TRUE
)

# Prediksi
prediksi_rf <- predict(
  model_rf,
  test_data
)

# Evaluasi
hasil_rf <- confusionMatrix(
  prediksi_rf,
  test_data$Skor.Efisiensi
)

print(hasil_rf)

cat("\nAccuracy:",
    hasil_rf$overall["Accuracy"],
    "\n")

cat("Kappa:",
    hasil_rf$overall["Kappa"],
    "\n")

# Feature importance
importance(model_rf)

# Visualisasi feature importance
varImpPlot(model_rf)

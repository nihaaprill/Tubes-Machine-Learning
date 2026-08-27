# ============================================
# VISUALISASI DATA
# ============================================

library(ggplot2)

# Membaca dataset
data_stres <- read.csv("../dataset/Dataset_10.csv")

# Membersihkan nama kolom
names(data_stres) <- make.names(names(data_stres))

# Mengubah target menjadi factor
data_stres$Skor.Efisiensi <- as.factor(
  data_stres$Skor.Efisiensi
)

# ============================================
# 1. Distribusi Target
# ============================================

grafik_target <- ggplot(
  data_stres,
  aes(x = Skor.Efisiensi)
) +
  geom_bar() +
  labs(
    title = "Distribusi Skor Efisiensi Belajar",
    x = "Skor Efisiensi",
    y = "Jumlah Mahasiswa"
  ) +
  theme_minimal()

print(grafik_target)

ggsave(
  "../results/distribusi_target.png",
  grafik_target,
  width = 8,
  height = 6
)

# ============================================
# 2. Distribusi IPK
# ============================================

grafik_ipk <- ggplot(
  data_stres,
  aes(
    x = Skor.Efisiensi,
    y = IPK.Terakhir
  )
) +
  geom_boxplot() +
  labs(
    title = "Distribusi IPK Berdasarkan Efisiensi Belajar",
    x = "Skor Efisiensi",
    y = "IPK Terakhir"
  ) +
  theme_minimal()

print(grafik_ipk)

ggsave(
  "../results/distribusi_ipk.png",
  grafik_ipk,
  width = 8,
  height = 6
)

# ============================================
# 3. Distribusi Waktu Belajar
# ============================================

grafik_waktu <- ggplot(
  data_stres,
  aes(
    x = Waktu.Belajar.Mandiri,
    fill = Skor.Efisiensi
  )
) +
  geom_bar(position = "dodge") +
  labs(
    title = "Distribusi Waktu Belajar Mandiri",
    x = "Waktu Belajar",
    y = "Jumlah Mahasiswa"
  ) +
  theme_minimal()

print(grafik_waktu)

ggsave(
  "../results/distribusi_waktu_belajar.png",
  grafik_waktu,
  width = 8,
  height = 6
)

# ============================================
# 4. Heatmap Korelasi
# ============================================

variabel_psikologis <- data_stres[
  ,
  c(
    "Beban.Tugas",
    "Kecemasan.Ujian",
    "Khawatir.Nilai",
    "Sulit.Fokus"
  )
]

matriks_korelasi <- cor(
  variabel_psikologis,
  use = "complete.obs"
)

heatmap(
  matriks_korelasi,
  main = "Heatmap Korelasi Variabel Psikologis"
)

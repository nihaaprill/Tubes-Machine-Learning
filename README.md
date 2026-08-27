# Tubes-Machine-Learning

# Klasifikasi Efisiensi Belajar Mahasiswa

## Deskripsi

Project ini merupakan penelitian pada mata kuliah **Machine Learning** yang bertujuan untuk mengklasifikasikan tingkat efisiensi belajar mahasiswa berdasarkan faktor akademik dan psikologis menggunakan algoritma **Naive Bayes**.

Data diperoleh melalui penyebaran kuesioner kepada mahasiswa dengan total **201 responden**.

Faktor yang digunakan dalam proses klasifikasi meliputi:

* IPK terakhir
* Waktu belajar mandiri
* Jumlah SKS
* Beban tugas
* Kecemasan ujian
* Kekhawatiran terhadap nilai
* Kesulitan fokus

Target yang digunakan adalah **Skor Efisiensi Belajar**.

## Tujuan

Penelitian ini bertujuan untuk:

1. Mengetahui hubungan faktor akademik dan psikologis terhadap efisiensi belajar mahasiswa.
2. Membangun model klasifikasi menggunakan algoritma Naive Bayes.
3. Mengklasifikasikan mahasiswa berdasarkan tingkat efisiensi belajarnya.
4. Mengevaluasi performa model menggunakan beberapa metrik evaluasi.
5. Membandingkan performa Naive Bayes dengan Decision Tree dan Random Forest.

## Dataset

Dataset terdiri dari **201 data mahasiswa**.

Variabel yang digunakan:

| Variabel              | Jenis   | Keterangan                                   |
| --------------------- | ------- | -------------------------------------------- |
| IPK Terakhir          | Numerik | Nilai IPK terakhir mahasiswa                 |
| Waktu Belajar Mandiri | Ordinal | Rata-rata waktu belajar di luar jam kuliah   |
| Jumlah SKS            | Numerik | Jumlah SKS yang diambil                      |
| Beban Tugas           | Ordinal | Tingkat beban tugas yang dirasakan           |
| Kecemasan Ujian       | Ordinal | Tingkat kecemasan saat menghadapi ujian      |
| Khawatir Nilai        | Ordinal | Tingkat kekhawatiran terhadap hasil akademik |
| Sulit Fokus           | Ordinal | Tingkat kesulitan berkonsentrasi             |
| Skor Efisiensi        | Target  | Kategori efisiensi belajar                   |

Dataset kemudian dibagi menjadi:

* 80% data training = 162 data
* 20% data testing = 39 data

Pembagian dilakukan menggunakan stratified sampling.

## Preprocessing

Tahapan preprocessing yang dilakukan meliputi:

1. Pembersihan nama kolom.
2. Konversi variabel target menjadi factor.
3. Pembagian data training dan testing.
4. Encoding data sesuai kebutuhan.
5. Pemeriksaan distribusi data.

## Algoritma

Penelitian menggunakan tiga algoritma:

### 1. Naive Bayes

Naive Bayes digunakan sebagai algoritma utama untuk melakukan klasifikasi efisiensi belajar mahasiswa.

### 2. Decision Tree

Decision Tree digunakan sebagai algoritma pembanding untuk melihat performa model berbasis aturan.

### 3. Random Forest

Random Forest digunakan sebagai algoritma pembanding berbasis ensemble.

## Evaluasi

Model dievaluasi menggunakan:

* Accuracy
* Kappa
* Sensitivity
* Specificity
* Balanced Accuracy
* Confusion Matrix

## Hasil

Pada pembagian data dengan `set.seed(123)`, model Naive Bayes berhasil mengklasifikasikan seluruh **39 data testing** dengan benar sehingga menghasilkan:

**Accuracy = 100%**

Confusion matrix menunjukkan tidak terdapat false positive maupun false negative.

Selain single split, dilakukan pula eksperimen repeated random sub-sampling sebanyak **100 iterasi**.

Hasil simulasi:

* 90 iterasi menghasilkan akurasi 100%.
* 10 iterasi menghasilkan akurasi 97,44%.
* Tidak terdapat iterasi dengan akurasi di bawah 97,44%.

## Perbandingan Model

Hasil eksperimen menunjukkan bahwa Naive Bayes memiliki rata-rata akurasi yang tinggi dan stabil.

Random Forest juga menunjukkan performa yang sangat baik, sedangkan Decision Tree memiliki performa yang relatif lebih rendah dan lebih tidak stabil.

## Tools

Project ini menggunakan:

* R
* RStudio
* caret
* e1071
* rpart
* randomForest

## Struktur Repository

```text
Tubes-Machine-Learning/
│
├── dataset/
│   └── Dataset_10.csv
│
├── preprocessing/
│   └── preprocessing.R
│
├── model/
│   ├── naive_bayes.R
│   ├── decision_tree.R
│   └── random_forest.R
│
├── visualization/
│   └── visualisasi.R
│
├── results/
│   ├── distribusi_target.png
│   ├── distribusi_ipk.png
│   ├── distribusi_waktu_belajar.png
│   └── heatmap_korelasi.png
│
├── report/
│   └── Laporan_UAS.pdf
│
├── README.md
└── .gitignore
```

## Anggota

**Julia Rahmawati**
**&**
**Niha April Miani**

Program Studi Ilmu Komputer
Universitas Pendidikan Indonesia

## Mata Kuliah

Machine Learning

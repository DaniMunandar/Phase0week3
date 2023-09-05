# Phase0week3


# Membuat Database
```
CREATE DATABASE tourism;
```

## Membuat tabel untuk Destinations, Hotel dan Pemesanan
```
CREATE TABLE IF NOT EXISTS Destinasi (
    ID_Destinasi INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Destinasi VARCHAR(255),
    Negara VARCHAR (255),
    Deskripsi TEXT,
    Rating DECIMAL(3,2)
);

CREATE TABLE IF NOT EXISTS Hotel (
    ID_Hotel INT AUTO_INCREMENT PRIMARY KEY,
    Nama_Hotel VARCHAR(255),
    ID_Destinasi INT,
    Rating DECIMAL(3,2),
    Alamat VARCHAR(255)
    FOREIGN KEY(ID_Destinasi) REFERENCES Destinasi(ID_Destinasi)
);

CREATE TABLE IF NOT EXISTS Pemesanan (
    ID_Pemesanan INT PRIMARY KEY AUTO_INCREMENT,
    Tamu VARCHAR(255) NOT NULL,
    ID_Hotel INT,
    TanggalCheckIn DATE,
    TanggalCheckOut DATE,
    FOREIGN KEY (ID_Hotel) REFERENCES Hotel(ID_Hotel)
);
```

## Menambahkan value Destinasi, Hotel dan Pemesanan
```
INSERT INTO Destinasi (Nama_Destinasi, Negara, Deskripsi, Rating)
VALUES
    ('Bali', 'Indonesia', 'Pulau eksotis dengan pantai indah', 4.5),
    ('Tokyo', 'Jepang', 'Kota Dengan Wrisan Budaya Leluhur', 4.8),
    ('Jakarta', 'Indonesia', 'Kota Dengan Sejuta Cerita', 4.2);

INSERT INTO Hotel (Nama_Hotel, ID_Destinasi, Rating, Alamat)
VALUES
    ('Hotel Bali Beach', 1, 4.3, 'Jalan Pantai Kuta, Bali'),
    ('Hotel Tokyo Street', 2, 4.7, 'Street Tokyo 211'),
    ('Aston', 3, 4.0, 'Jl. Raya Simatupang');

INSERT INTO Pemesanan (Tamu, ID_Hotel, TanggalCheckIn, TanggalCheckOut)
VALUES
    ('Arnol', 1, '2023-09-10', '2023-09-15'),
    ('Bimo', 2, '2023-10-05', '2023-10-10'),
    ('Aldo', 3, '2023-11-15', '2023-11-20');
```
# Data Retrieval

## Menampilkan semua Destinasi yang tersimpan dalam database
```
SELECT * FROM Destinasi;
```

## Menampilkan semua Hotel yang tersimpan dalam database
```
SELECT * FROM Hotel;
```

## Menampilkan semua Pemesanan yang tersimpan dalam database
```
SELECT * FROM Pemesanan;
```

## Menampilkan hotel di destinasi tertentu berdasarkan user input
```
SELECT Hotel.*
FROM Hotel
INNER JOIN Destinasi ON Hotel.ID_Destinasi = Destinasi.ID_Destinasi
WHERE Destinasi.Nama_Destinasi = 'Bali';
```

## Menghitung dan menampilkan rating rata-rata hotel di destinasi tertentu

```
SELECT AVG(Hotel.Rating) AS RataRataRating
FROM Hotel
INNER JOIN Destinasi ON Hotel.ID_Destinasi = Destinasi.ID_Destinasi
WHERE Destinasi.Nama_Destinasi = 'Bali';
```

# Data Modification:

## Update rating destinasi
```
UPDATE Destinasi
SET Rating = [4.7]
WHERE Nama_Destinasi = 'Bali';
```

## Update Alamat hotel.
```
UPDATE Hotel
SET Alamat = 'Simatupang'
WHERE Nama_Hotel = 'Aston';
```
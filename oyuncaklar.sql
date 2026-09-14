-- Bölüm 1 – Tablo kurma
CREATE TABLE oyuncaklar (
    id SERIAL PRIMARY KEY,
    isim VARCHAR(100) NOT NULL,
    cesit VARCHAR(50),
    fiyat DECIMAL(10, 2) CHECK (fiyat > 0),
    renk VARCHAR(30) DEFAULT 'kırmızı'
);

-- Bölüm 2 – Ekleme
-- 1. Şimşek ekleme (rengi varsayılan olarak 'kırmızı' atanır)
INSERT INTO oyuncaklar (isim, cesit, fiyat) 
VALUES ('Şimşek', 'araba', 50);

-- 2. Dört oyuncağı tek komutla ekleme
INSERT INTO oyuncaklar (isim, cesit, fiyat, renk) VALUES
('Ayıcık', 'peluş', 80, 'kahverengi'),
('Kale Seti', 'lego', 150, 'gri'),
('Zıpzıp', 'top', 20, 'sarı'),
('Barbi', 'bebek', 90, 'pembe');

-- Bölüm 3 – Bulma
SELECT * FROM oyuncaklar;
SELECT isim, fiyat FROM oyuncaklar WHERE fiyat >= 80;
SELECT * FROM oyuncaklar ORDER BY fiyat DESC LIMIT 2;
SELECT * FROM oyuncaklar WHERE isim LIKE 'Z%';
SELECT * FROM oyuncaklar WHERE cesit IN ('araba', 'top');
SELECT * FROM oyuncaklar WHERE fiyat BETWEEN 20 AND 60;

-- Bölüm 4 – Değiştirme ve silme
UPDATE oyuncaklar SET renk = 'mavi' WHERE isim = 'Şimşek';
DELETE FROM oyuncaklar WHERE isim = 'Zıpzıp';

-- Bonus Tahmin: "DELETE FROM oyuncaklar;" tablodaki TÜM satırları siler, tablo yapısı boş kalır.

-- Bölüm 5 – Tabloyu düzenleme
ALTER TABLE oyuncaklar ADD COLUMN kimin VARCHAR(50);
UPDATE oyuncaklar SET kimin = 'Ali' WHERE isim = 'Kale Seti';
ALTER TABLE oyuncaklar RENAME COLUMN cesit TO tur;
CREATE TABLE IF NOT EXISTS `Sehirler` (
	`AltyapiDurumu` varchar(255) DEFAULT '100',
	`SehirID` int NOT NULL,
	`SehirAdi` varchar(255) NOT NULL DEFAULT '100',
	`Ulke` varchar(255) NOT NULL DEFAULT '100',
	`Nufus` int,
	`Yuzolcu` float,
	`TuristikYerler` text,
	`Ulasim` varchar(255) DEFAULT '100',
	`Iklim` varchar(255) DEFAULT '100',
	`EkonomikDurum` varchar(255) DEFAULT '100',
	`EgitimDurumu` varchar(255) DEFAULT '100',
	`YasamKalitesi` varchar(255) DEFAULT '100',
	`YerelYemekler` text,
	`Etkinlikler` text,
	`OzelGecmeler` text,
	PRIMARY KEY (`SehirID`)
);

CREATE TABLE IF NOT EXISTS `Oteller` (
	`YildizSayisi` int,
	`OdaSayisi` int,
	`FiyatAraligi` varchar(255) DEFAULT '100',
	`OtelTipi` varchar(255) DEFAULT '100',
	`Telefon` varchar(255) DEFAULT '15',
	`Hizmetler` text,
	`Email` varchar(255) DEFAULT '100',
	`WebSitesi` varchar(255) DEFAULT '100',
	`Puan` float,
	`Açiklama` text,
	`Adres` varchar(255) DEFAULT '200',
	`SehirID` int NOT NULL,
	`ResimURL` varchar(255) DEFAULT '200',
	`OtelAdi` varchar(255) NOT NULL DEFAULT '100',
	`OtelID` int NOT NULL,
	PRIMARY KEY (`OtelID`)
);

CREATE TABLE IF NOT EXISTS `Kullanicilar` (
	`KullaniciID` int NOT NULL,
	`Ad` varchar(255) NOT NULL DEFAULT '100',
	`Soyad` varchar(255) NOT NULL DEFAULT '100',
	`Email` varchar(255) NOT NULL DEFAULT '100',
	`Telefon` varchar(255) DEFAULT '15',
	`Sifre` varchar(255) NOT NULL DEFAULT '100',
	`DogumTarihi` date,
	`Cinsiyet` varchar(255) DEFAULT '10',
	`Adres` varchar(255) DEFAULT '200',
	`KayitTarihi` datetime,
	`SonGirisTarihi` datetime,
	`ProfilResmi` varchar(255) DEFAULT '200',
	`HesapDurumu` varchar(255) DEFAULT '20',
	`FavoriOteller` text,
	`SehirID` int,
	`Notlar` text,
	PRIMARY KEY (`KullaniciID`)
);

CREATE TABLE IF NOT EXISTS `Rezervasyonlar` (
	`RezervasyonID` int NOT NULL,
	`KullaniciID` int NOT NULL,
	`OtelID` int NOT NULL,
	`GirisTarihi` date NOT NULL,
	`CikisTarihi` date NOT NULL,
	`OdaSayisi` int NOT NULL,
	`ToplamFiyat` float NOT NULL,
	`RezervasyonTarihi` datetime NOT NULL,
	`Durum` varchar(255) DEFAULT '20',
	`OdaTipi` varchar(255) DEFAULT '100',
	`OzelTalep` text,
	`KrediKartiBilgileri` text,
	`IptalPolitikasi` text,
	`IndirimKodu` varchar(255) DEFAULT '50',
	`Yorum` text,
	`Puan` float,
	PRIMARY KEY (`RezervasyonID`)
);


ALTER TABLE `Oteller` ADD CONSTRAINT `Oteller_fk11` FOREIGN KEY (`SehirID`) REFERENCES `Sehirler`(`SehirID`);
ALTER TABLE `Kullanicilar` ADD CONSTRAINT `Kullanicilar_fk14` FOREIGN KEY (`SehirID`) REFERENCES `Sehirler`(`SehirID`);
ALTER TABLE `Rezervasyonlar` ADD CONSTRAINT `Rezervasyonlar_fk1` FOREIGN KEY (`KullaniciID`) REFERENCES `Kullanicilar`(`KullaniciID`);

ALTER TABLE `Rezervasyonlar` ADD CONSTRAINT `Rezervasyonlar_fk2` FOREIGN KEY (`OtelID`) REFERENCES `Oteller`(`OtelID`);
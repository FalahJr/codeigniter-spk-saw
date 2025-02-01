-- Adminer 4.8.1 MySQL 5.7.39 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `alternatif`;
CREATE TABLE `alternatif` (
  `id_alternatif` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) NOT NULL,
  PRIMARY KEY (`id_alternatif`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `alternatif` (`id_alternatif`, `nama`) VALUES
(11,	'Umbar Mulyadi'),
(12,	'Muhlis'),
(13,	'Ahmad Muslich Abbas'),
(14,	'Kristin Handayani'),
(15,	'Mahmudin'),
(16,	'Tholib'),
(17,	'Muhdor Imamudin'),
(18,	'Kardi'),
(19,	'M. Imron'),
(20,	'Farih Ihwan');

DROP TABLE IF EXISTS `hasil`;
CREATE TABLE `hasil` (
  `id_hasil` int(11) NOT NULL AUTO_INCREMENT,
  `id_alternatif` int(11) NOT NULL,
  `nilai` float NOT NULL,
  PRIMARY KEY (`id_hasil`),
  KEY `id_alternatif` (`id_alternatif`),
  CONSTRAINT `hasil_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `hasil` (`id_hasil`, `id_alternatif`, `nilai`) VALUES
(1,	11,	100),
(2,	12,	93.75),
(3,	13,	82.5),
(4,	14,	71.25),
(5,	15,	55),
(6,	16,	78.75),
(7,	17,	72.5),
(8,	18,	28.75),
(9,	19,	45),
(10,	20,	37.5);

DROP TABLE IF EXISTS `kriteria`;
CREATE TABLE `kriteria` (
  `id_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `keterangan` varchar(100) NOT NULL,
  `kode_kriteria` varchar(100) NOT NULL,
  `bobot` float NOT NULL,
  `jenis` varchar(100) NOT NULL,
  PRIMARY KEY (`id_kriteria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `kriteria` (`id_kriteria`, `keterangan`, `kode_kriteria`, `bobot`, `jenis`) VALUES
(18,	'Kehadiran',	'C1',	15,	'Benefit'),
(19,	'Sikap / Etika',	'C2',	15,	'Cost'),
(20,	'Pelayanan',	'C3',	30,	'Benefit'),
(21,	'Tanggungjawab',	'C4',	15,	'Benefit'),
(22,	'Kuantitas (Beban Kerja)',	'C5',	25,	'Benefit');

DROP TABLE IF EXISTS `penilaian`;
CREATE TABLE `penilaian` (
  `id_penilaian` int(11) NOT NULL AUTO_INCREMENT,
  `id_alternatif` int(11) NOT NULL,
  `id_kriteria` int(11) NOT NULL,
  `nilai` int(100) NOT NULL,
  PRIMARY KEY (`id_penilaian`),
  KEY `id_alternatif` (`id_alternatif`),
  KEY `id_kriteria` (`id_kriteria`),
  KEY `nilai` (`nilai`),
  CONSTRAINT `penilaian_ibfk_1` FOREIGN KEY (`id_alternatif`) REFERENCES `alternatif` (`id_alternatif`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_ibfk_2` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `penilaian_ibfk_3` FOREIGN KEY (`nilai`) REFERENCES `sub_kriteria` (`id_sub_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `penilaian` (`id_penilaian`, `id_alternatif`, `id_kriteria`, `nilai`) VALUES
(81,	11,	18,	68),
(82,	12,	18,	68),
(83,	13,	18,	67),
(84,	14,	18,	67),
(85,	15,	18,	67),
(86,	16,	18,	67),
(87,	17,	18,	67),
(88,	11,	19,	89),
(89,	11,	20,	93),
(90,	11,	21,	97),
(91,	11,	22,	101),
(92,	12,	19,	89),
(93,	12,	20,	93),
(94,	12,	21,	97),
(95,	12,	22,	100),
(96,	13,	19,	88),
(97,	13,	20,	93),
(98,	13,	21,	97),
(99,	13,	22,	100),
(100,	14,	19,	88),
(101,	14,	20,	92),
(102,	14,	21,	96),
(103,	14,	22,	100),
(104,	15,	19,	86),
(105,	15,	20,	91),
(106,	15,	21,	96),
(107,	15,	22,	98),
(108,	16,	19,	89),
(109,	16,	20,	92),
(110,	16,	21,	96),
(111,	16,	22,	100),
(112,	17,	19,	89),
(113,	17,	20,	92),
(114,	17,	21,	96),
(115,	17,	22,	98),
(116,	18,	18,	102),
(117,	18,	19,	85),
(118,	18,	20,	90),
(119,	18,	21,	95),
(120,	18,	22,	99),
(121,	19,	18,	102),
(122,	19,	19,	86),
(123,	19,	20,	92),
(124,	19,	21,	95),
(125,	19,	22,	99),
(126,	20,	18,	102),
(127,	20,	19,	86),
(128,	20,	20,	91),
(129,	20,	21,	95),
(130,	20,	22,	99);

DROP TABLE IF EXISTS `sub_kriteria`;
CREATE TABLE `sub_kriteria` (
  `id_sub_kriteria` int(11) NOT NULL AUTO_INCREMENT,
  `id_kriteria` int(11) NOT NULL,
  `deskripsi` varchar(200) NOT NULL,
  `nilai` float NOT NULL,
  PRIMARY KEY (`id_sub_kriteria`),
  KEY `id_kriteria` (`id_kriteria`),
  CONSTRAINT `sub_kriteria_ibfk_1` FOREIGN KEY (`id_kriteria`) REFERENCES `kriteria` (`id_kriteria`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `sub_kriteria` (`id_sub_kriteria`, `id_kriteria`, `deskripsi`, `nilai`) VALUES
(67,	18,	'>75% dan <=90%',	3),
(68,	18,	'>90% dan 100%',	4),
(69,	18,	'>=65% dan <=75%',	2),
(85,	19,	'Sangat Tidak Sopan',	4),
(86,	19,	'Tidak Sopan',	3),
(88,	19,	'Cukup Sopan',	2),
(89,	19,	'Sopan',	1),
(90,	20,	'Kurang Baik',	1),
(91,	20,	'Cukup Baik',	2),
(92,	20,	'Baik',	3),
(93,	20,	'Sangat Baik',	4),
(94,	21,	'Sangat Tidak Bertanggungjawab',	1),
(95,	21,	'Tidak Bertanggungjawab',	2),
(96,	21,	'Cukup Bertanggungjawab',	3),
(97,	21,	'Bertanggungjawab',	4),
(98,	22,	'>=50 dan <=80 Pekerjaan',	2),
(99,	22,	'<50 Pekerjaan',	1),
(100,	22,	'>80 dan <=100 Pekerjaan',	3),
(101,	22,	'>100 pekerjaan',	4),
(102,	18,	'<=65',	1);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_user_level` int(11) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`),
  KEY `id_user_level` (`id_user_level`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`id_user_level`) REFERENCES `user_level` (`id_user_level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user` (`id_user`, `id_user_level`, `nama`, `email`, `username`, `password`) VALUES
(1,	1,	'Admin',	'admin@gmail.com',	'admin',	'21232f297a57a5a743894a0e4a801fc3'),
(7,	2,	'Pengguna',	'user@gmail.com',	'pengguna',	'8b097b8a86f9d6a991357d40d3d58634'),
(8,	1,	'wargadesa',	'warga@gmail.com',	'warga',	'4ab7d9d3a2a915753862aa89e6ff319c');

DROP TABLE IF EXISTS `user_level`;
CREATE TABLE `user_level` (
  `id_user_level` int(11) NOT NULL AUTO_INCREMENT,
  `user_level` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user_level`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `user_level` (`id_user_level`, `user_level`) VALUES
(1,	'Administrator'),
(2,	'User');

-- 2025-02-01 15:02:04

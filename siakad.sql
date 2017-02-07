-- phpMyAdmin SQL Dump
-- version 4.5.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 07, 2017 at 02:27 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.6.23-1+deprecated+dontuse+deb.sury.org~trusty+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakad`
--

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE `acl` (
  `id` int(3) NOT NULL,
  `controller` varchar(32) NOT NULL,
  `action` varchar(32) DEFAULT NULL,
  `area` varchar(128) NOT NULL,
  `parent` varchar(128) NOT NULL DEFAULT '0',
  `is_menu` enum('Y','N') NOT NULL DEFAULT 'Y' COMMENT 'menu atou cuma action',
  `label_menu` varchar(128) DEFAULT NULL,
  `child` varchar(128) DEFAULT NULL,
  `usergroup_id` varchar(128) DEFAULT NULL,
  `icon` varchar(128) DEFAULT NULL,
  `except_user` varchar(128) DEFAULT NULL COMMENT AS `uid pengecualian`,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='-manajemen hak akses user,usergroup terhadap modul sesuai hak akses user nya';

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`id`, `controller`, `action`, `area`, `parent`, `is_menu`, `label_menu`, `child`, `usergroup_id`, `icon`, `except_user`, `aktif`) VALUES
(22, 'acl', NULL, ',1,', '0', 'Y', 'ACL', '', ',1,2,', 'fa-cogs', '', 'Y'),
(21, 'index', NULL, '', '0', 'N', 'Dashboard', '', ',1,2,', 'fa-dashboard', '', 'Y'),
(1, '', NULL, '', 'area', 'Y', 'ADMIN SYSTEM', '', ',1,2,', 'fa-print', '', 'Y'),
(44, 'print', 'transkrip', '', '43', 'Y', 'Transkrip', '', ',1,2,', 'fa-print', '', 'Y'),
(55, 'print', 'kelas', '', '43', 'Y', 'Kelas', ',56,', ',1,2,', 'fa-bed', '', 'Y'),
(56, 'print', 'siswa', '', '55', 'Y', 'Siswa', '', ',1,2,', 'fa-gg', '', 'Y'),
(2, '', NULL, '', 'area', 'Y', 'PENGAJARAN FAKULTAS', '', ',1,2,', 'fa-print', '', 'Y'),
(59, 'account', 'loginEnd', '1', '0', 'N', 'login lagi', '', ',1,2,', 'fa-key', '', 'Y'),
(43, 'print', 'transkrip', ',1,2,', '0', 'Y', 'Cetak', ',44,45,', ',1,2,', 'fa-print', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `ref_menu`
--

CREATE TABLE `ref_menu` (
  `id` int(11) NOT NULL,
  `modul_nama` varchar(128) NOT NULL,
  `modul_label` varchar(128) NOT NULL,
  `controller` varchar(256) NOT NULL,
  `id_usergroup` varchar(128) NOT NULL,
  `parent` varchar(128) NOT NULL DEFAULT '0',
  `child` varchar(128) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_menu`
--

INSERT INTO `ref_menu` (`id`, `modul_nama`, `modul_label`, `controller`, `id_usergroup`, `parent`, `child`, `aktif`) VALUES
(1, 'dashboard', 'Dashboard', 'index', ',1,2,', '0', '', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `ref_option`
--

CREATE TABLE `ref_option` (
  `id` int(11) NOT NULL,
  `nama` varchar(64) NOT NULL,
  `opsi` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_option`
--

INSERT INTO `ref_option` (`id`, `nama`, `opsi`, `aktif`) VALUES
(1, 'warna', '["merah","hitam","putih","coklat","abu-abu","biru"]', 'Y'),
(3, 'confirm', '{"Y":"Yes","N":"No"}', 'Y'),
(4, 'bayar_via', '["CASH","Mandiri","BCA","BNI","BRI","CIMB"]', 'Y'),
(5, 'tipe_pelanggan', '["perorangan","instansi","mitra"]', 'Y'),
(6, 'agama', '["Islam","Khatolik","Hindu","Budha","Protestan"]', 'Y'),
(7, 'produk', '{"regular":"Regular","pick":"Pick & Drop","drop":"Drop off","angkut":"Jasa Angkut","tenaga":"Jasa Angkut + Tenaga"}', 'Y'),
(8, 'drop_provinsi', '["Bali","Madura","Jawa Timur","Jawa Tengah","Jawa Barat","DKI Jakarta"]', 'Y'),
(9, 'jasa_tenaga_lantai', '["Lantai 1","Lantai 2","Lantai 3"]', 'Y'),
(10, 'last_update_bank', '2016-10-25', 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `ref_user`
--

CREATE TABLE `ref_user` (
  `id` int(11) NOT NULL,
  `uid` varchar(128) NOT NULL,
  `usergroup` varchar(16) NOT NULL,
  `passwd` char(128) DEFAULT NULL,
  `nama` varchar(32) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `aktif` enum('Y','N') NOT NULL,
  `hapus` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_user`
--

INSERT INTO `ref_user` (`id`, `uid`, `usergroup`, `passwd`, `nama`, `email`, `aktif`, `hapus`) VALUES
(2, 'cs', ',2,', 'c20ad4d76fe97759aa27a0c99bff6710', 'cahyono', 'cs@sabila.com', 'Y', 'N'),
(1, 'admin', ',0,1,2,', '21232f297a57a5a743894a0e4a801fc3', 'maman2', 'admin@sabila.com', 'Y', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `ref_usergroup`
--

CREATE TABLE `ref_usergroup` (
  `id` int(2) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `deskripsi` text,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ref_usergroup`
--

INSERT INTO `ref_usergroup` (`id`, `nama`, `deskripsi`, `aktif`) VALUES
(0, 'Admin', '', 'Y'),
(1, 'Pengajaran', '', 'Y'),
(2, 'SDM', '', 'Y'),
(3, 'DOSEN', '', 'Y'),
(4, 'Karyawan', '', 'Y'),
(5, 'PERPUSTAKAAN', '', 'Y'),
(10, 'JURUSAN', '', 'Y'),
(11, 'Kapasitas Kelas', '', 'Y'),
(12, 'Nilai MHS', '', 'Y'),
(13, 'SUPERVISOR', '', 'Y'),
(14, 'PPJ-I', '', 'Y'),
(15, 'Keuangan', '', 'Y'),
(100, 'Bank', '', 'Y'),
(123, 'Pengajaran.bak', '', 'Y'),
(200, 'TU', '', 'Y'),
(300, 'DIKJAR', '', 'Y'),
(340, 'cetak', '', 'Y'),
(501, 'Rektorat_AKD', '', 'Y'),
(1000, 'MHS', '', 'Y'),
(9000, 'Monitoring Pejabat', '', 'Y'),
(9500, 'Laporan Khusus', '', 'Y'),
(30000, 'BAAK', '', 'Y');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acl`
--
ALTER TABLE `acl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_menu`
--
ALTER TABLE `ref_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_option`
--
ALTER TABLE `ref_option`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_user`
--
ALTER TABLE `ref_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ref_usergroup`
--
ALTER TABLE `ref_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acl`
--
ALTER TABLE `acl`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `ref_menu`
--
ALTER TABLE `ref_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ref_option`
--
ALTER TABLE `ref_option`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `ref_user`
--
ALTER TABLE `ref_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `ref_usergroup`
--
ALTER TABLE `ref_usergroup`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30001;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 12, 2026 at 05:26 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wagw`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id` int(11) NOT NULL,
  `nis` varchar(20) DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `jam` time DEFAULT NULL,
  `status` enum('HADIR','TERLAMBAT') DEFAULT 'HADIR',
  `waktu` datetime DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id`, `nis`, `tanggal`, `jam`, `status`, `waktu`, `latitude`, `longitude`) VALUES
(1, '55555', '2025-12-22', '11:08:15', '', NULL, NULL, NULL),
(0, '1', '2026-01-02', '18:13:16', '', '2026-01-02 18:13:16', -0.4978779, 117.1627596),
(0, '2025', '2026-01-02', '18:17:56', '', '2026-01-02 18:17:56', -0.4979049, 117.1627451),
(0, '55555', '2026-01-02', '18:20:38', '', '2026-01-02 18:20:38', -0.4978969, 117.1627487),
(0, '12', '2026-01-02', '18:22:59', '', '2026-01-02 18:22:59', -0.4978979, 117.1627431),
(0, '123', '2026-01-02', '18:31:18', '', '2026-01-02 18:31:18', -0.4978961, 117.1627476),
(0, '5555', '2026-01-02', '20:37:46', '', '2026-01-02 20:37:46', NULL, NULL),
(0, '1212', '2026-01-02', '21:30:47', '', '2026-01-02 21:30:47', NULL, NULL),
(0, '2000', '2026-01-09', '14:40:23', '', '2026-01-09 14:40:23', NULL, NULL),
(0, '2000', '2026-01-14', '10:01:21', '', '2026-01-14 10:01:21', NULL, NULL),
(0, '123124', '2026-01-14', '10:03:26', '', '2026-01-14 10:03:26', NULL, NULL),
(0, '12', '2026-01-19', '13:07:33', '', '2026-01-19 13:07:33', NULL, NULL),
(0, '20241', '2026-02-02', '09:22:54', '', '2026-02-02 09:22:54', NULL, NULL),
(0, '12', '2026-02-02', '09:23:17', '', '2026-02-02 09:23:17', NULL, NULL),
(0, '2024', '2026-02-02', '09:23:36', '', '2026-02-02 09:23:36', NULL, NULL),
(0, '123', '2026-02-08', '14:20:21', '', '2026-02-08 14:20:21', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `active_device`
--

CREATE TABLE `active_device` (
  `nis` varchar(20) NOT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `active_device`
--

INSERT INTO `active_device` (`nis`, `device_id`, `last_login`) VALUES
('1', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:14:28'),
('1', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:14:34'),
('1', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:17:19'),
('2025', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:17:30'),
('2025', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:17:48'),
('2025', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:20:15'),
('55555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:20:24'),
('55555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:20:29'),
('55555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:21:24'),
('5555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:37:35'),
('5555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:37:39'),
('5555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 21:30:26'),
('1212', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 21:30:37'),
('1212', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 21:30:42'),
('123124', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-14 10:03:14'),
('123124', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-14 10:03:21'),
('12', 'f2563ec6af5866d88945ff87952838233949e6c79466f65db2722ad6632bdb38', '2026-01-19 13:07:03'),
('12', 'f2563ec6af5866d88945ff87952838233949e6c79466f65db2722ad6632bdb38', '2026-01-19 13:07:21'),
('12', 'f2563ec6af5866d88945ff87952838233949e6c79466f65db2722ad6632bdb38', '2026-02-02 09:20:34'),
('20241', '1113d2660c63597820dea3e7ec7760a83b9bd6b109fc92915723f92b13b5d25b', '2026-02-02 09:22:00'),
('20241', '1113d2660c63597820dea3e7ec7760a83b9bd6b109fc92915723f92b13b5d25b', '2026-02-02 09:22:36'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-02 09:22:47'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-02 09:22:50'),
('2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:18:05'),
('2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:18:09'),
('2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:18:12'),
('123', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:19:11'),
('123', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:19:29'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-12 07:51:44'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-12 07:52:28'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-12 07:53:18'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-12 07:53:56'),
('20241', '1113d2660c63597820dea3e7ec7760a83b9bd6b109fc92915723f92b13b5d25b', '2026-02-12 07:54:31'),
('2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-12 07:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `autochat`
--

CREATE TABLE `autochat` (
  `rowid` bigint(20) NOT NULL,
  `profil` bigint(11) DEFAULT NULL,
  `keyword` varchar(100) NOT NULL,
  `previd` bigint(20) DEFAULT NULL,
  `logic` varchar(1) DEFAULT NULL,
  `answer` varchar(3000) DEFAULT NULL,
  `wa_media` varchar(200) DEFAULT NULL,
  `wa_file` varchar(200) DEFAULT NULL,
  `exec_php` varchar(200) DEFAULT NULL,
  `respon` varchar(1) DEFAULT NULL,
  `run_exe` varchar(200) DEFAULT NULL,
  `tipe` int(1) DEFAULT 0,
  `neednext` varchar(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `autochat`
--

INSERT INTO `autochat` (`rowid`, `profil`, `keyword`, `previd`, `logic`, `answer`, `wa_media`, `wa_file`, `exec_php`, `respon`, `run_exe`, `tipe`, `neednext`) VALUES
(1, 0, 'INFO', 0, '=', 'Silahkan pilih menu berikut ini :\r\nketikkan angka saja\r\n〰〰〰〰〰〰〰〰〰〰〰\r\n1 Ke Menu ke level 2\r\n2 Info tentang WA-GW\r\n3 Kirim saya Gambar', '', '', '', '1', '', 0, '1'),
(2, 0, '???', 0, '=', 'Maaf saya tidak mengerti ☹️\r\nCoba ketik INFO lagi untuk memulai', '', '', '', '1', '', 2, '0'),
(3, 0, '999', 0, '=', '', '', '', '', '1', '', 4, '0'),
(4, 0, '0', 0, '=', '', '', '', '', '1', '', 3, '0'),
(5, 0, '1', 1, '=', '*INI ADALAH MENU LEVEL 2*\r\n☠☠☠☠☠☠☠☠☠☠\r\nketik 1 untuk masuk menu level 3\r\nketik PHP untuk tes respon dari PHP\r\nketik QURAN untuk Random Quran\r\nketik SHOLAT untuk Jadwal Sholat\r\n\r\nketik 0 untuk kembali', '', '', '', '1', '', 0, '1'),
(6, 0, '2', 1, '=', '*INFO TENTANG WA-GW*\r\n〰〰〰〰〰〰〰〰〰〰〰\r\nKalo ada yg GRATIS !!\r\nKenapa harus Bayar ???\r\nWA-GW adalah WA Blaster, WA Sender, WA API,\r\nBot Otomatis, CRM & Helpdesk, Marketing Solution\r\nALL IN !!\r\nwa-gw.com\r\n\r\n\r\nketik 1 untuk buka link Instagram\r\nketik 0 untuk kembali ', '', '', '', '1', '', 0, '1'),
(7, 0, 'START', 0, '=', 'Halo Selamat Datang, ☺️☺️\r\nSaya adalah Bot Demo WAGW\r\n\r\nKetik INFO untuk menampilkan menu', '', '', '', '1', '', 1, '0'),
(8, 0, '1', 6, '=', 'Please follow yaa..\r\nhttps://www.instagram.com/wagwapp \r\n \r\nketik 0 untuk kembali ', '', '', '', '1', '', 0, '1'),
(9, 0, '3', 1, '=', 'Kirim Gambar dari Auto Respon\r\nklik 0 untuk kembali', 'C:\\wa-gw\\app\\bg.png', '', '', '1', '', 0, '1'),
(10, 0, '1', 5, '=', 'Ini Menu Level 3\r\n\r\nMasih mau dibikin berapa level lagi ??\r\nTerusin sendiri ya ☺️☺️\r\n\r\nketik 0 untuk kembali', '', '', '', '1', '', 0, '0'),
(11, 0, 'php', 5, '=', '', '', '', 'https://wa-gw.com/sample/sample.php', '1', '', 0, '0'),
(12, 0, 'quran', 5, '=', 'Hehe.. Coba kamu yang terusin bagian ini ya,,\r\ntinggal masukin PHP yang respon hasilnya ayat Quran\r\n\r\nbwt kembali ketik 0 lagi..', '', '', 'https://wa-gw.com/sample/quran.php', '1', '', 0, '0'),
(13, 0, 'sholat', 5, '=', '', '', '', 'https://wa-gw.com/sample/sholat.php', '1', '', 0, '0');

-- --------------------------------------------------------

--
-- Table structure for table `autochat_exclude`
--

CREATE TABLE `autochat_exclude` (
  `profil` bigint(20) DEFAULT NULL,
  `wa_no` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `autochat_user`
--

CREATE TABLE `autochat_user` (
  `wa_no` varchar(50) DEFAULT NULL,
  `previd` bigint(20) DEFAULT NULL,
  `profil` bigint(20) DEFAULT NULL,
  `exp_time` datetime DEFAULT NULL,
  `backid` bigint(20) DEFAULT NULL,
  `otp` varchar(20) DEFAULT NULL,
  `lastreply` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `autochat_user`
--

INSERT INTO `autochat_user` (`wa_no`, `previd`, `profil`, `exp_time`, `backid`, `otp`, `lastreply`) VALUES
('Mas Ganteng', 0, 0, '2021-06-14 01:12:29', 0, NULL, 'Maaf saya tidak mengerti ☹️\r\nCoba ketik INFO lagi untuk memulai'),
('Mas Ganteng', 0, 0, '2021-06-14 01:12:29', 0, NULL, 'Maaf saya tidak mengerti ☹️\r\nCoba ketik INFO lagi untuk memulai');

-- --------------------------------------------------------

--
-- Table structure for table `autorespon`
--

CREATE TABLE `autorespon` (
  `profil` bigint(11) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `answer` text DEFAULT NULL,
  `logic` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `autorespon`
--

INSERT INTO `autorespon` (`profil`, `keyword`, `answer`, `logic`) VALUES
(1, 'Hello', 'Hello :-)~r~rNice to met you', '='),
(1, 'How Are You', 'I am Fine', '='),
(1, 'I love you', 'Ohh.. I Love You Tooo.. <3 <3', ''),
(1, 'info', '*I am AutoRespon*~rBot using WA-GW', ''),
(1, 'makasih', 'Sama Sama', '%'),
(1, 'Salam', 'Wa`alaykumsalam', '%'),
(1, 'Thanx', 'Your Welcome', '='),
(2, 'Hello', 'Hello :-)~r~rNice to met you', '='),
(2, 'How Are You', 'I am Fine', '='),
(2, 'I love you', 'Ohh.. I Love You Tooo.. <3 <3', ''),
(2, 'info', '*I am AutoRespon*~rBot using WA-GW', ''),
(2, 'makasih', 'Sama Sama', '%'),
(2, 'Salam', 'Wa`alaykumsalam', '%'),
(2, 'Thanx', 'Your Welcome', '='),
(3, 'Hello', 'Hello :-)~r~rNice to met you', '='),
(3, 'How Are You', 'I am Fine', '='),
(3, 'I love you', 'Ohh.. I Love You Tooo.. <3 <3', ''),
(3, 'info', '*I am AutoRespon*~rBot using WA-GW', ''),
(3, 'makasih', 'Sama Sama', '%'),
(3, 'Salam', 'Wa`alaykumsalam', '%'),
(3, 'Thanx', 'Your Welcome', '=');

-- --------------------------------------------------------

--
-- Table structure for table `datacollect`
--

CREATE TABLE `datacollect` (
  `profil` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  `c1` varchar(200) DEFAULT NULL,
  `c2` varchar(200) DEFAULT NULL,
  `c3` varchar(200) DEFAULT NULL,
  `c4` varchar(200) DEFAULT NULL,
  `c5` varchar(200) DEFAULT NULL,
  `c6` varchar(200) DEFAULT NULL,
  `c7` varchar(200) DEFAULT NULL,
  `c8` varchar(200) DEFAULT NULL,
  `c9` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `datacollect_txt`
--

CREATE TABLE `datacollect_txt` (
  `profil` bigint(20) DEFAULT NULL,
  `cols` int(11) DEFAULT NULL,
  `txt1` varchar(300) DEFAULT NULL,
  `txt2` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_request`
--

CREATE TABLE `device_request` (
  `id` int(11) NOT NULL,
  `nis` varchar(20) NOT NULL,
  `new_device_id` varchar(255) NOT NULL,
  `request_time` datetime DEFAULT current_timestamp(),
  `status` enum('pending','approved','rejected') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `device_request`
--

INSERT INTO `device_request` (`id`, `nis`, `new_device_id`, `request_time`, `status`) VALUES
(1, '55555', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2025-12-22 10:50:17', 'approved'),
(0, '1', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-02 18:12:48', 'approved'),
(0, '1', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:14:20', 'approved'),
(0, '2025', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:17:26', 'approved'),
(0, '55555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:20:20', 'approved'),
(0, '12', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:22:44', 'approved'),
(0, '123', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:30:53', 'approved'),
(0, '12', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 18:39:40', 'approved'),
(0, '123', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:19:17', 'approved'),
(0, '123', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:28:24', 'approved'),
(0, '5555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:37:09', 'approved'),
(0, '5555', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 20:37:26', 'approved'),
(0, '1212', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-02 21:30:34', 'approved'),
(0, '2000', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-09 14:19:24', 'approved'),
(0, '2000', '38ad78b6f6a3e7bc9002cc42c9592433fd9e1d0d43a601d6b4c96de9f343ba49', '2026-01-13 12:17:16', 'approved'),
(0, '2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-13 12:18:18', 'approved'),
(0, '2000', '38ad78b6f6a3e7bc9002cc42c9592433fd9e1d0d43a601d6b4c96de9f343ba49', '2026-01-13 12:38:35', 'approved'),
(0, '2000', 'bc5398b3b1907cd05193915c2d9e60bdca15d9b9198ed533db966cbea81aab4c', '2026-01-13 12:40:40', 'approved'),
(0, '2000', '38ad78b6f6a3e7bc9002cc42c9592433fd9e1d0d43a601d6b4c96de9f343ba49', '2026-01-14 09:51:28', 'approved'),
(0, '2000', 'e4120f2bea671bd47239ab2e6fc11e1522aaf09afde0633bc2b25ed34f9f9ab3', '2026-01-14 09:54:57', 'approved'),
(0, '2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-14 09:58:34', 'approved'),
(0, '2000', 'e4120f2bea671bd47239ab2e6fc11e1522aaf09afde0633bc2b25ed34f9f9ab3', '2026-01-14 09:59:00', 'approved'),
(0, '123124', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-01-14 10:02:58', 'approved'),
(0, '12', 'f2563ec6af5866d88945ff87952838233949e6c79466f65db2722ad6632bdb38', '2026-01-19 13:06:57', 'approved'),
(0, '20241', '1113d2660c63597820dea3e7ec7760a83b9bd6b109fc92915723f92b13b5d25b', '2026-02-02 09:21:31', 'approved'),
(0, '2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-02 09:21:48', 'approved'),
(0, '2024', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', '2026-02-02 09:22:44', 'approved'),
(0, '2000', '383b33174af84f991eb9e07b75b5657210861dc799242a58082126ef9d9e3f1f', '2026-02-07 07:37:28', 'approved'),
(0, '2000', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:17:53', 'approved'),
(0, '123', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', '2026-02-08 14:18:34', 'approved');

-- --------------------------------------------------------

--
-- Table structure for table `grab`
--

CREATE TABLE `grab` (
  `profil` int(11) DEFAULT NULL,
  `grup` varchar(50) DEFAULT NULL,
  `contact` varchar(50) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `grab_tmp`
--

CREATE TABLE `grab_tmp` (
  `profil` int(11) NOT NULL,
  `contact` varchar(50) NOT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE `inbox` (
  `id` bigint(20) NOT NULL,
  `wa_no` varchar(200) NOT NULL,
  `sub_no` varchar(200) DEFAULT NULL,
  `wa_text` varchar(2000) NOT NULL,
  `wa_time` datetime NOT NULL,
  `status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `multi`
--

CREATE TABLE `multi` (
  `id` bigint(20) NOT NULL,
  `tipe` varchar(1) DEFAULT NULL,
  `profil` varchar(20) DEFAULT NULL,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) NOT NULL,
  `sub_no` varchar(200) DEFAULT NULL,
  `wa_text` varchar(2000) NOT NULL,
  `wa_media` varchar(500) DEFAULT NULL,
  `wa_file` varchar(500) DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_outbox` bigint(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `multi`
--

INSERT INTO `multi` (`id`, `tipe`, `profil`, `wa_mode`, `wa_no`, `sub_no`, `wa_text`, `wa_media`, `wa_file`, `wa_time`, `id_outbox`, `status`) VALUES
(2, 'S', '0', 0, '6282352625225', NULL, 'TTES', '', '', '2026-01-02 08:52:18', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE `outbox` (
  `id` bigint(20) NOT NULL,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) NOT NULL,
  `wa_text` varchar(2000) NOT NULL,
  `wa_media` varchar(500) DEFAULT NULL,
  `wa_file` varchar(500) DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `qr_token`
--

CREATE TABLE `qr_token` (
  `id` tinyint(11) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expired_at` datetime DEFAULT NULL,
  `status` enum('aktif','used','expired') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qr_token`
--

INSERT INTO `qr_token` (`id`, `token`, `created_at`, `expired_at`, `status`) VALUES
(1, 'eaca0b073e5e27f049e3efd0006ecca8', NULL, '2026-02-08 14:20:45', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sent`
--

CREATE TABLE `sent` (
  `id` bigint(20) NOT NULL,
  `wa_mode` int(11) DEFAULT NULL,
  `wa_no` varchar(200) NOT NULL,
  `wa_text` varchar(2000) NOT NULL,
  `wa_media` varchar(500) DEFAULT NULL,
  `wa_file` varchar(500) DEFAULT NULL,
  `wa_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sent`
--

INSERT INTO `sent` (`id`, `wa_mode`, `wa_no`, `wa_text`, `wa_media`, `wa_file`, `wa_time`, `status`) VALUES
(1, 0, '6282352625225', 'TEST FINAL DARI OUTBOX', NULL, NULL, '2026-01-02 05:22:22', NULL),
(1, 0, '6282311333123', '\r\nABSENSI SISWA SMK TI PRATAMA PGRI \r\n\r\nNama   : Agus BU\r\nKelas  : DKV\r\nJam    : 14:40\r\n\r\nStatus : HADIR\r\n', NULL, NULL, '2026-01-09 06:40:23', NULL),
(2, 0, '6282352625225', 'TES TERAKHIR CONFIG OK', NULL, NULL, '2026-01-02 05:27:41', NULL),
(2, 0, '6282311333123', '\r\nABSENSI SISWA SMK TI PRATAMA PGRI \r\n\r\nNama   : Agus BU\r\nKelas  : DKV\r\nJam    : 10:01\r\n\r\nStatus : HADIR\r\n', NULL, NULL, '2026-01-14 02:01:21', NULL),
(3, 0, '6289694225798', '\r\nABSENSI SISWA SMK TI PRATAMA PGRI \r\n\r\nNama   : rava\r\nKelas  : 2 tkj`\r\nJam    : 10:03\r\n\r\nStatus : HADIR\r\n', NULL, NULL, '2026-01-14 02:03:26', NULL),
(8, 0, '6282352625225', '\r\nABSENSI SISWA SMK TI PRATAMA PGRI \r\n\r\nNama   : ip\r\nKelas  : 22\r\nJam    : 14:20\r\n\r\nStatus : HADIR\r\n', NULL, NULL, '2026-02-08 06:20:21', NULL),
(9, 0, '6282352625225', '\r\nTEST ABSEN WA-GW\r\n\r\nNama   : jun\r\nKelas  : 1\r\nJam    : 17:31\r\n', NULL, NULL, '2026-01-02 10:31:18', NULL),
(10, 0, '628111111111', 'TES DARI PHP MANUAL', NULL, NULL, '2026-01-02 10:35:02', NULL),
(11, 0, '6282352625225', 'TES DARI PHP MANUAL', NULL, NULL, '2026-01-02 10:36:33', NULL),
(12, 0, '6282352625225', 'TES DARI PHP MANUAL', NULL, NULL, '2026-01-02 10:36:35', NULL),
(13, 0, '6282352625225', 'TEST DEBUG ABSEN', NULL, NULL, '2026-01-02 12:37:46', NULL),
(14, 0, '6282352625225', '\r\n📌 ABSENSI SISWA\r\n\r\nNama   : apa\r\nKelas  : 2 dkv\r\nJam    : 20:30\r\n\r\nStatus : HADIR\r\n', NULL, NULL, '2026-01-02 13:30:47', NULL),
(15, 0, '6289694225798', 'tes', '', '', '2026-01-02 15:16:57', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nis` varchar(20) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `no_wa_ortu` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `password_view` varchar(255) DEFAULT NULL,
  `device_hash` varchar(255) DEFAULT NULL,
  `device_status` enum('active','locked') DEFAULT 'active',
  `status` enum('pending','approved') DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nis`, `nama`, `kelas`, `no_wa_ortu`, `password`, `password_view`, `device_hash`, `device_status`, `status`) VALUES
('1', 'Yoga Dwi Prasetya', '11 DKV', '6281347754933', '$2y$10$xcYKJ7fNazE6dAvePbUp7OOp54FFYJ1s6ai6d0b5NJUs/Q.fOE3.G', '1', '', '', 'pending'),
('10', 'Junior Pratama', '12 TJKT', '6283894013177', '$2y$10$lkbPFJY8f1Kak6C7BczOj.XTm36Te.7SlJE7jARku0Sg45/miKmiW', '1', '', '', 'pending'),
('11', 'Fairuz Syauqi Maulana', '12 TJKT', '685166139013', '$2y$10$Btz7LJAw3UUcHRrQkWnXf.uUQs5SpV9Y1.xqmlefDkv0yD/2vA2xC', '1', '', '', 'pending'),
('12', 'Raga Eka Prasetya', '11 TJKT', '6281352757264', '$2y$10$Gwqy3jnh6C0u6SjIweqYduFU85s49Qesz8WtMjUgiO4FL1r95BqC.', '1', '', '', 'pending'),
('123', 'ip', '22', '6282352625225', '$2y$10$7/J7k89Wy/3Qq2keJCfYrOpwR667ceHSezfoqE98hIgxjXreQlPcS', 'io', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', 'active', 'pending'),
('123124', 'rava', '2 tkj`', '089694225798', '$2y$10$UPQNhRDJTmbDz1FcKrAsn.ZlR/zqb2TLo7hDG.H7bIje0M9bLgSQu', '1', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', 'active', 'pending'),
('13', 'Habibie Fathurrahman Siregar', '12 TJKT', '685754606081', '$2y$10$CzReN9hKSebNXUGpVxFZT.Tt15Uzck0WYk6r.DiUcyrOO1rcERYXO', '1', '', '', 'pending'),
('2', 'Ar Reyhan', '12 TJKT', '6282252566988', '$2y$10$9qtifo4iA48fXN4dY/N8Xe3CwZAlz4lh.MroWQZ6iOn7VVKDTAkT.', '1', '', '', 'pending'),
('2000', 'Agus BU', 'DKV', '6282311333123', '$2y$10$nyGHfZiwTNDVIVyV0t3sSuRw1pXbZQ3j1awnuKlCZEwpFI4fTgJW.', '1', '5a6cd6b0ba52ba3fd53fa58902f72bd4b77efe678ea9037e7a5df39ca3c27210', 'active', 'pending'),
('2024', 'Kornelius Wahyu Satria', '11 TJKT', '6285756732488', '$2y$10$k8ai.Dh9fnIlbq0aXA7TxuaAL6/jKLO3kC48R121A7ZjC/eCwBoOS', 'kornel', '01dfd754208aac20059eddb72ffe5610da4d2c448f2219c65f525008d2bb97fd', 'active', 'pending'),
('20241', 'Erika Nur Handayani Agustin', '11 TJKT', '6281260036965', '$2y$10$blrOoJ.eu9E5Oa7RaWLKE.eAbAcF4IjRr5EaSameQxlfGBiW5dDbu', 'bing bing', '1113d2660c63597820dea3e7ec7760a83b9bd6b109fc92915723f92b13b5d25b', 'active', 'pending'),
('20242', 'Leonardo Hartono', '11 TJKT', '6285240175352', '$2y$10$3Rp7UmcXjoxqnss5HIFLSOOyf7LY11Sl11K6zgQGvd1qECf8siaRS', '123', '', '', 'pending'),
('20251', 'Muhammad Rafy', '10 TJKT', '6282160390590', '$2y$10$7k8F25DhLNgBWyO4fZqbAu9vDh6f6RzJQxeUvbVT1oxIyAeCSnL46', '1', '', '', 'pending'),
('20261', 'Azzah Lutfiana', '11 DKV', '6282251153300', '$2y$10$u3JBd7hS5by9DxFH29ZJ.ONt67ZfTo.p3lHYSoJIW1tyZ0uPnRgXC', '1', '', '', 'pending'),
('202611', 'Like Patmasari', '11 DKV', '6285822192770', '$2y$10$Bp8tcIJl1ERCo1R0e3ovtuEMAugRMAigAYEjIMG.gsjt3DKLMXona', '1', '', '', 'pending'),
('3', 'Damasenus Paledang Hayon', '11 TJKT', '6281237379564', '$2y$10$gHUkpxCp/vOHHxAg4hYDpejQfQ3Xa1CoQZoW5s7RJ9PEkcuMyyoO2', '1', '', '', 'pending'),
('4', 'Maria Sintia Letek Weking', '12 DKV', '682150310282', '$2y$10$lOnIxhF3z623OlCyt6ryMuv3XGHSyr8DWvJwLPRCyuG8CZQZrpvY6', '1', '', '', 'pending'),
('5', 'Lisnaini Qaswana Putri', '12 DKV', '681256881857', '$2y$10$/kZHT9AGOFltq841pq/Wj.RfH7In2A4EpPT79Adi5IL4hMv/UzAWW', 'password', '', '', 'pending'),
('6', 'Fahry Afif', '10 TJKT', '6281352757264', '$2y$10$ch.btYzPG2NacHzqTU6q2eFO.ujUjsglW4/3ckHwgy3FWtg7qIzZK', '1', '', '', 'pending'),
('7', 'Muhammad Zidan Ramadhan', '12 TJKT', '6282191680389', '$2y$10$TVXWyo07aZM7jhQ4OvOGL.bL5cKddB8C4GZBFU04ruq42ISKLFlte', 'password', '', '', 'pending'),
('8', 'Muhammad Sadam', '12 TJKT', '682254424668', '$2y$10$MhZOTgkfRu2AzL8ua2t99.MiBz5x9w1QLcOF50/viGnBz8UB7bYrO', '1', '', '', 'pending'),
('9', 'Arif Purwanto', '12 TJKT', '682183329885', '$2y$10$xfomzPkX8J9DGUagUG2kne4LETxgJiEYGT7uLE4PygVGhUiRRu/za', '1', '', '', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tesbot`
--

CREATE TABLE `tesbot` (
  `kode` varchar(10) DEFAULT NULL,
  `nama` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmp`
--

CREATE TABLE `tmp` (
  `tmp_cd` varchar(50) NOT NULL,
  `tmp_val` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tmp`
--

INSERT INTO `tmp` (`tmp_cd`, `tmp_val`) VALUES
('appname', 'wg');

-- --------------------------------------------------------

--
-- Table structure for table `web_user`
--

CREATE TABLE `web_user` (
  `id` bigint(20) NOT NULL,
  `wa_user` varchar(100) NOT NULL,
  `wa_no` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `status` varchar(1) DEFAULT 'N',
  `password` varchar(20) DEFAULT NULL,
  `create_dt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `last_login` datetime DEFAULT NULL,
  `qr` varchar(500) DEFAULT NULL,
  `bot_mode` varchar(1) DEFAULT NULL,
  `bot_url` varchar(500) DEFAULT NULL,
  `disable_read` varchar(1) DEFAULT 'Y',
  `expiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `web_user`
--

INSERT INTO `web_user` (`id`, `wa_user`, `wa_no`, `email`, `status`, `password`, `create_dt`, `last_login`, `qr`, `bot_mode`, `bot_url`, `disable_read`, `expiry`) VALUES
(1, 'demo', '6285692961782', 'demo', 'Y', 'demo', '2021-07-24 19:38:57', '2021-07-20 05:42:36', '', '1', 'http://localhost/bots/autorespon.php', 'Y', '2099-12-31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `autochat`
--
ALTER TABLE `autochat`
  ADD PRIMARY KEY (`rowid`);

--
-- Indexes for table `autochat_exclude`
--
ALTER TABLE `autochat_exclude`
  ADD KEY `profil` (`profil`);

--
-- Indexes for table `autorespon`
--
ALTER TABLE `autorespon`
  ADD PRIMARY KEY (`profil`,`keyword`);

--
-- Indexes for table `datacollect`
--
ALTER TABLE `datacollect`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inbox`
--
ALTER TABLE `inbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `multi`
--
ALTER TABLE `multi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbox`
--
ALTER TABLE `outbox`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qr_token`
--
ALTER TABLE `qr_token`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sent`
--
ALTER TABLE `sent`
  ADD PRIMARY KEY (`id`,`wa_time`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nis`);

--
-- Indexes for table `tmp`
--
ALTER TABLE `tmp`
  ADD PRIMARY KEY (`tmp_cd`);

--
-- Indexes for table `web_user`
--
ALTER TABLE `web_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `autochat`
--
ALTER TABLE `autochat`
  MODIFY `rowid` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `datacollect`
--
ALTER TABLE `datacollect`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inbox`
--
ALTER TABLE `inbox`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `multi`
--
ALTER TABLE `multi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `outbox`
--
ALTER TABLE `outbox`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `web_user`
--
ALTER TABLE `web_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

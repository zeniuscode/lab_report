-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 26 Mar 2018 pada 02.02
-- Versi Server: 10.1.24-MariaDB
-- PHP Version: 7.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_lab_report`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'superuser', NULL, NULL),
(2, 'default', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_department`
--

CREATE TABLE `auth_group_department` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `department_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_group_permission`
--

CREATE TABLE `auth_group_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `codename`, `created_at`, `updated_at`) VALUES
(1, 'Master User', 'master_user', NULL, NULL),
(2, 'Master Department', 'master_department', NULL, NULL),
(3, 'Master Variant Product', 'master_variant_product', NULL, NULL),
(4, 'Master Shift', 'master_shift', NULL, NULL),
(5, 'Master Line', 'master_line', NULL, NULL),
(6, 'Master Auth', 'master_auth', NULL, NULL),
(7, 'Input Sample Minyak', 'input_sample_minyak', NULL, NULL),
(8, 'Approve Sample Minyak', 'approve_sample_minyak', NULL, NULL),
(9, 'View Sample Minyak', 'view_sample_minyak', NULL, NULL),
(10, 'Report Sample Minyak', 'report_sample_minyak', NULL, NULL),
(11, 'Input Sample Mie', 'input_sample_mie', NULL, NULL),
(12, 'Approve Sample Mie', 'approve_sample_mie', NULL, NULL),
(13, 'View Sample Mie', 'view_sample_mie', NULL, NULL),
(14, 'Report Sample Mie', 'report_sample_mie', NULL, NULL),
(15, 'Set Shift', 'set_shift', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(2, '2018_03_09_024054_create_m_department_table', 1),
(3, '2018_03_09_024135_create_m_line_table', 1),
(4, '2018_03_09_024211_create_m_product_table', 1),
(5, '2018_03_09_024337_create_auth_group_table', 1),
(6, '2018_03_09_024424_create_auth_permission_table', 1),
(9, '2018_03_09_024727_create_t_sample_minyak_table', 1),
(10, '2018_03_09_024750_create_t_pv_table', 1),
(11, '2018_03_09_024807_create_t_ffa_table', 1),
(12, '2018_03_09_024831_create_t_sample_mie_table', 1),
(13, '2018_03_09_024901_create_t_fc_table', 1),
(14, '2018_03_09_024929_create_t_ka_table', 1),
(17, '2018_03_09_024211_create_m_variant_product_table', 2),
(19, '2018_03_09_023917_create_m_shift_table', 4),
(20, '2018_03_09_040759_create_t_shift_table', 4),
(21, '2018_03_19_035501_create_m_jam_sample_table', 5),
(22, '2018_03_09_024607_create_m_user_table', 6),
(23, '2018_03_09_024524_create_auth_group_permission_table', 7),
(24, '2018_03_25_003349_create_auth_group_department_table', 8);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_department`
--

CREATE TABLE `m_department` (
  `id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_department`
--

INSERT INTO `m_department` (`id`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('1', 'ITE', 'Y', '25749', '25749', '2018-03-14 23:34:31', '2018-03-15 03:04:20'),
('2', 'PRN', 'Y', '25749', '25749', '2018-03-25 06:44:13', '2018-03-25 06:44:13');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_jam_sample`
--

CREATE TABLE `m_jam_sample` (
  `id` int(10) UNSIGNED NOT NULL,
  `jam_sample` time NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_jam_sample`
--

INSERT INTO `m_jam_sample` (`id`, `jam_sample`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, '06:00:00', '04091725749', '04091725749', NULL, NULL),
(2, '07:30:00', '04091725749', '04091725749', NULL, NULL),
(3, '09:00:00', '04091725749', '04091725749', NULL, NULL),
(4, '10:30:00', '04091725749', '04091725749', NULL, NULL),
(5, '12:00:00', '04091725749', '04091725749', NULL, NULL),
(6, '13:30:00', '04091725749', '04091725749', NULL, NULL),
(7, '15:00:00', '04091725749', '04091725749', NULL, NULL),
(8, '16:30:00', '04091725749', '04091725749', NULL, NULL),
(9, '18:00:00', '04091725749', '04091725749', NULL, NULL),
(10, '19:30:00', '04091725749', '04091725749', NULL, NULL),
(11, '21:00:00', '04091725749', '04091725749', NULL, NULL),
(12, '22:30:00', '04091725749', '04091725749', NULL, NULL),
(13, '00:00:00', '04091725749', '04091725749', NULL, NULL),
(14, '01:30:00', '04091725749', '04091725749', NULL, NULL),
(15, '03:00:00', '04091725749', '04091725749', NULL, NULL),
(16, '04:30:00', '04091725749', '04091725749', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_line`
--

CREATE TABLE `m_line` (
  `id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_line`
--

INSERT INTO `m_line` (`id`, `dept_id`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('LINE 1', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 10', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 11', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 12', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 13', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 14', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 15', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 16', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 2', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 3', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 4', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 5', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 6', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 7', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 8', '2', 'Y', '0491725749', '0491725749', NULL, NULL),
('LINE 9', '2', 'Y', '0491725749', '0491725749', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_product`
--

CREATE TABLE `m_product` (
  `mid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_shift`
--

CREATE TABLE `m_shift` (
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jam_awal` time NOT NULL,
  `jam_akhir` time NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_shift`
--

INSERT INTO `m_shift` (`name`, `jam_awal`, `jam_akhir`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('NORMAL SHIFT 1', '07:00:00', '15:00:00', 'Y', '25749', '25749', '2018-03-16 03:21:25', '2018-03-16 03:27:08'),
('NORMAL SHIFT 2', '15:00:00', '23:00:00', 'Y', '25749', '25749', '2018-03-16 03:23:34', '2018-03-16 03:27:11'),
('NORMAL SHIFT 3', '23:00:00', '07:00:00', 'Y', '25749', '25749', '2018-03-16 03:24:02', '2018-03-16 03:27:04'),
('SHORT SHIFT 1', '07:00:00', '12:00:00', 'Y', '25749', '25749', '2018-03-16 03:25:11', '2018-03-16 03:25:11'),
('SHORT SHIFT 2', '12:00:00', '17:00:00', 'Y', '25749', '25749', '2018-03-16 03:25:31', '2018-03-16 03:25:31'),
('SHORT SHIFT 3', '17:00:00', '22:00:00', 'Y', '25749', '25749', '2018-03-16 03:26:17', '2018-03-16 03:26:17');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_user`
--

CREATE TABLE `m_user` (
  `nik` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_id` int(10) UNSIGNED NOT NULL,
  `dept_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jabatan` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_user`
--

INSERT INTO `m_user` (`nik`, `group_id`, `dept_id`, `name`, `jabatan`, `email`, `password`, `created_by`, `updated_by`, `status`, `created_at`, `updated_at`, `remember_token`) VALUES
('04091725749', 2, '1', 'Heri Lesmana', 'Admin', 'lezmanaherie@gmail.com', '$2y$10$g/2fMvOPH8KcqAYoTFQ4uutH10mcYNobee7TqHPx7zdBmFFzArjQ.', '25749', '25749', 'Y', '2018-03-22 20:55:28', '2018-03-22 20:55:28', 'mleO6WaZ2iIWS1YVtrHBr486iHMTLciQZC5YiJZucs2Ia0D3wBbEFPSNVzpE'),
('04091725750', 2, '1', 'Muhammad Machbub Marzuqi', 'Foreman', 'muhammadmachbubmarzuqie@prakarsaalamsegar.com', '$2y$10$Ntol1LNzW6Cr7SdIlNvDUuh2hwJxSSQ08JWNv917kk/8akv3AI/gi', '25749', '25749', 'Y', '2018-03-22 20:56:00', '2018-03-23 00:24:45', 'ismbtlshN4zW2URfQaEtQ4RVershY4uV8ks6nW6HiXeHmHGcfboyoWTYNyRS');

-- --------------------------------------------------------

--
-- Struktur dari tabel `m_variant_product`
--

CREATE TABLE `m_variant_product` (
  `mid` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Y','N') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `m_variant_product`
--

INSERT INTO `m_variant_product` (`mid`, `name`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
('1001', 'Soto', 'Y', '25749', '25749', '2018-03-15 00:10:56', '2018-03-15 00:11:47'),
('10110', 'Goreng', 'Y', '25749', '25749', '2018-03-15 00:12:03', '2018-03-15 00:12:07'),
('1101', 'ST', 'Y', '25749', '25749', '2018-03-25 07:14:12', '2018-03-25 07:14:12'),
('1102', 'GR', 'Y', '25749', '25749', '2018-03-25 07:14:22', '2018-03-25 07:14:22');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_fc`
--

CREATE TABLE `t_fc` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `labu_isi` double(8,4) NOT NULL,
  `labu_awal` double(8,4) NOT NULL,
  `bobot_sample` double(8,4) NOT NULL,
  `nilai` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_ffa`
--

CREATE TABLE `t_ffa` (
  `id` int(10) NOT NULL,
  `sample_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tangki` enum('BKA','BKB','MP','BB') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `volume_titrasi` double(8,4) NOT NULL,
  `bobot_sample` double(8,4) NOT NULL,
  `normalitas` double(8,4) NOT NULL,
  `faktor` double(8,4) NOT NULL,
  `nilai` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_ffa`
--

INSERT INTO `t_ffa` (`id`, `sample_id`, `tangki`, `volume_titrasi`, `bobot_sample`, `normalitas`, `faktor`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 'SMK00001', 'MP', 0.8700, 10.0224, 0.1026, 25.6000, 0.2280, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
(2, 'SMK00001', 'BKA', 0.4500, 10.0270, 0.1026, 25.6000, 0.1179, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
(3, 'SMK00001', 'BKB', 0.4400, 10.1205, 0.1026, 25.6000, 0.1142, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
(4, 'SMK00002', 'MP', 0.4400, 10.0899, 0.1026, 25.6000, 0.1145, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
(5, 'SMK00003', 'MP', 0.7800, 10.0750, 0.1026, 25.6000, 0.2033, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
(6, 'SMK00004', 'MP', 0.4000, 10.0854, 0.1026, 25.6000, 0.1042, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(7, 'SMK00005', 'MP', 0.3400, 10.0006, 0.1026, 25.6000, 0.0893, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(8, 'SMK00006', 'MP', 0.4000, 10.0304, 0.1026, 25.6000, 0.1047, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(9, 'SMK00007', 'MP', 0.4100, 10.0343, 0.1026, 25.6000, 0.1073, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(10, 'SMK00008', 'MP', 0.4600, 10.0256, 0.1026, 25.6000, 0.1205, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(11, 'SMK00009', 'MP', 2.5100, 10.2101, 0.1026, 25.6000, 0.6457, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(12, 'SMK00010', 'MP', 0.4300, 10.3312, 0.1026, 25.6000, 0.1093, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(13, 'SMK00011', 'MP', 1.9800, 10.0444, 0.1026, 25.6000, 0.5178, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(14, 'SMK00012', 'MP', 0.9800, 10.0209, 0.1026, 25.6000, 0.2569, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(15, 'SMK00013', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(16, 'SMK00014', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(17, 'SMK00015', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(18, 'SMK00016', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 09:56:04', '2018-03-25 09:56:04'),
(19, 'SMK00017', 'MP', 0.8700, 10.0224, 0.1026, 25.6000, 0.2280, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(20, 'SMK00017', 'BKA', 0.4500, 10.0270, 0.1026, 25.6000, 0.1179, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(21, 'SMK00017', 'BKB', 0.4400, 10.1205, 0.1026, 25.6000, 0.1142, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(22, 'SMK00018', 'MP', 0.4400, 10.0899, 0.1026, 25.6000, 0.1145, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(23, 'SMK00019', 'MP', 0.7800, 10.0750, 0.1026, 25.6000, 0.2033, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(24, 'SMK00020', 'MP', 0.4000, 10.0854, 0.1026, 25.6000, 0.1042, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(25, 'SMK00021', 'MP', 0.3400, 10.0006, 0.1026, 25.6000, 0.0893, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(26, 'SMK00022', 'MP', 0.4000, 10.0304, 0.1026, 25.6000, 0.1047, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(27, 'SMK00023', 'MP', 0.4100, 10.0343, 0.1026, 25.6000, 0.1073, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(28, 'SMK00024', 'MP', 0.4600, 10.0256, 0.1026, 25.6000, 0.1205, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(29, 'SMK00025', 'MP', 2.5100, 10.2101, 0.1026, 25.6000, 0.6457, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(30, 'SMK00026', 'MP', 0.4300, 10.3312, 0.1026, 25.6000, 0.1093, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(31, 'SMK00027', 'MP', 1.9800, 10.0444, 0.1026, 25.6000, 0.5178, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(32, 'SMK00028', 'MP', 0.9800, 10.0209, 0.1026, 25.6000, 0.2569, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(33, 'SMK00029', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(34, 'SMK00030', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(35, 'SMK00031', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(36, 'SMK00032', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(37, 'SMK00033', 'MP', 0.8700, 10.0224, 0.1026, 25.6000, 0.2280, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(38, 'SMK00033', 'BKA', 0.4500, 10.0270, 0.1026, 25.6000, 0.1179, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(39, 'SMK00033', 'BKB', 0.4400, 10.1205, 0.1026, 25.6000, 0.1142, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(40, 'SMK00034', 'MP', 0.4400, 10.0899, 0.1026, 25.6000, 0.1145, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(41, 'SMK00035', 'MP', 0.7800, 10.0750, 0.1026, 25.6000, 0.2033, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(42, 'SMK00036', 'MP', 0.4000, 10.0854, 0.1026, 25.6000, 0.1042, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(43, 'SMK00037', 'MP', 0.3400, 10.0006, 0.1026, 25.6000, 0.0893, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(44, 'SMK00038', 'MP', 0.4000, 10.0304, 0.1026, 25.6000, 0.1047, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(45, 'SMK00039', 'MP', 0.4100, 10.0343, 0.1026, 25.6000, 0.1073, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(46, 'SMK00040', 'MP', 0.4600, 10.0256, 0.1026, 25.6000, 0.1205, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(47, 'SMK00041', 'MP', 2.5100, 10.2101, 0.1026, 25.6000, 0.6457, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(48, 'SMK00042', 'MP', 0.4300, 10.3312, 0.1026, 25.6000, 0.1093, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(49, 'SMK00043', 'MP', 1.9800, 10.0444, 0.1026, 25.6000, 0.5178, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(50, 'SMK00044', 'MP', 0.9800, 10.0209, 0.1026, 25.6000, 0.2569, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(51, 'SMK00045', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(52, 'SMK00046', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(53, 'SMK00047', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(54, 'SMK00048', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(55, 'SMK00049', 'MP', 0.8700, 10.0224, 0.1026, 25.6000, 0.2280, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(56, 'SMK00049', 'BKA', 0.4500, 10.0270, 0.1026, 25.6000, 0.1179, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(57, 'SMK00049', 'BKB', 0.4400, 10.1205, 0.1026, 25.6000, 0.1142, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(58, 'SMK00050', 'MP', 0.4400, 10.0899, 0.1026, 25.6000, 0.1145, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(59, 'SMK00051', 'MP', 0.7800, 10.0750, 0.1026, 25.6000, 0.2033, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(60, 'SMK00052', 'MP', 0.4000, 10.0854, 0.1026, 25.6000, 0.1042, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(61, 'SMK00053', 'MP', 0.3400, 10.0006, 0.1026, 25.6000, 0.0893, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(62, 'SMK00054', 'MP', 0.4000, 10.0304, 0.1026, 25.6000, 0.1047, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(63, 'SMK00055', 'MP', 0.4100, 10.0343, 0.1026, 25.6000, 0.1073, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(64, 'SMK00056', 'MP', 0.4600, 10.0256, 0.1026, 25.6000, 0.1205, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(65, 'SMK00057', 'MP', 2.5100, 10.2101, 0.1026, 25.6000, 0.6457, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(66, 'SMK00058', 'MP', 0.4300, 10.3312, 0.1026, 25.6000, 0.1093, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(67, 'SMK00059', 'MP', 1.9800, 10.0444, 0.1026, 25.6000, 0.5178, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(68, 'SMK00060', 'MP', 0.9800, 10.0209, 0.1026, 25.6000, 0.2569, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(69, 'SMK00061', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(70, 'SMK00062', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(71, 'SMK00063', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:27:43', '2018-03-25 10:27:43'),
(72, 'SMK00064', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:27:43', '2018-03-25 10:27:43'),
(73, 'SMK00065', 'MP', 0.8700, 10.0224, 0.1026, 25.6000, 0.2280, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(74, 'SMK00065', 'BKA', 0.4500, 10.0270, 0.1026, 25.6000, 0.1179, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(75, 'SMK00065', 'BKB', 0.4400, 10.1205, 0.1026, 25.6000, 0.1142, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(76, 'SMK00066', 'MP', 0.4400, 10.0899, 0.1026, 25.6000, 0.1145, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(77, 'SMK00067', 'MP', 0.7800, 10.0750, 0.1026, 25.6000, 0.2033, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(78, 'SMK00068', 'MP', 0.4000, 10.0854, 0.1026, 25.6000, 0.1042, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(79, 'SMK00069', 'MP', 0.3400, 10.0006, 0.1026, 25.6000, 0.0893, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(80, 'SMK00070', 'MP', 0.4000, 10.0304, 0.1026, 25.6000, 0.1047, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(81, 'SMK00071', 'MP', 0.4100, 10.0343, 0.1026, 25.6000, 0.1073, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(82, 'SMK00072', 'MP', 0.4600, 10.0256, 0.1026, 25.6000, 0.1205, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(83, 'SMK00073', 'MP', 2.5100, 10.2101, 0.1026, 25.6000, 0.6457, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(84, 'SMK00074', 'MP', 0.4300, 10.3312, 0.1026, 25.6000, 0.1093, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(85, 'SMK00075', 'MP', 1.9800, 10.0444, 0.1026, 25.6000, 0.5178, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(86, 'SMK00076', 'MP', 0.9800, 10.0209, 0.1026, 25.6000, 0.2569, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(87, 'SMK00077', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(88, 'SMK00078', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(89, 'SMK00079', 'MP', 0.4000, 10.0148, 0.1026, 25.6000, 0.1049, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(90, 'SMK00080', 'MP', 0.9800, 10.0296, 0.1026, 25.6000, 0.2566, '2018-03-25 10:28:37', '2018-03-25 10:28:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_ka`
--

CREATE TABLE `t_ka` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `w0` double(8,4) NOT NULL,
  `w1` double(8,4) NOT NULL,
  `w2` double(8,4) NOT NULL,
  `nilai` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_pv`
--

CREATE TABLE `t_pv` (
  `id` int(10) NOT NULL,
  `sample_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tangki` enum('BKA','BKB','MP','BB') COLLATE utf8mb4_unicode_ci NOT NULL,
  `volume_titrasi` double(8,4) NOT NULL,
  `bobot_sample` double(8,4) NOT NULL,
  `normalitas` double(8,4) NOT NULL,
  `faktor` double(8,4) NOT NULL,
  `nilai` double(8,4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_pv`
--

INSERT INTO `t_pv` (`id`, `sample_id`, `tangki`, `volume_titrasi`, `bobot_sample`, `normalitas`, `faktor`, `nilai`, `created_at`, `updated_at`) VALUES
(1, 'SMK00001', 'MP', 1.5600, 5.0413, 0.0100, 1000.0000, 3.0900, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
(2, 'SMK00001', 'BKA', 0.9800, 5.0568, 0.0100, 1000.0000, 1.9400, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
(3, 'SMK00001', 'BKB', 1.5500, 5.1326, 0.0100, 1000.0000, 3.0200, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
(4, 'SMK00002', 'MP', 1.9800, 5.1406, 0.0100, 1000.0000, 3.8500, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
(5, 'SMK00003', 'MP', 1.5100, 5.0092, 0.0100, 1000.0000, 3.0100, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
(6, 'SMK00004', 'MP', 1.3200, 5.0753, 0.0100, 1000.0000, 2.6000, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(7, 'SMK00005', 'MP', 1.4800, 5.0523, 0.0100, 1000.0000, 2.9300, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(8, 'SMK00006', 'MP', 1.7000, 5.0506, 0.0100, 1000.0000, 3.3700, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(9, 'SMK00007', 'MP', 1.7300, 5.0177, 0.0100, 1000.0000, 3.4500, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(10, 'SMK00008', 'MP', 1.2500, 5.0347, 0.0100, 1000.0000, 2.4800, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(11, 'SMK00009', 'MP', 1.5500, 5.0244, 0.0100, 1000.0000, 3.0800, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
(12, 'SMK00010', 'MP', 1.4200, 5.1260, 0.0100, 1000.0000, 2.7700, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(13, 'SMK00011', 'MP', 1.8700, 5.0338, 0.0100, 1000.0000, 3.7100, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(14, 'SMK00012', 'MP', 2.0100, 5.0160, 0.0100, 1000.0000, 4.0100, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(15, 'SMK00013', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(16, 'SMK00014', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(17, 'SMK00015', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
(18, 'SMK00016', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 09:56:04', '2018-03-25 09:56:04'),
(19, 'SMK00017', 'MP', 1.5600, 5.0413, 0.0100, 1000.0000, 3.0900, '2018-03-25 10:22:08', '2018-03-25 10:22:08'),
(20, 'SMK00017', 'BKA', 0.9800, 5.0568, 0.0100, 1000.0000, 1.9400, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(21, 'SMK00017', 'BKB', 1.5500, 5.1326, 0.0100, 1000.0000, 3.0200, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(22, 'SMK00018', 'MP', 1.9800, 5.1406, 0.0100, 1000.0000, 3.8500, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(23, 'SMK00019', 'MP', 1.5100, 5.0092, 0.0100, 1000.0000, 3.0100, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
(24, 'SMK00020', 'MP', 1.3200, 5.0753, 0.0100, 1000.0000, 2.6000, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(25, 'SMK00021', 'MP', 1.4800, 5.0523, 0.0100, 1000.0000, 2.9300, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(26, 'SMK00022', 'MP', 1.7000, 5.0506, 0.0100, 1000.0000, 3.3700, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(27, 'SMK00023', 'MP', 1.7300, 5.0177, 0.0100, 1000.0000, 3.4500, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
(28, 'SMK00024', 'MP', 1.2500, 5.0347, 0.0100, 1000.0000, 2.4800, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(29, 'SMK00025', 'MP', 1.5500, 5.0244, 0.0100, 1000.0000, 3.0800, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(30, 'SMK00026', 'MP', 1.4200, 5.1260, 0.0100, 1000.0000, 2.7700, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(31, 'SMK00027', 'MP', 1.8700, 5.0338, 0.0100, 1000.0000, 3.7100, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(32, 'SMK00028', 'MP', 2.0100, 5.0160, 0.0100, 1000.0000, 4.0100, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(33, 'SMK00029', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
(34, 'SMK00030', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(35, 'SMK00031', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(36, 'SMK00032', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
(37, 'SMK00033', 'MP', 1.5600, 5.0413, 0.0100, 1000.0000, 3.0900, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(38, 'SMK00033', 'BKA', 0.9800, 5.0568, 0.0100, 1000.0000, 1.9400, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(39, 'SMK00033', 'BKB', 1.5500, 5.1326, 0.0100, 1000.0000, 3.0200, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(40, 'SMK00034', 'MP', 1.9800, 5.1406, 0.0100, 1000.0000, 3.8500, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
(41, 'SMK00035', 'MP', 1.5100, 5.0092, 0.0100, 1000.0000, 3.0100, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(42, 'SMK00036', 'MP', 1.3200, 5.0753, 0.0100, 1000.0000, 2.6000, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(43, 'SMK00037', 'MP', 1.4800, 5.0523, 0.0100, 1000.0000, 2.9300, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(44, 'SMK00038', 'MP', 1.7000, 5.0506, 0.0100, 1000.0000, 3.3700, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(45, 'SMK00039', 'MP', 1.7300, 5.0177, 0.0100, 1000.0000, 3.4500, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
(46, 'SMK00040', 'MP', 1.2500, 5.0347, 0.0100, 1000.0000, 2.4800, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(47, 'SMK00041', 'MP', 1.5500, 5.0244, 0.0100, 1000.0000, 3.0800, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(48, 'SMK00042', 'MP', 1.4200, 5.1260, 0.0100, 1000.0000, 2.7700, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(49, 'SMK00043', 'MP', 1.8700, 5.0338, 0.0100, 1000.0000, 3.7100, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(50, 'SMK00044', 'MP', 2.0100, 5.0160, 0.0100, 1000.0000, 4.0100, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
(51, 'SMK00045', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(52, 'SMK00046', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(53, 'SMK00047', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(54, 'SMK00048', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
(55, 'SMK00049', 'MP', 1.5600, 5.0413, 0.0100, 1000.0000, 3.0900, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(56, 'SMK00049', 'BKA', 0.9800, 5.0568, 0.0100, 1000.0000, 1.9400, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(57, 'SMK00049', 'BKB', 1.5500, 5.1326, 0.0100, 1000.0000, 3.0200, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(58, 'SMK00050', 'MP', 1.9800, 5.1406, 0.0100, 1000.0000, 3.8500, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(59, 'SMK00051', 'MP', 1.5100, 5.0092, 0.0100, 1000.0000, 3.0100, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(60, 'SMK00052', 'MP', 1.3200, 5.0753, 0.0100, 1000.0000, 2.6000, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
(61, 'SMK00053', 'MP', 1.4800, 5.0523, 0.0100, 1000.0000, 2.9300, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(62, 'SMK00054', 'MP', 1.7000, 5.0506, 0.0100, 1000.0000, 3.3700, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(63, 'SMK00055', 'MP', 1.7300, 5.0177, 0.0100, 1000.0000, 3.4500, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(64, 'SMK00056', 'MP', 1.2500, 5.0347, 0.0100, 1000.0000, 2.4800, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
(65, 'SMK00057', 'MP', 1.5500, 5.0244, 0.0100, 1000.0000, 3.0800, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(66, 'SMK00058', 'MP', 1.4200, 5.1260, 0.0100, 1000.0000, 2.7700, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(67, 'SMK00059', 'MP', 1.8700, 5.0338, 0.0100, 1000.0000, 3.7100, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(68, 'SMK00060', 'MP', 2.0100, 5.0160, 0.0100, 1000.0000, 4.0100, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(69, 'SMK00061', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(70, 'SMK00062', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
(71, 'SMK00063', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:27:43', '2018-03-25 10:27:43'),
(72, 'SMK00064', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:27:43', '2018-03-25 10:27:43'),
(73, 'SMK00065', 'MP', 1.5600, 5.0413, 0.0100, 1000.0000, 3.0900, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(74, 'SMK00065', 'BKA', 0.9800, 5.0568, 0.0100, 1000.0000, 1.9400, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(75, 'SMK00065', 'BKB', 1.5500, 5.1326, 0.0100, 1000.0000, 3.0200, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(76, 'SMK00066', 'MP', 1.9800, 5.1406, 0.0100, 1000.0000, 3.8500, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
(77, 'SMK00067', 'MP', 1.5100, 5.0092, 0.0100, 1000.0000, 3.0100, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(78, 'SMK00068', 'MP', 1.3200, 5.0753, 0.0100, 1000.0000, 2.6000, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(79, 'SMK00069', 'MP', 1.4800, 5.0523, 0.0100, 1000.0000, 2.9300, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(80, 'SMK00070', 'MP', 1.7000, 5.0506, 0.0100, 1000.0000, 3.3700, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(81, 'SMK00071', 'MP', 1.7300, 5.0177, 0.0100, 1000.0000, 3.4500, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(82, 'SMK00072', 'MP', 1.2500, 5.0347, 0.0100, 1000.0000, 2.4800, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
(83, 'SMK00073', 'MP', 1.5500, 5.0244, 0.0100, 1000.0000, 3.0800, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(84, 'SMK00074', 'MP', 1.4200, 5.1260, 0.0100, 1000.0000, 2.7700, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(85, 'SMK00075', 'MP', 1.8700, 5.0338, 0.0100, 1000.0000, 3.7100, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(86, 'SMK00076', 'MP', 2.0100, 5.0160, 0.0100, 1000.0000, 4.0100, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
(87, 'SMK00077', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(88, 'SMK00078', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(89, 'SMK00079', 'MP', 1.0200, 5.0678, 0.0100, 1000.0000, 2.0100, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
(90, 'SMK00080', 'MP', 0.9800, 5.0685, 0.0100, 1000.0000, 1.9300, '2018-03-25 10:28:37', '2018-03-25 10:28:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sample_mie`
--

CREATE TABLE `t_sample_mie` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid_product` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_date` date NOT NULL,
  `input_date` date NOT NULL,
  `sample_time` time NOT NULL,
  `input_time` time NOT NULL,
  `shift` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve` enum('Y','N','') COLLATE utf8mb4_unicode_ci NOT NULL,
  `approver` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve_date` date NOT NULL,
  `approve_time` time NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_sample_minyak`
--

CREATE TABLE `t_sample_minyak` (
  `id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `line_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dept_id` varchar(3) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mid_product` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sample_date` date NOT NULL,
  `input_date` date NOT NULL,
  `sample_time` time NOT NULL,
  `input_time` time NOT NULL,
  `shift` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  `approve` enum('Y','N','') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approver` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `approve_date` date DEFAULT NULL,
  `approve_time` time DEFAULT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `t_sample_minyak`
--

INSERT INTO `t_sample_minyak` (`id`, `line_id`, `dept_id`, `mid_product`, `sample_date`, `input_date`, `sample_time`, `input_time`, `shift`, `approve`, `approver`, `approve_date`, `approve_time`, `created_by`, `keterangan`, `created_at`, `updated_at`) VALUES
('SMK00001', 'LINE 1', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:00', '2018-03-25 09:56:00'),
('SMK00002', 'LINE 2', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
('SMK00003', 'LINE 3', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
('SMK00004', 'LINE 4', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:01', '2018-03-25 09:56:01'),
('SMK00005', 'LINE 5', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
('SMK00006', 'LINE 6', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
('SMK00007', 'LINE 7', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
('SMK00008', 'LINE 8', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
('SMK00009', 'LINE 9', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:02', '2018-03-25 09:56:02'),
('SMK00010', 'LINE 10', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00011', 'LINE 11', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00012', 'LINE 12', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00013', 'LINE 13', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00014', 'LINE 14', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00015', 'LINE 15', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00016', 'LINE 16', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '16:56:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 09:56:03', '2018-03-25 09:56:03'),
('SMK00017', 'LINE 1', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:08', '2018-03-25 10:22:08'),
('SMK00018', 'LINE 2', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
('SMK00019', 'LINE 3', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:09', '2018-03-25 10:22:09'),
('SMK00020', 'LINE 4', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
('SMK00021', 'LINE 5', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
('SMK00022', 'LINE 6', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
('SMK00023', 'LINE 7', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:10', '2018-03-25 10:22:10'),
('SMK00024', 'LINE 8', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00025', 'LINE 9', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00026', 'LINE 10', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00027', 'LINE 11', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00028', 'LINE 12', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00029', 'LINE 13', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:11', '2018-03-25 10:22:11'),
('SMK00030', 'LINE 14', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
('SMK00031', 'LINE 15', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
('SMK00032', 'LINE 16', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:22:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:22:12', '2018-03-25 10:22:12'),
('SMK00033', 'LINE 1', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
('SMK00034', 'LINE 2', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
('SMK00035', 'LINE 3', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:25', '2018-03-25 10:24:25'),
('SMK00036', 'LINE 4', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
('SMK00037', 'LINE 5', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
('SMK00038', 'LINE 6', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
('SMK00039', 'LINE 7', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:26', '2018-03-25 10:24:26'),
('SMK00040', 'LINE 8', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00041', 'LINE 9', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00042', 'LINE 10', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00043', 'LINE 11', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00044', 'LINE 12', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00045', 'LINE 13', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:27', '2018-03-25 10:24:27'),
('SMK00046', 'LINE 14', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
('SMK00047', 'LINE 15', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
('SMK00048', 'LINE 16', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:24:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:24:28', '2018-03-25 10:24:28'),
('SMK00049', 'LINE 1', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
('SMK00050', 'LINE 2', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
('SMK00051', 'LINE 3', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
('SMK00052', 'LINE 4', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:40', '2018-03-25 10:27:40'),
('SMK00053', 'LINE 5', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
('SMK00054', 'LINE 6', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
('SMK00055', 'LINE 7', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
('SMK00056', 'LINE 8', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:41', '2018-03-25 10:27:41'),
('SMK00057', 'LINE 9', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00058', 'LINE 10', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00059', 'LINE 11', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00060', 'LINE 12', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00061', 'LINE 13', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00062', 'LINE 14', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00063', 'LINE 15', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:42', '2018-03-25 10:27:42'),
('SMK00064', 'LINE 16', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:27:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:27:43', '2018-03-25 10:27:43'),
('SMK00065', 'LINE 1', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
('SMK00066', 'LINE 2', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:34', '2018-03-25 10:28:34'),
('SMK00067', 'LINE 3', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00068', 'LINE 4', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00069', 'LINE 5', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00070', 'LINE 6', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00071', 'LINE 7', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00072', 'LINE 8', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:35', '2018-03-25 10:28:35'),
('SMK00073', 'LINE 9', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
('SMK00074', 'LINE 10', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
('SMK00075', 'LINE 11', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
('SMK00076', 'LINE 12', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:36', '2018-03-25 10:28:36'),
('SMK00077', 'LINE 13', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
('SMK00078', 'LINE 14', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
('SMK00079', 'LINE 15', '2', '1101', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:37', '2018-03-25 10:28:37'),
('SMK00080', 'LINE 16', '2', '1102', '1970-01-01', '2018-03-25', '06:00:00', '17:28:00', '1', NULL, NULL, NULL, NULL, '04091725749', NULL, '2018-03-25 10:28:37', '2018-03-25 10:28:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `t_shift`
--

CREATE TABLE `t_shift` (
  `id` int(10) UNSIGNED NOT NULL,
  `shift_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `created_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `auth_group_department`
--
ALTER TABLE `auth_group_department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_group_department_group_id_foreign` (`group_id`),
  ADD KEY `auth_group_department_department_id_foreign` (`department_id`);

--
-- Indexes for table `auth_group_permission`
--
ALTER TABLE `auth_group_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `auth_group_permission_group_id_foreign` (`group_id`),
  ADD KEY `auth_group_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_department`
--
ALTER TABLE `m_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_jam_sample`
--
ALTER TABLE `m_jam_sample`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `m_line`
--
ALTER TABLE `m_line`
  ADD PRIMARY KEY (`id`),
  ADD KEY `m_line_dept_id_foreign` (`dept_id`);

--
-- Indexes for table `m_product`
--
ALTER TABLE `m_product`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `m_shift`
--
ALTER TABLE `m_shift`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `m_user`
--
ALTER TABLE `m_user`
  ADD PRIMARY KEY (`nik`),
  ADD KEY `m_user_group_id_foreign` (`group_id`),
  ADD KEY `m_user_dept_id_foreign` (`dept_id`);

--
-- Indexes for table `m_variant_product`
--
ALTER TABLE `m_variant_product`
  ADD PRIMARY KEY (`mid`);

--
-- Indexes for table `t_fc`
--
ALTER TABLE `t_fc`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_fc_sample_id_foreign` (`sample_id`);

--
-- Indexes for table `t_ffa`
--
ALTER TABLE `t_ffa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_ffa_sample_id_foreign` (`sample_id`);

--
-- Indexes for table `t_ka`
--
ALTER TABLE `t_ka`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_ka_sample_id_foreign` (`sample_id`);

--
-- Indexes for table `t_pv`
--
ALTER TABLE `t_pv`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_pv_sample_id_foreign` (`sample_id`);

--
-- Indexes for table `t_sample_mie`
--
ALTER TABLE `t_sample_mie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_sample_mie_line_id_foreign` (`line_id`),
  ADD KEY `t_sample_mie_dept_id_foreign` (`dept_id`),
  ADD KEY `t_sample_mie_mid_product_foreign` (`mid_product`);

--
-- Indexes for table `t_sample_minyak`
--
ALTER TABLE `t_sample_minyak`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_sample_minyak_line_id_foreign` (`line_id`),
  ADD KEY `t_sample_minyak_dept_id_foreign` (`dept_id`),
  ADD KEY `t_sample_minyak_mid_product_foreign` (`mid_product`);

--
-- Indexes for table `t_shift`
--
ALTER TABLE `t_shift`
  ADD PRIMARY KEY (`id`),
  ADD KEY `t_shift_shift_name_foreign` (`shift_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `auth_group_department`
--
ALTER TABLE `auth_group_department`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_group_permission`
--
ALTER TABLE `auth_group_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `m_jam_sample`
--
ALTER TABLE `m_jam_sample`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `t_ffa`
--
ALTER TABLE `t_ffa`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `t_pv`
--
ALTER TABLE `t_pv`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;
--
-- AUTO_INCREMENT for table `t_shift`
--
ALTER TABLE `t_shift`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `auth_group_department`
--
ALTER TABLE `auth_group_department`
  ADD CONSTRAINT `auth_group_department_department_id_foreign` FOREIGN KEY (`department_id`) REFERENCES `m_department` (`id`),
  ADD CONSTRAINT `auth_group_department_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `auth_group_permission`
--
ALTER TABLE `auth_group_permission`
  ADD CONSTRAINT `auth_group_permission_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Ketidakleluasaan untuk tabel `m_line`
--
ALTER TABLE `m_line`
  ADD CONSTRAINT `m_line_dept_id_foreign` FOREIGN KEY (`dept_id`) REFERENCES `m_department` (`id`);

--
-- Ketidakleluasaan untuk tabel `m_user`
--
ALTER TABLE `m_user`
  ADD CONSTRAINT `m_user_dept_id_foreign` FOREIGN KEY (`dept_id`) REFERENCES `m_department` (`id`),
  ADD CONSTRAINT `m_user_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_fc`
--
ALTER TABLE `t_fc`
  ADD CONSTRAINT `t_fc_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `t_sample_mie` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_ffa`
--
ALTER TABLE `t_ffa`
  ADD CONSTRAINT `t_ffa_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `t_sample_minyak` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_ka`
--
ALTER TABLE `t_ka`
  ADD CONSTRAINT `t_ka_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `t_sample_mie` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_pv`
--
ALTER TABLE `t_pv`
  ADD CONSTRAINT `t_pv_sample_id_foreign` FOREIGN KEY (`sample_id`) REFERENCES `t_sample_minyak` (`id`);

--
-- Ketidakleluasaan untuk tabel `t_sample_mie`
--
ALTER TABLE `t_sample_mie`
  ADD CONSTRAINT `t_sample_mie_dept_id_foreign` FOREIGN KEY (`dept_id`) REFERENCES `m_department` (`id`),
  ADD CONSTRAINT `t_sample_mie_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `m_line` (`id`),
  ADD CONSTRAINT `t_sample_mie_mid_product_foreign` FOREIGN KEY (`mid_product`) REFERENCES `m_product` (`mid`);

--
-- Ketidakleluasaan untuk tabel `t_sample_minyak`
--
ALTER TABLE `t_sample_minyak`
  ADD CONSTRAINT `t_sample_minyak_dept_id_foreign` FOREIGN KEY (`dept_id`) REFERENCES `m_department` (`id`),
  ADD CONSTRAINT `t_sample_minyak_line_id_foreign` FOREIGN KEY (`line_id`) REFERENCES `m_line` (`id`),
  ADD CONSTRAINT `t_sample_minyak_mid_product_foreign` FOREIGN KEY (`mid_product`) REFERENCES `m_variant_product` (`mid`);

--
-- Ketidakleluasaan untuk tabel `t_shift`
--
ALTER TABLE `t_shift`
  ADD CONSTRAINT `t_shift_shift_name_foreign` FOREIGN KEY (`shift_name`) REFERENCES `m_shift` (`name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

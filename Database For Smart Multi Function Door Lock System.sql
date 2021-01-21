-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 24, 2019 at 07:36 AM
-- Server version: 10.2.23-MariaDB
-- PHP Version: 7.2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u188287689_mfdl`
--

-- --------------------------------------------------------

--
-- Table structure for table `log_scans`
--

CREATE TABLE `log_scans` (
  `id` int(10) UNSIGNED NOT NULL,
  `scan_method_id` int(10) UNSIGNED NOT NULL,
  `scan_attemp_id` int(10) UNSIGNED NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `log_scans`
--

INSERT INTO `log_scans` (`id`, `scan_method_id`, `scan_attemp_id`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 3, 1, '2019-05-17 16:08:35', '2019-05-17 16:08:35', NULL),
(2, 2, 7, 1, '2019-05-17 16:49:14', '2019-05-17 16:49:14', NULL),
(3, 2, 8, 1, '2019-05-17 16:49:58', '2019-05-17 16:49:58', NULL),
(4, 2, 9, 1, '2019-05-18 06:42:05', '2019-05-18 06:42:05', NULL),
(5, 2, 10, 1, '2019-05-18 06:42:23', '2019-05-18 06:42:23', NULL),
(6, 2, 11, 1, '2019-05-18 06:42:42', '2019-05-18 06:42:42', NULL),
(7, 2, 12, 1, '2019-05-18 06:45:00', '2019-05-18 06:45:00', NULL),
(8, 2, 13, 1, '2019-05-18 06:45:22', '2019-05-18 06:45:22', NULL),
(9, 2, 14, 1, '2019-05-18 06:46:00', '2019-05-18 06:46:00', NULL),
(10, 2, 15, 1, '2019-05-18 06:48:18', '2019-05-18 06:48:18', NULL),
(11, 2, 16, 1, '2019-05-18 06:48:29', '2019-05-18 06:48:29', NULL),
(12, 2, 17, 1, '2019-05-18 06:49:06', '2019-05-18 06:49:06', NULL),
(13, 2, 18, 1, '2019-05-18 06:49:17', '2019-05-18 06:49:17', NULL),
(14, 2, 19, 1, '2019-05-18 06:50:57', '2019-05-18 06:50:57', NULL),
(15, 2, 20, 1, '2019-05-18 06:59:27', '2019-05-18 06:59:27', NULL),
(16, 2, 21, 1, '2019-05-18 06:59:38', '2019-05-18 06:59:38', NULL),
(17, 2, 22, 1, '2019-05-18 07:01:21', '2019-05-18 07:01:21', NULL),
(18, 2, 23, 1, '2019-05-18 07:02:10', '2019-05-18 07:02:10', NULL),
(19, 3, 26, 1, '2019-05-20 15:00:53', '2019-05-20 15:00:53', NULL),
(20, 2, 28, 1, '2019-05-20 15:26:21', '2019-05-20 15:26:21', NULL),
(21, 3, 29, 1, '2019-05-20 15:26:45', '2019-05-20 15:26:45', NULL),
(22, 3, 31, 1, '2019-05-21 16:13:34', '2019-05-21 16:13:34', NULL),
(23, 2, 32, 1, '2019-05-21 22:52:20', '2019-05-21 22:52:20', NULL),
(24, 5, 33, 1, '2019-05-21 23:05:57', '2019-05-21 23:05:57', NULL),
(25, 5, 34, 1, '2019-05-21 23:05:57', '2019-05-21 23:05:57', NULL),
(26, 5, 35, 1, '2019-05-21 23:06:09', '2019-05-21 23:06:09', NULL),
(27, 5, 36, 1, '2019-05-21 23:06:10', '2019-05-21 23:06:10', NULL),
(28, 2, 38, 1, '2019-05-21 23:18:16', '2019-05-21 23:18:16', NULL),
(29, 2, 39, 1, '2019-05-21 23:18:17', '2019-05-21 23:18:17', NULL),
(30, 2, 40, 1, '2019-05-21 23:18:24', '2019-05-21 23:18:24', NULL),
(31, 2, 41, 1, '2019-05-21 23:18:34', '2019-05-21 23:18:34', NULL),
(32, 2, 42, 1, '2019-05-21 23:18:35', '2019-05-21 23:18:35', NULL),
(33, 5, 43, 1, '2019-05-21 23:18:41', '2019-05-21 23:18:41', NULL),
(34, 2, 44, 1, '2019-05-22 01:17:31', '2019-05-22 01:17:31', NULL),
(35, 2, 45, 1, '2019-05-22 01:30:30', '2019-05-22 01:30:30', NULL),
(36, 2, 46, 1, '2019-05-22 20:21:30', '2019-05-22 20:21:30', NULL),
(37, 5, 47, 1, '2019-05-22 21:47:15', '2019-05-22 21:47:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `machines`
--

CREATE TABLE `machines` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stats` int(11) NOT NULL,
  `lock_stats` int(11) NOT NULL,
  `is_online` tinyint(1) NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `machines`
--

INSERT INTO `machines` (`id`, `name`, `location`, `ip_address`, `description`, `stats`, `lock_stats`, `is_online`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Mesin 1', 'Portable', '192.168.1.5', 'raspberry PI Scan Mesin', 0, 1, 0, 1, '2019-05-17 07:04:28', '2019-05-23 22:52:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(45, '2014_10_12_000000_create_users_table', 1),
(46, '2014_10_12_100000_create_password_resets_table', 1),
(47, '2019_02_25_110340_create_roles_table', 1),
(48, '2019_02_25_110357_create_user_types_table', 1),
(49, '2019_02_25_110414_create_machines_table', 1),
(50, '2019_02_25_110429_create_log_scans_table', 1),
(51, '2019_02_25_110607_create_scan_methods_table', 1),
(52, '2019_03_03_152204_create_scan_method_stats_table', 1),
(53, '2019_03_03_185631_create_scan_types_table', 1),
(54, '2019_03_03_185653_create_scan_attemps_table', 1),
(55, '2019_03_03_191005_create_foreign_key', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `level`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin', 0, 1, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(2, 'admin', 'admin', 0, 2, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(3, 'user', 'user', 0, 3, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(4, 'guest', 'guest', 0, 4, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_attemps`
--

CREATE TABLE `scan_attemps` (
  `id` int(10) UNSIGNED NOT NULL,
  `scan_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stats` int(11) NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `scan_type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan_attemps`
--

INSERT INTO `scan_attemps` (`id`, `scan_time`, `data`, `stats`, `machine_id`, `scan_type_id`, `user_id`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '2019-05-17 14:42:21', '6', 0, 1, 2, NULL, 1, '2019-05-17 14:42:21', '2019-05-17 14:42:21', NULL),
(2, '2019-05-17 14:42:26', '6', 0, 1, 2, NULL, 1, '2019-05-17 14:42:26', '2019-05-17 14:42:26', NULL),
(3, '2019-05-17 16:08:35', '06072019', 1, 1, 2, 2, 1, '2019-05-17 16:08:35', '2019-05-17 16:08:35', NULL),
(4, '2019-05-17 16:21:42', '-1', 0, 1, 2, NULL, 1, '2019-05-17 16:21:42', '2019-05-17 16:21:42', NULL),
(5, '2019-05-17 16:40:41', '-1', 0, 1, 2, NULL, 1, '2019-05-17 16:40:41', '2019-05-17 16:40:41', NULL),
(6, '2019-05-17 16:48:08', '1111', 0, 1, 2, NULL, 1, '2019-05-17 16:48:08', '2019-05-17 16:48:08', NULL),
(7, '2019-05-17 16:49:14', '1111', 1, 1, 2, 1, 1, '2019-05-17 16:49:14', '2019-05-17 16:49:14', NULL),
(8, '2019-05-17 16:49:58', '1111', 1, 1, 2, 1, 1, '2019-05-17 16:49:58', '2019-05-17 16:49:58', NULL),
(9, '2019-05-18 06:42:05', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:42:05', '2019-05-18 06:42:05', NULL),
(10, '2019-05-18 06:42:23', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:42:23', '2019-05-18 06:42:23', NULL),
(11, '2019-05-18 06:42:42', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:42:42', '2019-05-18 06:42:42', NULL),
(12, '2019-05-18 06:45:00', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:45:00', '2019-05-18 06:45:00', NULL),
(13, '2019-05-18 06:45:22', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:45:22', '2019-05-18 06:45:22', NULL),
(14, '2019-05-18 06:46:00', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:46:00', '2019-05-18 06:46:00', NULL),
(15, '2019-05-18 06:48:18', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:48:18', '2019-05-18 06:48:18', NULL),
(16, '2019-05-18 06:48:29', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:48:29', '2019-05-18 06:48:29', NULL),
(17, '2019-05-18 06:49:06', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:49:06', '2019-05-18 06:49:06', NULL),
(18, '2019-05-18 06:49:17', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:49:17', '2019-05-18 06:49:17', NULL),
(19, '2019-05-18 06:50:57', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:50:57', '2019-05-18 06:50:57', NULL),
(20, '2019-05-18 06:59:27', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:59:27', '2019-05-18 06:59:27', NULL),
(21, '2019-05-18 06:59:38', '1111', 1, 1, 2, 1, 1, '2019-05-18 06:59:38', '2019-05-18 06:59:38', NULL),
(22, '2019-05-18 07:01:21', '1111', 1, 1, 2, 1, 1, '2019-05-18 07:01:21', '2019-05-18 07:01:21', NULL),
(23, '2019-05-18 07:02:10', '1111', 1, 1, 2, 1, 1, '2019-05-18 07:02:10', '2019-05-18 07:02:10', NULL),
(24, '2019-05-20 14:59:49', '-1', 0, 1, 2, NULL, 1, '2019-05-20 14:59:49', '2019-05-20 14:59:49', NULL),
(25, '2019-05-20 15:00:01', '-1', 0, 1, 2, NULL, 1, '2019-05-20 15:00:01', '2019-05-20 15:00:01', NULL),
(26, '2019-05-20 15:00:53', '10', 1, 1, 2, 1, 1, '2019-05-20 15:00:53', '2019-05-20 15:00:53', NULL),
(27, '2019-05-20 15:26:06', '1234', 0, 1, 2, NULL, 1, '2019-05-20 15:26:06', '2019-05-20 15:26:06', NULL),
(28, '2019-05-20 15:26:21', '1111', 1, 1, 2, 1, 1, '2019-05-20 15:26:21', '2019-05-20 15:26:21', NULL),
(29, '2019-05-20 15:26:45', '10', 1, 1, 2, 1, 1, '2019-05-20 15:26:45', '2019-05-20 15:26:45', NULL),
(30, '2019-05-21 16:10:23', '6', 0, 1, 2, NULL, 1, '2019-05-21 16:10:23', '2019-05-21 16:10:23', NULL),
(31, '2019-05-21 16:13:34', '10', 1, 1, 2, 1, 1, '2019-05-21 16:13:34', '2019-05-21 16:13:34', NULL),
(32, '2019-05-21 22:52:20', '1111', 1, 1, 2, 1, 1, '2019-05-21 22:52:20', '2019-05-21 22:52:20', NULL),
(33, '2019-05-21 23:05:57', '1234', 1, 1, 2, 2, 1, '2019-05-21 23:05:57', '2019-05-21 23:05:57', NULL),
(34, '2019-05-21 23:05:57', '1234', 1, 1, 2, 2, 1, '2019-05-21 23:05:57', '2019-05-21 23:05:57', NULL),
(35, '2019-05-21 23:06:09', '1234', 1, 1, 2, 2, 1, '2019-05-21 23:06:09', '2019-05-21 23:06:09', NULL),
(36, '2019-05-21 23:06:10', '1234', 1, 1, 2, 2, 1, '2019-05-21 23:06:10', '2019-05-21 23:06:10', NULL),
(37, '2019-05-21 23:17:06', '23635', 0, 1, 2, NULL, 1, '2019-05-21 23:17:06', '2019-05-21 23:17:06', NULL),
(38, '2019-05-21 23:18:16', '1111', 1, 1, 2, 1, 1, '2019-05-21 23:18:16', '2019-05-21 23:18:16', NULL),
(39, '2019-05-21 23:18:17', '1111', 1, 1, 2, 1, 1, '2019-05-21 23:18:17', '2019-05-21 23:18:17', NULL),
(40, '2019-05-21 23:18:24', '1111', 1, 1, 2, 1, 1, '2019-05-21 23:18:24', '2019-05-21 23:18:24', NULL),
(41, '2019-05-21 23:18:34', '1111', 1, 1, 2, 1, 1, '2019-05-21 23:18:34', '2019-05-21 23:18:34', NULL),
(42, '2019-05-21 23:18:35', '1111', 1, 1, 2, 1, 1, '2019-05-21 23:18:35', '2019-05-21 23:18:35', NULL),
(43, '2019-05-21 23:18:41', '1234', 1, 1, 2, 2, 1, '2019-05-21 23:18:41', '2019-05-21 23:18:41', NULL),
(44, '2019-05-22 01:17:31', '1111', 1, 1, 2, 1, 1, '2019-05-22 01:17:31', '2019-05-22 01:17:31', NULL),
(45, '2019-05-22 01:30:30', '1111', 1, 1, 2, 1, 1, '2019-05-22 01:30:30', '2019-05-22 01:30:30', NULL),
(46, '2019-05-22 20:21:30', '1111', 1, 1, 2, 1, 1, '2019-05-22 20:21:30', '2019-05-22 20:21:30', NULL),
(47, '2019-05-22 21:47:15', '1234', 1, 1, 2, 2, 1, '2019-05-22 21:47:15', '2019-05-22 21:47:15', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_methods`
--

CREATE TABLE `scan_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `stats` int(11) NOT NULL,
  `scan_type_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan_methods`
--

INSERT INTO `scan_methods` (`id`, `name`, `data`, `stats`, `scan_type_id`, `user_id`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'PIN Data', '06072019', 1, 4, 2, 2, '2019-05-17 16:08:27', '2019-05-17 16:08:27', NULL),
(2, 'PIN Data', '1111', 1, 4, 1, 1, '2019-05-17 16:48:23', '2019-05-17 16:48:23', NULL),
(3, 'FingerPrint Data', '10', 1, 1, 1, 1, '2019-05-20 15:00:45', '2019-05-20 15:00:45', NULL),
(4, 'PIN Data', '1212', 1, 4, 1, 1, '2019-05-20 15:27:30', '2019-05-20 15:27:30', NULL),
(5, 'PIN Data', '1234', 1, 4, 2, 2, '2019-05-21 22:53:57', '2019-05-21 22:53:57', NULL),
(6, 'PIN Data', '1111', 1, 4, 1, 1, '2019-05-21 23:56:32', '2019-05-21 23:56:32', NULL),
(7, 'PIN Data', '1234', 1, 4, 2, 2, '2019-05-22 01:31:37', '2019-05-22 01:31:37', NULL),
(8, 'PIN Data', '1234', 1, 4, 2, 2, '2019-05-22 01:33:28', '2019-05-22 01:33:28', NULL),
(9, 'PIN Data', '1234', 1, 4, 1, 1, '2019-05-22 21:46:53', '2019-05-22 21:46:53', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_method_stats`
--

CREATE TABLE `scan_method_stats` (
  `id` int(10) UNSIGNED NOT NULL,
  `machine_id` int(10) UNSIGNED NOT NULL,
  `scan_type_id` int(10) UNSIGNED NOT NULL,
  `stats` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan_method_stats`
--

INSERT INTO `scan_method_stats` (`id`, `machine_id`, `scan_type_id`, `stats`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(2, 1, 2, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(3, 1, 3, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(4, 1, 4, 1, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `scan_types`
--

CREATE TABLE `scan_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stats` int(11) NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `scan_types`
--

INSERT INTO `scan_types` (`id`, `name`, `description`, `stats`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'fingerprint', 'Modul Fingerprint', 0, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(2, 'RFID', 'Modul RFID', 0, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(3, 'camera', 'Modul camera', 0, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL),
(4, 'Username / Password', 'Modul Keypad', 0, 1, '2019-05-17 07:04:28', '2019-05-17 07:04:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `stats` int(11) NOT NULL,
  `user_type_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_created_by` int(10) UNSIGNED NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `first_name`, `last_name`, `username`, `email`, `password`, `email_verified_at`, `stats`, `user_type_id`, `role_id`, `user_created_by`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin', 'superadmin', 'superadmin', 'superadmin@primexaviers.com', '$2y$10$IUATkSR.AANQYZPiwATMbuN8owwx9pCaMnjvX2yfONdZsjZxGBoFW', '2019-05-17 07:04:29', 1, 1, 1, 1, 'L6hI4eEl89fpCD853npeV4hMW3YAC59ZyjKuNlLdwAYKAp1cYNtopUXcNvKD', '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(2, 'Aldi', 'Aldi', 'Afandi', 'Aldiafandi', 'Mraldiafandi@gmail.com', '$2y$10$qETCF3JvMTFw1Qx5VKafQuHoFwQ3NFd6rZlZBlHO04rzZCmor6HBG', NULL, 1, 1, 1, 1, NULL, '2019-05-17 15:36:39', '2019-05-17 15:36:39', NULL),
(3, 'Aditya', 'Adit', 'Adit', 'Aditya', 'Aditya@gmail.com', '$2y$10$shGKfAv0tNJixQcmodh1i.ZfPXYiSLoB722CBSNvtNM8MlCkwxJDi', NULL, 1, 1, 1, 1, NULL, '2019-05-21 22:13:35', '2019-05-21 22:13:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_types`
--

CREATE TABLE `user_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(11) NOT NULL,
  `user_created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_types`
--

INSERT INTO `user_types` (`id`, `name`, `description`, `level`, `user_created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'superadmin', 'superadmin', 0, 1, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(2, 'admin', 'admin', 0, 2, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(3, 'user', 'user', 0, 3, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL),
(4, 'guest', 'guest', 0, 4, '2019-05-17 07:04:29', '2019-05-17 07:04:29', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log_scans`
--
ALTER TABLE `log_scans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_scans_scan_attemp_id_foreign` (`scan_attemp_id`),
  ADD KEY `log_scans_scan_method_id_foreign` (`scan_method_id`);

--
-- Indexes for table `machines`
--
ALTER TABLE `machines`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_attemps`
--
ALTER TABLE `scan_attemps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scan_attemps_machine_id_foreign` (`machine_id`),
  ADD KEY `scan_attemps_scan_type_id_foreign` (`scan_type_id`);

--
-- Indexes for table `scan_methods`
--
ALTER TABLE `scan_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scan_methods_scan_type_id_foreign` (`scan_type_id`),
  ADD KEY `scan_methods_user_id_foreign` (`user_id`);

--
-- Indexes for table `scan_method_stats`
--
ALTER TABLE `scan_method_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `scan_method_stats_machine_id_foreign` (`machine_id`),
  ADD KEY `scan_method_stats_scan_type_id_foreign` (`scan_type_id`);

--
-- Indexes for table `scan_types`
--
ALTER TABLE `scan_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_user_type_id_foreign` (`user_type_id`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `user_types`
--
ALTER TABLE `user_types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log_scans`
--
ALTER TABLE `log_scans`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `machines`
--
ALTER TABLE `machines`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `scan_attemps`
--
ALTER TABLE `scan_attemps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `scan_methods`
--
ALTER TABLE `scan_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `scan_method_stats`
--
ALTER TABLE `scan_method_stats`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `scan_types`
--
ALTER TABLE `scan_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_types`
--
ALTER TABLE `user_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `log_scans`
--
ALTER TABLE `log_scans`
  ADD CONSTRAINT `log_scans_scan_attemp_id_foreign` FOREIGN KEY (`scan_attemp_id`) REFERENCES `scan_attemps` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `log_scans_scan_method_id_foreign` FOREIGN KEY (`scan_method_id`) REFERENCES `scan_methods` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scan_attemps`
--
ALTER TABLE `scan_attemps`
  ADD CONSTRAINT `scan_attemps_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scan_attemps_scan_type_id_foreign` FOREIGN KEY (`scan_type_id`) REFERENCES `scan_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scan_methods`
--
ALTER TABLE `scan_methods`
  ADD CONSTRAINT `scan_methods_scan_type_id_foreign` FOREIGN KEY (`scan_type_id`) REFERENCES `scan_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scan_methods_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `scan_method_stats`
--
ALTER TABLE `scan_method_stats`
  ADD CONSTRAINT `scan_method_stats_machine_id_foreign` FOREIGN KEY (`machine_id`) REFERENCES `machines` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `scan_method_stats_scan_type_id_foreign` FOREIGN KEY (`scan_type_id`) REFERENCES `scan_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `users_user_type_id_foreign` FOREIGN KEY (`user_type_id`) REFERENCES `user_types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<USER_REQUEST>
ช่วย add ลง DB ด้วยจาก 

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: Jul 18, 2026 at 05:24 AM
-- Server version: 5.7.39
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `quiz_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE `answers` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_answer` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` char(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `answers`
--

INSERT INTO `answers` (`id`, `topic_id`, `user_id`, `question_id`, `user_answer`, `answer`, `created_at`, `updated_at`) VALUES
(11, 2, 3, 2, 'D', 'D', '2026-07-15 11:46:50', '2026-07-15 11:46:50'),
(12, 2, 3, 7, 'B', 'B', '2026-07-15 11:46:54', '2026-07-15 11:46:54'),
(13, 2, 3, 10, 'D', 'C', '2026-07-15 11:46:57', '2026-07-15 11:46:57'),
(14, 2, 3, 9, 'C', 'B', '2026-07-15 11:46:59', '2026-07-15 11:46:59'),
(15, 2, 3, 4, '0', 'B', '2026-07-15 11:47:02', '2026-07-15 11:47:02'),
(16, 2, 3, 8, 'C', 'C', '2026-07-15 11:47:04', '2026-07-15 11:47:04'),
(17, 2, 3, 5, 'D', 'D', '2026-07-15 11:47:08', '2026-07-15 11:47:08'),
(18, 2, 3, 1, 'C', 'C', '2026-07-15 11:47:11', '2026-07-15 11:47:11'),
(19, 2, 3, 3, 'B', 'B', '2026-07-15 11:47:31', '2026-07-15 11:47:31'),
(20, 2, 3, 6, 'A', 'B', '2026-07-15 11:47:34', '2026-07-15 11:47:34'),
(21, 2, 9, 7, 'A', 'B', '2026-07-15 11:49:34', '2026-07-15 11:49:34'),
(22, 2, 9, 4, 'C', 'B', '2026-07-15 11:49:36', '2026-07-15 11:49:36'),
(23, 2, 9, 10, 'D', 'C', '2026-07-15 11:49:38', '2026-07-15 11:49:38'),
(24, 2, 9, 6, 'D', 'B', '2026-07-15 11:49:40', '2026-07-15 11:49:40'),
(25, 2, 9, 2, 'D', 'D', '2026-07-15 11:49:42', '2026-07-15 11:49:42'),
(26, 2, 9, 5, 'A', 'D', '2026-07-15 11:49:46', '2026-07-15 11:49:46'),
(27, 2, 9, 9, 'C', 'B', '2026-07-15 11:49:49', '2026-07-15 11:49:49'),
(28, 2, 9, 3, 'A', 'B', '2026-07-15 11:49:52', '2026-07-15 11:49:52'),
(29, 2, 9, 1, 'C', 'C', '2026-07-15 11:49:55', '2026-07-15 11:49:55'),
(30, 2, 9, 8, '0', 'C', '2026-07-15 11:49:57', '2026-07-15 11:49:57');

-- --------------------------------------------------------

--
-- Table structure for table `authentication_log`
--

CREATE TABLE `authentication_log` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `login_at` timestamp NULL DEFAULT NULL,
  `logout_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `authentication_log`
--

INSERT INTO `authentication_log` (`id`, `user_id`, `ip_address`, `user_agent`, `login_at`, `logout_at`, `created_at`, `updated_at`) VALUES
(1, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', NULL, '2024-05-16 06:18:42', NULL, '2024-05-16 06:18:42'),
(2, 53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:35:29', '2024-05-12 23:38:43', NULL, '2024-05-12 23:38:43'),
(3, 53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:35:46', NULL, NULL, NULL),
(4, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:36:26', '2024-05-22 05:56:19', NULL, '2024-05-22 05:56:19'),
(5, 53, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:38:39', NULL, NULL, NULL),
(6, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:39:02', NULL, NULL, NULL),
(7, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:39:28', NULL, NULL, NULL),
(8, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-12 23:39:51', NULL, NULL, NULL),
(9, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 00:30:38', NULL, NULL, NULL),
(10, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 00:39:40', NULL, NULL, NULL),
(11, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 00:42:25', NULL, NULL, NULL),
(12, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 01:03:00', NULL, NULL, NULL),
(13, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 01:08:46', NULL, NULL, NULL),
(14, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-13 02:11:42', NULL, NULL, NULL),
(15, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-14 23:15:10', NULL, NULL, NULL),
(16, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 02:45:17', NULL, NULL, NULL),
(17, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 02:48:49', NULL, NULL, NULL),
(18, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 02:50:11', NULL, NULL, NULL),
(19, 54, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 03:05:31', '2024-05-16 03:08:45', NULL, '2024-05-16 03:08:45'),
(20, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 03:08:59', NULL, NULL, NULL),
(21, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 03:25:20', NULL, NULL, NULL),
(22, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 03:27:32', NULL, NULL, NULL),
(23, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 04:07:27', NULL, NULL, NULL),
(24, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 04:29:43', NULL, NULL, NULL),
(25, 56, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 04:49:04', NULL, NULL, NULL),
(26, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 04:52:23', NULL, NULL, NULL),
(27, 57, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 04:59:36', NULL, NULL, NULL),
(28, 58, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:04:47', NULL, NULL, NULL),
(29, 59, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:08:08', NULL, NULL, NULL),
(30, 61, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:12:49', NULL, NULL, NULL),
(31, 62, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:14:55', NULL, NULL, NULL),
(32, 60, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:19:08', NULL, NULL, NULL),
(33, 64, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:22:27', '2024-05-16 05:23:21', NULL, '2024-05-16 05:23:21'),
(34, 63, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:23:32', NULL, NULL, NULL),
(35, 65, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:27:16', NULL, NULL, NULL),
(36, 66, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:28:53', NULL, NULL, NULL),
(37, 67, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:38:52', NULL, NULL, NULL),
(38, 68, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:40:52', NULL, NULL, NULL),
(39, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 05:45:52', NULL, NULL, NULL),
(40, 45, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 06:18:24', NULL, NULL, NULL),
(41, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 06:18:57', NULL, NULL, NULL),
(42, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-16 06:24:26', NULL, NULL, NULL),
(43, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 02:21:49', NULL, NULL, NULL),
(44, 1, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36', '2024-05-22 05:56:52', NULL, NULL, NULL),
(45, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 10:00:25', '2026-07-15 11:48:46', NULL, '2026-07-15 11:48:46'),
(46, 3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 10:39:17', '2026-07-15 11:48:31', NULL, '2026-07-15 11:48:31'),
(47, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 10:42:49', NULL, NULL, NULL),
(48, 3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:39:24', NULL, NULL, NULL),
(49, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:43:58', NULL, NULL, NULL),
(50, 3, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:45:33', NULL, NULL, NULL),
(51, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:48:36', NULL, NULL, NULL),
(52, 9, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:49:22', '2026-07-15 11:50:08', NULL, '2026-07-15 11:50:08'),
(53, 1, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36', '2026-07-15 11:50:11', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int(10) UNSIGNED NOT NULL,
  `MAIL_FROM_NAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_DRIVER` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_HOST` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_PORT` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_USERNAME` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_FROM_ADDRESS` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_PASSWORD` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `MAIL_ENCRYPTION` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `copyrighttexts`
--

CREATE TABLE `copyrighttexts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `copyrighttexts`
--

INSERT INTO `copyrighttexts` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, '2024 Quick Quiz. All Rights Reserved', NULL, '2024-05-22 05:57:18');

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2017_11_23_160102_create_sessions_table', 1),
(4, '2017_11_25_133229_create_settings_table', 1),
(5, '2017_12_03_080242_create_topics_table', 1),
(6, '2017_12_03_080330_create_tests_table', 1),
(7, '2017_12_03_091845_create_questions_table', 1),
(8, '2017_12_03_110511_create_answers_table', 1),
(9, '2017_12_21_085915_add_image_video_column_to_questions', 2),
(12, '2019_02_07_113422_create_f_a_qs_table', 4),
(13, '2019_02_04_122123_create_pages_table', 5),
(14, '2019_02_12_065327_create_copyrighttexts_table', 6),
(17, '2019_02_04_100908_create_social_icons_table', 7),
(18, '2019_02_15_072716_create_config_table', 8),
(19, '2019_02_12_165455_create_topic_user_table', 9);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  `show_in_menu` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `p_w_a_settings`
--

CREATE TABLE `p_w_a_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pwa_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pwa_splash_icon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `id` int(10) UNSIGNED NOT NULL,
  `topic_id` int(10) UNSIGNED NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `a` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `c` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `e` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `f` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `answer` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_snippet` text COLLATE utf8mb4_unicode_ci,
  `answer_exp` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `question_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_video_link` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `question_audio` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`id`, `topic_id`, `question`, `a`, `b`, `c`, `d`, `e`, `f`, `answer`, `code_snippet`, `answer_exp`, `created_at`, `updated_at`, `question_img`, `question_video_link`, `question_audio`) VALUES
(1, 2, 'พยัญชนะไทยมีทั้งหมดกี่ตัว?', '40 ตัว', '42 ตัว', '44 ตัว', '46 ตัว', NULL, NULL, 'C', NULL, 'พยัญชนะไทยมีทั้งหมด 44 ตัว ตั้งแต่ ก.ไก่ ถึง ฮ.นกฮูก', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(2, 2, 'ข้อใดคือสระในภาษาไทย?', 'ก', 'ะ', 'า', 'ทั้ง B และ C เป็นสระ', NULL, NULL, 'D', NULL, '\"ะ\" คือสระอะ และ \"า\" คือสระอา ส่วน \"ก\" เป็นพยัญชนะ', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(3, 2, 'พยัญชนะตัวแรกของภาษาไทยคือตัวอะไร?', 'ข.ไข่', 'ก.ไก่', 'ค.ควาย', 'ฮ.นกฮูก', NULL, NULL, 'B', NULL, 'พยัญชนะตัวแรกคือ ก.ไก่ และตัวสุดท้ายคือ ฮ.นกฮูก', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(4, 2, 'คำว่า \"บ้าน\" ประสมด้วยสระอะไร?', 'สระอะ', 'สระอา', 'สระอำ', 'สระอู', NULL, NULL, 'B', NULL, 'คำว่า \"บ้าน\" (บ + า + น + ไม้โท) ประสมด้วยสระอา', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(5, 2, 'ตัวอักษรใดทำหน้าที่เป็นได้ทั้งพยัญชนะและสระ?', 'อ.อ่าง', 'ย.ยักษ์', 'ว.แหวน', 'ถูกทุกข้อ', NULL, NULL, 'D', NULL, 'อ, ย, ว สามารถทำหน้าที่เป็นสระร่วมได้ เช่น สระออ (พ่อ), สระเอีย (เรียน), สระอัว (ตัว)', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(6, 2, 'คำในข้อใดสะกดด้วย \"สระอี\"?', 'กิน', 'ตี', 'ดำ', 'มือ', NULL, NULL, 'B', NULL, 'คำว่า \"ตี\" (ต + อี) สะกดด้วยสระอี', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(7, 2, 'พยัญชนะตัวสุดท้ายของภาษาไทยคือตัวใด?', 'อ.อ่าง', 'ฮ.นกฮูก', 'ร.เรือ', 'ล.ลิง', NULL, NULL, 'B', NULL, 'พยัญชนะตัวที่ 44 ซึ่งเป็นตัวสุดท้ายคือ ฮ.นกฮูก', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(8, 2, 'สระในข้อใดเป็น \"สระเสียงยาว\"?', 'สระอะ', 'สระอิ', 'สระอา', 'สระอุ', NULL, NULL, 'C', NULL, 'สระอาเป็นสระเสียงยาวคู่กับสระอะซึ่งเป็นสระเสียงสั้น', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(9, 2, 'คำว่า \"กิน\" ประสมด้วยสระใด?', 'สระอี', 'สระอิ', 'สระอุ', 'สระอือ', NULL, NULL, 'B', NULL, 'คำว่า \"กิน\" (ก + อิ + น) ประสมด้วยสระอิ', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL),
(10, 2, 'ข้อใดมีเสียงสระเหมือนกับคำว่า \"มือ\"?', 'ดึง', 'ดู', 'ถือ', 'มา', NULL, NULL, 'C', NULL, 'คำว่า \"มือ\" และ \"ถือ\" ประสมด้วยสระอือเหมือนกัน', '2026-07-15 18:40:53', '2026-07-15 18:40:53', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `welcome_txt` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Quick Quiz',
  `userquiz` tinyint(1) DEFAULT '0',
  `w_email` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `google_login` tinyint(1) DEFAULT '0',
  `fb_login` tinyint(1) DEFAULT '0',
  `gitlab_login` tinyint(1) DEFAULT '0',
  `right_setting` tinyint(1) DEFAULT NULL,
  `element_setting` tinyint(1) DEFAULT NULL,
  `wel_mail` tinyint(1) NOT NULL DEFAULT '0',
  `coming_soon` tinyint(1) NOT NULL DEFAULT '0',
  `comingsoon_enabled_ip` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `logo`, `favicon`, `welcome_txt`, `userquiz`, `w_email`, `currency_code`, `currency_symbol`, `google_login`, `fb_login`, `gitlab_login`, `right_setting`, `element_setting`, `wel_mail`, `coming_soon`, `comingsoon_enabled_ip`, `created_at`, `updated_at`) VALUES
(1, 'logo_1512974578qq2.png', 'favicon.ico', 'Quick Quiz', NULL, 'test@gmail.com', 'USD', 'fa fa-dollar', 0, 0, 0, 0, 0, 0, 0, NULL, NULL, '2019-05-26 00:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `social_icons`
--

CREATE TABLE `social_icons` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery`
--

CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `video_title` varchar(255) NOT NULL,
  `video_url` varchar(500) NOT NULL,
  `video_id` varchar(255) NOT NULL,
  `video_thumbnail` varchar(255) NOT NULL,
  `video_duration` varchar(255) NOT NULL,
  `video_description` text NOT NULL,
  `video_type` varchar(45) NOT NULL,
  `video_status` int(11) NOT NULL DEFAULT '1',
  `size` varchar(255) NOT NULL,
  `total_views` int(11) NOT NULL DEFAULT '0',
  `date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tbl_gallery`
--

INSERT INTO `tbl_gallery` (`id`, `cat_id`, `video_title`, `video_url`, `video_id`, `video_thumbnail`, `video_duration`, `video_description`, `video_type`, `video_status`, `size`, `total_views`, `date_time`) VALUES
(4, 4, 'Satu Indonesiaku Persembahan untuk Negeri', 'https://www.youtube.com/watch?v=fcIML2MI_U0', 'fcIML2MI_U0', '', '7:18', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'youtube', 1, '', 10, '2018-02-12 07:01:54'),
(5, 5, 'Crazy Football High Level Skills', 'https://www.youtube.com/watch?v=jIuwP1tLRnM', 'jIuwP1tLRnM', '', '6:07', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'youtube', 1, '', 4, '2018-02-12 07:01:54'),
(6, 4, 'Jalani Mimpi Video Clip of Noah Band', 'https://www.youtube.com/watch?v=MhaWRStfP_c', 'MhaWRStfP_c', '', '04:02', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'youtube', 1, '', 8, '2018-02-12 07:01:54'),
(7, 1, 'Tujhme Rab Dikhta Hai by Shreya Ghoshal', 'https://www.youtube.com/watch?v=KQc3bAItPEw', 'KQc3bAItPEw', '', '02:09', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'youtube', 1, '', 6, '2018-02-12 07:01:54'),
(8, 4, 'Tiba2 Ku Menangis - Koes Plus Live Concert', 'https://www.youtube.com/watch?v=PuQjXiGdPAk', 'PuQjXiGdPAk', '', '03:11', '<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p>Lorem Ipsum&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n', 'youtube', 1, '', 13, '2018-02-12 07:01:54'),
(10, 6, 'My Name Song', 'https://www.youtube.com/watch?v=95EFNsXgRhQ', '95EFNsXgRhQ', '', '04:01', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'youtube', 1, '', 2, '2020-04-25 08:38:08'),
(11, 3, ' วิธีใช้ Google AI Studio 2025 ครบจบใน 20 นาที #ครูยู', 'https://www.youtube.com/watch?v=AJkqKgrWBjU', 'AJkqKgrWBjU', '1748710675_Screenshot 2568-05-31 at 23.55.47.png', '18:42', '<p>&nbsp;</p>\r\n\r\n<p>สอนใช้ Google AI studio สร้างเสียงไทย สร้างภาพ สร้างวิดีโอ Google AI Studio <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqbV8wb2lrTXZNOGFBOVRaQ1Q1T2t4TDNwNWdsd3xBQ3Jtc0tsdk1OUWRCUkZWcS1WNXZQYURQTjdZZmZmalNvUVo3M1RLX0hxWU1KOEpRYnVsZlc4ZjdKT0xLbk1WelhGVlJBZHM1OFR4SXN0Y3YxZXpjR0t4X1JfdnVMenRSTFhFcDREZl9FMm5fTHl5YnNjdnNZZw&amp;q=https%3A%2F%2Faistudio.google.com%2F&amp;v=AJkqKgrWBjU\" target=\"_blank\">https://aistudio.google.com/</a> เป็นเครื่องมือที่ทรงพลังในการสร้างสรรค์คอนเทนต์ยุคใหม่ โดยไม่ต้องใช้โปรแกรมซับซ้อนหรืออุปกรณ์ราคาแพง ไม่ว่าคุณจะเป็นยูทูบเบอร์ นักการตลาด หรือเจ้าของธุรกิจ ก็สามารถใช้แพลตฟอร์มนี้เพื่อเปลี่ยน &quot;ข้อความ&quot; ให้กลายเป็น เสียง ภาพ หรือวิดีโอ ได้ในเวลาไม่กี่นาที <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU\" target=\"\">00:00</a> สอนใช้ Google AI Studio <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=38s\" target=\"\">00:38</a> ส่วนประกอบหลักของ AI Gooogle <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=62s\" target=\"\">01:02</a> Chat จาก Google AI <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=178s\" target=\"\">02:58</a> สรุป YouTube ด้วย AI <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=335s\" target=\"\">05:35</a> สร้างเสียง AI ภาษาไทย <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=513s\" target=\"\">08:33</a> สร้างเสียง Poscast AI คุยกัน <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=725s\" target=\"\">12:05</a> สร้างภาพด้วย Google AI <a href=\"https://www.youtube.com/watch?v=AJkqKgrWBjU&amp;t=837s\" target=\"\">13:57</a> Veo2 สร้างวิดีโอ AI ทำความรู้จักกับ Google AI Studio Google AI Studio แบ่งการทำงานออกเป็น 3 ส่วนหลัก ได้แก่: Chat Mode: ใช้ในการสร้างข้อความ บทความ บทสนทนา หรือสคริปต์โฆษณา Generate Media: สร้างเสียง ภาพ และวิดีโอจากข้อความที่เราป้อนเข้าไป Model Selection: เลือกโมเดลการทำงานตามความเร็วหรือความละเอียดที่ต้องการ เช่น Pro, Flash หรือ Thinking Mode สร้าง &ldquo;เสียง&rdquo; ด้วยข้อความง่ายๆ ผู้ใช้งานสามารถเลือกได้ว่าอยากได้เสียงพูดคนเดียว (Single Speaker) หรือบทสนทนา 2 คน (Multi Speaker) โดยมีขั้นตอนง่ายๆ ดังนี้: ใส่ข้อความที่ต้องการให้พูด เช่น &ldquo;สคริปต์ขาย iPhone 14&rdquo; เลือกเสียงผู้ชายหรือผู้หญิง และสำเนียงตามต้องการ คลิก &ldquo;Run&rdquo; แล้วรอเพียงไม่กี่วินาที หากคุณอยากเริ่มต้นสร้างรายได้ออนไลน์ หรือเปลี่ยนไอเดียให้กลายเป็นสื่อคุณภาพ อย่าพลาดทดลองใช้ Google AI Studio ฟรีตั้งแต่วันนี้! 🎬 สนใจคอร์สออนไลน์ YouTube Expert ➡︎ <a href=\"https://www.youtube.com/redirect?event=video_description&amp;redir_token=QUFFLUhqa2NhTm1QMFF5Wi1qUkc3S1c2SEh2MG4xNlU1Z3xBQ3Jtc0ttbXNaVy1OaENxN1p6ME9LQV9mVmhxRzJjODBSMmU5dmItZzlydjlPQm1NUWlReXY5aDhYUV9ITVdveHZjNDdmcndyc3pyN2FZLVRQcFVsZkE4YkdKRldTWF9raU03b0JTZGV0ZVY0NDRzNmRtM0xfbw&amp;q=https%3A%2F%2Fkruyoo.com%2Fyoutube-expert&amp;v=AJkqKgrWBjU\" target=\"_blank\">https://kruyoo.com/youtube-expert</a></p>\r\n', 'youtube', 1, '', 4, '2020-04-25 08:38:41'),
(12, 6, '10 ประเภท สื่อการเรียนการสอน', 'https://www.youtube.com/watch?v=1SU7P9KMXeA', '1SU7P9KMXeA', '1748710394_Screenshot 2568-05-31 at 23.50.19.png', '9:25', '<p>10 ประเภท สื่อการเรียนการสอน</p>\r\n', 'youtube', 1, '', 16, '2020-04-25 08:39:05'),
(13, 6, 'Dinosaur Day Song', 'https://www.youtube.com/watch?v=P10p7ALXkcU', 'P10p7ALXkcU', '', '03:20', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>\r\n', 'youtube', 1, '', 17, '2020-04-25 08:39:29'),
(14, 6, 'หลักสูตร ', 'https://d8.freeterabox.com/file/b0bb42d0ecd46f55dc28033b3c0583c8?bkt=en-c58a217c5b5bf7b273e54893ba14ba950505799db67e8fac867d2c7c9705c31076f22f0b796f070e&xcode=4a7098fb5484630984209bf97e7895e474cb5745c7eca156705ef31b7578d666f6ca03e7f94fa66db13d5cf6e82573b10b2977702d3e6764&fid=4401111320239-250528-583056056563247&time=1749485486&sign=FDTAXUGERQlBHSKfon-DCb740ccc5511e5e8fedcff06b081203-QA0tLLGf08nBGS%2B583Hq4Oo3n%2Bg%3D&to=d8&size=26102188&sta_dx=26102188&sta_cs=0&sta_ft=mp4&sta_ct=7&sta_mt=7&fm2=M', 'cda11up', '1749479072_Screenshot 2568-06-09 at 21.23.57.png', '3:21:00', '<p>หลักสูตร &quot;การผลิตสื่อการสอนคำศัพท์แสนสนุก&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>หลักสูตร &quot;การผลิตสื่อการสอนคำศัพท์แสนสนุก&quot;</p>\r\n\r\n<p>โครงการอบรมพัฒนาศักยภาพครูผู้สอนและบุคลากรทางการศึกษาระดับปฐมวัย&nbsp;ประถมศึกษาและมัธยมศึกษา</p>\r\n\r\n<p>หลักสูตร &quot;การผลิตสื่อการสอนคำศัพท์แสนสนุก&quot;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>วิทยากร</p>\r\n\r\n<p>อ.ดร.สุจิตรา แซ่ลิ่ม</p>\r\n\r\n<p>อาจารย์ประจำ สาขาวิชาภาษาและวัฒนธรรมไทยสำหรับชาวต่างประเทศ สำนักวิชาศิลปศาสตร์ มหาวิทยาลัยแม่ฟ้าหลวง</p>\r\n\r\n<p>Live วันเสาร์ที่ 28 พฤษภาคม 2565</p>\r\n\r\n<p>เวลา 09.00 - 12.00 น.</p>\r\n\r\n<p>ณ อาคารมูลนิธิศักดิ์พรทรัพย์</p>\r\n\r\n<p><a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%A1%E0%B8%B9%E0%B8%A5%E0%B8%99%E0%B8%B4%E0%B8%98%E0%B8%B4%E0%B8%A8%E0%B8%B1%E0%B8%81%E0%B8%94%E0%B8%B4%E0%B9%8C%E0%B8%9E%E0%B8%A3%E0%B8%97%E0%B8%A3%E0%B8%B1%E0%B8%9E%E0%B8%A2%E0%B9%8C?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#มูลนิธิศักดิ์พรทรัพย์</a>&nbsp;<a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%AD%E0%B8%9A%E0%B8%A3%E0%B8%A1?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#อบรม</a>&nbsp;<a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%AD%E0%B8%9A%E0%B8%A3%E0%B8%A1%E0%B8%84%E0%B8%A3%E0%B8%B9?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#อบรมครู</a>&nbsp;<a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%AD%E0%B8%9A%E0%B8%A3%E0%B8%A1%E0%B8%84%E0%B8%A3%E0%B8%B9%E0%B8%AD%E0%B8%AD%E0%B8%99%E0%B9%84%E0%B8%A5%E0%B8%99%E0%B9%8C?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#อบรมครูออนไลน์</a>&nbsp;<a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%AD%E0%B8%9A%E0%B8%A3%E0%B8%A1%E0%B8%AD%E0%B8%AD%E0%B8%99%E0%B9%84%E0%B8%A5%E0%B8%99%E0%B9%8C?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#อบรมออนไลน์</a>&nbsp;<a href=\"https://web.facebook.com/watch/hashtag/%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B8%A8%E0%B8%B6%E0%B8%81%E0%B8%A9%E0%B8%B2%E0%B8%AD%E0%B8%AD%E0%B8%99%E0%B9%84%E0%B8%A5%E0%B8%99%E0%B9%8C?__eep__=6%2F&amp;__cft__[0]=AZXwHdq3BmK51iTfVZrtVNesDf4BiLmsNufvJWU8-R19RfUrDqEfGg0UEUIPWOK5Nad85yKS2CCVbEK_ks7L68HUp4wKIaPBWNAQZh9AhFjar7Hx8c6t7n1s7tw6sGhxF3iCtY6qZZ16TnEvCTs7uhyKBqVxamwE8l8v6NgZAOEFEnEwKq6O6NrsVPsu6dzPH9iEaJ-ZJ6J8uJwsUsEQGbzQmGkhL3fO8zLOQXu8dhMUAQ&amp;__tn__=*NK-R\">#การศึกษาออนไลน์</a></p>\r\n\r\n<p><a href=\"https://scontent.xx.fbcdn.net/o1/v/t2/f2/m69/AQOCtQnBRMIKvg9M2Edv0a5akWwwwCeA02MzfouXM4wS2X7eReGptpB5IFVt7pDxD-oSZC1GAX-kP4AXguVxFy5R.mp4\">getmyfb.com_1749483253452.mp4</a></p>\r\n', 'Url', 1, '', 39, '2025-06-09 07:24:32'),
(16, 6, 'เรียนรู้พยัญชนะอักษรต่ำ สระ และวรรณยุกต์ - สื่อการเรียนการสอน ภาษาไทย ป.1', 'https://pixeldrain.com/api/file/3RZdEv2T', 'cda11up', '1749486408_Screenshot 2568-06-09 at 23.23.47.png', '12:59 ', '<p>- เรียนรู้เรื่อง เรียนรู้พยัญชนะอักษรต่ำ สระ และวรรณยุกต์</p>\r\n\r\n<p>- มาดูว่า อักษรสูง อักษรกลาง และอักษรต่ำประกอบด้วย พยัญชนะอะไรบ้าง</p>\r\n\r\n<p>- เรียนรู้เรื่อง สระ ฝึกอ่านฝึกเขียน พร้อมกับตัวอย่างคำที่ใช้ สระต่างๆ เช่น สระอะ สระอิ สระอึ สระอุ เป็นต้น</p>\r\n\r\n<p>- เรียนรู้เรื่อง&nbsp;วรรณยุกต์ พร้อมการออกเสียง และการเขียนที่ถูกต้อง พร้อมตัวอย่างคำที่ใช้วรรณยุกต์</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>: link :&nbsp;<a href=\"https://web.facebook.com/watch/?ref=search&amp;v=658876278215535&amp;external_log_id=9ee1a71e-80aa-4721-8860-22ae2a581b24&amp;q=%E0%B8%AA%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%20video\">https://web.facebook.com/watch/?ref=search&amp;v=658876278215535&amp;external_log_id=9ee1a71e-80aa-4721-8860-22ae2a581b24&amp;q=%E0%B8%AA%E0%B8%B7%E0%B9%88%E0%B8%AD%E0%B8%81%E0%B8%B2%E0%B8%A3%E0%B9%80%E0%B8%A3%E0%B8%B5%E0%B8%A2%E0%B8%99%E0%B8%81%E0%B8%B2%E0%B8%A3%20video</a></p>\r\n', 'Url', 1, '', 43, '2025-06-09 09:26:48'),
(17, 6, 'การอ่านแจกลูก การสะกดคำ สระอะ สระอิ - สื่อการเรียนการสอน ภาษาไทย ป.1', 'https://pixeldrain.com/api/file/TPhHmQdM', 'cda11up', '1749487734_Screenshot 2568-06-09 at 23.44.20.png', '14:25:00', '<p>สื่อการเรียนการสอน ภาษาไทย ป.1</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>เรื่อง การอ่านแจกลูก การสะกดคำ สระอะ สระอิ</p>\r\n\r\n<p>- การอ่านแจกลูก การสะกดคำ สระอะ สระอิ</p>\r\n\r\n<p>- ตัวอย่างคำศัพท์ และประโยคจาก สระอะ และ สระอิ...</p>\r\n\r\n<h2>link :&nbsp;<a href=\"https://web.facebook.com/watch/?v=520551911930064\">https://web.facebook.com/watch/?v=520551911930064</a></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n', 'Url', 1, '', 21, '2025-06-09 09:48:54'),
(18, 7, 'EP 1 | Flutter คืออะไร? ทำไมควรใช้? เริ่มเขียนแอปง่ายๆ ไปด้วยกัน | What Why First Flutter!?', 'https://www.youtube.com/watch?v=tD9iyr5zoCs', 'tD9iyr5zoCs', '1749832575_Screenshot 2568-06-13 at 23.33.22.png', '11:23', '<p>EP 1 | Flutter คืออะไร? ทำไมควรใช้? เริ่มเขียนแอปง่ายๆ ไปด้วยกัน | What Why First Flutter!?</p>\r\n\r\n<p><img alt=\"The State of Flutter in 2024: A Mature Yet Evolving Ecosystem. | by hazel |  Medium\" src=\"https://miro.medium.com/v2/resize:fit:800/1*3-M8z7qtE32OgRGQEBSX-Q.png\" /></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>วิดีโอนี้จะพาคุณมารู้จักกับ Flutter ว่ามันคืออะไร และ ทำไมหลายคนถึงเลือกใช้ สำหรับการพัฒนาแอป เราจะสอนคุณแบบง่ายๆ ตั้งแต่การ ติดตั้ง Flutter ง่าย ๆ จนถึง สร้างแอปแรกของคุณ ถ้าคุณสนใจพัฒนาแอป แต่ไม่รู้จะเ
<truncated 303396 bytes>

NOTE: The output was truncated because it was too long. Use a more targeted query or a smaller range to get the information you need.
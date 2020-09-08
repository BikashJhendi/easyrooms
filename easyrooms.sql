-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 08, 2020 at 10:05 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `easyrooms`
--

-- --------------------------------------------------------

--
-- Table structure for table `account_usersaccount`
--

CREATE TABLE `account_usersaccount` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `email` varchar(60) NOT NULL,
  `username` varchar(120) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_user` tinyint(1) NOT NULL,
  `fullName` varchar(120) NOT NULL,
  `contactNo` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_usersaccount`
--

INSERT INTO `account_usersaccount` (`id`, `password`, `email`, `username`, `date_joined`, `last_login`, `is_admin`, `is_active`, `is_staff`, `is_superuser`, `is_user`, `fullName`, `contactNo`) VALUES
(1, 'pbkdf2_sha256$180000$EPOXknRwo9Ea$4dGEdcn4Vbfa1X7I2vUnD3oIDkIvvBWwyDbCoCNWOzw=', 'admin@gmail.com', 'admin', '0000-00-00 00:00:00.000000', '2020-09-08 08:02:21.154682', 1, 1, 1, 1, 1, 'admin', '1234567890'),
(2, 'pbkdf2_sha256$180000$ojEwfcE9oQj5$oSE6HNSjQStmQxU+iR8PGWclvokDHYTM4tfskU+hOEs=', 'user@gmail.com', 'user', '0000-00-00 00:00:00.000000', '2020-09-08 08:00:27.645928', 0, 1, 0, 0, 1, 'user', '9874561230'),
(3, 'pbkdf2_sha256$180000$cc9t4xDnJCIw$25JVRSyaBFfPw+4xWV3CxdrwCZayFYi6334eLDsUevQ=', 'anil@gmail.com', 'anil', '2020-09-08 06:44:38.732126', '2020-09-08 06:44:38.732126', 1, 1, 1, 1, 1, '', NULL),
(4, 'pbkdf2_sha256$180000$ShSSt4WI3BUH$y0xyYCHODR25uksRuesrcKC0OKOsUBSv3LqlKbjkMJE=', 'yogesh@gmail.com', 'yogesh', '2020-09-08 06:45:28.584418', '2020-09-08 06:45:28.584418', 1, 1, 1, 1, 1, '', NULL),
(5, 'pbkdf2_sha256$180000$EP2AK5hUnIT6$rcVb/eeB402syyS0iW6CUzg27BQK7kw1+NWPWIn95hI=', 'rajesh@gmail.com', 'rajesh', '2020-09-08 06:45:54.555061', '2020-09-08 06:45:54.555061', 1, 1, 1, 1, 1, '', NULL),
(6, 'pbkdf2_sha256$180000$fqKuiKsNbEh8$2t2bGSfapomT08ox1dO4lMkfA7m/tgL6sxNEhxE2dZs=', 'bikash@gmail.com', 'bikash', '2020-09-08 06:46:40.048645', '2020-09-08 06:46:40.048645', 1, 1, 1, 1, 1, '', NULL),
(7, 'pbkdf2_sha256$180000$Dc02uaw4nSil$GQtGnfB0RwBnbMdq+KNzkGg0Dt5PsxNBEPrbYMk7CmY=', 'abhishek@gmail.com', 'abhishek', '2020-09-08 06:47:15.404729', '2020-09-08 06:47:15.404729', 1, 1, 1, 1, 1, '', NULL),
(8, 'pbkdf2_sha256$180000$EEsEMv2Ffm9X$B60YtArB3wBVBBb3nlFd5l3Tbe2JzIa/LJSTYKHTC6w=', 'abhishekchapagai@gmail.com', 'abhiChapa', '2020-09-08 06:49:46.478278', '2020-09-08 07:48:01.504045', 0, 1, 0, 0, 1, 'Abhishek Chapagai', '1234567980'),
(9, 'pbkdf2_sha256$180000$BGFjz1LiJ9yE$YvpddZXozZJa9RN06/jYC2XLiejgj9iTpR9VNUcLh7k=', 'bikashjhendi@gmail.com', 'bikashJ', '2020-09-08 06:50:58.458110', '2020-09-08 08:01:39.792283', 0, 1, 0, 0, 1, 'Bikash Jhendi', '9818111111'),
(10, 'pbkdf2_sha256$180000$wFTrZVgJyh8S$SyC/RCMAqED/RaO9iNIgteMlACoq7doGRW5Kte+SoEc=', 'anilsubedi@gmail.com', 'anilSuba', '2020-09-08 06:52:13.392107', '2020-09-08 08:02:06.123589', 0, 1, 0, 0, 1, 'Anil Subedi', '9818222222'),
(11, 'pbkdf2_sha256$180000$QINWLLGaYNJ0$1Y3a6Wl5lCOZeOqIGCYXvGNOESbhKTLtV1jP9++8qg8=', 'rajeshkasula@gmail.com', 'rajeshK', '2020-09-08 07:05:19.917159', '2020-09-08 07:32:40.990584', 0, 1, 0, 0, 1, 'Rajesh kasula', '9818333333'),
(12, 'pbkdf2_sha256$180000$2ww0eMwReaTq$Zi6627eFBKisywcgqCcx/KCU7rQMJM5hUu/7R9hiqfg=', 'yogeshshrestha@gamil.com', 'yogeshS', '2020-09-08 07:47:46.548682', '2020-09-08 07:47:46.548682', 0, 1, 0, 0, 1, 'Yogesh Shrestha', '9818444444');

-- --------------------------------------------------------

--
-- Table structure for table `account_usersaccount_groups`
--

CREATE TABLE `account_usersaccount_groups` (
  `id` int(11) NOT NULL,
  `usersaccount_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_usersaccount_groups`
--

INSERT INTO `account_usersaccount_groups` (`id`, `usersaccount_id`, `group_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 2),
(9, 9, 2),
(10, 10, 2),
(11, 11, 2),
(12, 12, 2);

-- --------------------------------------------------------

--
-- Table structure for table `account_usersaccount_user_permissions`
--

CREATE TABLE `account_usersaccount_user_permissions` (
  `id` int(11) NOT NULL,
  `usersaccount_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'adminGroup'),
(2, 'userGroup');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add users account', 1, 'add_usersaccount'),
(2, 'Can change users account', 1, 'change_usersaccount'),
(3, 'Can delete users account', 1, 'delete_usersaccount'),
(4, 'Can view users account', 1, 'view_usersaccount'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add rooms', 7, 'add_rooms'),
(26, 'Can change rooms', 7, 'change_rooms'),
(27, 'Can delete rooms', 7, 'delete_rooms'),
(28, 'Can view rooms', 7, 'view_rooms'),
(29, 'Can add rooms image', 8, 'add_roomsimage'),
(30, 'Can change rooms image', 8, 'change_roomsimage'),
(31, 'Can delete rooms image', 8, 'delete_roomsimage'),
(32, 'Can view rooms image', 8, 'view_roomsimage'),
(33, 'Can add rent', 9, 'add_rent'),
(34, 'Can change rent', 9, 'change_rent'),
(35, 'Can delete rent', 9, 'delete_rent'),
(36, 'Can view rent', 9, 'view_rent');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'account', 'usersaccount'),
(2, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'contenttypes', 'contenttype'),
(9, 'roomsapps', 'rent'),
(7, 'roomsapps', 'rooms'),
(8, 'roomsapps', 'roomsimage'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-08 06:44:03.755020'),
(2, 'auth', '0001_initial', '2020-09-08 06:44:03.816896'),
(3, 'account', '0001_initial', '2020-09-08 06:44:04.035719'),
(4, 'account', '0002_Custome_Account_Migrations', '2020-09-08 06:44:04.250191'),
(5, 'account', '0003_usersRelations', '2020-09-08 06:44:04.262189'),
(6, 'admin', '0001_initial', '2020-09-08 06:44:04.289108'),
(7, 'admin', '0002_logentry_remove_auto_add', '2020-09-08 06:44:04.367897'),
(8, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-08 06:44:04.378868'),
(9, 'contenttypes', '0002_remove_content_type_name', '2020-09-08 06:44:04.426740'),
(10, 'auth', '0002_alter_permission_name_max_length', '2020-09-08 06:44:04.464197'),
(11, 'auth', '0003_alter_user_email_max_length', '2020-09-08 06:44:04.474184'),
(12, 'auth', '0004_alter_user_username_opts', '2020-09-08 06:44:04.483187'),
(13, 'auth', '0005_alter_user_last_login_null', '2020-09-08 06:44:04.492124'),
(14, 'auth', '0006_require_contenttypes_0002', '2020-09-08 06:44:04.495116'),
(15, 'auth', '0007_alter_validators_add_error_messages', '2020-09-08 06:44:04.504127'),
(16, 'auth', '0008_alter_user_username_max_length', '2020-09-08 06:44:04.513067'),
(17, 'auth', '0009_alter_user_last_name_max_length', '2020-09-08 06:44:04.521075'),
(18, 'auth', '0010_alter_group_name_max_length', '2020-09-08 06:44:04.534075'),
(19, 'auth', '0011_update_proxy_permissions', '2020-09-08 06:44:04.548039'),
(20, 'auth', '0012_group_admin', '2020-09-08 06:44:04.562003'),
(21, 'auth', '0013_remove_group_admin', '2020-09-08 06:44:04.575994'),
(22, 'roomsapps', '0001_initial', '2020-09-08 06:44:04.643604'),
(23, 'sessions', '0001_initial', '2020-09-08 06:44:04.790487');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('16eleajl0n7jwtcezoysqczsuut0wkup', 'OGEwMGM0MTlhYjIwYjk1NjhiODFlNzA4NzczYWI5M2EzNWI4NjUwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZWU3MDMwNmYyNTRmYjBhNTYyMzkzYjQ5ZDk2NTZkNzNiMTc3NmFmIn0=', '2020-09-22 08:02:21.158674');

-- --------------------------------------------------------

--
-- Table structure for table `roomsapps_rent`
--

CREATE TABLE `roomsapps_rent` (
  `id` int(11) NOT NULL,
  `room_status` varchar(120) DEFAULT NULL,
  `date_rent` datetime(6) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomsapps_rent`
--

INSERT INTO `roomsapps_rent` (`id`, `room_status`, `date_rent`, `room_id`, `user_id`) VALUES
(1, 'pending', '2020-09-08 08:01:03.631898', 9, 2),
(2, 'pending', '2020-09-08 08:01:08.279434', 3, 2),
(3, 'pending', '2020-09-08 08:01:14.421157', 16, 2),
(4, 'pending', '2020-09-08 08:01:16.951708', 16, 2),
(5, 'pending', '2020-09-08 08:01:44.553960', 9, 9),
(6, 'pending', '2020-09-08 08:01:49.708203', 5, 9),
(7, 'pending', '2020-09-08 08:02:10.749245', 13, 10),
(8, 'pending', '2020-09-08 08:02:13.277377', 13, 10);

-- --------------------------------------------------------

--
-- Table structure for table `roomsapps_rooms`
--

CREATE TABLE `roomsapps_rooms` (
  `id` int(11) NOT NULL,
  `title` varchar(120) DEFAULT NULL,
  `contactNo` varchar(10) DEFAULT NULL,
  `district` varchar(120) DEFAULT NULL,
  `address` varchar(120) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `descriptions` varchar(120) DEFAULT NULL,
  `noOfRooms` varchar(10) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `date_post` datetime(6) DEFAULT NULL,
  `image` varchar(120) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomsapps_rooms`
--

INSERT INTO `roomsapps_rooms` (`id`, `title`, `contactNo`, `district`, `address`, `price`, `descriptions`, `noOfRooms`, `status`, `date_post`, `image`, `user_id`) VALUES
(1, 'Thimi - 6, Bhaktapur', '9818222222', 'Bhaktapur', 'Thimi - 6', '15000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.', '3', 'accepted', '2020-09-08 07:28:25.963870', 'rooms_photo/single-room.jpg', 9),
(2, 'Thimi -5, Bhaktapur', '9818222222', 'Bhaktapur', 'Thimi -5', '5000.00', '24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '1', 'review', '2020-09-08 07:26:08.070559', 'rooms_photo/pic2.jpg', 9),
(3, 'Thimi -4, Bhaktapur', '9818222222', 'Bhaktapur', 'Thimi -4', '20000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:28:33.390427', 'rooms_photo/209765624.jpg', 9),
(4, 'Thimi - 7, Bhaktapur', '9818222222', 'Bhaktapur', 'Thimi - 7,', '10000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '1', 'review', '2020-09-08 07:28:02.272907', 'rooms_photo/about-us54.jpg', 9),
(5, 'Nikoshera - 5, Bhaktapur', '9818222222', 'Bhaktapur', 'Nikoshera - 5', '15000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:53:26.969619', 'rooms_photo/209765624_WedJ1gK.jpg', 11),
(6, 'Tsd jsa;ld sadl jk;ljl;', '9818222222', 'Bhaktapur', 'sadsadsadasasd', '95555.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '1', 'rejected', '2020-09-08 07:53:40.577002', 'rooms_photo/unnamed2.jpg', 11),
(7, 'Madhyapur Thimi-10, Bhaktapur', '9818222222', 'Bhaktapur', 'Madhyapur Thimi-10', '5555.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '1', 'accepted', '2020-09-08 07:53:48.851897', 'rooms_photo/182705414.jpg', 11),
(8, 'Greenland -5, Kathmandu', '9818222222', 'Kathmandu', 'Greenland -5', '10000.00', 'Parking Available.\r\n24 hours water supply.\r\nRoad Side.', '1', 'accepted', '2020-09-08 07:54:51.099230', 'rooms_photo/about-us54_oqDqYsL.jpg', 11),
(9, 'Koteshor -5, Kathmandu', '9818222222', 'Kathmandu', 'Koteshor -5', '5555.00', '24 hours water supply.\r\nRoad Side.', '1', 'accepted', '2020-09-08 07:54:23.294449', 'rooms_photo/display_pic.php.jpg', 11),
(10, 'Baneshwor -6, Kathmandu', '9818222222', 'Kathmandu', 'Baneshwor -6', '30000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:53:58.771300', 'rooms_photo/209765624_LSuka0b.jpg', 11),
(11, 'Baneshwor -6, Kathmandu', '9818444444', 'Kathmandu', 'Baneshwor -6', '40000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '3', 'accepted', '2020-09-08 07:54:08.266447', 'rooms_photo/209765624_06hpCku.jpg', 10),
(12, 'Baneshwor -5, Kathmandu', '9818444444', 'Kathmandu', 'Baneshwor -5', '20000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'review', '2020-09-08 07:41:52.878067', 'rooms_photo/7dfbbd021ad1522f9be3e07f1e3c2fe6788473f9.jpeg', 10),
(13, 'Lakeside - 5, Pokhara', '9818333333', 'Pokhara', 'Lakeside - 5', '25000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '3', 'accepted', '2020-09-08 07:55:06.648978', 'rooms_photo/182705414_zYHDJBu.jpg', 12),
(14, 'asdassdasdasd', '9818444444', 'Pokhara', 'asdasd', '5555.00', 'sadasdasd', '10', 'rejected', '2020-09-08 07:56:10.472150', 'rooms_photo/unnamed2_hHRipBe.jpg', 12),
(15, 'asd', '9818111111', 'Kathmandu', 'asdasdasdasd', '55555.00', 'asdasdasdasd', '1', 'rejected', '2020-09-08 07:55:12.232083', 'rooms_photo/unnamed2_r0j7dN6.jpg', 12),
(16, 'Lakeside - 5, Pokhara', '9818444444', 'Pokhara', 'Lakeside - 5', '15000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:55:18.552892', 'rooms_photo/timthumb.php.jpg', 12),
(17, 'Lakeside - 5, Pokhara', '9818444444', 'Pokhara', 'Lakeside - 5', '15000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:55:23.490198', 'rooms_photo/timthumb.php_lVC3WiA.jpg', 12),
(18, 'Lakeside - 10, Pokhara', '9818444444', 'Pokhara', 'Lakeside - 10', '30000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '4', 'accepted', '2020-09-08 07:55:29.834903', 'rooms_photo/3bed.jpg', 12),
(19, 'Lumbini Banijya Campus, Devinagar -6, Butwal', '9818111111', 'Butwal', 'Lumbini Banijya Campus, Devinagar', '40000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '3', 'accepted', '2020-09-08 07:55:49.457365', 'rooms_photo/182705414_swbB6HT.jpg', 8),
(20, 'Lumbini Banijya Campus, Devinagar - 7, Butwal', '9818111111', 'Butwal', 'Lumbini Banijya Campus, Devinagar - 7', '40000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '4', 'accepted', '2020-09-08 07:55:53.674601', 'rooms_photo/182705414_ub7NQLb.jpg', 8),
(21, 'Lumbini Banijya Campus, Devinagar-10, Butwal', '9818111111', 'Butwal', 'Lumbini Banijya Campus, Devinagar-10', '12000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:55:58.346131', 'rooms_photo/9acc254c-6362-11e7-8aa8-42010af00005_Zh1ZTar.jpg', 8),
(22, 'Lumbini Banijya Campus, Devinagar-1, Butwal', '9818111111', 'Butwal', 'Lumbini Banijya Campus, Devinagar-1', '20000.00', 'Parking Available.\r\n24 hours water supply.\r\nAttach Toilet.\r\nRoad Side.', '2', 'accepted', '2020-09-08 07:56:04.347903', 'rooms_photo/about-us54_dQGcnD8.jpg', 8),
(23, 'asdadadasd', '9818222222', 'Kathmandu', 'asdadadadsd', '55555.00', 'asdasdd', '5', 'review', '2020-09-08 07:59:22.261463', 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_3XdkhQm.png', 10),
(24, 'asdadadasd', '9818222222', 'Kathmandu', 'asdadadadsd', '55555.00', 'asdasdd', '5', 'rejected', '2020-09-08 08:02:36.537530', 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_YaBWh9K.png', 10),
(25, 'asdadadasd', '9818222222', 'Kathmandu', 'asdadadadsd', '55555.00', 'asdasdd', '5', 'rejected', '2020-09-08 08:02:51.947817', 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_5eVtAO2.png', 10),
(26, 'asdadadasd', '9818222222', 'Kathmandu', 'asdadadadsd', '55555.00', 'asdasdd', '5', 'rejected', '2020-09-08 08:03:07.733657', 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_UUFRCzm.png', 10),
(27, 'asdadadasd', '9818222222', 'Kathmandu', 'asdadadadsd', '55555.00', 'asdasdd', '5', 'review', '2020-09-08 07:59:51.775705', 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_snRsRB5.png', 10),
(28, 'Baneshwor -6, Kathmandu', '1234567980', 'Kathmandu', 'Baneshwor -6', '5555.00', '24 hours water supply.', '1', 'review', '2020-09-08 08:00:58.386434', 'rooms_photo/unnamed2_ubNv2ev.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `roomsapps_roomsimage`
--

CREATE TABLE `roomsapps_roomsimage` (
  `id` int(11) NOT NULL,
  `rooms_images` varchar(100) DEFAULT NULL,
  `rooms_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roomsapps_roomsimage`
--

INSERT INTO `roomsapps_roomsimage` (`id`, `rooms_images`, `rooms_id`) VALUES
(1, 'rooms_photo/single-room_mjoRLex.jpg', 1),
(2, 'rooms_photo/teahouse-room-nepal.jpg', 1),
(3, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280.png', 1),
(4, 'rooms_photo/pic2_IrccH9n.jpg', 2),
(5, 'rooms_photo/209765624_9qr9Tnv.jpg', 3),
(6, 'rooms_photo/dream-nepal-hotel-and.jpg', 3),
(7, 'rooms_photo/about-us54_0J8Fq82.jpg', 4),
(8, 'rooms_photo/209765624_KRfrxPw.jpg', 5),
(9, 'rooms_photo/about-us54_lqOalnf.jpg', 5),
(10, 'rooms_photo/unnamed2_ITPDXrW.jpg', 6),
(11, 'rooms_photo/182705414_rLE7VfH.jpg', 7),
(12, 'rooms_photo/about-us54_T9qJESV.jpg', 8),
(13, 'rooms_photo/display_pic.php_j4r8zzu.jpg', 9),
(14, 'rooms_photo/209765624_0ZARhBa.jpg', 10),
(15, 'rooms_photo/about-us54_TZKsIEq.jpg', 10),
(16, 'rooms_photo/209765624_s3Zxmpm.jpg', 11),
(17, 'rooms_photo/about-us54_rK3Qmgv.jpg', 11),
(18, 'rooms_photo/display_pic.php_lF5hRjU.jpg', 11),
(19, 'rooms_photo/7dfbbd021ad1522f9be3e07f1e3c2fe6788473f9_pjP2ynN.jpeg', 12),
(20, 'rooms_photo/9acc254c-6362-11e7-8aa8-42010af00005.jpg', 12),
(21, 'rooms_photo/182705414_pLE6QpG.jpg', 13),
(22, 'rooms_photo/209765624_qzFTrzI.jpg', 13),
(23, 'rooms_photo/about-us54_QjAZ5QT.jpg', 13),
(24, 'rooms_photo/unnamed2_c7Fmhv4.jpg', 14),
(25, 'rooms_photo/unnamed2_HhA9iNT.jpg', 15),
(26, 'rooms_photo/timthumb.php_mqD6y6w.jpg', 16),
(27, 'rooms_photo/unnamed.jpg', 16),
(28, 'rooms_photo/timthumb.php_Fti3hyP.jpg', 17),
(29, 'rooms_photo/unnamed_lt8QMm7.jpg', 17),
(30, 'rooms_photo/3bed_p0AZK0v.jpg', 18),
(31, 'rooms_photo/7dfbbd021ad1522f9be3e07f1e3c2fe6788473f9_ZWlJixB.jpeg', 18),
(32, 'rooms_photo/9acc254c-6362-11e7-8aa8-42010af00005_TuQ3chS.jpg', 18),
(33, 'rooms_photo/66363205.jpg', 18),
(34, 'rooms_photo/182705414_sunPQED.jpg', 19),
(35, 'rooms_photo/209765624_0PZY2Rl.jpg', 19),
(36, 'rooms_photo/about-us54_cieBQct.jpg', 19),
(37, 'rooms_photo/182705414_PqHf9s8.jpg', 20),
(38, 'rooms_photo/209765624_1a45kOe.jpg', 20),
(39, 'rooms_photo/about-us54_e2iSD10.jpg', 20),
(40, 'rooms_photo/display_pic.php_4QZGKFO.jpg', 20),
(41, 'rooms_photo/9acc254c-6362-11e7-8aa8-42010af00005_xuSzRsd.jpg', 21),
(42, 'rooms_photo/66363205_fw5sGRN.jpg', 21),
(43, 'rooms_photo/about-us54_GccYX5o.jpg', 22),
(44, 'rooms_photo/display_pic.php_DVFSKcJ.jpg', 22),
(45, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_pvC10cv.png', 23),
(46, 'rooms_photo/unnamed2_uFpE53T.jpg', 23),
(47, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_0bjnWgW.png', 24),
(48, 'rooms_photo/unnamed2_XFHmyA8.jpg', 24),
(49, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_WykE6DF.png', 25),
(50, 'rooms_photo/unnamed2_eg719Mk.jpg', 25),
(51, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_4v5bOXS.png', 26),
(52, 'rooms_photo/unnamed2_TMWaoCD.jpg', 26),
(53, 'rooms_photo/thimg_Add-a-heading-3-_1920x1280_iq0fKYc.png', 27),
(54, 'rooms_photo/unnamed2_xQUCR5S.jpg', 27),
(55, 'rooms_photo/unnamed2_5p8XNOQ.jpg', 28);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account_usersaccount`
--
ALTER TABLE `account_usersaccount`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `contactNo` (`contactNo`);

--
-- Indexes for table `account_usersaccount_groups`
--
ALTER TABLE `account_usersaccount_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_usersaccount_gro_usersaccount_id_group_id_b75e9775_uniq` (`usersaccount_id`,`group_id`),
  ADD KEY `account_usersaccount_groups_group_id_5e63cfa8_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `account_usersaccount_user_permissions`
--
ALTER TABLE `account_usersaccount_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `account_usersaccount_use_usersaccount_id_permissi_b30250da_uniq` (`usersaccount_id`,`permission_id`),
  ADD KEY `account_usersaccount_permission_id_0ccb1f97_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_account_usersaccount_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `roomsapps_rent`
--
ALTER TABLE `roomsapps_rent`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomsapps_rent_room_id_3c14895b_fk_roomsapps_rooms_id` (`room_id`),
  ADD KEY `roomsapps_rent_user_id_6084f269_fk_account_usersaccount_id` (`user_id`);

--
-- Indexes for table `roomsapps_rooms`
--
ALTER TABLE `roomsapps_rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomsapps_rooms_user_id_4c47997e_fk_account_usersaccount_id` (`user_id`);

--
-- Indexes for table `roomsapps_roomsimage`
--
ALTER TABLE `roomsapps_roomsimage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roomsapps_roomsimage_rooms_id_a1d53579_fk_roomsapps_rooms_id` (`rooms_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_usersaccount`
--
ALTER TABLE `account_usersaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `account_usersaccount_groups`
--
ALTER TABLE `account_usersaccount_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `account_usersaccount_user_permissions`
--
ALTER TABLE `account_usersaccount_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `roomsapps_rent`
--
ALTER TABLE `roomsapps_rent`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `roomsapps_rooms`
--
ALTER TABLE `roomsapps_rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `roomsapps_roomsimage`
--
ALTER TABLE `roomsapps_roomsimage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account_usersaccount_groups`
--
ALTER TABLE `account_usersaccount_groups`
  ADD CONSTRAINT `account_usersaccount_groups_group_id_5e63cfa8_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `account_usersaccount_usersaccount_id_fd8c1ade_fk_account_u` FOREIGN KEY (`usersaccount_id`) REFERENCES `account_usersaccount` (`id`);

--
-- Constraints for table `account_usersaccount_user_permissions`
--
ALTER TABLE `account_usersaccount_user_permissions`
  ADD CONSTRAINT `account_usersaccount_permission_id_0ccb1f97_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `account_usersaccount_usersaccount_id_d9252162_fk_account_u` FOREIGN KEY (`usersaccount_id`) REFERENCES `account_usersaccount` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_usersaccount_id` FOREIGN KEY (`user_id`) REFERENCES `account_usersaccount` (`id`);

--
-- Constraints for table `roomsapps_rent`
--
ALTER TABLE `roomsapps_rent`
  ADD CONSTRAINT `roomsapps_rent_room_id_3c14895b_fk_roomsapps_rooms_id` FOREIGN KEY (`room_id`) REFERENCES `roomsapps_rooms` (`id`),
  ADD CONSTRAINT `roomsapps_rent_user_id_6084f269_fk_account_usersaccount_id` FOREIGN KEY (`user_id`) REFERENCES `account_usersaccount` (`id`);

--
-- Constraints for table `roomsapps_rooms`
--
ALTER TABLE `roomsapps_rooms`
  ADD CONSTRAINT `roomsapps_rooms_user_id_4c47997e_fk_account_usersaccount_id` FOREIGN KEY (`user_id`) REFERENCES `account_usersaccount` (`id`);

--
-- Constraints for table `roomsapps_roomsimage`
--
ALTER TABLE `roomsapps_roomsimage`
  ADD CONSTRAINT `roomsapps_roomsimage_rooms_id_a1d53579_fk_roomsapps_rooms_id` FOREIGN KEY (`rooms_id`) REFERENCES `roomsapps_rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

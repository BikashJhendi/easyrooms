-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2020 at 07:05 PM
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
  `contactNo` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `account_usersaccount`
--

INSERT INTO `account_usersaccount` (`id`, `password`, `email`, `username`, `date_joined`, `last_login`, `is_admin`, `is_active`, `is_staff`, `is_superuser`, `is_user`, `fullName`, `contactNo`) VALUES
(1, 'pbkdf2_sha256$180000$EPOXknRwo9Ea$4dGEdcn4Vbfa1X7I2vUnD3oIDkIvvBWwyDbCoCNWOzw=', 'admin@gmail.com', 'admin', '2020-08-29 17:03:51.465212', '2020-08-29 17:03:51.465212', 1, 1, 1, 1, 1, 'admin', '1234567890'),
(2, 'pbkdf2_sha256$180000$3Yk1aEbPMlZp$2fGWlHN+riKtD9UdnPfywN0c4VFn+ClyxQiXjggkzg4=', 'user@gmail.com', 'user', '2020-08-29 16:54:31.968114', '2020-08-29 16:54:44.303000', 0, 1, 0, 0, 1, 'user', '0123456789');

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
(2, 1, 1),
(1, 2, 2);

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
(24, 'Can view session', 6, 'view_session');

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

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-08-29 17:03:51.472194', '1', 'admin@gmail.com', 2, '[{\"changed\": {\"fields\": [\"Groups\", \"Full Name\", \"Contact Number\"]}}]', 1, 1);

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
(1, 'contenttypes', '0001_initial', '2020-08-29 16:52:44.095806'),
(2, 'contenttypes', '0002_remove_content_type_name', '2020-08-29 16:52:44.138010'),
(3, 'auth', '0001_initial', '2020-08-29 16:52:44.190867'),
(4, 'auth', '0002_alter_permission_name_max_length', '2020-08-29 16:52:44.355427'),
(5, 'auth', '0003_alter_user_email_max_length', '2020-08-29 16:52:44.362448'),
(6, 'auth', '0004_alter_user_username_opts', '2020-08-29 16:52:44.369391'),
(7, 'auth', '0005_alter_user_last_login_null', '2020-08-29 16:52:44.375373'),
(8, 'auth', '0006_require_contenttypes_0002', '2020-08-29 16:52:44.379392'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2020-08-29 16:52:44.385379'),
(10, 'auth', '0008_alter_user_username_max_length', '2020-08-29 16:52:44.393366'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2020-08-29 16:52:44.411278'),
(12, 'auth', '0010_alter_group_name_max_length', '2020-08-29 16:52:44.429229'),
(13, 'auth', '0011_update_proxy_permissions', '2020-08-29 16:52:44.437208'),
(14, 'auth', '0012_group_admin', '2020-08-29 16:52:44.450173'),
(15, 'auth', '0013_remove_group_admin', '2020-08-29 16:52:44.461144'),
(16, 'account', '0001_initial', '2020-08-29 16:52:44.524974'),
(17, 'admin', '0001_initial', '2020-08-29 16:52:44.716907'),
(18, 'admin', '0002_logentry_remove_auto_add', '2020-08-29 16:52:44.792705'),
(19, 'admin', '0003_logentry_add_action_flag_choices', '2020-08-29 16:52:44.801684'),
(20, 'sessions', '0001_initial', '2020-08-29 16:52:44.818953');

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
('i209jkdu8t9hkf0malqsfda6fumtcy1c', 'OGEwMGM0MTlhYjIwYjk1NjhiODFlNzA4NzczYWI5M2EzNWI4NjUwZDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI2ZWU3MDMwNmYyNTRmYjBhNTYyMzkzYjQ5ZDk2NTZkNzNiMTc3NmFmIn0=', '2020-09-12 16:54:48.000454');

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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_usersaccount`
--
ALTER TABLE `account_usersaccount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `account_usersaccount_groups`
--
ALTER TABLE `account_usersaccount_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 17, 2022 at 08:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `django_project_1`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
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
(1, 'Can add korisnici', 1, 'add_korisnici'),
(2, 'Can change korisnici', 1, 'change_korisnici'),
(3, 'Can delete korisnici', 1, 'delete_korisnici'),
(4, 'Can view korisnici', 1, 'view_korisnici'),
(5, 'Can add studenti', 2, 'add_studenti'),
(6, 'Can change studenti', 2, 'change_studenti'),
(7, 'Can delete studenti', 2, 'delete_studenti'),
(8, 'Can view studenti', 2, 'view_studenti'),
(9, 'Can add predmeti', 3, 'add_predmeti'),
(10, 'Can change predmeti', 3, 'change_predmeti'),
(11, 'Can delete predmeti', 3, 'delete_predmeti'),
(12, 'Can view predmeti', 3, 'view_predmeti'),
(13, 'Can add ocene', 4, 'add_ocene'),
(14, 'Can change ocene', 4, 'change_ocene'),
(15, 'Can delete ocene', 4, 'delete_ocene'),
(16, 'Can view ocene', 4, 'view_ocene'),
(17, 'Can add log entry', 5, 'add_logentry'),
(18, 'Can change log entry', 5, 'change_logentry'),
(19, 'Can delete log entry', 5, 'delete_logentry'),
(20, 'Can view log entry', 5, 'view_logentry'),
(21, 'Can add permission', 6, 'add_permission'),
(22, 'Can change permission', 6, 'change_permission'),
(23, 'Can delete permission', 6, 'delete_permission'),
(24, 'Can view permission', 6, 'view_permission'),
(25, 'Can add group', 7, 'add_group'),
(26, 'Can change group', 7, 'change_group'),
(27, 'Can delete group', 7, 'delete_group'),
(28, 'Can view group', 7, 'view_group'),
(29, 'Can add content type', 8, 'add_contenttype'),
(30, 'Can change content type', 8, 'change_contenttype'),
(31, 'Can delete content type', 8, 'delete_contenttype'),
(32, 'Can view content type', 8, 'view_contenttype'),
(33, 'Can add session', 9, 'add_session'),
(34, 'Can change session', 9, 'change_session'),
(35, 'Can delete session', 9, 'delete_session'),
(36, 'Can view session', 9, 'view_session');

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
  `user_id` bigint(20) NOT NULL
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
(5, 'admin', 'logentry'),
(7, 'auth', 'group'),
(6, 'auth', 'permission'),
(8, 'contenttypes', 'contenttype'),
(1, 'korisnici', 'korisnici'),
(4, 'predmeti', 'ocene'),
(3, 'predmeti', 'predmeti'),
(9, 'sessions', 'session'),
(2, 'studenti', 'studenti');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'korisnici', '0001_initial', '2022-03-15 23:43:30.157737'),
(2, 'contenttypes', '0001_initial', '2022-03-15 23:43:30.948175'),
(3, 'admin', '0001_initial', '2022-03-15 23:43:33.329524'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-03-15 23:43:33.374489'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-03-15 23:43:33.416377'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-03-15 23:43:34.396819'),
(7, 'auth', '0001_initial', '2022-03-15 23:43:38.545374'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-03-15 23:43:40.186536'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-03-15 23:43:40.279433'),
(10, 'auth', '0004_alter_user_username_opts', '2022-03-15 23:43:40.324314'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-03-15 23:43:40.366258'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-03-15 23:43:40.405125'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-03-15 23:43:40.450915'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-03-15 23:43:40.525092'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-03-15 23:43:40.593458'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-03-15 23:43:40.805748'),
(17, 'auth', '0011_update_proxy_permissions', '2022-03-15 23:43:40.854714'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-03-15 23:43:40.901121'),
(19, 'studenti', '0001_initial', '2022-03-15 23:43:41.163087'),
(20, 'predmeti', '0001_initial', '2022-03-15 23:43:44.312588'),
(21, 'sessions', '0001_initial', '2022-03-15 23:43:44.957980');

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
('fx7gbnp9uv7m1f6cwntna7nlg5riea4z', '.eJxdj8tuwyAQRX8l8oZNhDA1fmQVdd9vsAYY28Q2RANupUb594KURdvdzL1njjSPaoQjLeMRkUZnq0tVV-ffmQazoi-FvYGfAzfBJ3KaF4S_2sg_gsXt_cX-ESwQl3wNoLpWNjg1YpKTQRCDFTipwbagsNdKKhCt6EBaiW-d7noplembZhjMJK3I0mMLc_gEP66BXPRuzdoHc5ZdTnV7PjG3Yx5ZwphYXu-E3_8i3MFtJfhCze8UZoLdEfgbckISdT1c54LkJ_fCU9ig4GB3511MBCkQe1bPH_ISZcQ:1nUsS7:Nb0hM9Oc_CKWEQ55OVr836rzSAXxeZS1HIZQ3uzbRZU', '2022-03-31 15:54:15.435225'),
('kq37cydgedzudhzob21glfbfemhkerm0', '.eJxdjDsKgDAQBa8iabaRdDZW3kQWEmTJZ2XzKQy5u7FJYfdmBl5TxfPFFePpWChFcmpXDcjAvmzrAhTsWIAmUITBt9jn72xA8tMcNY-bpK0pWtLXhT3OTCkLZhboqr83HSmI:1nUuZ3:gOWRuw8syKmXlFe_1DSTKnvt19sUH_6hsRfaCJeHWIE', '2022-03-31 18:09:33.473622'),
('wb3ok52n9i6mf0xity8den26dhjph9r3', '.eJxVjDsOwjAQBe_iGllm8ZeSnjNYa-8aB5AtxUmFuDtESgHtm5n3EhHXpcZ18BwnEmdxFIffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsjGmdBc9GqQMmMKpDiYgJZNOyTAYPKKodAwCeXnAcw2WsdQi5ASrw_90Y4Ag:1nUGx1:5Vp_STLxblvCuwKV27nZglJKeuoWrzoj2lIIgMX_LxU', '2022-03-29 23:51:39.247846');

-- --------------------------------------------------------

--
-- Table structure for table `korisnici_korisnici`
--

CREATE TABLE `korisnici_korisnici` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `ime` varchar(40) NOT NULL,
  `prezime` varchar(40) NOT NULL,
  `email` varchar(60) NOT NULL,
  `rola` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `korisnici_korisnici`
--

INSERT INTO `korisnici_korisnici` (`id`, `password`, `ime`, `prezime`, `email`, `rola`, `username`, `date_joined`, `last_login`, `is_admin`, `is_active`, `is_staff`, `is_superuser`) VALUES
(5, 'pbkdf2_sha256$320000$4TD36gM1vO2PmnNTY4mwlW$QrIM+kb1F5MP6BViZ3pt0f31r+s8zDI+cTXG29wOR7I=', 'admin', 'admin', 'admin@vtsnis.edu.rs', 'administrator', 'vtsadmin', '2022-03-16 22:12:44.861461', '2022-03-16 22:12:44.909334', 1, 1, 1, 1),
(13, 'pbkdf2_sha256$320000$Y3cYexpKQXjRnnqT9EAJ43$Xqx06e/5T2iIvJ8i7vWJezGdA8DP28++NVTEBwj28MU=', 'Pera', 'Peric', 'pp@vtsnis.edu.rs', 'profesor', 'vtsStaff_pp@vtsnis.edu.rs', '2022-03-17 00:04:23.850138', '2022-03-17 00:04:23.851135', 0, 1, 0, 0),
(16, 'pbkdf2_sha256$320000$ehVyArvt1CUpONJtFtsh7K$RizenkoNaB4gAhnlxV00ZywjWL07LQ7IvcjrtLZo3iw=', 'test', 'test', 'web.programiranje.rer0119@gmail.com', 'administrator', 'vtsStaff_web.programiranje.rer', '2022-03-17 15:25:51.263014', '2022-03-17 15:54:09.463133', 0, 1, 0, 0),
(21, 'pbkdf2_sha256$320000$voVn8MNiSn4fAuYttQfRR5$2vtaTUUiZ5q5W7RZ2gcrOpZTWc3R9y/h+VCGAfiqsvk=', 'Profesor', 'Profesor', 'profesor@vtsnis.edu.rs', 'profesor', 'vtsStaff_profesor@vtsnis.edu.r', '2022-03-17 17:55:32.094776', '2022-03-17 17:55:32.094776', 0, 1, 0, 0),
(25, 'pbkdf2_sha256$320000$JVeu76MBwT3x2qHOyOBarC$d16Kt6r3t1v4vRsclorJL5682Dp+YaIxpqtwNnivnRw=', 'Fica', 'Ficic', 'ff@vtsnis.edu.rs', 'student', 'vtsUser_ff@vtsnis.edu.rs', '2022-03-17 18:02:53.554756', '2022-03-17 18:02:53.554756', 0, 1, 0, 0),
(27, 'pbkdf2_sha256$320000$G3GYrnsFEiMnH39ZRGW0Q9$esxEvXZBEsOAsafWIr7RJ5BrNbYF/voI0dA158kyrL4=', 'Goran', 'Gokic', 'gg@vtsnis.edu.rs', 'student', 'vtsUser_gg@vtsnis.edu.rs', '2022-03-17 18:10:19.218681', '2022-03-17 18:10:19.218681', 0, 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `predmeti_ocene`
--

CREATE TABLE `predmeti_ocene` (
  `id` bigint(20) NOT NULL,
  `ocena` int(11) NOT NULL,
  `datum` date NOT NULL,
  `predmet_id` bigint(20) NOT NULL,
  `student_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `predmeti_ocene`
--

INSERT INTO `predmeti_ocene` (`id`, `ocena`, `datum`, `predmet_id`, `student_id`) VALUES
(6, 8, '2022-03-17', 5, 9),
(7, 10, '2022-03-17', 6, 9);

-- --------------------------------------------------------

--
-- Table structure for table `predmeti_predmeti`
--

CREATE TABLE `predmeti_predmeti` (
  `id` bigint(20) NOT NULL,
  `naziv` varchar(100) NOT NULL,
  `godina_studija` varchar(10) NOT NULL,
  `sifra` varchar(100) NOT NULL,
  `espb` double DEFAULT NULL,
  `obavezni_izborni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `predmeti_predmeti`
--

INSERT INTO `predmeti_predmeti` (`id`, `naziv`, `godina_studija`, `sifra`, `espb`, `obavezni_izborni`) VALUES
(1, 'Matematika I', '1', '666', 6, 'obavezni'),
(2, 'Matematika II', '1', '999', 6, 'obavezni'),
(3, 'Algoritmi i strukture podataka', '1', '111', 6, 'obavezni'),
(4, 'Adminisriranje racunarskih mreza', '2', '333', 6, 'izborni'),
(5, 'Fizika', '1', '777', 6, 'obavezni'),
(6, 'Operativni sistemi', '2', '555', 6, 'obavezni');

-- --------------------------------------------------------

--
-- Table structure for table `studenti_studenti`
--

CREATE TABLE `studenti_studenti` (
  `id` bigint(20) NOT NULL,
  `ime` varchar(100) NOT NULL,
  `ime_roditelja` varchar(100) NOT NULL,
  `prezime` varchar(100) NOT NULL,
  `jmbg` bigint(20) NOT NULL,
  `datum_rodjenja` date NOT NULL,
  `broj_telefona` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `broj_indeksa` varchar(10) NOT NULL,
  `godina_studija` varchar(10) NOT NULL,
  `slika` varchar(100) NOT NULL,
  `espb` double DEFAULT NULL,
  `prosek_ocena` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `studenti_studenti`
--

INSERT INTO `studenti_studenti` (`id`, `ime`, `ime_roditelja`, `prezime`, `jmbg`, `datum_rodjenja`, `broj_telefona`, `email`, `broj_indeksa`, `godina_studija`, `slika`, `espb`, `prosek_ocena`) VALUES
(9, 'Fica', 'Fiki', 'Ficic', 123456789, '2022-03-17', '123456', 'ff@vtsnis.edu.rs', 'rer1/22', '1', '', 12, 9),
(11, 'Goran', 'Goki', 'Gokic', 123456, '2022-03-17', '123456', 'gg@vtsnis.edu.rs', 'rer9/22', '1', '', 0, 0);

--
-- Indexes for dumped tables
--

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
  ADD KEY `django_admin_log_user_id_c564eba6_fk_korisnici_korisnici_id` (`user_id`);

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
-- Indexes for table `korisnici_korisnici`
--
ALTER TABLE `korisnici_korisnici`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- Indexes for table `predmeti_ocene`
--
ALTER TABLE `predmeti_ocene`
  ADD PRIMARY KEY (`id`),
  ADD KEY `predmeti_ocene_predmet_id_e722f585_fk_predmeti_predmeti_id` (`predmet_id`),
  ADD KEY `predmeti_ocene_student_id_21a72024_fk_studenti_studenti_id` (`student_id`);

--
-- Indexes for table `predmeti_predmeti`
--
ALTER TABLE `predmeti_predmeti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `studenti_studenti`
--
ALTER TABLE `studenti_studenti`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `korisnici_korisnici`
--
ALTER TABLE `korisnici_korisnici`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `predmeti_ocene`
--
ALTER TABLE `predmeti_ocene`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `predmeti_predmeti`
--
ALTER TABLE `predmeti_predmeti`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `studenti_studenti`
--
ALTER TABLE `studenti_studenti`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_korisnici_korisnici_id` FOREIGN KEY (`user_id`) REFERENCES `korisnici_korisnici` (`id`);

--
-- Constraints for table `predmeti_ocene`
--
ALTER TABLE `predmeti_ocene`
  ADD CONSTRAINT `predmeti_ocene_predmet_id_e722f585_fk_predmeti_predmeti_id` FOREIGN KEY (`predmet_id`) REFERENCES `predmeti_predmeti` (`id`),
  ADD CONSTRAINT `predmeti_ocene_student_id_21a72024_fk_studenti_studenti_id` FOREIGN KEY (`student_id`) REFERENCES `studenti_studenti` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

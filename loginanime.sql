-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.4.11-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para loginanime
CREATE DATABASE IF NOT EXISTS `loginanime` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `loginanime`;

-- Volcando estructura para tabla loginanime.administrador
CREATE TABLE IF NOT EXISTS `administrador` (
  `idAdmin` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`idAdmin`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla loginanime.administrador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `administrador` DISABLE KEYS */;
INSERT INTO `administrador` (`idAdmin`, `nombre`, `email`, `pass`) VALUES
	(1, 'eM1X5nqk2oadmin', '5VpEJBkFBK@gmail.com', '$2y$10$tXMw3h8JlbE3kGFumXGdOOCXveVcdZ6r5Kwukl2Jt1iHQyTwgKJkq');
/*!40000 ALTER TABLE `administrador` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.categories: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
	(2, 'Shonen', '2022-04-18 20:19:18', '2022-04-23 00:00:42'),
	(3, 'Misterio', '2022-04-18 20:19:30', '2022-04-18 20:19:30'),
	(4, 'Gore', '2022-04-18 20:19:46', '2022-04-18 20:19:46'),
	(5, 'Romanticismo', '2022-04-18 22:35:58', '2022-04-18 22:35:58'),
	(6, 'Comedia', '2022-04-18 22:36:16', '2022-04-18 22:36:16'),
	(7, 'Terror', '2022-04-23 18:20:03', '2022-04-23 18:20:03');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.comments
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `commenter_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commenter_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `commentable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT 1,
  `child_id` bigint(20) unsigned DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_commenter_id_commenter_type_index` (`commenter_id`,`commenter_type`),
  KEY `comments_commentable_type_commentable_id_index` (`commentable_type`,`commentable_id`),
  KEY `comments_child_id_foreign` (`child_id`),
  CONSTRAINT `comments_child_id_foreign` FOREIGN KEY (`child_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.comments: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` (`id`, `commenter_id`, `commenter_type`, `guest_name`, `guest_email`, `commentable_type`, `commentable_id`, `comment`, `approved`, `child_id`, `deleted_at`, `created_at`, `updated_at`) VALUES
	(4, '5', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '4', 'COMENTARIO DE ROMANTICISMO', 1, NULL, NULL, '2022-04-21 22:06:52', '2022-04-21 22:06:52'),
	(9, '5', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '5', 'SHONEN', 1, NULL, NULL, '2022-04-22 01:11:52', '2022-04-22 01:11:52'),
	(13, '1', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '2', 'Hola, soy el administrador\r\nToggle between multiple modals with some clever placement of the data-bs-target and data-bs-toggle attributes. For example, you could toggle a password reset modal from within an already open sign in modal. Please note multiple modals cannot be open at the same time—this method simply toggles between two separate modals.', 1, NULL, NULL, '2022-04-23 00:50:37', '2022-04-23 00:50:37'),
	(14, '1', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '5', 'Respondiendo a categoría Shonen.', 1, 9, NULL, '2022-04-23 03:12:32', '2022-04-23 03:12:32'),
	(15, '2', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '2', 'Respondiendo al admin', 1, 13, NULL, '2022-04-23 03:17:51', '2022-04-23 03:17:51'),
	(16, '1', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '3', 'COMENTARIO EN CATEGORÍA GORE', 1, NULL, NULL, '2022-04-23 03:19:56', '2022-04-23 03:19:56'),
	(17, '5', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '2', 'Respondiendo quien respondio al admin', 1, 15, NULL, '2022-04-23 18:06:23', '2022-04-23 18:06:23'),
	(18, '5', 'App\\Models\\User', NULL, NULL, 'App\\Models\\Models\\Post', '2', 'Respondiendo al admin desde mi cuenta', 1, 13, NULL, '2022-04-23 18:06:52', '2022-04-23 18:06:52');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.failed_jobs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.migrations: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2019_08_19_000000_create_failed_jobs_table', 1),
	(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
	(5, '2022_01_26_174104_create_forms_table', 2),
	(6, '2022_04_18_193942_create_categories_table', 3),
	(7, '2022_04_18_202317_create_posts_table', 4),
	(12, '2022_04_21_191654_create_comments_table', 5);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.password_resets: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.personal_access_tokens
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.personal_access_tokens: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) unsigned NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_category_id_foreign` (`category_id`),
  CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.posts: ~7 rows (aproximadamente)
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` (`id`, `category_id`, `title`, `content`, `author`, `featured`, `created_at`, `updated_at`) VALUES
	(1, 3, '¿No lo esperabas?', 'Se ha dado informes de que hasta el momento el anime Death note, tiene mas seguimiento de lo esperado en el manga y como podemos observar, las cosas cada vez se ponen mas raras y complicadas!!', 'Ivonne López', 'images/featureds/1650314200-images (5).jpg', '2022-04-18 20:36:14', '2022-04-19 04:08:30'),
	(2, 6, '¡Que Sorpresa!', '"Nichijou" se trata de un clásico y referencia en cuanto a animes de humor y comedia. Repentinamente empezaremos a encontrarnos con robots, acción frenética y todo tipo de inusuales escenarios que den lugar a momentos para el recuerdo.', 'Ivonne  Lopez', 'images/featureds/1650341126-nichijou.jpg', '2022-04-18 22:37:12', '2022-04-19 04:06:37'),
	(3, 4, '¿!Que ha pasado!?', 'Goblin Slayer desató críticas con su primera temporada, la cual tenía Goblins violando mujeres, mucha violencia gráfica y abuso físico y psicológico a las víctimas, pero aun así la segunda temporada trae aún más salvajismo y violencia a su público, por si eso no  habían quedado satisfechos .', 'Ivonne Lopez', 'images/featureds/1650341636-Goblin-Slayer-segunda-temporada-miniatura.jpg', '2022-04-18 22:38:02', '2022-04-19 04:14:59'),
	(4, 5, '¡No podemos esperar mas!', 'Komi-san, ya esta a nada de estrenar su segunda temporada  y ahora nos preguntamos, ¿Qué pasara con tadano? Al fin komi podrá decirle lo que en verdad siente por el o seguirá con el temor de no poder ser la correspondida para el, nunca lo sabremos hasta que podamos ver esta temporada nueva :,( que ya casi se acerca!!!!', 'Ivonne Lopez', 'images/featureds/1650342031-FHOIc3takAEFBTH-1536x1097.jpg', '2022-04-18 22:40:58', '2022-04-19 04:20:31'),
	(5, 2, '¡Cada vez se pone mejor!', 'One piece, el anime al cual todos se estan uniendo y como no si es una obra de arte esta por sacar su nueva película titulada FILM RED y gran sorpresa que nos llevamos, ¿Shanks tiene una hija? por su puesto que si y apenas nos enteramos, al igual que tu con este post, no sabemos que mas nos depara o que mas sorpresas nos dará este gran Yonkō', 'Ivonne Lopez', 'images/featureds/1650342336-shanksuta-1.jpg', '2022-04-19 03:56:01', '2022-04-19 04:27:49'),
	(6, 2, 'Después del hackeo', 'El anime de One Piece reanudará sus emisiones en la televisión japonesa el próximo domingo 24 de abril. Después del hackeo a los servidores de Toei Animation el pasado 15 de marzo, que se tradujo en la suspensión indefinida de las principales series de la compañía nipona en los principales canales de distribución, estamos ansiosos de ver en a nuestro tan amado capitan luffy', 'Ivonne Lopez', 'images/featureds/1650342714-4LFL4QT225GVJKXWXNRYPRQFPM.png', '2022-04-19 04:31:54', '2022-04-19 04:31:54'),
	(7, 7, 'Another', 'Another cuenta la historia de Koichi Sakakibara, un adolescente de 15 años que en el año 1998 se muda de Tokyo hacia Yomiyama, donde comenzará a cursar sus estudios en la Escuela Media del Norte, en el 9º año, en la sección 3ª.', 'Alma Vianeyi', 'images/featureds/1650738494-Another.jpg', '2022-04-23 18:28:14', '2022-04-23 18:28:14');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;

-- Volcando estructura para tabla loginanime.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fullacces` enum('yes','no') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Volcando datos para la tabla loginanime.users: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `email`, `codigo`, `fullacces`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', 'admin@gmail.com', '$sdQ22J9', 'yes', NULL, '$2y$10$spLgLYcgmbIsv1RRtK8EVeta1xYMwFpE08ogp2lxarg/aVlAlJ8/m', 'P5EvcX9MAebZh6fbyNPhLEHV2Or0SRWjKa5BgOmyQx8VRDln4wCACAYp2kje', '2022-04-18 07:39:14', '2022-04-18 07:39:14'),
	(2, 'Usuario Prueba', 'user@gmail.com', '$sf1IoYhl', 'no', NULL, '$2y$10$R5DE/C1TmP/Cxb02aC9IHeZEHYmmvdYCXiQrUqQQQn3VlgM7Oi8NG', NULL, '2022-04-18 08:09:13', '2022-04-18 08:09:13'),
	(3, 'ivonne', 'carmen@gmail.com', NULL, 'no', NULL, '$2y$10$EfXMiDOEov5njG119rvGxuKJCZvdKCksRSrfEdW5swqwnSDtit50K', NULL, '2022-04-18 22:34:06', '2022-04-18 22:34:06'),
	(4, 'ivonne', 'livonne@gmail.com', NULL, 'no', NULL, '$2y$10$fboLu6pQHNMN4k0xOd1AQuz1FTnsyOQVRTN/SPdfZnlhHob/oyrbO', NULL, '2022-04-19 04:58:29', '2022-04-19 04:58:29'),
	(5, 'Alma Vianeyi', 'alma_vianeyi@outlook.com', NULL, 'no', NULL, '$2y$10$dHb1rFkIDgKrpyg40tGF9OKr5kByX5TnDcTrrdpSZ0ZdJ.P5JHSPu', NULL, '2022-04-19 19:51:34', '2022-04-19 19:51:34');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

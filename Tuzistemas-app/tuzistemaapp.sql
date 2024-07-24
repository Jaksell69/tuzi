-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 31-05-2024 a las 03:55:52
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tuzistemaapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `group_teacher`
--

CREATE TABLE `group_teacher` (
  `id` int NOT NULL,
  `gT_enrollment` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gT_group` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `group_teacher`
--

INSERT INTO `group_teacher` (`id`, `gT_enrollment`, `gT_group`) VALUES
(1, '100100115', '9S12'),
(2, '100100115', '7S11'),
(3, '100100115', '5S12'),
(4, '100100115', '3S11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `R_description` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `R_id` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`R_description`, `R_id`) VALUES
('Jefe de Carrera', 1),
('Docente', 2),
('Alumno', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `schedule`
--

CREATE TABLE `schedule` (
  `S_Id` int NOT NULL,
  `S_Name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `S_Type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `S_Size` int NOT NULL,
  `S_Content` longblob NOT NULL,
  `S_Group` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `S_Autor` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `S_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uploaded_files`
--

CREATE TABLE `uploaded_files` (
  `UP_Id` int NOT NULL,
  `UP_Enrollment` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UP_File` longblob NOT NULL,
  `UP_Type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `UP_nameFile` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `UP_dateFile` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `UP_sizeFile` int NOT NULL,
  `UP_group` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `u_id` int UNSIGNED NOT NULL,
  `U_name` varchar(70) COLLATE utf8mb4_unicode_ci NOT NULL,
  `U_mail` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `U_phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `U_password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `U_role` int UNSIGNED DEFAULT NULL,
  `U_enrollment` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'NULL',
  `U_boss` tinyint(1) NOT NULL DEFAULT '0',
  `U_group` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT 'Sin Grupo'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`u_id`, `U_name`, `U_mail`, `U_phone`, `U_password`, `U_role`, `U_enrollment`, `U_boss`, `U_group`) VALUES
(1, 'Jorge Jaksell Herrera Zarza', 'jaksellzarza26@gmail.com', '5512345678', '$2y$10$CP2XOqbBwmhGnzhfSFnrFOgXe8xKc9jQ8rbLDF.hMymUafFh3PPXq', 3, '186010115', 1, '9S12'),
(2, 'Jorge Jaksell Herrera Zarza', 'jaksellzarza@gmail.com', '5538495677', '$2y$10$6SNdNTiVEjxDcdd98AehTOBd.eH61o6qoEXVcETgLuYNCLKg17s96', 3, '196010115', 0, '9S12'),
(3, 'Fifine Kynder', 'fkynder0@japanpost.jp', '274-118-36', NULL, 3, '3734114063', 0, '3S12'),
(4, 'Elnar Sherville', 'esherville1@theglobeandmail.com', '866-402-48', NULL, 3, '0614995841', 0, '5S12'),
(5, 'Karita Simmell', 'ksimmell2@php.net', '170-361-01', NULL, 3, '6274370919', 0, '8S11'),
(6, 'Gertrude Kinglesyd', 'gkinglesyd3@g.co', '878-933-14', NULL, 3, '9311763470', 0, '3S12'),
(7, 'Edy Munday', 'emunday4@weibo.com', '967-710-26', NULL, 3, '4664518943', 0, '9S11'),
(8, 'Marlee Burdis', 'mburdis5@intel.com', '687-680-98', NULL, 3, '5561972936', 0, '2S12'),
(9, 'Tandi de Courcey', 'tde6@census.gov', '114-844-72', NULL, 3, '2957669218', 0, '4S12'),
(10, 'Whitney Dulinty', 'wdulinty7@webs.com', '561-495-47', NULL, 3, '5219398830', 0, '1S11'),
(11, 'Pascale Brimson', 'pbrimson8@bloglovin.com', '347-663-61', NULL, 3, '4277409105', 0, '5S12'),
(12, 'Sadye Cloney', 'scloney9@ameblo.jp', '454-421-90', NULL, 3, '4164639598', 0, '8S12'),
(13, 'Edward Arrol', 'earrola@livejournal.com', '155-190-87', NULL, 3, '1620765942', 0, '8S11'),
(14, 'Kynthia Chuter', 'kchuterb@usda.gov', '487-760-07', NULL, 3, '4826332130', 0, '5S11'),
(15, 'Whitney Warr', 'wwarrc@ihg.com', '830-356-31', NULL, 3, '8793591829', 0, '2S11'),
(16, 'Truman De Ath', 'tded@instagram.com', '734-101-98', NULL, 3, '2663994510', 0, '6S12'),
(17, 'Agustin Casburn', 'acasburne@diigo.com', '535-231-04', NULL, 3, '1044728647', 0, '1S11'),
(18, 'Roshelle Steedman', 'rsteedmanf@cpanel.net', '976-484-37', NULL, 3, '5954200408', 0, '6S12'),
(19, 'Lennard Jendricke', 'ljendrickeg@deviantart.com', '992-376-67', NULL, 3, '7880085947', 0, '2S11'),
(20, 'Zuzana Ruf', 'zrufh@infoseek.co.jp', '426-721-62', NULL, 3, '7918971698', 0, '9S12'),
(21, 'Eldin Droghan', 'edroghani@xing.com', '716-877-05', NULL, 3, '0614207878', 0, '8S12'),
(22, 'Freddie Tapping', 'ftappingj@bizjournals.com', '527-258-77', NULL, 3, '3375496044', 0, '9S11'),
(23, 'Ernesta Jeggo', 'ejeggok@dyndns.org', '877-406-48', NULL, 3, '3482061033', 0, '9S11'),
(24, 'Carlie Whitman', 'cwhitmanl@nih.gov', '144-937-90', NULL, 3, '8467172347', 0, '2S12'),
(25, 'Esme Topes', 'etopesm@i2i.jp', '544-936-73', NULL, 3, '9964260504', 0, '6S11'),
(26, 'Hana MacClay', 'hmacclayn@moonfruit.com', '353-501-57', NULL, 3, '7739943940', 0, '5S12'),
(27, 'Annadiana Furniss', 'afurnisso@census.gov', '872-609-78', NULL, 3, '1732534837', 0, '4S11'),
(28, 'Otes MacLardie', 'omaclardiep@wordpress.org', '818-403-49', NULL, 3, '1858744024', 0, '3S12'),
(29, 'Clemmy Toulch', 'ctoulchq@sciencedaily.com', '368-474-07', NULL, 3, '4569976697', 0, '3S11'),
(30, 'Valentin Lamblot', 'vlamblotr@bbc.co.uk', '934-904-78', NULL, 3, '9635259328', 0, '1S12'),
(31, 'Thornie Browne', 'tbrownes@naver.com', '925-856-79', NULL, 3, '5292658782', 0, '8S11'),
(32, 'Aggie Pocklington', 'apocklingtont@wiley.com', '808-421-21', NULL, 3, '2176477235', 0, '7S11'),
(33, 'Burch Springer', 'bspringeru@360.cn', '482-407-94', NULL, 3, '1402680627', 0, '7S11'),
(34, 'Dana Laying', 'dlayingv@theglobeandmail.com', '922-932-10', NULL, 3, '8553592693', 0, '8S11'),
(35, 'Abdul Cherrett', 'acherrettw@de.vu', '301-770-65', NULL, 3, '9389328926', 0, '5S11'),
(36, 'Silvana Lightowler', 'slightowlerx@etsy.com', '491-182-58', NULL, 3, '4555829360', 0, '1S11'),
(37, 'Mala Ligoe', 'mligoey@comcast.net', '249-432-65', NULL, 3, '7087891626', 0, '7S11'),
(38, 'Inga Dunne', 'idunnez@latimes.com', '952-189-23', NULL, 3, '6092250306', 0, '8S12'),
(39, 'Johnette Saltmarshe', 'jsaltmarshe10@cornell.edu', '902-215-94', NULL, 3, '0611080257', 0, '2S12'),
(40, 'Kevina Luff', 'kluff11@canalblog.com', '110-517-31', NULL, 3, '5234502589', 0, '3S12'),
(41, 'Halie Vaz', 'hvaz12@telegraph.co.uk', '979-647-89', NULL, 3, '6672621857', 0, '8S12'),
(42, 'Ring Letten', 'rletten13@tinyurl.com', '527-152-29', NULL, 3, '2086295294', 0, '7S11'),
(43, 'Laurel Rhule', 'lrhule14@cnn.com', '743-235-50', NULL, 3, '1940746345', 0, '9S12'),
(44, 'Murdock Creevy', 'mcreevy15@netvibes.com', '756-304-69', NULL, 3, '2686119993', 0, '3S12'),
(45, 'Sheppard Sharpling', 'ssharpling16@smugmug.com', '949-690-31', NULL, 3, '2572069210', 0, '3S12'),
(46, 'Mariejeanne McGinnis', 'mmcginnis17@posterous.com', '440-358-21', NULL, 3, '9416571822', 0, '1S12'),
(47, 'Decca Ganniclifft', 'dganniclifft18@utexas.edu', '541-475-20', NULL, 3, '2381120815', 0, '7S11'),
(48, 'Harold Wyer', 'hwyer19@about.me', '282-207-79', NULL, 3, '3404236467', 0, '5S12'),
(49, 'Ezechiel Burkitt', 'eburkitt1a@macromedia.com', '371-754-12', NULL, 3, '3987776072', 0, '1S11'),
(50, 'Skylar La Batie', 'sla1b@elpais.com', '615-318-77', NULL, 3, '0058899561', 0, '7S12'),
(51, 'Shell Carluccio', 'scarluccio1c@chicagotribune.com', '709-441-56', NULL, 3, '4804578803', 0, '4S12'),
(52, 'Adam Constance', 'aconstance1d@prweb.com', '925-506-38', NULL, 3, '5248595185', 0, '1S12'),
(53, 'Corenda Ahren', 'cahren1e@spiegel.de', '969-496-23', NULL, 3, '3015550500', 0, '1S11'),
(54, 'Dorthea Lansdowne', 'dlansdowne1f@arstechnica.com', '624-272-86', NULL, 3, '3203747588', 0, '5S12'),
(55, 'Crissie Goward', 'cgoward1g@census.gov', '659-585-00', NULL, 3, '5981615990', 0, '8S12'),
(56, 'Martha Scotter', 'mscotter1h@theguardian.com', '717-310-59', NULL, 3, '1740706498', 0, '5S11'),
(57, 'Florencia Rispin', 'frispin1i@simplemachines.org', '708-901-40', NULL, 3, '9736311716', 0, '3S11'),
(58, 'Annamarie Shelf', 'ashelf1j@dion.ne.jp', '182-331-68', NULL, 3, '8371232969', 0, '7S12'),
(59, 'Selene Ramberg', 'sramberg1k@istockphoto.com', '124-190-08', NULL, 3, '7008669534', 0, '7S11'),
(60, 'Dane Hehl', 'dhehl1l@toplist.cz', '683-703-31', NULL, 3, '2429421682', 0, '6S11'),
(61, 'Leilah Dockwray', 'ldockwray1m@trellian.com', '151-976-94', NULL, 3, '3954072378', 0, '4S11'),
(62, 'Witty Dunston', 'wdunston1n@xing.com', '306-500-85', NULL, 3, '8665988556', 0, '5S12'),
(63, 'Debbie Saing', 'dsaing1o@list-manage.com', '122-576-54', NULL, 3, '5606142732', 0, '2S11'),
(64, 'Eartha Goathrop', 'egoathrop1p@hp.com', '247-247-92', NULL, 3, '5584244120', 0, '7S12'),
(65, 'Nicolai Norvell', 'nnorvell1q@admin.ch', '149-671-47', NULL, 3, '9641322443', 0, '4S12'),
(66, 'Jesus Eversfield', 'jeversfield1r@wunderground.com', '330-568-50', NULL, 3, '2127163192', 0, '5S12'),
(67, 'Pedro Kuhnwald', 'pkuhnwald1s@ted.com', '965-151-88', NULL, 3, '1664523723', 0, '4S11'),
(68, 'Ediva Kincaid', 'ekincaid1t@dagondesign.com', '573-400-50', NULL, 3, '3723052762', 0, '7S11'),
(69, 'Kaila Lafrentz', 'klafrentz1u@cloudflare.com', '172-292-92', NULL, 3, '3106622512', 0, '5S12'),
(70, 'Emmett Frankom', 'efrankom1v@51.la', '775-727-78', NULL, 3, '4773349239', 0, '8S12'),
(71, 'Levin Wanless', 'lwanless1w@stumbleupon.com', '536-635-24', NULL, 3, '8831108107', 0, '6S11'),
(72, 'Daffie Brackpool', 'dbrackpool1x@princeton.edu', '910-137-31', NULL, 3, '2558425439', 0, '7S11'),
(73, 'Emmaline Huson', 'ehuson1y@addthis.com', '571-809-67', NULL, 3, '0087007916', 0, '7S11'),
(74, 'Odelle Barwood', 'obarwood1z@noaa.gov', '743-199-78', NULL, 3, '8033149418', 0, '5S11'),
(75, 'Barr Braikenridge', 'bbraikenridge20@gnu.org', '144-904-56', NULL, 3, '2579244271', 0, '3S12'),
(76, 'Maye Gullefant', 'mgullefant21@godaddy.com', '559-579-89', NULL, 3, '3959722028', 0, '9S12'),
(77, 'Christoforo Sollner', 'csollner22@china.com.cn', '931-721-07', NULL, 3, '3943263940', 0, '7S11'),
(78, 'Leoline Cheverell', 'lcheverell23@techcrunch.com', '267-567-71', NULL, 3, '8083836923', 0, '3S12'),
(79, 'Cherianne Cuer', 'ccuer24@jigsy.com', '679-779-17', NULL, 3, '4110432677', 0, '2S11'),
(80, 'Brinna De Leek', 'bde25@networksolutions.com', '952-643-00', NULL, 3, '2270092813', 0, '3S11'),
(81, 'Dahlia Kalvin', 'dkalvin26@umn.edu', '394-813-41', NULL, 3, '6755827703', 0, '6S11'),
(82, 'Iggy Gasperi', 'igasperi27@wordpress.com', '318-710-47', NULL, 3, '4482376264', 0, '5S11'),
(83, 'Tiffie McConnell', 'tmcconnell28@ezinearticles.com', '964-361-71', NULL, 3, '2946472574', 0, '1S11'),
(84, 'Melita Juara', 'mjuara29@sun.com', '933-809-42', NULL, 3, '9102767708', 0, '3S11'),
(85, 'Ginnifer Kleehuhler', 'gkleehuhler2a@google.com.au', '243-203-55', NULL, 3, '0722820046', 0, '9S11'),
(86, 'Rhianna Beacock', 'rbeacock2b@marriott.com', '712-791-83', NULL, 3, '9225323085', 0, '4S11'),
(87, 'Neal Deshon', 'ndeshon2c@bigcartel.com', '623-192-32', NULL, 3, '2322503266', 0, '4S12'),
(88, 'Silvanus Bristow', 'sbristow2d@nih.gov', '422-779-88', NULL, 3, '9865977400', 0, '6S11'),
(89, 'Paola Woollcott', 'pwoollcott2e@jimdo.com', '197-757-30', NULL, 3, '2488146218', 0, '7S11'),
(90, 'Leyla McLagan', 'lmclagan2f@ebay.co.uk', '296-355-86', NULL, 3, '7671691305', 0, '5S11'),
(91, 'Josepha Duberry', 'jduberry2g@booking.com', '973-118-38', NULL, 3, '9538588991', 0, '9S12'),
(92, 'Hazel Betteriss', 'hbetteriss2h@examiner.com', '633-415-30', NULL, 3, '3811749307', 0, '8S12'),
(93, 'Annette Adamczewski', 'aadamczewski2i@mapy.cz', '360-226-85', NULL, 3, '9642346613', 0, '6S11'),
(94, 'Ricky Fonzo', 'rfonzo2j@census.gov', '981-116-03', NULL, 3, '9753630263', 0, '4S12'),
(95, 'Tonnie Mabon', 'tmabon2k@imdb.com', '582-642-41', NULL, 3, '9082380005', 0, '9S11'),
(96, 'Berta McShee', 'bmcshee2l@bloglovin.com', '827-167-23', NULL, 3, '8148870071', 0, '2S11'),
(97, 'Rosalyn Farrand', 'rfarrand2m@blogs.com', '387-830-77', NULL, 3, '3593526581', 0, '4S12'),
(98, 'Klemens Bastable', 'kbastable2n@cpanel.net', '658-963-53', NULL, 3, '3530559474', 0, '3S12'),
(99, 'Thatcher Creaser', 'tcreaser2o@google.es', '100-591-81', NULL, 3, '7900433392', 0, '8S12'),
(100, 'Gav Bolino', 'gbolino2p@nymag.com', '681-554-69', NULL, 3, '0570027748', 0, '6S12'),
(101, 'Lanni Jolliff', 'ljolliff2q@rambler.ru', '576-255-74', NULL, 3, '6158254533', 0, '1S11'),
(102, 'Rivalee Marchand', 'rmarchand2r@ftc.gov', '981-129-84', NULL, 3, '9818043448', 0, '3S12'),
(103, 'Flora Jedrzejczak', 'fjedrzejczak2s@sciencedaily.com', '499-441-16', NULL, 3, '1792124791', 0, '1S12'),
(104, 'Judie Hazelton', 'jhazelton2t@sohu.com', '299-515-82', NULL, 3, '0353934828', 0, '4S12'),
(105, 'Yorker Fullard', 'yfullard2u@homestead.com', '957-504-59', NULL, 3, '9457920376', 0, '6S12'),
(106, 'Lacie Mortel', 'lmortel2v@bravesites.com', '253-379-44', NULL, 3, '7065454371', 0, '7S11'),
(107, 'Wallace Venner', 'wvenner2w@oaic.gov.au', '248-847-80', NULL, 3, '4151384650', 0, '1S12'),
(108, 'Steve Oakland', 'soakland2x@bbc.co.uk', '781-522-01', NULL, 3, '3327311501', 0, '7S12'),
(109, 'Andreas Jarmyn', 'ajarmyn2y@un.org', '594-418-45', NULL, 3, '0872145271', 0, '9S11'),
(110, 'Clerc Hamill', 'chamill2z@statcounter.com', '637-913-79', NULL, 3, '3398374425', 0, '8S12'),
(111, 'Dan Spence', 'dspence30@tiny.cc', '548-824-69', NULL, 3, '3040802097', 0, '6S12'),
(112, 'Ado Weyland', 'aweyland31@patch.com', '515-972-90', NULL, 3, '5486968841', 0, '8S12'),
(113, 'Wendy Faint', 'wfaint32@vinaora.com', '398-452-84', NULL, 3, '4931719090', 0, '4S11'),
(114, 'Janella Pawels', 'jpawels33@engadget.com', '477-110-60', NULL, 3, '6780150509', 0, '6S12'),
(115, 'Frederico Dayce', 'fdayce34@google.ca', '501-783-83', NULL, 3, '5319676786', 0, '1S12'),
(116, 'Maddalena Blaxland', 'mblaxland35@people.com.cn', '587-204-09', NULL, 3, '0689530226', 0, '2S12'),
(117, 'Riobard Menere', 'rmenere36@timesonline.co.uk', '151-581-71', NULL, 3, '7069643667', 0, '1S11'),
(118, 'Christabella Cathrall', 'ccathrall37@tripadvisor.com', '999-712-08', NULL, 3, '8878150754', 0, '1S11'),
(119, 'Leslie Laffling', 'llaffling38@paginegialle.it', '609-584-82', NULL, 3, '4902701723', 0, '9S12'),
(120, 'Talya Lumby', 'tlumby39@friendfeed.com', '710-881-74', NULL, 3, '6453972468', 0, '6S11'),
(121, 'Rodrigo Neem', 'rneem3a@scribd.com', '581-435-81', NULL, 3, '7820630825', 0, '2S12'),
(122, 'Henderson Ivashin', 'hivashin3b@independent.co.uk', '193-945-08', NULL, 3, '6751865392', 0, '2S11'),
(123, 'Galvin Pockett', 'gpockett3c@nhs.uk', '515-929-54', NULL, 3, '8499308376', 0, '9S12'),
(124, 'Tobye Partkya', 'tpartkya3d@godaddy.com', '795-364-26', NULL, 3, '6268093119', 0, '7S11'),
(125, 'Rowena Woolger', 'rwoolger3e@constantcontact.com', '914-537-52', NULL, 3, '4354977559', 0, '1S11'),
(126, 'Mary Jackman', 'mjackman3f@wordpress.org', '960-298-10', NULL, 3, '2756868000', 0, '3S12'),
(127, 'Celle Giacovelli', 'cgiacovelli3g@nba.com', '642-587-73', NULL, 3, '9051392141', 0, '3S12'),
(128, 'Cilka Peal', 'cpeal3h@usatoday.com', '463-632-29', NULL, 3, '3445094616', 0, '2S12'),
(129, 'Lane Ransfield', 'lransfield3i@macromedia.com', '806-520-32', NULL, 3, '8879138529', 0, '7S11'),
(130, 'Arabela Lamswood', 'alamswood3j@ebay.com', '579-528-12', NULL, 3, '2334752584', 0, '7S11'),
(131, 'Hanan Feaveryear', 'hfeaveryear3k@archive.org', '448-115-38', NULL, 3, '1904391710', 0, '9S11'),
(132, 'Clio Stairs', 'cstairs3l@squidoo.com', '168-239-21', NULL, 3, '6648218282', 0, '3S12'),
(133, 'Arel Woolway', 'awoolway3m@howstuffworks.com', '422-169-92', NULL, 3, '0874195918', 0, '5S12'),
(134, 'Barron Lake', 'blake3n@youtube.com', '426-659-95', NULL, 3, '8585278293', 0, '9S11'),
(135, 'Elladine Stanlock', 'estanlock3o@prlog.org', '939-941-13', NULL, 3, '7736792429', 0, '9S12'),
(136, 'Wilhelmine Muddicliffe', 'wmuddicliffe3p@salon.com', '423-678-60', NULL, 3, '8149387838', 0, '6S11'),
(137, 'Skippy Dudman', 'sdudman3q@yale.edu', '597-957-82', NULL, 3, '3505292583', 0, '9S11'),
(138, 'Lammond Borsay', 'lborsay3r@hp.com', '458-693-31', NULL, 3, '1101050101', 0, '5S12'),
(139, 'Farr Gorrick', 'fgorrick3s@hhs.gov', '369-869-51', NULL, 3, '3185279549', 0, '4S12'),
(140, 'Channa Matskiv', 'cmatskiv3t@tinyurl.com', '856-798-79', NULL, 3, '9489541648', 0, '4S11'),
(141, 'Roana Bottle', 'rbottle3u@amazon.co.jp', '921-625-06', NULL, 3, '6620343384', 0, '5S11'),
(142, 'Allianora Wetherald', 'awetherald3v@jiathis.com', '171-601-00', NULL, 3, '4666674829', 0, '5S11'),
(143, 'Max Rubica', 'mrubica3w@sciencedaily.com', '970-160-67', NULL, 3, '0045985340', 0, '8S12'),
(144, 'Gilligan Arrigo', 'garrigo3x@macromedia.com', '250-484-46', NULL, 3, '2102269647', 0, '2S11'),
(145, 'Vincent Bysshe', 'vbysshe3y@comsenz.com', '757-359-54', NULL, 3, '3543677861', 0, '5S11'),
(146, 'Rosmunda Strainge', 'rstrainge3z@jalbum.net', '213-478-97', NULL, 3, '8101147829', 0, '9S12'),
(147, 'Sascha Tortoise', 'stortoise40@sfgate.com', '297-255-35', NULL, 3, '3014665444', 0, '9S12'),
(148, 'Jacquie Battelle', 'jbattelle41@tinypic.com', '348-274-81', NULL, 3, '0422255955', 0, '2S11'),
(149, 'Silvano Kunzler', 'skunzler42@paginegialle.it', '515-342-66', NULL, 3, '4999392801', 0, '7S12'),
(150, 'Daryn Winckworth', 'dwinckworth43@surveymonkey.com', '510-611-14', NULL, 3, '6963906467', 0, '6S12'),
(151, 'Goldarina Athey', 'gathey44@boston.com', '517-760-65', NULL, 3, '1737575701', 0, '4S12'),
(152, 'Doralyn Simanenko', 'dsimanenko45@zdnet.com', '954-750-07', NULL, 3, '9898650044', 0, '5S11'),
(153, 'Meg Henrie', 'mhenrie46@nih.gov', '783-669-80', NULL, 3, '4422218530', 0, '7S12'),
(154, 'Hildegarde Quantrell', 'hquantrell47@creativecommons.org', '727-552-95', NULL, 3, '5439953450', 0, '1S11'),
(155, 'Genevra Gajewski', 'ggajewski48@opera.com', '721-441-36', NULL, 3, '9662348433', 0, '2S11'),
(156, 'Sylas Dronsfield', 'sdronsfield49@columbia.edu', '370-383-03', NULL, 3, '2232203948', 0, '8S11'),
(157, 'Ardyce Brill', 'abrill4a@sphinn.com', '102-619-55', NULL, 3, '8883499417', 0, '1S11'),
(158, 'Berti Brewis', 'bbrewis4b@comcast.net', '371-302-85', NULL, 3, '2274435693', 0, '6S12'),
(159, 'Brose Knapper', 'bknapper4c@census.gov', '118-478-11', NULL, 3, '4283079294', 0, '9S12'),
(160, 'Tessi Ixer', 'tixer4d@ox.ac.uk', '214-981-86', NULL, 3, '4042041949', 0, '3S11'),
(161, 'Willy Ertelt', 'wertelt4e@topsy.com', '854-864-66', NULL, 3, '9993140619', 0, '4S12'),
(162, 'Orsa Menlow', 'omenlow4f@hatena.ne.jp', '465-360-02', NULL, 3, '2111736422', 0, '1S12'),
(163, 'Warde Zanini', 'wzanini4g@huffingtonpost.com', '280-423-23', NULL, 3, '1968346953', 0, '6S11'),
(164, 'Annice Grzelak', 'agrzelak4h@ehow.com', '257-603-60', NULL, 3, '7033532539', 0, '3S11'),
(165, 'Alysa Truce', 'atruce4i@nationalgeographic.com', '885-165-46', NULL, 3, '5951033365', 0, '2S12'),
(166, 'Leoline Hebbard', 'lhebbard4j@wix.com', '530-659-63', NULL, 3, '2106506600', 0, '6S12'),
(167, 'Opalina Hounihan', 'ohounihan4k@nps.gov', '504-225-23', NULL, 3, '6843386431', 0, '7S11'),
(168, 'Dorice Burch', 'dburch4l@tripod.com', '951-133-94', NULL, 3, '5114583344', 0, '1S11'),
(169, 'Maggie Hagan', 'mhagan4m@census.gov', '395-677-32', NULL, 3, '8852444149', 0, '4S11'),
(170, 'Madge Stoller', 'mstoller4n@auda.org.au', '105-117-70', NULL, 3, '5470762505', 0, '6S11'),
(171, 'Jennica Ebertz', 'jebertz4o@dot.gov', '454-767-23', NULL, 3, '1870715551', 0, '9S12'),
(172, 'Emili Lanfer', 'elanfer4p@buzzfeed.com', '608-144-03', NULL, 3, '2030397423', 0, '8S12'),
(173, 'Durant Calway', 'dcalway4q@google.ca', '964-951-20', NULL, 3, '4327789631', 0, '1S11'),
(174, 'Deni Harlow', 'dharlow4r@statcounter.com', '449-284-76', NULL, 3, '6462610468', 0, '1S11'),
(175, 'Olag Bolley', 'obolley4s@skyrock.com', '575-901-01', NULL, 3, '5303579433', 0, '9S11'),
(176, 'Anabella Jammet', 'ajammet4t@altervista.org', '881-974-45', NULL, 3, '3305998563', 0, '4S11'),
(177, 'Pamelina Snedker', 'psnedker4u@gmpg.org', '739-798-32', NULL, 3, '7543613395', 0, '3S12'),
(178, 'Halley Fagge', 'hfagge4v@xinhuanet.com', '631-755-09', NULL, 3, '0795153791', 0, '1S12'),
(179, 'Caty Scranney', 'cscranney4w@acquirethisname.com', '596-152-74', NULL, 3, '8710084541', 0, '1S11'),
(180, 'Kelbee Bowart', 'kbowart4x@tamu.edu', '794-955-28', NULL, 3, '9446979757', 0, '3S11'),
(181, 'Perry Fortye', 'pfortye4y@smh.com.au', '252-827-73', NULL, 3, '0503392421', 0, '9S11'),
(182, 'Mateo Varcoe', 'mvarcoe4z@cornell.edu', '525-305-81', NULL, 3, '0986124729', 0, '9S11'),
(183, 'Anselm Elam', 'aelam50@sphinn.com', '104-116-20', NULL, 3, '3556455617', 0, '3S12'),
(184, 'Feodor Pearch', 'fpearch51@miibeian.gov.cn', '174-986-39', NULL, 3, '0937670448', 0, '2S11'),
(185, 'Aidan Moffett', 'amoffett52@ucoz.com', '592-520-83', NULL, 3, '2005112739', 0, '1S12'),
(186, 'Theodoric Tomlin', 'ttomlin53@infoseek.co.jp', '804-585-32', NULL, 3, '6963040060', 0, '2S11'),
(187, 'Davine Filippone', 'dfilippone54@google.pl', '345-167-91', NULL, 3, '5753925944', 0, '3S12'),
(188, 'Timotheus Yeaman', 'tyeaman55@netscape.com', '420-156-63', NULL, 3, '5469441407', 0, '6S11'),
(189, 'Darren Rameau', 'drameau56@instagram.com', '311-409-09', NULL, 3, '8520495230', 0, '5S11'),
(190, 'Drake Antonat', 'dantonat57@csmonitor.com', '784-804-68', NULL, 3, '5525310562', 0, '2S11'),
(191, 'Jillie Harrow', 'jharrow58@sbwire.com', '606-370-46', NULL, 3, '3072147299', 0, '5S12'),
(192, 'Gui Teissier', 'gteissier59@globo.com', '383-804-52', NULL, 3, '4113020760', 0, '8S12'),
(193, 'Zondra Eede', 'zeede5a@mysql.com', '280-246-71', NULL, 3, '3793210642', 0, '5S11'),
(194, 'Birgitta Vidgeon', 'bvidgeon5b@google.co.jp', '123-176-36', NULL, 3, '4471225308', 0, '2S12'),
(195, 'Kalil Koubu', 'kkoubu5c@goodreads.com', '371-105-36', NULL, 3, '5570668233', 0, '6S11'),
(196, 'Shellie Cornbill', 'scornbill5d@qq.com', '315-942-73', NULL, 3, '8726317494', 0, '5S11'),
(197, 'Liv Ughetti', 'lughetti5e@nbcnews.com', '609-426-53', NULL, 3, '7522391849', 0, '6S12'),
(198, 'Ted Huxter', 'thuxter5f@instagram.com', '397-681-66', NULL, 3, '7547107656', 0, '9S11'),
(199, 'Joleen Joselson', 'jjoselson5g@stumbleupon.com', '368-886-96', NULL, 3, '3073952764', 0, '9S12'),
(200, 'Danit Helgass', 'dhelgass5h@icio.us', '809-284-13', NULL, 3, '9347298751', 0, '5S11'),
(201, 'Law Claire', 'lclaire5i@cyberchimps.com', '401-587-04', NULL, 3, '7835289334', 0, '4S11'),
(202, 'Byron Heaysman', 'bheaysman5j@house.gov', '389-739-04', NULL, 3, '2673351841', 0, '4S12'),
(203, 'Vanny Cawsey', 'vcawsey5k@marketwatch.com', '192-841-08', NULL, 3, '6905156973', 0, '3S12'),
(204, 'Walliw Dulin', 'wdulin5l@t.co', '703-893-45', NULL, 3, '5352610853', 0, '6S11'),
(205, 'Cristian Clash', 'cclash5m@noaa.gov', '695-601-36', NULL, 3, '0449659763', 0, '2S11'),
(206, 'Laney Jurkowski', 'ljurkowski5n@ezinearticles.com', '209-885-77', NULL, 3, '9608028221', 0, '7S12'),
(207, 'Sebastian Coleborn', 'scoleborn5o@abc.net.au', '578-418-48', NULL, 3, '2128188539', 0, '3S12'),
(208, 'Borden Ackwood', 'backwood5p@google.pl', '538-461-05', NULL, 3, '8303713639', 0, '3S12'),
(209, 'Nicola Pitceathly', 'npitceathly5q@nps.gov', '960-195-09', NULL, 3, '9594136103', 0, '5S11'),
(210, 'Aubert Ciccetti', 'aciccetti5r@angelfire.com', '968-596-50', NULL, 3, '0638512670', 0, '4S12'),
(211, 'Ellis Kitchinghan', 'ekitchinghan5s@bigcartel.com', '810-261-87', NULL, 3, '1745261907', 0, '6S11'),
(212, 'Abby Brockman', 'abrockman5t@vinaora.com', '395-367-40', NULL, 3, '9053500111', 0, '3S11'),
(213, 'Sybilla Copnar', 'scopnar5u@hc360.com', '389-765-13', NULL, 3, '5765971369', 0, '7S12'),
(214, 'Janey Larrat', 'jlarrat5v@tinyurl.com', '406-843-18', NULL, 3, '5163720929', 0, '9S11'),
(215, 'Alyda Whelpdale', 'awhelpdale5w@technorati.com', '687-413-90', NULL, 3, '6456186870', 0, '9S11'),
(216, 'Tomasine Godleman', 'tgodleman5x@jalbum.net', '994-220-09', NULL, 3, '2733952021', 0, '6S12'),
(217, 'Kile Wackley', 'kwackley5y@time.com', '810-879-51', NULL, 3, '2489759612', 0, '6S11'),
(218, 'Car Getty', 'cgetty5z@google.com.au', '502-892-43', NULL, 3, '4967283195', 0, '1S12'),
(219, 'Selinda Thorneley', 'sthorneley60@about.com', '326-700-40', NULL, 3, '8704091892', 0, '9S12'),
(220, 'Ainslie Sor', 'asor61@drupal.org', '875-223-20', NULL, 3, '6747990242', 0, '5S11'),
(221, 'Der Gandey', 'dgandey62@phoca.cz', '889-660-88', NULL, 3, '8908756604', 0, '2S12'),
(222, 'Floria Hirtzmann', 'fhirtzmann63@live.com', '485-702-95', NULL, 3, '1476601410', 0, '5S12'),
(223, 'Peterus Baggallay', 'pbaggallay64@google.es', '570-140-10', NULL, 3, '3281000037', 0, '7S11'),
(224, 'Cinnamon Wretham', 'cwretham65@hc360.com', '809-288-18', NULL, 3, '2754700048', 0, '1S11'),
(225, 'Hasty Loughton', 'hloughton66@surveymonkey.com', '233-259-22', NULL, 3, '3852223490', 0, '4S12'),
(226, 'Leona Annesley', 'lannesley67@qq.com', '744-754-27', NULL, 3, '7490964466', 0, '9S11'),
(227, 'Mildrid Trigg', 'mtrigg68@storify.com', '576-743-66', NULL, 3, '9477663190', 0, '1S12'),
(228, 'Chadd Offin', 'coffin69@hibu.com', '562-223-98', NULL, 3, '6844600941', 0, '8S12'),
(229, 'Marguerite Woolfitt', 'mwoolfitt6a@elegantthemes.com', '361-675-92', NULL, 3, '9953245649', 0, '3S11'),
(230, 'Zenia Craighall', 'zcraighall6b@elegantthemes.com', '351-245-73', NULL, 3, '9106440916', 0, '7S12'),
(231, 'Lothario Dobbings', 'ldobbings6c@istockphoto.com', '798-505-94', NULL, 3, '2534884468', 0, '6S12'),
(232, 'Darcy Wastall', 'dwastall6d@columbia.edu', '623-835-62', NULL, 3, '5532455996', 0, '9S12'),
(233, 'Bryana Allston', 'ballston6e@pcworld.com', '727-668-59', NULL, 3, '7108344041', 0, '4S12'),
(234, 'Maryrose Briamo', 'mbriamo6f@twitter.com', '715-477-03', NULL, 3, '0426976584', 0, '2S12'),
(235, 'Marianne Flowith', 'mflowith6g@dedecms.com', '291-245-70', NULL, 3, '5997477630', 0, '2S12'),
(236, 'Dorine Carryer', 'dcarryer6h@furl.net', '849-447-06', NULL, 3, '9834300816', 0, '6S11'),
(237, 'Alys Eayres', 'aeayres6i@instagram.com', '356-341-99', NULL, 3, '5324540366', 0, '6S12'),
(238, 'Michaeline Pavkovic', 'mpavkovic6j@jalbum.net', '694-407-00', NULL, 3, '9587846680', 0, '6S11'),
(239, 'Freedman Dyzart', 'fdyzart6k@yahoo.com', '372-593-83', NULL, 3, '2478199238', 0, '4S12'),
(240, 'Darren Andri', 'dandri6l@examiner.com', '706-606-96', NULL, 3, '0242603882', 0, '9S11'),
(241, 'Jacquetta Morling', 'jmorling6m@gov.uk', '434-690-71', NULL, 3, '4358854176', 0, '7S11'),
(242, 'Alonso MacHoste', 'amachoste6n@imgur.com', '288-622-25', NULL, 3, '3232679595', 0, '5S12'),
(243, 'Luca Heaselgrave', 'lheaselgrave6o@baidu.com', '361-882-16', NULL, 3, '8981553939', 0, '1S11'),
(244, 'Chanda Shrubsall', 'cshrubsall6p@issuu.com', '865-334-38', NULL, 3, '4885812372', 0, '2S11'),
(245, 'Yolande Sewall', 'ysewall6q@bluehost.com', '403-433-16', NULL, 3, '2559167891', 0, '4S11'),
(246, 'Gilburt Antonioni', 'gantonioni6r@sohu.com', '287-579-53', NULL, 3, '5470854973', 0, '5S12'),
(247, 'Carmencita Sandeson', 'csandeson6s@cbc.ca', '997-453-14', NULL, 3, '4487037158', 0, '1S11'),
(248, 'Lillis Hurren', 'lhurren6t@oaic.gov.au', '232-447-66', NULL, 3, '6670456026', 0, '2S11'),
(249, 'Wernher Borkin', 'wborkin6u@chicagotribune.com', '855-431-39', NULL, 3, '9145592276', 0, '3S12'),
(250, 'Dicky Aizlewood', 'daizlewood6v@issuu.com', '704-575-93', NULL, 3, '9440236469', 0, '7S12'),
(251, 'Dur Gildersleeve', 'dgildersleeve6w@yelp.com', '431-764-62', NULL, 3, '5955639403', 0, '6S11'),
(252, 'Torrie McDiarmid', 'tmcdiarmid6x@wordpress.org', '575-228-75', NULL, 3, '5859748787', 0, '7S11'),
(253, 'Worthington Fogt', 'wfogt6y@un.org', '380-636-52', NULL, 3, '5472956064', 0, '1S11'),
(254, 'Ginni Allen', 'gallen6z@purevolume.com', '630-439-10', NULL, 3, '6583854155', 0, '4S12'),
(255, 'Lilith Brettell', 'lbrettell70@google.fr', '309-993-92', NULL, 3, '6831732135', 0, '7S11'),
(256, 'Haskel Hallihan', 'hhallihan71@hubpages.com', '496-449-50', NULL, 3, '4132721124', 0, '4S12'),
(257, 'Mel Marchington', 'mmarchington72@unesco.org', '486-163-10', NULL, 3, '3799102299', 0, '3S12'),
(258, 'Joni Gilchrist', 'jgilchrist73@reverbnation.com', '649-186-12', NULL, 3, '9602906731', 0, '9S12'),
(259, 'Lock Kingsnod', 'lkingsnod74@columbia.edu', '751-640-16', NULL, 3, '0842703950', 0, '5S11'),
(260, 'Marlon Gittoes', 'mgittoes75@so-net.ne.jp', '822-728-28', NULL, 3, '7841441282', 0, '9S12'),
(261, 'Brier Rivelin', 'brivelin76@cornell.edu', '297-956-60', NULL, 3, '7116374027', 0, '1S12'),
(262, 'Brunhilde Frossell', 'bfrossell77@jalbum.net', '626-594-07', NULL, 3, '0890428875', 0, '6S11'),
(263, 'Pat Baumer', 'pbaumer78@salon.com', '603-614-34', NULL, 3, '3111731294', 0, '8S12'),
(264, 'Mohandis Santora', 'msantora79@issuu.com', '149-139-76', NULL, 3, '2031557378', 0, '1S11'),
(265, 'Upton Horsted', 'uhorsted7a@google.ca', '817-433-39', NULL, 3, '4340514276', 0, '3S11'),
(266, 'Dewain Brecken', 'dbrecken7b@nhs.uk', '463-410-18', NULL, 3, '1057009830', 0, '1S12'),
(267, 'Annice Pawson', 'apawson7c@go.com', '233-393-80', NULL, 3, '6041357863', 0, '1S12'),
(268, 'Jolynn Gawthorpe', 'jgawthorpe7d@elegantthemes.com', '776-466-38', NULL, 3, '3183692600', 0, '5S11'),
(269, 'Lonnard Dumbrell', 'ldumbrell7e@businessinsider.com', '963-778-86', NULL, 3, '0951219049', 0, '6S12'),
(270, 'Nikki Beevis', 'nbeevis7f@liveinternet.ru', '814-535-04', NULL, 3, '3820596313', 0, '3S11'),
(271, 'Elsie Blanch', 'eblanch7g@zdnet.com', '619-268-96', NULL, 3, '6670610106', 0, '7S12'),
(272, 'Luce Manna', 'lmanna7h@usda.gov', '131-541-07', NULL, 3, '6091066315', 0, '1S12'),
(273, 'Cathee Arnfield', 'carnfield7i@indiegogo.com', '450-308-51', NULL, 3, '1024830357', 0, '8S11'),
(274, 'Daniel Fitzhenry', 'dfitzhenry7j@freewebs.com', '796-877-64', NULL, 3, '7224948020', 0, '3S12'),
(275, 'Nan Beveredge', 'nbeveredge7k@deliciousdays.com', '961-964-35', NULL, 3, '8285189279', 0, '3S11'),
(276, 'Lida Figure', 'lfigure7l@rediff.com', '547-450-87', NULL, 3, '5693508781', 0, '2S12'),
(277, 'Aristotle Hugueville', 'ahugueville7m@sun.com', '288-816-56', NULL, 3, '9149063367', 0, '5S12'),
(278, 'Keir Croal', 'kcroal7n@psu.edu', '238-781-16', NULL, 3, '0159440130', 0, '8S12'),
(279, 'Brande Birk', 'bbirk7o@comsenz.com', '443-642-14', NULL, 3, '1944440143', 0, '1S11'),
(280, 'Tracy Bozward', 'tbozward7p@github.io', '300-845-03', NULL, 3, '2856470580', 0, '4S11'),
(281, 'Skylar Parcells', 'sparcells7q@friendfeed.com', '574-540-38', NULL, 3, '5105205219', 0, '3S11'),
(282, 'Belva O\' Dornan', 'bo7r@hp.com', '971-628-07', NULL, 3, '1487610246', 0, '7S12'),
(283, 'Terrance Casbourne', 'tcasbourne7s@moonfruit.com', '712-884-29', NULL, 3, '3971490611', 0, '6S12'),
(284, 'Ambrose Digg', 'adigg7t@npr.org', '270-793-16', NULL, 3, '3844814884', 0, '9S11'),
(285, 'Phil Vasnev', 'pvasnev7u@dmoz.org', '383-662-35', NULL, 3, '3453015665', 0, '5S11'),
(286, 'Justin Sydall', 'jsydall7v@vk.com', '128-910-40', NULL, 3, '1401625614', 0, '8S11'),
(287, 'Cob Timbrell', 'ctimbrell7w@xing.com', '164-857-54', NULL, 3, '8476517467', 0, '6S11'),
(288, 'Birgit Greenhalf', 'bgreenhalf7x@gizmodo.com', '782-868-36', NULL, 3, '9369599355', 0, '3S11'),
(289, 'Morton Powner', 'mpowner7y@etsy.com', '445-739-24', NULL, 3, '7540130148', 0, '5S12'),
(290, 'Aleda Cleft', 'acleft7z@geocities.com', '618-748-32', NULL, 3, '8722616268', 0, '6S11'),
(291, 'Carlye Lacroux', 'clacroux80@tuttocitta.it', '249-242-75', NULL, 3, '8421873741', 0, '9S11'),
(292, 'Sherye Dermot', 'sdermot81@hibu.com', '764-514-25', NULL, 3, '9287455074', 0, '2S12'),
(293, 'Sylvan Thrift', 'sthrift82@admin.ch', '828-661-29', NULL, 3, '9015013608', 0, '4S11'),
(294, 'Tobe Elsey', 'telsey83@studiopress.com', '693-809-98', NULL, 3, '5477672447', 0, '8S12'),
(295, 'Kylynn Pinxton', 'kpinxton84@berkeley.edu', '316-765-03', NULL, 3, '3062570083', 0, '3S11'),
(296, 'Bibbie Bullick', 'bbullick85@microsoft.com', '872-556-70', NULL, 3, '6929262439', 0, '5S11'),
(297, 'Hailey Mannin', 'hmannin86@google.fr', '791-141-17', NULL, 3, '1978193092', 0, '6S12'),
(298, 'Boniface Ireland', 'bireland87@phpbb.com', '144-605-10', NULL, 3, '8207870451', 0, '5S11'),
(299, 'Willie Worswick', 'wworswick88@sun.com', '436-735-70', NULL, 3, '5286668682', 0, '3S11'),
(300, 'Cayla Chettle', 'cchettle89@gmpg.org', '711-831-02', NULL, 3, '3694033769', 0, '2S11'),
(301, 'Alfonso Leeming', 'aleeming8a@jigsy.com', '534-185-42', NULL, 3, '7130036435', 0, '4S12'),
(302, 'Kat Cowe', 'kcowe8b@51.la', '847-323-40', NULL, 3, '7369644308', 0, '4S12'),
(303, 'Jorge Profe Zarza', 'jaksellzarza.profe@gmail.com', '7047765509', '$2y$10$FN/pr1nbHc2m7631O4bPF.uxNIXuxqDPbWJ2vTwtEJQJhS692aAxW', 2, '100100115', 0, 'Sin Grupo');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `group_teacher`
--
ALTER TABLE `group_teacher`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gT_enrollment` (`gT_enrollment`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`R_id`);

--
-- Indices de la tabla `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`S_Id`);

--
-- Indices de la tabla `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD PRIMARY KEY (`UP_Id`),
  ADD KEY `UP_Enrollment` (`UP_Enrollment`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`u_id`),
  ADD UNIQUE KEY `U_mail` (`U_mail`),
  ADD UNIQUE KEY `U_enrollment` (`U_enrollment`),
  ADD KEY `rolUser` (`U_role`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `group_teacher`
--
ALTER TABLE `group_teacher`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `R_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `schedule`
--
ALTER TABLE `schedule`
  MODIFY `S_Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `uploaded_files`
--
ALTER TABLE `uploaded_files`
  MODIFY `UP_Id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `u_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=304;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `group_teacher`
--
ALTER TABLE `group_teacher`
  ADD CONSTRAINT `Teacher-Group` FOREIGN KEY (`gT_enrollment`) REFERENCES `users` (`U_enrollment`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `uploaded_files`
--
ALTER TABLE `uploaded_files`
  ADD CONSTRAINT `fileUser` FOREIGN KEY (`UP_Enrollment`) REFERENCES `users` (`U_enrollment`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `rolUser` FOREIGN KEY (`U_role`) REFERENCES `roles` (`R_id`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

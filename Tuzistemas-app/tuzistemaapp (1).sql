-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-06-2024 a las 14:04:09
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
(12, '100100115', '9S12'),
(13, '100100990', '9S12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `n_Sender` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `n_Receiver` int NOT NULL,
  `n_Subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_Message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `notifications`
--

INSERT INTO `notifications` (`id`, `n_Sender`, `n_Receiver`, `n_Subject`, `n_Message`, `n_Date`) VALUES
(1, '100101076', 3, 'Prueba', 'Hola, Mundo', '2024-06-02 12:53:32'),
(2, '100101076', 3, 'Prueba 2', 
(3, '100101076', 2, 'Prueba Profe', 

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
('Todos', 0),
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
(3, 'Jorge Profe Zarza', 'jaksellzarza.profe@gmail.com', '5512345678', '$2y$10$CJlS3y1ZEVFrYIWMVdGBiO0KQCi3WmlyUNPd9aW8vwWf0WLEZFvwm', 2, '100100115', 0, 'Sin Grupo'),
(4, 'Abel Ponce Gonz�lez', 'ayakobowitz0@mediafire.com', '5557002477', '', 3, '4868405748', 0, '2S11'),
(5, 'Air�e Coronado L�pez', 'irubinfeld1@irs.gov', '5565589516', '', 3, '6784376447', 0, '8S11'),
(6, 'Alberto Ram�rez Mart�nez', 'sclue2@google.ca', '5546763312', '', 3, '3591240893', 0, '9S11'),
(7, 'Alejandra Martinez Villagrana', 'dpugsley3@live.com', '5509774834', '', 3, '7930059375', 0, '5S11'),
(8, 'Alejandro  Arreola Islas', 'lknibley4@cbslocal.com', '5590732786', '', 3, '1339873648', 0, '7S11'),
(9, 'Alejandro Jacob  Navarro Caro', 'bmccully5@addthis.com', '5502968740', '', 3, '7013953911', 0, '5S12'),
(10, 'Alfonso  Diaz Lozano', 'obalcon6@booking.com', '5575429813', '', 3, '507113594', 0, '7S12'),
(11, 'Alicia De La Torre Guerrero', 'gbehnen7@gizmodo.com', '5519797756', '', 3, '4214459210', 0, '7S11'),
(12, 'Alma Delia Resendiz Garc�a', 'crhymes8@netlog.com', '5545351323', '', 3, '1962824225', 0, '3S11'),
(13, 'Alma Selene Neri Lopez', 'redgington9@technorati.com', '5569985133', '', 3, '4535168709', 0, '4S11'),
(14, 'Alma Ver�nica P�rez Carrillo', 'esizeya@constantcontact.com', '5535176686', '', 3, '5095405490', 0, '5S11'),
(15, 'Andres  Larios Eusebio', 'htownbyb@yolasite.com', '5502652445', '', 3, '9115330591', 0, '1S12'),
(16, 'Angelica Pineda Rodriguez', 'cwindlessc@php.net', '5520554844', '', 3, '6497189513', 0, '1S12'),
(17, 'Anibal Enrique Qui�onez Abarca', 'dfaulkesd@google.co.uk', '5579885440', '', 3, '5748593106', 0, '7S11'),
(18, 'Antonio Alan Manzano Delgado', 'fklimese@soup.io', '5575485625', '', 3, '4800395186', 0, '5S12'),
(19, 'Antonio Emmanuel Hinojoza Astorga', 'mcleavelandf@cornell.edu', '5546274192', '', 3, '2174351943', 0, '7S11'),
(20, 'Apolonio Ahumada Gonzalez', 'dlabang@blogs.com', '5546248876', '', 3, '4992863191', 0, '5S12'),
(21, 'Araceli Mart�nez Ramos', 'abootyh@fema.gov', '5546223561', '', 3, '9561832348', 0, '6S11'),
(22, 'Ariana Lucrecia  Davila Figueroa', 'ktolliti@nymag.com', '5546198246', '', 3, '4116951749', 0, '5S11'),
(23, 'Arnaldo Urbina Soto', 'hnysj@webnode.com', '5546172930', '', 3, '5905458766', 0, '5S12'),
(24, 'Arturo Gonz�lez Garc�a', 'redgerlyk@imgur.com', '5546147615', '', 3, '8837582781', 0, '9S11'),
(25, 'Arturo Coronado Haro', 'llutonl@addtoany.com', '5546122299', '', 3, '4390032402', 0, '5S11'),
(26, 'Ary Josu�  Ru�z Alcaraz', 'mpechem@illinois.edu', '5546096984', '', 3, '1001832094', 0, '9S12'),
(27, 'Avelina Martinez Juarez', 'gdimberlinen@qq.com', '5546071668', '', 3, '5850070737', 0, '3S12'),
(28, 'Bernardo Moreno Orozco Y Loza', 'amanzo@shop-pro.jp', '5546046353', '', 3, '5019194727', 0, '5S11'),
(29, 'Bertha Guadalupe Casillas Cardenas', 'mdummettp@lulu.com', '5546021038', '', 3, '8077916937', 0, '3S11'),
(30, 'Blanca Estela Valdez Granado', 'htornsq@mtv.com', '5545995722', '', 3, '9126666596', 0, '3S12'),
(31, 'Blanca Luz  Aguilar Montes', 'alagor@dell.com', '5545970407', '', 3, '5115059150', 0, '8S12'),
(32, 'Blanca Susana  Aguillar Villacis', 'rsussanss@wired.com', '5545945091', '', 3, '5273749050', 0, '1S11'),
(33, 'Carlos  Varela Ubal', 'tdeet@plala.or.jp', '5545919776', '', 3, '8518840333', 0, '2S11'),
(34, 'Carlos Alberto Renteria Rivera', 'nbonsulu@nifty.com', '5545894460', '', 3, '3021012760', 0, '5S12'),
(35, 'Carlos Armando  Peralta J�uregui', 'wlorencev@hhs.gov', '5545869145', '', 3, '5618651548', 0, '2S12'),
(36, 'Carlos Enrique  Llamas Gonzalez', 'blangelayw@drupal.org', '5545843830', '', 3, '765993783', 0, '3S12'),
(37, 'Carlos Felipe  Guti�rrez Estrada', 'gtuckwellx@hibu.com', '5545818514', '', 3, '5818006735', 0, '5S11'),
(38, 'Carmen Lerma Lopez', 'cbiddlestony@fema.gov', '5545793199', '', 3, '5598525380', 0, '2S11'),
(39, 'Carmen Alicia Gonz�lez Mart�nez', 'akemerz@ebay.com', '5545767883', '', 3, '754669807', 0, '7S11'),
(40, 'Catalina Espadas', 'rdreye10@webeden.co.uk', '5545742568', '', 3, '4179718170', 0, '6S11'),
(41, 'Cesar Alejandro  Gutierrez Mora', 'gtroke11@cornell.edu', '5545717252', '', 3, '1390015181', 0, '7S12'),
(42, 'C�sar Aurelio  Maga�a Trujillo', 'thendriksen12@ask.com', '5545691937', '', 3, '4050655667', 0, '7S11'),
(43, 'Christian Hinojosa Ayala', 'kpregal13@walmart.com', '5545666622', '', 3, '5666206109', 0, '3S11'),
(44, 'Christian Pabel Mu�oz L�pez', 'nchesney14@privacy.gov.au', '5545641306', '', 3, '2462339310', 0, '9S12'),
(45, 'Claudia  Diaz Gayou', 'kmartusewicz15@vimeo.com', '5545615991', '', 3, '348416296', 0, '2S12'),
(46, 'Clemente Lomeli Flores', 'cfroude16@slate.com', '5545590675', '', 3, '8012497735', 0, '6S12'),
(47, 'Constantino Salinas Arce', 'hlorrain17@loc.gov', '5545565360', '', 3, '711786488', 0, '5S12'),
(48, 'Cristino Ramirez Flores', 'bduplain18@cbsnews.com', '5545540044', '', 3, '7952970356', 0, '1S11'),
(49, 'Cristobal Evaristo Torres Duran', 'bgoldster19@bloglines.com', '5545514729', '', 3, '2089734876', 0, '6S12'),
(50, 'Cristopher De Alba Anguiano', 'cvowels1a@dedecms.com', '5545489414', '', 3, '8141008285', 0, '7S12'),
(51, 'Cynthia Patricia Cantero Pacheco', 'gpittock1b@cyberchimps.com', '5545464098', '', 3, '367809001', 0, '2S11'),
(52, 'Damaris Yanai  Castorena Ram�rez', 'gabrahamson1c@google.com', '5545438783', '', 3, '1832371905', 0, '1S11'),
(53, 'Daniela Aurora L�pez Briones', 'emonketon1d@over-blog.com', '5545413467', '', 3, '1778067689', 0, '5S12'),
(54, 'David Ibarra C�rdenas', 'rshadwick1e@mashable.com', '5545388152', '', 3, '5190479021', 0, '7S11'),
(55, 'Deise Martins', 'mmegainey1f@mysql.com', '5545362836', '', 3, '6531493623', 0, '7S12'),
(56, 'Denisse  Corona Garc�a', 'rvenard1g@livejournal.com', '5545337521', '', 3, '8921489134', 0, '1S11'),
(57, 'Dialhery D�az', 'ctock1h@dropbox.com', '5545312206', '', 3, '355087855', 0, '4S11'),
(58, 'Diana Patricia Vidal Garc�a', 'zziems1i@virginia.edu', '5545286890', '', 3, '4151745432', 0, '1S11'),
(59, 'Diego Escobar Gonz�lez', 'cstarmont1j@nyu.edu', '5545261575', '', 3, '723617740', 0, '3S12'),
(60, 'Dulce Carolina Garay  Aguirre', 'erupel1k@spiegel.de', '5545236259', '', 3, '7029569210', 0, '3S11'),
(61, 'Edgar Guerrero Centeno', 'aadkins1l@cbsnews.com', '5545210944', '', 3, '9529883943', 0, '2S11'),
(62, 'Edgar Hilario Pe�a Aceves', 'fatterbury1m@technorati.com', '5545185628', '', 3, '5361222704', 0, '6S11'),
(63, 'Edith  Luque Hernandez', 'lbetho1n@com.com', '5545160313', '', 3, '8496592359', 0, '2S12'),
(64, 'Eduardo Bohorquez', 'adriussi1o@unc.edu', '5545134998', '', 3, '9836714200', 0, '9S12'),
(65, 'Elva Graciela Almanza Rodriguez', 'pjochen1p@examiner.com', '5545109682', '', 3, '2371110019', 0, '3S12'),
(66, 'Emeterio Mu�iz Estrada', 'mdenizet1q@independent.co.uk', '5545084367', '', 3, '1125121645', 0, '1S12'),
(67, 'Eric Ricardo Gallo Flores', 'cewells1r@csmonitor.com', '5545059051', '', 3, '3485487929', 0, '7S11'),
(68, 'Miguel Angel Montoya Martin Del Campo', 'lstandering1s@nhs.uk', '5545033736', '', 3, '12882607', 0, '6S11'),
(69, 'Miguel Angel Mendoza Benitez', 'nhatchett1t@artisteer.com', '5545008420', '', 3, '2252204273', 0, '8S12'),
(70, 'Miguel Angel Mendoza Benitez', 'bbelf1u@goodreads.com', '5544983105', '', 3, '3542888176', 0, '2S12'),
(71, 'Mike Mora', 'eagdahl1v@ow.ly', '5544957790', '', 3, '378516825', 0, '4S11'),
(72, 'Milagros Freyre', 'gerrichelli1w@gizmodo.com', '5544932474', '', 3, '4279622825', 0, '5S11'),
(73, 'Miriam Teresita  Rivas Mu�oz', 'gswedeland1x@networksolutions.com', '5544907159', '', 3, '8763277522', 0, '6S12'),
(74, 'Miriam Teresita  Rivas Mu�oz', 'astovold1y@usnews.com', '5544881843', '', 3, '8068659951', 0, '6S11'),
(75, 'Mirza Flores Gomez', 'bbuard1z@moonfruit.com', '5544856528', '', 3, '2230525808', 0, '8S12'),
(76, 'M�nica Sagrario Reyes Alcal�', 'fgrzegorek20@google.it', '5544831212', '', 3, '1701904799', 0, '5S11'),
(77, 'Nahum Antonio Ramirez Bernal', 'smiddler21@moonfruit.com', '5544805897', '', 3, '117826421', 0, '1S11'),
(78, 'Neftali  Jimenez Ramirez', 'ssmye22@arstechnica.com', '5544780582', '', 3, '3261033282', 0, '7S11'),
(79, 'Neftali Lizzette Haro V�zquez', 'aruilton23@usgs.gov', '5544755266', '', 3, '4266163835', 0, '6S12'),
(80, 'Nelida Ochoa Lopez', 'jocorrane24@myspace.com', '5544729951', '', 3, '7575730354', 0, '1S11'),
(81, 'Noe Toscano Rodr�guez', 'ade25@reverbnation.com', '5544704635', '', 3, '9984318117', 0, '6S11'),
(82, 'Noe Garcia Alvarez', 'amance26@china.com.cn', '5544679320', '', 3, '2102810836', 0, '6S11'),
(83, 'Noe Zamorano Lara', 'kcorps27@addthis.com', '5544654004', '', 3, '7436736396', 0, '7S12'),
(84, 'Noel Garcia Rodriguez', 'aadam28@eventbrite.com', '5544628689', '', 3, '2341292720', 0, '1S11'),
(85, 'Norberto Emigdio Bernabe Ceja', 'mshafe29@diigo.com', '5544603374', '', 3, '7067043158', 0, '3S12'),
(86, 'Norma Patricia Moncada Villanueva', 'sgionettitti2a@woothemes.com', '5544578058', '', 3, '5959651599', 0, '9S12'),
(87, 'Omar Enrique  Cervantes Rivera', 'bwhittleton2b@umich.edu', '5544552743', '', 3, '6765310185', 0, '1S12'),
(88, 'Oscar Cerrillo Cruz', 'nrobins2c@microsoft.com', '5544527427', '', 3, '4228236146', 0, '5S12'),
(89, 'Oscar Michel Esparza', 'mlinden2d@youtu.be', '5544502112', '', 3, '1428910174', 0, '6S12'),
(90, 'Oscar Gasca Brito', 'npogson2e@imageshack.us', '5544476796', '', 3, '7734000045', 0, '8S12'),
(91, '�scar Ram�rez Lomel�', 'grait2f@prlog.org', '5544451481', '', 3, '1887556524', 0, '5S11'),
(92, 'Oscar Luis Hurtado Vergara', 'bsphinxe2g@blog.com', '5544426166', '', 3, '4314696788', 0, '3S12'),
(93, 'Otoniel Varas De Valdez Gonz�lez', 'tfratczak2h@globo.com', '5544400850', '', 3, '780030834', 0, '1S11'),
(94, 'Pablo Guzman Torres', 'jhaddleton2i@hostgator.com', '5544375535', '', 3, '1885715854', 0, '6S12'),
(95, 'Pablo Javier  Saenz Core', 'jallix2j@ucla.edu', '5544350219', '', 3, '8582435509', 0, '6S12'),
(96, 'Pablo Jes�s Salinas Osornio', 'rbeasley2k@mapquest.com', '5544324904', '', 3, '3517770906', 0, '5S11'),
(97, 'Patricia Moreno', 'askae2l@360.cn', '5544299588', '', 3, '967021995', 0, '5S12'),
(98, 'Paulo Roberto  Ziulkoski', 'dmaddick2m@arstechnica.com', '5544274273', '', 3, '8835836255', 0, '7S12'),
(99, 'Pedro S�nchez. Orozco', 'rphythian2n@simplemachines.org', '5544248958', '', 3, '6530369503', 0, '7S12'),
(100, 'Pilar  Conesa Santamaria', 'enuemann2o@google.co.uk', '5544223642', '', 3, '8735500506', 0, '8S11'),
(101, 'Ram�n Cama�o Vargas', 'afontanet2p@hubpages.com', '5544198327', '', 3, '2536080560', 0, '3S12'),
(102, 'Ramon Daniel Martinez Cuevas', 'avalett2q@usatoday.com', '5544173011', '', 3, '7391809268', 0, '1S12'),
(103, 'Raul Garcia Carmona', 'gmcniff2r@msu.edu', '5544147696', '', 3, '5473148344', 0, '9S12'),
(104, 'Ricardo Osorio Jim�nez', 'enares2s@theatlantic.com', '5544122380', '', 3, '6462812982', 0, '4S12'),
(105, 'Ricardo Flores Alvarez', 'mdietz2t@dedecms.com', '5544097065', '', 3, '3540275975', 0, '1S11'),
(106, 'Ricardo Guadalupe Alcal� Nava', 'dastell2u@ask.com', '5544071750', '', 3, '8758929991', 0, '2S12'),
(107, 'Ricardo Gustavo Mardones Hettich', 'npelos2v@bravesites.com', '5544046434', '', 3, '1893001865', 0, '2S12'),
(108, 'Rigoberto Silva Robles', 'cglenwright2w@businessweek.com', '5544021119', '', 3, '6243955869', 0, '8S11'),
(109, 'Roberto Orozco G�lvez', 'bcomoletti2x@cpanel.net', '5543995803', '', 3, '4750612588', 0, '6S12'),
(110, 'Roberto I�iguez Aguilar', 'cwelldrake2y@mediafire.com', '5543970488', '', 3, '1385047003', 0, '3S12'),
(111, 'Jorge Octavio  Martinez Reynoso', 'tskentelbery2z@nsw.gov.au', '5543945172', '', 3, '9029447346', 0, '5S11'),
(112, 'Jose Cortes', 'zweddup30@yandex.ru', '5543919857', '', 3, '8013738744', 0, '2S12'),
(113, 'Jose  Jurado', 'bmeere31@nasa.gov', '5543894542', '', 3, '9712268608', 0, '1S12'),
(114, 'Jose Alberto  Bravo Saldivar', 'ghockey32@army.mil', '5543869226', '', 3, '2134895888', 0, '4S11'),
(115, 'Jos� Alejandro Mata Estrada', 'bcauston33@cdbaby.com', '5543843911', '', 3, '6261493669', 0, '9S11'),
(116, 'Jose Daniel  Ochoa Casillas', 'adeeney34@sciencedaily.com', '5543818595', '', 3, '572564848', 0, '4S11'),
(117, 'Jose De Jesus Salazar Hdez', 'bhaseley35@smugmug.com', '5543793280', '', 3, '2742012176', 0, '5S12'),
(118, 'Jos� De Jes�s Macias Morales', 'ateresi36@upenn.edu', '5543767964', '', 3, '9552607787', 0, '4S11'),
(119, 'Jos� Eduardo Mej�a Soto', 'jmazzia37@globo.com', '5543742649', '', 3, '5428131470', 0, '5S11'),
(120, 'Jose Felix Ahumada Gonzalez', 'nmontgomery38@amazon.co.uk', '5543717334', '', 3, '4032281254', 0, '2S12'),
(121, 'Jose Gilberto Cortes', 'mwilderspoon39@dailymotion.com', '5543692018', '', 3, '3750292523', 0, '2S12'),
(122, 'Jos� Guadalupe L�pez Almejo', 'cashtonhurst3a@github.io', '5543666703', '', 3, '4047121746', 0, '5S11'),
(123, 'Jos� Guadalupe Rocha Esparza', 'agrayling3b@facebook.com', '5543641387', '', 3, '6769564963', 0, '1S11'),
(124, 'Jos� Humberto Ram�rez Flores', 'sreuter3c@columbia.edu', '5543616072', '', 3, '7138096070', 0, '2S11'),
(125, 'Jos� Luis   I�iguez G�mez', 'ecutts3d@msu.edu', '5543590756', '', 3, '8846844521', 0, '8S12'),
(126, 'Jose Ma Luna Arellano', 'sdyhouse3e@msu.edu', '5543565441', '', 3, '4088889991', 0, '9S11'),
(127, 'Jos� Manuel Flores Curiel', 'arosling3f@theatlantic.com', '5543540126', '', 3, '7283653295', 0, '1S12'),
(128, 'Jose Rodrigo Sotelo Islas', 'syesson3g@bbb.org', '5543514810', '', 3, '271910623', 0, '3S12'),
(129, 'Jose Ventura Jose Ventura', 'snorvill3h@elegantthemes.com', '5543489495', '', 3, '2548532003', 0, '3S11'),
(130, 'Josue Lomeli Rodriguez', 'bskittreal3i@stumbleupon.com', '5543464179', '', 3, '9597811340', 0, '7S12'),
(131, 'Juan Carlos V�zquez Cabello', 'dzimmermeister3j@ebay.com', '5543438864', '', 3, '961919809', 0, '1S11'),
(132, 'Juan Carlos Campos Herrera', 'gbagnal3k@yellowbook.com', '5543413548', '', 3, '570078814', 0, '3S11'),
(133, 'Juan Carlos Espinosa Larracoechea', 'jrutland3l@rakuten.co.jp', '5543388233', '', 3, '9385196316', 0, '7S12'),
(134, 'Juan Carlos  Le�n Rodas', 'aedgeon3m@linkedin.com', '5543362918', '', 3, '5191683986', 0, '8S12'),
(135, 'Juan De Dios Lopez Alvarado', 'ddunniom3n@elegantthemes.com', '5543337602', '', 3, '1916185568', 0, '7S12'),
(136, 'Juan Diego Ramos Uriarte', 'fbysh3o@deviantart.com', '5543312287', '', 3, '3759593070', 0, '6S11'),
(137, 'Juan Guadalupe Aceves Delgado', 'grummin3p@linkedin.com', '5543286971', '', 3, '6474482990', 0, '8S11'),
(138, 'Juan Ignacio Hermosillo Covarrubias', 'ldomm3q@wikia.com', '5543261656', '', 3, '2585314383', 0, '2S12'),
(139, 'Juan Jesus Rodriguez Soria', 'hrounsefell3r@opensource.org', '5543236340', '', 3, '3059107726', 0, '2S11'),
(140, 'Juan Jose Navarro Pati�o', 'rlinskey3s@biglobe.ne.jp', '5543211025', '', 3, '5839603716', 0, '9S12'),
(141, 'Juan Jose Gutierrez Contreras', 'lbladon3t@csmonitor.com', '5543185710', '', 3, '6497811826', 0, '8S11'),
(142, 'Juan Ram�n T�llez Nu�o', 'bculverhouse3u@vinaora.com', '5543160394', '', 3, '7765152289', 0, '6S11'),
(143, 'Juli�n  Najles', 'wginsie3v@1688.com', '5543135079', '', 3, '8063722078', 0, '1S11'),
(144, 'Javier Herrera Ladr�n De Guevara', 'vkelly3w@mit.edu', '5543109763', '', 3, '9073845793', 0, '5S12'),
(145, 'Javier Hurtado', 'gmagnus3x@cdc.gov', '5543084448', '', 3, '3138084370', 0, '7S11'),
(146, 'Javier Perez Torres', 'tmcquaker3y@xing.com', '5543059132', '', 3, '7815292607', 0, '1S12'),
(147, 'Javier Jim�nez Esquivel', 'ntenby3z@plala.or.jp', '5543033817', '', 3, '1938518004', 0, '1S11'),
(148, 'Jesus Salas Lizaur', 'jglendining40@oracle.com', '5543008502', '', 3, '7835281104', 0, '7S12'),
(149, 'Jesus Angel Govea Loredo', 'cpere41@etsy.com', '5542983186', '', 3, '7232962584', 0, '2S11'),
(150, 'Jesus Elihu  Sanchez Carre�o', 'dmalt42@unicef.org', '5542957871', '', 3, '3374821561', 0, '6S11'),
(151, 'Jes�s Fernando Ortiz Zepeda', 'mscaplehorn43@bizjournals.com', '5542932555', '', 3, '7529400908', 0, '2S12'),
(152, 'Jhonny Cesar Vargas Hernandez', 'bwoodage44@slideshare.net', '5542907240', '', 3, '8841056940', 0, '1S11'),
(153, 'Jonas Donizette', 'ncharlesworth45@wordpress.com', '5542881924', '', 3, '3400343250', 0, '6S11'),
(154, 'Jorge Gutierrez Reynaga', 'gfrondt46@google.co.jp', '5542856609', '', 3, '3116746095', 0, '6S11'),
(155, 'Jorge  P�rez Rubio', 'etatton47@slashdot.org', '5542831294', '', 3, '3053035391', 0, '6S12'),
(156, 'Jorge Alberto Vazquez Abundis', 'awanden48@ocn.ne.jp', '5542805978', '', 3, '9737164407', 0, '9S12'),
(157, 'Jorge Elias  Hernandez Ledon', 'kwarlawe49@oakley.com', '5542780663', '', 3, '3683697202', 0, '7S11'),
(158, 'Jorge Fernando  Martinez Vasquez', 'omilsom4a@furl.net', '5542755347', '', 3, '104988495', 0, '9S11'),
(159, 'Jorge Gregorio Casillas Garc�a', 'fraoul4b@barnesandnoble.com', '5542730032', '', 3, '9434747783', 0, '5S12'),
(160, 'Jorge Luis Cuevas Miguel', 'vishchenko4c@behance.net', '5542704716', '', 3, '8322894201', 0, '2S12'),
(161, 'Jorge Luis Perez Trejo', 'rdel4d@phpbb.com', '5542679401', '', 3, '4736586893', 0, '7S12'),
(162, 'Jorge Luis  Saldivar Plascencia', 'cmomford4e@eventbrite.com', '5542654086', '', 3, '2994480808', 0, '8S11'),
(319, 'Jorge Jaksell Zarza Jefe', 'jaksellzarza.jefe@gmail.com', '5538495677', '$2y$10$lE66MPztaiUHqy5sqVaMDeFGkLrRCEw4aheFS8Drf.fHa.THIJ./S', 1, '100101076', 0, 'Sin Grupo'),
(320, 'Angelica Pineda Rodriguez', 'hwanek0@npr.org', '5562767045', NULL, 2, '100100990', 0, 'Sin Grupo'),
(321, 'Juan Cruz', 'ttaylour1@livejournal.com', '5530180140', NULL, 2, '100100056', 0, 'Sin Grupo'),
(322, 'Arturo Coronado Haro', 'nvallender2@patch.com', '5533303496', NULL, 2, '100100416', 0, 'Sin Grupo'),
(323, 'Gabriela Castro', 'wlindenbaum3@wikispaces.com', '5584901139', NULL, 2, '100100911', 0, 'Sin Grupo'),
(324, 'Carlos  Varela Ubal', 'hyushankin4@sina.com.cn', '5516351976', NULL, 2, '100100334', 0, 'Sin Grupo'),
(325, 'Valeria Martinez', 'shaseley5@reuters.com', '5523533268', NULL, 2, '100100301', 0, 'Sin Grupo'),
(326, 'Maria Torres', 'ajosskowitz6@eepurl.com', '5528828785', NULL, 2, '100100409', 0, 'Sin Grupo'),
(327, 'Denisse  Corona García', 'clongland7@usnews.com', '5588344360', NULL, 2, '100100680', 0, 'Sin Grupo'),
(328, 'Cristopher De Alba Anguiano', 'cyerby8@berkeley.edu', '5547228492', NULL, 2, '100100657', 0, 'Sin Grupo'),
(329, 'Isabel Garcia', 'cbasset9@yelp.com', '5579399374', NULL, 2, '100100199', 0, 'Sin Grupo'),
(330, 'Carlos Gonzalez', 'ggumbya@sphinn.com', '5558597332', NULL, 2, '100100144', 0, 'Sin Grupo'),
(331, 'Emeterio Muñiz Estrada', 'vkordovanib@loc.gov', '5520762533', NULL, 2, '100100245', 0, 'Sin Grupo'),
(332, 'Ariana Lucrecia  Davila Figueroa', 'dnelsonc@rediff.com', '5510272678', NULL, 2, '100100082', 0, 'Sin Grupo'),
(333, 'Ricardo Sanchez', 'cfidgind@elpais.com', '5575489049', NULL, 2, '100100602', 0, 'Sin Grupo'),
(334, 'Alejandro Hernandez', 'gbrenstuhle@behance.net', '5544232437', NULL, 2, '100100027', 0, 'Sin Grupo');

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
-- Indices de la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `n_Sender` (`n_Sender`);

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `R_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `u_id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=335;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `group_teacher`
--
ALTER TABLE `group_teacher`
  ADD CONSTRAINT `Teacher-Group` FOREIGN KEY (`gT_enrollment`) REFERENCES `users` (`U_enrollment`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notificationUser` FOREIGN KEY (`n_Sender`) REFERENCES `users` (`U_enrollment`) ON DELETE SET NULL ON UPDATE CASCADE;

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

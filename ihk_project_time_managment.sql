-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 04. Dez 2019 um 11:50
-- Server-Version: 10.1.37-MariaDB
-- PHP-Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `ihk_project_time_managment`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `firm_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `project_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `start` int(11) DEFAULT NULL,
  `deadline` int(11) DEFAULT NULL,
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `eur_pro_hour` decimal(15,2) NOT NULL DEFAULT '0.00',
  `eur_pro_project` decimal(15,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `projects`
--

INSERT INTO `projects` (`id`, `firm_name`, `project_name`, `start`, `deadline`, `description`, `eur_pro_hour`, `eur_pro_project`) VALUES
(1, 'sillyCon', 'usos', NULL, NULL, NULL, '0.00', '0.00'),
(2, 'BitTreff', 'milbit', NULL, NULL, NULL, '0.00', '0.00'),
(3, 'Tramble', 'chokowaves', NULL, NULL, NULL, '0.00', '0.00'),
(4, 'Colosium', 'website', NULL, NULL, NULL, '0.00', '0.00'),
(5, 'newOrd', 'interaktive_booklet', NULL, NULL, NULL, '0.00', '0.00'),
(6, 'mildort', 'map', 1557093600, 1593813600, '', '30.00', '0.00'),
(7, 'lotto', 'tatoo', NULL, NULL, 'control of the system', '45.00', '73000.00'),
(8, 'trunko', 'blinder', NULL, NULL, 'analyse of data', '73.00', '150000.00'),
(12, 'puque', 'madris', 1556661600, 1593813600, 'new styling', '73.00', '500000.00'),
(13, 'marken', 'lae', 1559340000, 0, 'code', '53.00', '0.00'),
(15, 'lordi', 'mordi', 1559340000, 1593813600, 'code', '57.00', '0.00'),
(16, 'klaas bach', 'spycar', 1559340000, 1569880800, 'build solution', '87.03', '0.00'),
(18, 's', 'd', 1562277600, 1593813600, 'dsf', '45.00', '789.00'),
(19, 'dg', 'dh', 1562277600, 1593813600, 'hfgg', '45.00', '790000.00'),
(20, 'dring', 'sling', 1562277600, 1567548000, 'sling a dring', '76.00', '140000.00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `date` int(11) NOT NULL,
  `check_out` int(11) DEFAULT NULL,
  `pause` int(11) DEFAULT NULL,
  `project_name` varchar(120) COLLATE utf8_bin DEFAULT NULL,
  `notation` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `work_conditions` varchar(50) COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `reports`
--

INSERT INTO `reports` (`id`, `date`, `check_out`, `pause`, `project_name`, `notation`, `work_conditions`) VALUES
(169, 1557214500, 1560239100, 300, 'mildort', 'test click checkout_btn in 9.45', ''),
(172, 1557215460, 1560243120, 0, 'mildort', 'fzdiv', 'field-work'),
(173, 1557214440, 1560264240, 0, '', '', ''),
(194, 1557721740, 1557732540, 1440, 'newOrd', 'trololo bindro', 'field-work'),
(207, 1557747960, 1560285960, 900, '', 'edit', ''),
(208, 1557715560, 1559907960, 8220, '', 'hhklu', ''),
(216, 1557724320, 1557749520, 0, 'sillyCon', 'klappt', 'field-work'),
(218, 1557753900, 1560284700, 1080, 'Tramble', 'edited', ''),
(219, 1557753900, 1560263100, 0, 'Tramble', 'fdasfgasfdfasdfasdfdsadfs', ''),
(220, 1557753960, 1560270360, 0, '', 'kukuer\r\nedit', ''),
(221, 1557734760, 1557756360, 600, 'BitTreff', 'da', 'office'),
(222, 1557717900, 1557757560, 0, 'Tramble', '', 'home-office'),
(230, 1557917880, 1557929220, 3600, 'BitTreff', 'vxcv', 'office'),
(231, 1557885600, 1557928800, 8400, 'Colosium', 'pause 2:20', 'office'),
(233, 1558002600, 1558002600, 0, '', 'proof the user_reports table, acc_id: 2 rep_id: 233. <b>proved</b> ohoh', ''),
(234, 1557997860, 1558005060, 600, 'Tramble', 'vbvcv', 'office'),
(238, 1558007520, 1558007520, 0, '', 'sad', ''),
(239, 1558007880, 1558007880, 0, '', '', ''),
(240, 1558007940, 1558007940, 0, 'BitTreff', 'trytry', ''),
(241, 1558007940, 1558007940, 0, '', 'trytry', ''),
(242, 1558008000, 1558008000, 0, '', 'trytry 239', ''),
(243, 1557991260, 1558009260, 0, 'newOrd', 'klio prooof', 'home-office'),
(244, 1559023500, 1559891100, 1080, 'BitTreff', 'rytrty', 'office'),
(245, 1559112780, 1559148780, 11640, 'Tramble', 'day_overall test', 'office'),
(246, 1559112000, 1559119200, 1020, 'mildort', 'overall funktionizing correct', 'field-work'),
(247, 1559112060, 1559119260, 1920, 'Colosium', 'gmdate test', 'office'),
(248, 1559268000, 1560247200, 420, 'mildort', 'bulb bulb', 'home-office'),
(249, 1559552760, 1560261960, 240, 'Colosium', 'was edited', 'home-office'),
(250, 1559459160, 1560261960, 2820, 'sillyCon', 'pioj', 'field-work'),
(251, 1559538420, 1560244020, 60, 'Tramble', 'u7si', 'field-work'),
(253, 1560053700, 1560093300, 540, 'Tramble', ' kkxcyk', 'office'),
(254, 1559892120, 1559917320, 600, 'Tramble', 'uihoux', 'office'),
(255, 1559702880, 1560240000, 660, 'Tramble', '4. ->5. edit!', 'home-office'),
(256, 1559626680, 1560263880, 1920, 'newOrd', 'wrehd c', 'office'),
(257, 1559721600, 1560340800, 960, 'Tramble', 'tram-bon', 'home-office'),
(258, 1559805060, 1560273060, 780, 'newOrd', '13 minutes for a rest', 'office'),
(259, 1546751820, 1560237420, 420, 'BitTreff', 'some entry', 'office'),
(260, 1559787480, 1560237480, 1140, 'Tramble', 'earlier that day', 'field-work'),
(261, 1559879820, 1560239820, 1320, 'mildort', 'some entry for 7.6 from 6.6', 'home-office'),
(262, 1554097560, 1560268020, 360, 'sillyCon', 'first day of april', 'home-office'),
(263, 1547197200, 1560268800, 900, 'BitTreff', 'cr 11.06', 'home-office'),
(264, 1549861200, 1560240060, 3600, 'sillyCon', 'cr 11.06', 'office'),
(265, 1557561780, 1560258480, 2040, '', 'does not react on project name', 'home-office'),
(266, 1549260600, 1560240600, 720, 'Tramble', 'cr 11.06', 'field-work'),
(268, 1557562920, 1560270120, 0, '', 'ferade angelegt', 'field-work'),
(273, 1560149460, 1560160260, 0, 'Tramble', 'im mÃ¤rz aufgemacht', 'office'),
(274, 1560228480, 1560257280, 1260, 'Tramble', '', 'home-office'),
(275, 1560430200, 1560271800, 3600, 'BitTreff', 'dr', 'office'),
(276, 1560257760, 1560257760, 0, '', 'null minutes on work', ''),
(277, 1560257940, 1560258060, 0, '', '2 min', ''),
(278, 1554003720, 1560260520, 300, 'Tramble', 'last day of march', 'home-office'),
(279, 1552280700, 1560261900, 3600, 'Tramble', 'e', 'office'),
(282, 1560322380, 1560343980, 0, 'Tramble', 'entry 14.53', 'field-work'),
(283, 1561356120, 1561364580, 360, 'Tramble', 'tralalo', 'office'),
(284, 1561240800, 1561364580, 960, 'BitTreff', 'passed day w.o entry', 'field-work'),
(285, 1561442400, 1561464120, 600, 'Tramble', 'nmv', 'office'),
(286, 1561528800, 1561551840, 1440, '', '', ''),
(287, 0, 0, 0, '', '', ''),
(288, 1561615200, 1561732380, 0, '', 'that day of creation', 'home-office'),
(289, 1562034000, 1562052000, 780, '', 'moin!', 'office'),
(290, 1562137320, 1562166120, 0, 'milbit', 'problem solved ', 'office'),
(291, 1562306280, 1562338680, 1860, 'madris', 'longwaybord', 'study'),
(292, 1562654040, 1562693640, 2700, 'madris', 'make me happy', 'office'),
(293, 1562740440, 1562769240, 0, 'interaktive_booklet', 'nata tan', 'home-office'),
(294, 1562823600, 1562848800, 3600, 'blinder', '', 'office'),
(295, 1562911800, 1562940600, 2460, 'tatoo', 'right on the right leg', 'study'),
(296, 1563180000, 1563205200, 3600, 'chokowaves', 'fasgag', 'office'),
(297, 1563263520, 1563295920, 2820, 'mordi', 'lordi', 'field-work'),
(298, 1563346260, 1563375060, 3120, 'mordi', 'kodi', 'study'),
(299, 1563335700, 1563346500, 0, 'website', '<b> cloud</b>', 'home-office'),
(300, 1563516000, 1563811500, 4140, 'blinder', 'darm', 'office'),
(301, 1563779100, 1563826200, 0, 'chokowaves', 'dre', 'home-office'),
(302, 1563826200, 1563783240, 0, 'interaktive_booklet', 'from drom', 'Home-office'),
(303, 1563779220, 1563811620, 0, 'website', 'row_e ', 'office'),
(304, 1563769080, 1563787080, 0, 'website', '5nizza', 'office'),
(305, 1563787080, 1563789000, 0, '', '; SELECT * FROM users', ''),
(310, 1564380000, 1564400460, 0, 'website', 'new one after 3 deletes', 'BÃ¼ro'),
(311, 1568092020, 1568131620, 2760, 'lae', 'heute ist sonnig', 'Home-office'),
(312, 1567836000, 1567857240, 2880, 'tatoo', 'muss drei tage lang sein', 'Beim Kunden'),
(313, 1572322740, 1572358740, 3600, 'tatoo', 'hi!!!', 'BÃ¼ro'),
(314, 1572853800, 1572879000, 0, 'madris', 'heute ich arbeite an teil b', 'BÃ¼ro');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `forename` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'muster',
  `surname` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT 'mustermann',
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(250) COLLATE utf8_bin NOT NULL DEFAULT 'pssw',
  `email` varchar(70) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `users`
--

INSERT INTO `users` (`id`, `forename`, `surname`, `username`, `password`, `email`) VALUES
(1, 'tester', 'testmann', 'tester', 'tes', 'test@g.nu'),
(2, 'udo', 'erster', 'u1', 'u1', 'udo@er.du'),
(3, 'anta', 'tare', 'anat', 'anat', 'anat@ewm.bg'),
(4, 'mert', 'cortois', 'merc', 'merc', 'merc@uri.uli'),
(5, 'egon', 'terry', 'emet', 'emet', 'emet@emet.emet'),
(6, 'ignat', 'mulat', 'mulig', '900150983cd24fb0d6963f7d28e17f72', 'm@m.com'),
(7, 'tundra', 'ushka', 'trushka', 'tru', 'ushtundra@dfru.de'),
(8, 'ulla', 'drun', 'druna', '3XETtVWuBgBh', 'drulla@gmx.dru'),
(10, 'mila', 'dina', 'dilara', 'dilara', 'dila@mila.mu');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `users_reports`
--

CREATE TABLE `users_reports` (
  `user_id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Daten für Tabelle `users_reports`
--

INSERT INTO `users_reports` (`user_id`, `report_id`) VALUES
(0, 97),
(0, 124),
(1, 1),
(1, 72),
(1, 73),
(1, 77),
(1, 78),
(1, 79),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 95),
(1, 96),
(1, 98),
(1, 99),
(1, 100),
(1, 101),
(1, 102),
(1, 103),
(1, 104),
(1, 105),
(1, 106),
(1, 107),
(1, 108),
(1, 109),
(1, 110),
(1, 111),
(1, 112),
(1, 113),
(1, 114),
(1, 125),
(1, 126),
(1, 128),
(1, 129),
(1, 131),
(1, 132),
(1, 133),
(1, 134),
(1, 158),
(1, 166),
(1, 167),
(1, 168),
(1, 169),
(1, 171),
(1, 172),
(1, 173),
(1, 176),
(1, 190),
(1, 197),
(1, 198),
(1, 199),
(1, 200),
(1, 201),
(1, 202),
(1, 203),
(1, 204),
(1, 205),
(1, 206),
(1, 207),
(1, 208),
(1, 209),
(1, 210),
(1, 211),
(1, 212),
(1, 213),
(1, 214),
(1, 215),
(1, 216),
(1, 217),
(1, 218),
(1, 219),
(1, 220),
(1, 221),
(1, 222),
(1, 223),
(1, 230),
(1, 231),
(1, 244),
(1, 245),
(1, 246),
(1, 247),
(1, 248),
(1, 249),
(1, 250),
(1, 251),
(1, 252),
(1, 253),
(1, 254),
(1, 255),
(1, 256),
(1, 257),
(1, 258),
(1, 259),
(1, 260),
(1, 261),
(1, 262),
(1, 263),
(1, 264),
(1, 265),
(1, 266),
(1, 268),
(1, 269),
(1, 270),
(1, 271),
(1, 272),
(1, 273),
(1, 274),
(1, 275),
(1, 276),
(1, 277),
(1, 278),
(1, 279),
(1, 282),
(1, 283),
(1, 284),
(1, 285),
(1, 286),
(1, 287),
(1, 288),
(1, 289),
(1, 290),
(1, 291),
(1, 300),
(1, 301),
(1, 302),
(1, 310),
(1, 311),
(1, 312),
(1, 313),
(1, 314),
(2, 1),
(2, 72),
(2, 73),
(2, 93),
(2, 115),
(2, 116),
(2, 117),
(2, 118),
(2, 119),
(2, 120),
(2, 121),
(2, 122),
(2, 123),
(2, 127),
(2, 159),
(2, 160),
(2, 161),
(2, 162),
(2, 163),
(2, 164),
(2, 165),
(2, 186),
(2, 187),
(2, 233),
(2, 234),
(2, 238),
(2, 242),
(2, 292),
(2, 294),
(2, 295),
(2, 296),
(2, 297),
(2, 298),
(3, 1),
(3, 72),
(3, 73),
(3, 94),
(3, 293),
(4, 1),
(4, 72),
(4, 73),
(5, 130),
(5, 135),
(5, 136),
(5, 137),
(5, 138),
(5, 139),
(5, 140),
(5, 141),
(5, 142),
(5, 143),
(5, 144),
(5, 145),
(5, 146),
(5, 147),
(5, 148),
(5, 149),
(5, 150),
(5, 151),
(5, 152),
(5, 153),
(5, 154),
(5, 155),
(5, 156),
(5, 157),
(5, 179),
(5, 188),
(5, 192),
(5, 194),
(5, 195),
(5, 243),
(5, 299),
(7, 304),
(7, 305),
(10, 303);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_name` (`project_name`);

--
-- Indizes für die Tabelle `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `users_reports`
--
ALTER TABLE `users_reports`
  ADD PRIMARY KEY (`user_id`,`report_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=315;

--
-- AUTO_INCREMENT für Tabelle `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

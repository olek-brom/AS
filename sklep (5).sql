-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 24 Kwi 2023, 06:25
-- Wersja serwera: 10.4.27-MariaDB
-- Wersja PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `sklep`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `egzemplarz`
--

CREATE TABLE `egzemplarz` (
  `id_egzemplarza` int(11) NOT NULL,
  `produkt_id_produkt` int(11) NOT NULL,
  `zamowienie_id_zamowienia` int(11) NOT NULL,
  `data_zakupu` date DEFAULT NULL,
  `cena_zakupu` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `egzemplarz`
--

INSERT INTO `egzemplarz` (`id_egzemplarza`, `produkt_id_produkt`, `zamowienie_id_zamowienia`, `data_zakupu`, `cena_zakupu`) VALUES
(27, 4, 14, NULL, 0),
(28, 1, 14, NULL, 0),
(29, 1, 15, NULL, 0),
(30, 2, 15, NULL, 0),
(31, 1, 15, NULL, 0),
(35, 5, 16, NULL, 0),
(36, 6, 16, NULL, 0),
(37, 4, 17, NULL, 0),
(38, 4, 18, NULL, 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategoria`
--

CREATE TABLE `kategoria` (
  `id_kategorii` int(11) NOT NULL,
  `nazwa_kategorii` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `kategoria`
--

INSERT INTO `kategoria` (`id_kategorii`, `nazwa_kategorii`) VALUES
(1, 'Oleje'),
(2, 'Szampony'),
(3, 'Odżywki'),
(4, 'Maski');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `produkt`
--

CREATE TABLE `produkt` (
  `id_produkt` int(11) NOT NULL,
  `nazwa_produktu` varchar(200) NOT NULL,
  `opis` text NOT NULL,
  `cena_brutto_dla_klienta` double NOT NULL,
  `kategoria_id_kategorii` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `produkt`
--

INSERT INTO `produkt` (`id_produkt`, `nazwa_produktu`, `opis`, `cena_brutto_dla_klienta`, `kategoria_id_kategorii`) VALUES
(1, 'Regeneracyjny', 'Opis szamponu regeneracyjnego', 10, 2),
(2, '3w1', 'Opis szamponu 3w1', 10, 2),
(3, 'Przeciwłupieżowy', 'Opis szamponu przeciwłupieżowego', 10, 2),
(4, '2w1', 'Opis oleju 2w1', 10, 1),
(5, 'Do włosów kręconych', 'Opis odżywki do włosów kręconych', 10, 3),
(6, 'Do włosów kręconych', 'Opis maski do włosów kręconych', 10, 4),
(7, 'Do włosów kręconych', 'Opis szamponu do włosów kręconych', 10, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rola`
--

CREATE TABLE `rola` (
  `id_rola` int(11) NOT NULL,
  `nazwa_rola` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rola`
--

INSERT INTO `rola` (`id_rola`, `nazwa_rola`) VALUES
(1, 'administrator'),
(2, 'pracownik'),
(3, 'klient');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `rola_has_user`
--

CREATE TABLE `rola_has_user` (
  `rola_id_rola` int(11) NOT NULL,
  `user_id_usera` int(11) NOT NULL,
  `data_nadania` date NOT NULL DEFAULT current_timestamp(),
  `aktywna` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `rola_has_user`
--

INSERT INTO `rola_has_user` (`rola_id_rola`, `user_id_usera`, `data_nadania`, `aktywna`) VALUES
(1, 1, '2022-12-28', 1),
(2, 2, '2022-12-29', 1),
(2, 28, '2023-01-03', 1),
(3, 3, '2022-12-28', 1),
(3, 29, '2023-01-03', 1),
(3, 30, '2023-01-03', 1),
(3, 31, '2023-01-03', 1),
(3, 32, '2023-01-28', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user`
--

CREATE TABLE `user` (
  `id_usera` int(11) NOT NULL,
  `haslo` varchar(200) NOT NULL,
  `kto_zalozyl_user_id` int(11) NOT NULL,
  `nazwa_usera` text NOT NULL,
  `data_zalozenia` datetime NOT NULL DEFAULT current_timestamp(),
  `imie` varchar(45) NOT NULL,
  `nazwisko` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `adres` varchar(45) NOT NULL,
  `kiedy_modyfikowal` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `kto_modyfikowal_id_usera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `user`
--

INSERT INTO `user` (`id_usera`, `haslo`, `kto_zalozyl_user_id`, `nazwa_usera`, `data_zalozenia`, `imie`, `nazwisko`, `e-mail`, `adres`, `kiedy_modyfikowal`, `kto_modyfikowal_id_usera`) VALUES
(1, '$2y$10$dz3bbxkN5CEQb3KKfFRDhe52OzzR3fRRFzE4mbKj8m05H8oLmLiGi', 1, 'administrator', '2022-12-28 19:34:12', 'Jan', 'Administratorski', 'admin@hair.pl', 'Jana z PHP-a 7', '2022-12-29 19:36:41', 1),
(2, '$2y$10$dz3bbxkN5CEQb3KKfFRDhe52OzzR3fRRFzE4mbKj8m05H8oLmLiGi', 1, 'pracownik', '2022-12-28 19:34:12', 'Maro', 'Pracowniczy', 'marek.pracowniczy@hair.com', 'Michała z Javy 4', '2023-01-04 18:14:37', 1),
(3, '$2y$10$dz3bbxkN5CEQb3KKfFRDhe52OzzR3fRRFzE4mbKj8m05H8oLmLiGi', 1, 'klient', '2022-12-28 19:36:32', 'Adam', 'Kliencki', 'jan.kliencki@gmail.com', 'Stefana z JSONa', '2022-12-29 19:36:13', 1),
(28, '$2y$10$aV3Ns1c9inM7lBsknCHTOOpPQFZSOWtVcIvK88qSEiedGp8W00N4O', 28, 'administrator2', '2023-01-03 14:31:28', 'Andrzej', 'Czerepukowski', 'andrzej.czerepukowski@gmail.com', 'Sosnowa 8', '2023-01-12 08:53:04', 28),
(29, '$2y$10$f5krfqH6aL3PcGfh8iuZLe/3xTjbfjOESh2aooV3f5GYZDLoBdxo.', 29, 'administrator3', '2023-01-03 14:39:31', 'Aleksander', 'olek315@gmail.com', 'olek315@gmail.com', 'Dunikowskiego 7', '2023-01-03 13:39:31', 29),
(30, '$2y$10$LUbwewwBSU.N0FCBSYE7v.osLiZ3UbMmIwR7mrRa.pkm.Fh3idZqy', 1, 'administrator4', '2023-01-03 14:40:51', 'Aleksander', 'olek315@gmail.com', 'olek3315@gmail.com', 'Dunikowskiego 7', '2023-01-03 13:40:51', 1),
(31, '$2y$10$34KztegPDatKO8ECqLBC0O0.o.Ebb3Ysgemo34HTi7hqAPSraAixe', 1, 'administrator5', '2023-01-03 14:42:14', 'Aleksander', 'olek315@gmail.com', 'olek3415@gmail.com', 'Dunikowskiego 7', '2023-01-03 13:42:14', 1),
(32, '$2y$10$St3nQ6tZrU0upIeSVbfJV.YfFpv2MoS.y0Sub6ITYnK3Udmx0FJha', 32, 'klient66', '2023-01-28 11:04:44', 'Aleksander', 'aleksande66r.brom@gmail.com', 'aleksander.brom@gmail.com', 'Dunikowskiego', '2023-01-28 10:04:44', 32);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zamowienie`
--

CREATE TABLE `zamowienie` (
  `id_zamowienia` int(11) NOT NULL,
  `user_id_usera` int(11) NOT NULL,
  `numer_zamowienia` text NOT NULL,
  `data_zlozenia_zamowienia` datetime DEFAULT NULL,
  `czy_oplacono` tinyint(1) DEFAULT NULL,
  `data_przyjecia_zamowienia` date NOT NULL,
  `data_zrealizowania_zamowienia` date NOT NULL,
  `czy_spakowno` tinyint(1) NOT NULL,
  `czy_wyslano` tinyint(1) NOT NULL,
  `data_wysylki` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `zamowienie`
--

INSERT INTO `zamowienie` (`id_zamowienia`, `user_id_usera`, `numer_zamowienia`, `data_zlozenia_zamowienia`, `czy_oplacono`, `data_przyjecia_zamowienia`, `data_zrealizowania_zamowienia`, `czy_spakowno`, `czy_wyslano`, `data_wysylki`) VALUES
(14, 3, '', NULL, 1, '0000-00-00', '2023-01-06', 0, 1, '0000-00-00'),
(15, 29, '', '2023-01-06 23:27:36', 1, '0000-00-00', '2023-01-06', 0, 1, '2023-01-06'),
(16, 3, '', '2023-01-12 10:52:16', 1, '0000-00-00', '0000-00-00', 0, 0, '0000-00-00'),
(17, 3, '', '2023-01-15 13:33:24', 1, '0000-00-00', '0000-00-00', 0, 0, '0000-00-00'),
(18, 32, '', '2023-01-28 11:06:30', 1, '0000-00-00', '0000-00-00', 0, 0, '0000-00-00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdjecie`
--

CREATE TABLE `zdjecie` (
  `id_zdjecie` int(11) NOT NULL,
  `produkt_id_produkt` int(11) NOT NULL,
  `sciezka_plik` varchar(250) NOT NULL,
  `data_modyfikacji` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Zrzut danych tabeli `zdjecie`
--

INSERT INTO `zdjecie` (`id_zdjecie`, `produkt_id_produkt`, `sciezka_plik`, `data_modyfikacji`) VALUES
(1, 1, '..\\app\\img\\szampony_szampon_regeneracyjny.jpg', '2022-12-10 15:04:19'),
(2, 2, '..\\app\\img\\szampony_szampon_2w1.jpg', '2022-12-10 15:07:25'),
(3, 3, '..\\app\\img\\szampony_szampon_przeciwlupiezowy.jpg', '2022-12-10 15:07:25'),
(4, 4, '..\\app\\img\\oleje_olej_2w1.jpg', '2022-12-10 15:07:25'),
(5, 5, '..\\app\\img\\odzywki_odzywka_do_wlosow_kreconych.jpg', '2023-01-04 21:37:59'),
(6, 6, '..\\app\\img\\maski_maska_do_wlosow_kreconych.jpg', '2022-12-10 15:07:25'),
(7, 7, '..\\app\\img\\szampony_szampon_do_wlosow_kreconych.jpg', '2022-12-10 15:07:25');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `egzemplarz`
--
ALTER TABLE `egzemplarz`
  ADD PRIMARY KEY (`id_egzemplarza`),
  ADD KEY `fk_produkt_has_zamowienie_produkt1` (`produkt_id_produkt`),
  ADD KEY `fk_produkt_has_zamowienie_zamowienie1` (`zamowienie_id_zamowienia`);

--
-- Indeksy dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  ADD PRIMARY KEY (`id_kategorii`);

--
-- Indeksy dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD PRIMARY KEY (`id_produkt`),
  ADD KEY `fk_produkt_kategoria1` (`kategoria_id_kategorii`);

--
-- Indeksy dla tabeli `rola`
--
ALTER TABLE `rola`
  ADD PRIMARY KEY (`id_rola`);

--
-- Indeksy dla tabeli `rola_has_user`
--
ALTER TABLE `rola_has_user`
  ADD PRIMARY KEY (`rola_id_rola`,`user_id_usera`),
  ADD KEY `fk_rola_has_user_user1` (`user_id_usera`);

--
-- Indeksy dla tabeli `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_usera`),
  ADD KEY `fk_user_user1` (`kto_zalozyl_user_id`),
  ADD KEY `fk_user_user2` (`kto_modyfikowal_id_usera`);

--
-- Indeksy dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD PRIMARY KEY (`id_zamowienia`),
  ADD KEY `fk_zamowienie_user1` (`user_id_usera`);

--
-- Indeksy dla tabeli `zdjecie`
--
ALTER TABLE `zdjecie`
  ADD PRIMARY KEY (`id_zdjecie`),
  ADD KEY `zdjecie_ibfk_1` (`produkt_id_produkt`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `egzemplarz`
--
ALTER TABLE `egzemplarz`
  MODIFY `id_egzemplarza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT dla tabeli `kategoria`
--
ALTER TABLE `kategoria`
  MODIFY `id_kategorii` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `produkt`
--
ALTER TABLE `produkt`
  MODIFY `id_produkt` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `rola`
--
ALTER TABLE `rola`
  MODIFY `id_rola` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT dla tabeli `user`
--
ALTER TABLE `user`
  MODIFY `id_usera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  MODIFY `id_zamowienia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `zdjecie`
--
ALTER TABLE `zdjecie`
  MODIFY `id_zdjecie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `egzemplarz`
--
ALTER TABLE `egzemplarz`
  ADD CONSTRAINT `fk_produkt_has_zamowienie_produkt1` FOREIGN KEY (`produkt_id_produkt`) REFERENCES `produkt` (`id_produkt`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_produkt_has_zamowienie_zamowienie1` FOREIGN KEY (`zamowienie_id_zamowienia`) REFERENCES `zamowienie` (`id_zamowienia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `produkt`
--
ALTER TABLE `produkt`
  ADD CONSTRAINT `fk_produkt_kategoria1` FOREIGN KEY (`kategoria_id_kategorii`) REFERENCES `kategoria` (`id_kategorii`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `rola_has_user`
--
ALTER TABLE `rola_has_user`
  ADD CONSTRAINT `fk_rola_has_user_rola1` FOREIGN KEY (`rola_id_rola`) REFERENCES `rola` (`id_rola`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rola_has_user_user1` FOREIGN KEY (`user_id_usera`) REFERENCES `user` (`id_usera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `fk_user_user1` FOREIGN KEY (`kto_zalozyl_user_id`) REFERENCES `user` (`id_usera`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_user_user2` FOREIGN KEY (`kto_modyfikowal_id_usera`) REFERENCES `user` (`id_usera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zamowienie`
--
ALTER TABLE `zamowienie`
  ADD CONSTRAINT `fk_zamowienie_user1` FOREIGN KEY (`user_id_usera`) REFERENCES `user` (`id_usera`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ograniczenia dla tabeli `zdjecie`
--
ALTER TABLE `zdjecie`
  ADD CONSTRAINT `zdjecie_ibfk_1` FOREIGN KEY (`produkt_id_produkt`) REFERENCES `produkt` (`id_produkt`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

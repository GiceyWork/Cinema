-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Хост: MariaDB-11.8:3306
-- Время создания: Дек 14 2025 г., 16:22
-- Версия сервера: 11.8.3-MariaDB
-- Версия PHP: 8.4.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `cinema`
--

-- --------------------------------------------------------

--
-- Структура таблицы `actor`
--

CREATE TABLE `actor` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `surname` text NOT NULL,
  `patronymic` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `actor`
--

INSERT INTO `actor` (`id`, `name`, `surname`, `patronymic`) VALUES
(1, 'Иван', 'Иванов', 'Иванович'),
(2, 'Мария', 'Петрова', 'Петровна'),
(3, 'Алексей', 'Смирнов', 'Сергеевич'),
(4, 'Елена', 'Кузнецова', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `actor_film`
--

CREATE TABLE `actor_film` (
  `film_id` int(11) NOT NULL,
  `actor_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `actor_film`
--

INSERT INTO `actor_film` (`film_id`, `actor_id`) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4),
(4, 1),
(5, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `film`
--

CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `title` text NOT NULL,
  `duration_minute` varchar(3) NOT NULL,
  `rating` decimal(2,1) NOT NULL,
  `release_date` date NOT NULL,
  `photo_path` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `film`
--

INSERT INTO `film` (`id`, `description`, `price`, `title`, `duration_minute`, `rating`, `release_date`, `photo_path`) VALUES
(1, 'Классический триллер с неожиданными поворотами', 9.99, 'Тень прошлого', '110', 8.5, '2024-05-12', '\\images\\тень прошлого.jpg'),
(2, 'Комедия о дружбе и приключениях', 7.50, 'Веселый поход', '95', 7.2, '2023-11-02', '\\images\\веселый поход.jpg'),
(3, 'Фильм о космосе и мечтах', 12.00, 'Звездный путь', '130', 8.9, '2022-06-18', '\\images\\звездный путь.jpg'),
(4, 'Драма о семье и выборах', 8.75, 'Переплетения', '105', 7.8, '2021-09-27', '\\images\\переплетения.jpg'),
(5, 'Анимация для всей семьи', 6.99, 'Сказка о Луне', '85', 7.5, '2020-03-14', '\\images\\сказка о луне.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genre`
--

INSERT INTO `genre` (`id`, `title`) VALUES
(1, 'Драма'),
(2, 'Комедия'),
(3, 'Боевик'),
(4, 'Научная фантастика'),
(5, 'Анимация'),
(6, 'Триллер');

-- --------------------------------------------------------

--
-- Структура таблицы `genre_film`
--

CREATE TABLE `genre_film` (
  `film_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `genre_film`
--

INSERT INTO `genre_film` (`film_id`, `genre_id`) VALUES
(1, 1),
(4, 1),
(2, 2),
(1, 4),
(3, 4),
(5, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `room`
--

INSERT INTO `room` (`id`, `title`) VALUES
(1, 'Зал А'),
(2, 'Зал Б'),
(3, 'Зал В');

-- --------------------------------------------------------

--
-- Структура таблицы `seans`
--

CREATE TABLE `seans` (
  `film_id` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `seans_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seans`
--

INSERT INTO `seans` (`film_id`, `id`, `room_id`, `seans_date`) VALUES
(1, 1, 1, '2025-12-15 15:45:00'),
(1, 2, 2, '2025-12-17 15:00:00'),
(2, 3, 1, '2025-12-15 20:00:00'),
(3, 4, 3, '2025-12-17 17:45:00'),
(4, 5, 2, '2025-12-16 08:50:00'),
(5, 6, 3, '2025-12-15 14:50:00');

-- --------------------------------------------------------

--
-- Структура таблицы `seats`
--

CREATE TABLE `seats` (
  `seans_id` int(11) NOT NULL,
  `seat_number` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Дамп данных таблицы `seats`
--

INSERT INTO `seats` (`seans_id`, `seat_number`) VALUES
(1, 12),
(1, 11),
(2, 4);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `actor`
--
ALTER TABLE `actor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `actor_film`
--
ALTER TABLE `actor_film`
  ADD KEY `actor_film_fk0` (`film_id`),
  ADD KEY `actor_film_fk1` (`actor_id`);

--
-- Индексы таблицы `film`
--
ALTER TABLE `film`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `genre_film`
--
ALTER TABLE `genre_film`
  ADD PRIMARY KEY (`film_id`,`genre_id`),
  ADD KEY `genre_film_fk1` (`genre_id`);

--
-- Индексы таблицы `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Индексы таблицы `seans`
--
ALTER TABLE `seans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `seans_fk0` (`film_id`),
  ADD KEY `seans_fk2` (`room_id`);

--
-- Индексы таблицы `seats`
--
ALTER TABLE `seats`
  ADD KEY `seats_fk1` (`seans_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `actor`
--
ALTER TABLE `actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `film`
--
ALTER TABLE `film`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `seans`
--
ALTER TABLE `seans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `actor_film`
--
ALTER TABLE `actor_film`
  ADD CONSTRAINT `actor_film_fk0` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `actor_film_fk1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`);

--
-- Ограничения внешнего ключа таблицы `genre_film`
--
ALTER TABLE `genre_film`
  ADD CONSTRAINT `genre_film_fk0` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `genre_film_fk1` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`);

--
-- Ограничения внешнего ключа таблицы `seans`
--
ALTER TABLE `seans`
  ADD CONSTRAINT `seans_fk0` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  ADD CONSTRAINT `seans_fk2` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`);

--
-- Ограничения внешнего ключа таблицы `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_fk1` FOREIGN KEY (`seans_id`) REFERENCES `seans` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

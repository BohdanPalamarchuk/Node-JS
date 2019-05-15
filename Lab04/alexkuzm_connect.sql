-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Фев 27 2019 г., 16:19
-- Версия сервера: 5.6.37
-- Версия PHP: 7.0.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `alexkuzm_connect`
--

-- --------------------------------------------------------

--
-- Структура таблицы `departments`
--

CREATE TABLE `departments` (
  `department_id` int(11) NOT NULL,
  `department_name` varchar(255) NOT NULL,
  `short_name` varchar(50) NOT NULL,
  `establishment_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `departments`
--

INSERT INTO `departments` (`department_id`, `department_name`, `short_name`, `establishment_id`) VALUES
(100, 'Факультет інформаційно-комп\'ютерних технологій', 'ФІКТ', 100),
(101, 'Факультет комп\'ютерно-інтегрованих технологій, мехатроніки і робототехніки', 'ФКІТМР', 100),
(102, 'Факультет економіки та менеджменту', 'ФЕМ', 100),
(103, 'Гiрничо-екологiчний факультет', 'ГЕФ', 100),
(104, 'Факультет обліку і фінансів', 'ФОФ', 100),
(105, 'Факультет публічного управління та права', 'ФПУП', 100),
(106, 'Фізико-математичний факультет', 'ФізМат', 101);

-- --------------------------------------------------------

--
-- Структура таблицы `establishments`
--

CREATE TABLE `establishments` (
  `establishment_id` int(11) NOT NULL,
  `establishment_name` varchar(255) NOT NULL,
  `short_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `establishments`
--

INSERT INTO `establishments` (`establishment_id`, `establishment_name`, `short_name`) VALUES
(100, 'Житомирський державний технологічний університет', 'ЖДТУ'),
(101, 'Житомирський державний університет імені Івана Франка', 'ЖДТУ'),
(102, 'Житомирський національний агроекологічний університет', 'ЖНАУ'),
(103, 'Житомирський військовий інститут імені С.П. Корольова', 'ЖВІ'),
(104, 'Житомирський інститут медсестринства', 'ЖІМ'),
(105, 'Житомирське відділення Національної академії внутрішніх справ', 'ЖВНАВС');

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE `groups` (
  `group_id` int(11) NOT NULL,
  `group_name` varchar(255) NOT NULL,
  `department_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`group_id`, `group_name`, `department_id`) VALUES
(100, 'PI53', 100),
(101, 'PI54', 100),
(102, 'PI55', 100),
(103, 'ПІК-15', 100),
(104, 'PI51', 100);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `middle_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `middle_name`, `email`, `phone`, `group_id`) VALUES
(1512, 'Doe', 'John', 'William', 'demo1@gmail.com', '0680398273', 100),
(1513, 'Peterson', 'Alex', 'Wiilliams', 'demo@gmail.com', '0680398273', 101),
(1514, 'Johnson', 'Alex', 'Williams', 'asdf@gmail.com', '1234567890', 100);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`department_id`),
  ADD KEY `school_id` (`establishment_id`);

--
-- Индексы таблицы `establishments`
--
ALTER TABLE `establishments`
  ADD PRIMARY KEY (`establishment_id`);

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `group_id` (`group_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `departments`
--
ALTER TABLE `departments`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;
--
-- AUTO_INCREMENT для таблицы `establishments`
--
ALTER TABLE `establishments`
  MODIFY `establishment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;
--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1515;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `departments`
--
ALTER TABLE `departments`
  ADD CONSTRAINT `departments_ibfk_1` FOREIGN KEY (`establishment_id`) REFERENCES `establishments` (`establishment_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `groups_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`group_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

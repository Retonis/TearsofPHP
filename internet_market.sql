-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Мар 14 2022 г., 03:38
-- Версия сервера: 8.0.24
-- Версия PHP: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `internet_market`
--

-- --------------------------------------------------------

--
-- Структура таблицы `catergory_item`
--

CREATE TABLE `catergory_item` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'Наименование товара'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `catergory_item`
--

INSERT INTO `catergory_item` (`id`, `name`) VALUES
(1, 'Книги'),
(2, 'Одежда'),
(3, 'Обувь'),
(4, 'Бытовая техника'),
(5, 'Электроника'),
(6, 'Мебель');

-- --------------------------------------------------------

--
-- Структура таблицы `item`
--

CREATE TABLE `item` (
  `id` int NOT NULL,
  `id_category` int NOT NULL COMMENT 'id категории товара',
  `name` varchar(255) NOT NULL COMMENT 'Наименование',
  `weight` float NOT NULL COMMENT 'Вес',
  `price` float NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `item`
--

INSERT INTO `item` (`id`, `id_category`, `name`, `weight`, `price`) VALUES
(1, 6, 'Шкаф', 20000, 10000),
(2, 5, 'Ноутбук', 3000, 21500),
(3, 3, 'Ботинки', 500, 2000),
(4, 1, 'S.T.A.L.K.E.R Рыжий лес', 200, 500),
(5, 2, 'Пальто', 1500, 5000),
(6, 4, 'Фен', 400, 2100),
(7, 5, 'Монитор', 2000, 15000),
(8, 5, 'Клавиатура', 1000, 2000);

-- --------------------------------------------------------

--
-- Структура таблицы `item_orderat`
--

CREATE TABLE `item_orderat` (
  `id` int NOT NULL,
  `id_orderat` int NOT NULL COMMENT 'id заказа',
  `id_items` int NOT NULL COMMENT 'id товара',
  `number` int NOT NULL COMMENT 'Колличество',
  `price` float NOT NULL COMMENT 'Цена'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товар заказа';

--
-- Дамп данных таблицы `item_orderat`
--

INSERT INTO `item_orderat` (`id`, `id_orderat`, `id_items`, `number`, `price`) VALUES
(3, 1, 5, 1, 6000),
(4, 2, 4, 1, 450),
(5, 3, 1, 1, 10000),
(6, 4, 3, 2, 2100),
(7, 5, 2, 1, 23000);

-- --------------------------------------------------------

--
-- Структура таблицы `orderat`
--

CREATE TABLE `orderat` (
  `id` int NOT NULL,
  `id_customer` int NOT NULL COMMENT 'id покупателя',
  `date` datetime NOT NULL COMMENT 'Дата и время отправки'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `orderat`
--

INSERT INTO `orderat` (`id`, `id_customer`, `date`) VALUES
(1, 2, '2021-10-11 09:15:12'),
(2, 4, '2021-06-08 17:30:00'),
(3, 1, '2021-05-18 14:21:00'),
(4, 3, '2020-09-24 16:20:10'),
(5, 5, '2021-09-21 21:13:00');

-- --------------------------------------------------------

--
-- Структура таблицы `payment`
--

CREATE TABLE `payment` (
  `id` int NOT NULL,
  `id_customer` int NOT NULL COMMENT 'id покупателя',
  `date` datetime NOT NULL COMMENT 'Дата и время оплаты',
  `sum` int NOT NULL COMMENT 'Сумма'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Оплата';

--
-- Дамп данных таблицы `payment`
--

INSERT INTO `payment` (`id`, `id_customer`, `date`, `sum`) VALUES
(1, 1, '2021-07-15 05:00:00', 2000),
(2, 2, '2021-09-06 15:00:00', 4000),
(3, 3, '2021-06-29 20:00:00', 10000),
(4, 4, '2021-07-07 09:15:12', 7000),
(5, 5, '2021-05-02 22:18:26', 9000);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `full_name` varchar(355) DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `full_name`, `login`, `email`, `password`) VALUES
(9, 'Вася Василий Петрович', 'test', 'test@local.ru', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Структура таблицы `сustomer`
--

CREATE TABLE `сustomer` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL COMMENT 'ФИО',
  `adress` varchar(255) NOT NULL COMMENT 'Адрес доставки',
  `email` varchar(255) NOT NULL COMMENT 'e-mail'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Дамп данных таблицы `сustomer`
--

INSERT INTO `сustomer` (`id`, `name`, `adress`, `email`) VALUES
(1, 'Иванов С.М.', 'Курицыно 1', 'ism@ya.ru'),
(2, 'Максимов А.В.', 'Царицыно 25/1', 'made@mail.ru'),
(3, 'Лавров К.Р.', 'Власова 10', 'foaa@yandex.ru'),
(4, 'Карпов К.П.', 'Энергетиков 15', 'flow@ya.ru'),
(5, 'Капельков Е.В.', 'Зеленая 12/2', 'kape@mail.ru');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `catergory_item`
--
ALTER TABLE `catergory_item`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Индексы таблицы `item_orderat`
--
ALTER TABLE `item_orderat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_orderat` (`id_orderat`),
  ADD KEY `item_orderat_ibfk_1` (`id_items`);

--
-- Индексы таблицы `orderat`
--
ALTER TABLE `orderat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Индексы таблицы `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `сustomer`
--
ALTER TABLE `сustomer`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `catergory_item`
--
ALTER TABLE `catergory_item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `item`
--
ALTER TABLE `item`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `item_orderat`
--
ALTER TABLE `item_orderat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `orderat`
--
ALTER TABLE `orderat`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `payment`
--
ALTER TABLE `payment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `сustomer`
--
ALTER TABLE `сustomer`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `catergory_item` (`id`);

--
-- Ограничения внешнего ключа таблицы `item_orderat`
--
ALTER TABLE `item_orderat`
  ADD CONSTRAINT `item_orderat_ibfk_1` FOREIGN KEY (`id_items`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `item_orderat_ibfk_2` FOREIGN KEY (`id_orderat`) REFERENCES `orderat` (`id`);

--
-- Ограничения внешнего ключа таблицы `orderat`
--
ALTER TABLE `orderat`
  ADD CONSTRAINT `orderat_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `сustomer` (`id`);

--
-- Ограничения внешнего ключа таблицы `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `сustomer` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

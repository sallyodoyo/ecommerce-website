-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2022 at 06:08 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `imoradb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `is_active` enum('0','1') NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `is_active`) VALUES
(8, 'Sally Keju', 'sallykeju@gmail.com', '$2y$10$4HDksU0fLHPRgC2vtWDpaOOacUu3WvCu/Ld4sBllyynG8wYareB0u', '0'),
(9, 'Admin 2', 'admin2@gmail.com', '$2y$10$AZcWPVqgegBG1VaMiuWCA.F3b4KXRxCt/rdI807XrqDZ5ELYghYby', '0');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(100) NOT NULL,
  `brand_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(2, 'Casual'),
(7, 'Formal'),
(8, 'Sports'),
(9, 'New Sub-Category');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(10) NOT NULL,
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(250) NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `p_id`, `ip_add`, `user_id`, `qty`) VALUES
(5, 8, '::1', 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(100) NOT NULL,
  `cat_title` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`) VALUES
(2, 'Ladies'),
(14, 'Men'),
(15, 'Children'),
(16, 'Pets'),
(17, 'New Category '),
(18, 'Universal');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `product_id`, `qty`) VALUES
(5, 3, 6, 1),
(6, 4, 8, 1),
(7, 7, 6, 1),
(8, 7, 24, 1),
(9, 7, 25, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(100) NOT NULL,
  `product_cat` int(11) NOT NULL,
  `product_brand` int(100) NOT NULL,
  `product_title` varchar(255) NOT NULL,
  `product_price` int(100) NOT NULL,
  `product_qty` int(11) NOT NULL,
  `product_desc` text NOT NULL,
  `product_image` text NOT NULL,
  `product_keywords` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_cat`, `product_brand`, `product_title`, `product_price`, `product_qty`, `product_desc`, `product_image`, `product_keywords`) VALUES
(6, 2, 2, 'Floral Top', 1000, 5, 'Beautiful casual floral-print top', '1643535656_ladiescasualtop.jpg', 'floral, casual, ladies, top'),
(7, 2, 2, 'Skinny Jeans', 1500, 10, 'blue casual skinny jeans for ladies', '1643553227_ladiescaualjeans.jpg', 'jeans, casual, ladies, skinny'),
(8, 2, 7, 'Blue Blouse', 700, 10, 'Blue formal blouse for ladies', '1643553416_ladiesformalshirt.jpeg', 'blouse, blue, ladies, formal'),
(10, 2, 7, 'Grey Suit', 2500, 10, 'grey pant suit for ladies', '1643553500_ladiesformalsuit.jpeg', 'suit, ladies, grey, formal'),
(11, 2, 8, 'Sports set', 3000, 15, 'pink sports set for ladies', '1643553594_ladiessportsset.jpg', 'sports, ladies, set, pink'),
(12, 2, 8, 'Purple trainers', 2000, 11, 'purple running trainers for ladies', '1643553724_ladiessportsshoes.jpg', 'ladies, trainers, purple, sports'),
(13, 14, 8, 'Mens sports set', 3000, 22, 'black sports outfit for men. full set', '1643554006_1643553848_mensportsset.jpg', 'men, sports, black, set, shoes'),
(14, 14, 8, 'Black trainers', 2000, 11, 'black trainers for men', '1643554091_mensportsshoes.jpg', 'men, black, trainers, sports, shoes'),
(15, 14, 7, 'Pinstripe suit', 17000, 12, 'blue pinstripe suit', '1643554522_menformalsuit.jpg', 'suit, men, blue, formal, pinstripe '),
(16, 14, 7, 'Blue dress shirt', 2000, 11, 'blue dress shirt for men', '1643554605_menformalshirt.jpg', 'dress shirt, blue, men, formal'),
(19, 15, 7, 'dress', 1100, 11, 'dress for girls', '1643555256_childrenformaldress.jpg', 'dress, chlidren'),
(21, 15, 2, 't-shirt', 1000, 22, 'blu tshirt', '1643555518_childrencasualshirt.jpg', 't-shirt, children'),
(22, 15, 8, 'children sports set ', 2000, 22, 'children tracksuit', '1643555637_childrensportsset.jpg', 'children, tracksuit, sports'),
(23, 16, 2, 'Dog leash', 500, 11, 'dog leash pink', '1643555827_petleash.jpg', 'pet, dog, leash'),
(24, 16, 2, 'toys', 1000, 11, 'pet toys', '1643555881_toys.jpg', 'pet, dog, toys'),
(25, 18, 7, 'universal clothes', 1000, 10, 'evening wear for ladies and gentlemen', '1643561470_universalbelt.jpg', 'universal, evening wear');

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address1` varchar(300) NOT NULL,
  `address2` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address1`, `address2`) VALUES
(3, 'Selma', 'Grace', 'selmagrace@gmail.com', 'a292a3e3d32d56e9f1466d092f2514aa', '0712345678', 'xxxxx', 'xxxxx'),
(4, 'Client', 'One', 'client1@gmail.com', '06b0c19ada73d5c8d89cdc922ad91bef', '0712345678', 'xxxxxxx', 'xxxxxxx'),
(5, 'Client', 'Two', 'client2@gmail.com', 'ee6017bf8328742654fca3b6e20e40b8', '0712345678', 'ccccccccc', 'ccccccccc'),
(7, 'Buyer', 'One', 'buyer1@gmail.com', '7f2cf79aee3c8b70f34ad2ee94a4ac47', '0712345678', 'xxxxx', 'xxxxxx');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `fk_product_cat` (`product_cat`),
  ADD KEY `fk_product_brand` (`product_brand`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_product_brand` FOREIGN KEY (`product_brand`) REFERENCES `brands` (`brand_id`),
  ADD CONSTRAINT `fk_product_cat` FOREIGN KEY (`product_cat`) REFERENCES `categories` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

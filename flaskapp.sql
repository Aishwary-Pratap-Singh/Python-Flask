-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2019 at 05:13 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flaskapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `SNo` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `email` text NOT NULL,
  `phoneNum` text,
  `msg` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`SNo`, `Name`, `email`, `phoneNum`, `msg`, `date`) VALUES
(2, 'first', 'aaa', '111', 'bbbb', '2019-04-20 17:29:39'),
(3, 'maad', 'maadsaifuddin_52@hotmail.com', '', 'aaaaa', '2019-04-21 00:11:47'),
(4, 'hussain', 'maadsaifuddin51@gmail.com', '', 'hello hussain', '2019-04-21 00:15:18'),
(5, 'Moiz', 'moiz@ssuet.com', '', 'moiz aagey wala', '2019-04-21 15:37:40'),
(6, 'Moiz2', 'maadsaifuddin_52@hotmail.com', '', 'helloooooooooo', '2019-04-21 15:58:06'),
(7, 'Moiz2', 'maadsaifuddin_52@hotmail.com', '', 'helloooooooooo', '2019-04-21 15:58:52'),
(8, 'hussain', 'moiz@ssuet.com', '', 'hussain', '2019-04-21 15:59:09'),
(9, 'Moiz', 'maadsaifuddin51@lehigh.edu', NULL, 'hhhhhhhhh', '2019-04-21 16:04:51'),
(10, 'hussain', 'moiz@ssuet.com', NULL, 'hussain', '2019-04-21 17:35:11'),
(11, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz ', '2019-04-21 18:25:04'),
(12, 'hussain', 'moiz@ssuet.com', NULL, 'Moiz', '2019-04-21 18:26:17'),
(13, 'hussain', 'moiz@ssuet.com', NULL, 'Moiz', '2019-04-21 18:38:29'),
(14, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz mera chal gaya ', '2019-04-21 20:05:50'),
(15, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz mera chal gaya ', '2019-04-21 20:06:54'),
(16, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz mera chal gaya ', '2019-04-21 20:07:23'),
(17, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz mera chal gaya ', '2019-04-21 20:09:45'),
(18, 'Moiz Ali ABedin', 'moiz@ssuet.com', NULL, 'Moiz mera chal gaya ', '2019-04-21 20:10:52'),
(19, 'maad', 'maadsaifuddin_52@hotmail.com', NULL, 'mmmmmmmmmmmmm', '2019-04-24 20:56:22'),
(20, 'hussain', 'maadsaifuddin_52@hotmail.com', '03357559425', 'bhuijkl', '2019-04-27 23:50:26');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `SNO` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `pwd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `Sno` int(11) NOT NULL,
  `Title` text NOT NULL,
  `slag` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `tag_line` text NOT NULL,
  `img_file` varchar(25) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`Sno`, `Title`, `slag`, `content`, `tag_line`, `img_file`, `date`) VALUES
(2, 'Google’s TensorFlow Object Detection API', 'second-post', 'Every time you visit Google’s research blog, you can find the company working on something out of the world and unbelievable. As part of its Big Data research, it published an article on its working on machine learning systems designed to improve its services and products. The deep learning technology is all about the machines identifying several objects on an image – yes, on an image.', 'second post', '', '2019-04-25 12:07:53'),
(3, 'How to get started with Python for data analysis?', 'third-post', 'Python is a popular analytics tool that is used globally by data scientists around the world. For a lot of people, especially beginners, it appears a little complex. However, this article helps you get started with Python in the simplest way possible. The article is simple and the one you need to read today.\r\n\r\nThese articles will keep you updated on diverse analytics topics and will also help you realize newer topics you can read about further. Check them out and if you find an interesting read on data science, share them in your comments.', 'third post', '', '2019-04-25 12:08:58'),
(4, 'What Are The Different Types of AI?', 'fifth-post', 'Superficially, most of us understand what Artificial Intelligence (AI) is, what it stands for, its potential and future. We have been dreaming on a machine-dominated world for long and we are definitely heading there. But right now, what is…', 'fourth post', '', '2019-04-25 12:10:03'),
(5, 'What is The Difference Between Data Science and Machine Learning', 'sixth-post', 'One of the most common confusions arise among the modern technologies such as artificial intelligence, machine learning, big data, data science, deep learning and more. While they are all closely interconnected, each has a distinct purpose…', 'fifth post', '', '2019-04-25 12:10:46'),
(6, 'The Scope Of Jobs With Artificial Intelligence And Machine Learning', 'fourth-post', 'According to a Gartner report, Artificial Intelligence (AI) is estimated to pave way for close to 2.3 million opportunities by the year 2020. And if you look at a report from Indeed, vacancies in the realm of artificial intelligence has doubled over the last three years. A similar report from Indeed also reveals that the most in-demand job roles in artificial intelligence are that of machine learning engineers, software engineers and data scientists.\r\n\r\nWhile the competition in the industry is yet to heat up in the coming months, the current talent pool in the IT industry have already set their eyes on artificial intelligence as an avenue for lucrative paychecks and rewarding career path. Amidst all the commotion that AI will replace redundant job roles with automation and smart devices, we are yet to reach the stage where machines would take over our everyday life. So if you are an AI aspirant looking to land a job in the industry, let us remind you that opportunities are aplenty. This article sheds light on some of the most in-demand jobs in the industry right now.\r\n\r\nData Scientist\r\n\r\nBy now, we are quite sure you would have understood the roles and responsibilities of data scientists. They are primarily involved in collecting data from multiple touchpoints, analyzing it, interpreting it for inferences and insights and coming up with effective solutions for business concerns. Machine learning and artificial intelligence are integral parts of data science, where techniques from both such as regression, predictive analytics and more are applied for insight generation.\r\n\r\nMachine Learning Engineer\r\n\r\nWith a median salary of over a $1000, machine learning engineers are some of the most in-demand jobs in artificial intelligence. They are most sought by companies and are immediately recruited for operations if found suitable. Machine learning engineers come with competencies on software, natural language processing, statistics, applied math and working knowledge of tools such as IntelliJ, Eclipse and more. If you are an AI aspirant, you might want to consider more about becoming a machine learning engineer.\r\n', 'sixth post', 'Ai-11.jpg', '2019-04-25 12:14:39'),
(7, 'Argumentation in artificial intelligence', 'seventh-post', 'mmmmmmmmmmmmmm', 'Artificial intelligence and its power  ', 's.jpg', '2019-04-27 23:47:05');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `email` text NOT NULL,
  `pwd` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `pwd`) VALUES
(3, 'maad', 'maadsaifuddin_52@hotmail.com', 'sha256$1bYS5MLk$e205f326f18a89bf9a13421629752b426127ea40a19845afd0a60cf5f5cfeec2'),
(4, 'CS162017', 'maadsaifuddin51@gmail.com', 'sha256$c1tTHcvj$582e868b768b3c7644f7e9d3206312ef4e801d5ff5f92c0315934a7e2cbc695b'),
(5, 'Hussain', 'hussain53@gmail.com', 'sha256$Y1mS1RsK$7d7621bd1ae4045ff172c5291b2151f7606f26e47262130578ea89e13d8d2328'),
(6, 'Moiz', 'moiz@ssuet.com', 'sha256$CrEetv0N$6d6d990199ac1b307754118c77c92c57b60e2e7832a721f2e59e9fd1ec52c989'),
(7, 'moizali', 'moiz@ssuet.com', 'sha256$Xw16jg66$d7f92aa2f446ba3a2622678652617337fcded91d5135fe01425226642f4cdb75'),
(8, 'Hussain52', 'BC@gmail.com', 'sha256$3SlHfaWh$48a4aa3a331e9f83d97fbaf16cfa46fd9f5e14fb4abc05f9061c8f34b02c3d41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`SNo`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`SNO`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`Sno`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `SNo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `login`
--
ALTER TABLE `login`
  MODIFY `SNO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

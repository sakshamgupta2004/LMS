-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 06, 2024 at 01:32 PM
-- Server version: 8.0.27
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_master`
--

CREATE TABLE `book_master` (
  `bookId` int NOT NULL,
  `bookTitle` varchar(100) DEFAULT NULL,
  `author` varchar(200) DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `publicationId` varchar(100) DEFAULT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `publicationYear` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book_master`
--

INSERT INTO `book_master` (`bookId`, `bookTitle`, `author`, `qty`, `publicationId`, `genre`, `publicationYear`) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 0, 'J.B. Lippincott & Co.', 'Fiction', 1960),
(2, '1984', 'George Orwell', 3, 'Secker & Warburg', 'Dystopian', 1949),
(3, 'Pride and Prejudice', 'Jane Austen', 3, 'T. Egerton', 'Romance', 1813),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 5, 'Scribner', 'Classic', 1925),
(5, 'Moby Dick', 'Herman Melville', 2, 'Harper & Brothers', 'Adventure', 1851),
(6, 'War and Peace', 'Leo Tolstoy', 1, 'The Russian Messenger', 'Historical', 1869),
(7, 'The Catcher in the Rye', 'J.D. Salinger', 3, 'Little, Brown and Company', 'Fiction', 1951),
(8, 'The Lord of the Rings', 'J.R.R. Tolkien', 6, 'Allen & Unwin', 'Fantasy', 1954),
(9, 'Crime and Punishment', 'Fyodor Dostoevsky', 1, 'The Russian Messenger', 'Psychological', 1866),
(10, 'Alices Adventures in Wonderland', 'Lewis Carroll', 2, 'Macmillan', 'Fantasy', 1865),
(123455, 'Something I Added', 'Me', 10, '--', 'IDK', 2004);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberId` int NOT NULL,
  `memberName` varchar(200) DEFAULT NULL,
  `addr` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contact` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberId`, `memberName`, `addr`, `email`, `contact`) VALUES
(7, 'saksham', '--', 'sak@a.a', 9711),
(8, 'Saksham2', '--', 'abc@a.a', 9),
(9, 'Someone', '--', 'idk@a.a', 9342492);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transId` int NOT NULL,
  `bookId` int DEFAULT NULL,
  `memberId` int DEFAULT NULL,
  `issueDate` date DEFAULT NULL,
  `returnDate` date DEFAULT NULL,
  `finePaid` decimal(5,2) NOT NULL DEFAULT '0.00',
  `transClosed` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transId`, `bookId`, `memberId`, `issueDate`, `returnDate`, `finePaid`, `transClosed`) VALUES
(9, 1, 7, '2024-11-06', '2024-11-10', '0.00', 1),
(10, 2, 7, '2024-11-06', '2024-11-10', '0.00', 1),
(11, 1, 7, '2024-12-06', '2024-11-06', '0.00', 1),
(12, 1, 7, '2024-12-06', '2024-11-06', '0.00', 1),
(13, 2, 8, '2024-11-06', '2024-11-06', '0.00', 1),
(14, 2, 7, '2024-11-06', '2024-11-08', '0.00', 1),
(15, 4, 7, '2024-11-06', '2024-11-06', '0.00', 1),
(16, 2, 7, '2024-11-07', '2024-11-06', '0.00', 1),
(17, 4, 8, '2024-11-06', '2024-11-07', '0.00', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_master`
--
ALTER TABLE `book_master`
  ADD PRIMARY KEY (`bookId`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberId`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `memberId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transId` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

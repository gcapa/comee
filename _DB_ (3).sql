-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Eki 2019, 20:48:24
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `computer engineering`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `class`
--

DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `class_id` int(11) NOT NULL,
  `class-name` varchar(20) NOT NULL,
  `class_no` int(11) NOT NULL,
  `lesson_id` int(20) NOT NULL,
  `student_id` int(20) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  `exam_id` int(20) NOT NULL,
  `course_id` int(20) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `class-name` (`class-name`),
  KEY `class_no` (`class_no`),
  KEY `lesson_id` (`lesson_id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `exam_id` (`exam_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `course`
--

DROP TABLE IF EXISTS `course`;
CREATE TABLE IF NOT EXISTS `course` (
  `course_id` int(20) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_hours` int(20) NOT NULL,
  `student_id` int(20) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  `lesson_id` int(20) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `student_id` (`student_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(20) NOT NULL,
  `exam_date` date NOT NULL,
  `lesson_name` varchar(20) NOT NULL,
  `student_id` int(20) NOT NULL,
  `lesson_id` int(20) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  PRIMARY KEY (`exam_id`),
  KEY `exam_name` (`exam_name`),
  KEY `lesson_name` (`lesson_name`),
  KEY `student_id` (`student_id`),
  KEY `lesson_id` (`lesson_id`),
  KEY `teacher_id` (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `lesson`
--

DROP TABLE IF EXISTS `lesson`;
CREATE TABLE IF NOT EXISTS `lesson` (
  `lesson_id` int(11) NOT NULL,
  `class_no` int(11) NOT NULL,
  `teacher_id` int(20) NOT NULL,
  `lesson_name` varchar(50) NOT NULL,
  `lesson_adress` varchar(50) NOT NULL,
  `student_id` int(20) NOT NULL,
  `course_id` int(20) NOT NULL,
  PRIMARY KEY (`lesson_id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student`
--

DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `student_id` int(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `surname` varchar(30) NOT NULL,
  `phone number` varchar(20) NOT NULL,
  `age` int(2) NOT NULL,
  `mail` varchar(30) NOT NULL,
  `gender` text NOT NULL,
  `year` int(1) NOT NULL,
  `city` text NOT NULL,
  `lesson_id` int(20) NOT NULL,
  PRIMARY KEY (`student_id`),
  KEY `lesson_id` (`lesson_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `student_id` int(20) NOT NULL,
  `lesson_id` int(20) NOT NULL,
  `course_id` int(20) NOT NULL,
  `exam_id` int(20) NOT NULL,
  `class_id` int(20) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `teacher_name` (`teacher_name`),
  KEY `lesson_id` (`lesson_id`),
  KEY `student_id` (`student_id`),
  KEY `course_id` (`course_id`),
  KEY `exam_id` (`exam_id`),
  KEY `class_id` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `class_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `class_ibfk_2` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`),
  ADD CONSTRAINT `class_ibfk_3` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);

--
-- Tablo kısıtlamaları `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `course_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `course_ibfk_3` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  ADD CONSTRAINT `exams_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `exams_ibfk_3` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`);

--
-- Tablo kısıtlamaları `lesson`
--
ALTER TABLE `lesson`
  ADD CONSTRAINT `lesson_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`teacher_id`);

--
-- Tablo kısıtlamaları `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`);

--
-- Tablo kısıtlamaları `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`lesson_id`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`),
  ADD CONSTRAINT `teacher_ibfk_3` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`),
  ADD CONSTRAINT `teacher_ibfk_4` FOREIGN KEY (`class_id`) REFERENCES `class` (`class_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

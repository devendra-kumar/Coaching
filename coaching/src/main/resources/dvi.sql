-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: localhost    Database: userbase
-- ------------------------------------------------------
-- Server version	5.1.59-community
use userbase;

DROP TABLE IF EXISTS `condidate_registration`;
CREATE TABLE `condidate_registration` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(45) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `contact_number` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `institute` varchar(45) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
);
CREATE TABLE `questions` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `question` varchar(1000) DEFAULT NULL,
  `answer1` varchar(45) DEFAULT NULL,
  `answer2` varchar(45) DEFAULT NULL,
  `answer3` varchar(45) DEFAULT NULL,
  `answer4` varchar(45) DEFAULT NULL,
  `correct_answer` varchar(45) DEFAULT NULL,
  `language_type` varchar(45) DEFAULT NULL,
  `question_set` varchar(45) DEFAULT NULL,
  `question_type` varchar(45) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `results` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `answered_count` varchar(255) DEFAULT NULL,
  `correct_answer_count` varchar(255) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `questions` varchar(255) DEFAULT NULL,
  `total_count` varchar(255) DEFAULT NULL,
  `total_marks` varchar(255) DEFAULT NULL,
  `un_answered_count` varchar(255) DEFAULT NULL,
  `candidate_id` int(20) DEFAULT NULL,
  `result_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
);
CREATE TABLE `user_roles` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`),
  UNIQUE KEY `uni_userid_role` (`role`,`userid`),
  KEY `fk_user_idx` (`userid`),
  CONSTRAINT `fk_userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`)
);
CREATE TABLE `users` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(60) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
);
INSERT INTO `users` VALUES 
(1,'admin','admin@gmail.com','$2a$12$U6T2Y0QYqNJJhmroilGSJOcX00QKf/RWfd/86O..Z4QoGNCUvd2Fu',NULL,1);

INSERT INTO `user_roles` VALUES (1,1,'ROLE_ADMIN');
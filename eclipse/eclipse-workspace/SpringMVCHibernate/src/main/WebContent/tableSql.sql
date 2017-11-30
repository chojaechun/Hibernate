CREATE TABLE `board` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `userId` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `content` varchar(1000) NOT NULL,
  `count` int(11) NOT NULL,
  `date` date NOT NULL,
  `delchk` varchar(4) NOT NULL,
  PRIMARY KEY (`idx`),
  UNIQUE KEY `index_UNIQUE` (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8
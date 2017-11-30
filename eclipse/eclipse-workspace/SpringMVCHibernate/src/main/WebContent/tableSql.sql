CREATE TABLE `m_board` (
  `m_boardseq` int(11) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(15) NOT NULL,
  `m_title` varchar(45) NOT NULL,
  `m_content` varchar(1000) NOT NULL,
  `m_count` int(11) NOT NULL,
  `m_date` date NOT NULL,
  `m_delchk` varchar(4) NOT NULL,
  PRIMARY KEY (`m_boardseq`),
  UNIQUE KEY `index_UNIQUE` (`m_boardseq`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8

---------------------------------------------------------------------------------------
CREATE TABLE `m_user` (
  `m_userseq` int(11) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(15) CHARACTER SET latin1 NOT NULL,
  `m_username` varchar(15) CHARACTER SET latin1 NOT NULL,
  `m_usernik` varchar(15) CHARACTER SET latin1 NOT NULL,
  `m_userpass` varchar(20) CHARACTER SET latin1 NOT NULL,
  `m_useremail` varchar(45) CHARACTER SET latin1 NOT NULL,
  `m_userfiq` varchar(100) CHARACTER SET latin1 NOT NULL,
  `m_userfia` varchar(100) CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`m_userseq`),
  UNIQUE KEY `m_userid_UNIQUE` (`m_userid`),
  UNIQUE KEY `m_usernik_UNIQUE` (`m_usernik`),
  UNIQUE KEY `m_userseq_UNIQUE` (`m_userseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
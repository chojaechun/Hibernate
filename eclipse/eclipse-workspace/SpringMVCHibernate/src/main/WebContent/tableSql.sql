-- mysql 시 어느 DB에 저장할지 작성해야한다. myboard.m_board 이런식
CREATE TABLE `m_board` (
  `m_boardseq` int(11) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(15) NOT NULL,
  `m_title` varchar(45) NOT NULL,
  `m_content` varchar(1000) NOT NULL,
  `m_count` int(11) NOT NULL,
  `m_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_delchk` varchar(4) NOT NULL,
  PRIMARY KEY (`m_boardseq`),
  UNIQUE KEY `index_UNIQUE` (`m_boardseq`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8

---------------------------------------------------------------------------------------
CREATE TABLE `m_user` (
  `m_userseq` int(11) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(15) NOT NULL,
  `m_username` varchar(15) NOT NULL,
  `m_usernik` varchar(15) NOT NULL,
  `m_userpass` varchar(20) NOT NULL,
  `m_useremail` varchar(45)NOT NULL,
  `m_userquestion` varchar(100) NOT NULL,
  `m_useranswer` varchar(100) NOT NULL,
  PRIMARY KEY (`m_userseq`),
  UNIQUE KEY `m_userid_UNIQUE` (`m_userid`),
  UNIQUE KEY `m_usernik_UNIQUE` (`m_usernik`),
  UNIQUE KEY `m_userseq_UNIQUE` (`m_userseq`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8
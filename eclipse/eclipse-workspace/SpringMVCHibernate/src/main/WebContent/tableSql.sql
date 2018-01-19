-- mysql 시 어느 DB에 저장할지 작성해야한다. myboard.m_board 이런식
-- PK(PRIMARY KEY)와 UNIQUE KEY 와 중복해서 사용 하지 말자.
/*
 * Primary Key(기본키) : 해당 테이블의 식별자 역할을 하는 제약조건으로 테이블에 하나만 설정할 수 있음
 * Unique Key : 해당 칼럼에 입력되는 데이터가 각각 유일하다는 것을 보장하기 위한 제약조건으로 
 * 				한 테이블에 여러개 설정이 가능합니다. 물론, 기본키는 Unique key에 포함됩니다.
 * 
 * */
CREATE TABLE `m_board` (
  `m_boardseq` int(11) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(15) NOT NULL,
  `m_usernik` varchar(25) NOT NULL,
  `m_title` varchar(45) NOT NULL,
  `m_content` varchar(1000) NOT NULL,
  `m_count` int(11) NOT NULL,
  `m_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `m_delchk` varchar(4) NOT NULL,
  PRIMARY KEY (`m_boardseq`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
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
  UNIQUE KEY `m_usernik_UNIQUE` (`m_usernik`)
) ENGINE=InnoDB AUTO_INCREMENT=1  DEFAULT CHARSET=utf8
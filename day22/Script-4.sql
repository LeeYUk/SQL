CREATE TABLE department
(
	"학과" varchar2(100) primary key,
	"학과사무실" varchar2(100)
)

CREATE TABLE subject
(
	"강좌이름" varchar2(100) PRIMARY key,
	
	"강의실"  varchar2(100)
)

CREATE TABLE student_information
(
	"학생번호" number(38,0) PRIMARY key,
	"학생이름" varchar2(100),
	"주소" varchar2(100),
	"학과" varchar2(100)
)


CREATE TABLE "record"
(
	"학생번호" number(38,0),
	"강좌이름" varchar2(100),
	"강의실" float(22)
)

ALTER TABLE HR."record" RENAME COLUMN "강의실" TO "성적"


INSERT INTO HR.SUBJECT  VALUES ('자료구조','c101')

INSERT INTO HR.SUBJECT  VALUES ('c++','c102')

INSERT INTO HR.SUBJECT  VALUES ('윈도우즈프로그래밍','c103')


INSERT INTO HR.DEPARTMENT  VALUES ('컴공','e302')

INSERT INTO HR.STUDENT_INFORMATION  VALUES (1,'홍길동','창원','컴공')

INSERT INTO HR.STUDENT_INFORMATION  VALUES (2,'이순신','김해','컴공')

INSERT INTO HR.STUDENT_INFORMATION  VALUES (3,'김태희','부산','컴공')

INSERT INTO HR."record" VALUES (1,'자료구조',3.5)

INSERT INTO HR."record" VALUES (1,'c++',2.5)

INSERT INTO HR."record" VALUES (1,'윈도우즈프로그래밍',3.7)

INSERT INTO HR."record" VALUES (2,'윈도우즈프로그래밍',1.7)

SELECT * FROM HR.STUDENT_INFORMATION WHERE "학생번호" IN (SELECT "학생번호" FROM HR."record" WHERE "성적" = 1.7)


SELECT * FROM  "record" r  INNER JOIN STUDENT_INFORMATION si  ON  r.학생번호  = si.학생번호 

SELECT * FROM "record" r  LEFT OUTER JOIN STUDENT_INFORMATION si  ON (r.학생번호  =si.학생번호)

SELECT * FROM "record" r  right OUTER JOIN STUDENT_INFORMATION si  ON (r.학생번호  =si.학생번호)





CREATE TABLE music
(
	"가수" varchar2(100),
	"제목" varchar2(100),
	"순위" number(38,0)
)



CREATE TABLE genre
(
	"제목" varchar2(100) PRIMARY key,
	"장르" varchar2(100)
)

 -- CREATE TABLE playlist
--(
	--"가수" varchar2(100),
	--"장르" varchar2(100)
--)

DROP TABLE HR.PLAYLIST 

ALTER TABLE HR.MUSIC ADD "발매년도" varchar2(100)

INSERT INTO HR.MUSIC  VALUES ('뉴진스','Ditto',1,'2022')

INSERT INTO HR.MUSIC  VALUES ('BTS','Butter',2,'2021')

INSERT INTO HR.MUSIC  VALUES ('블랙핑크','ShutDown',3,'2022')

INSERT INTO HR.MUSIC  VALUES ('이승기','삭제',4,'2004')

INSERT INTO HR.MUSIC  VALUES ('데이식스','ShootMe',5,'2019')


INSERT INTO HR.GENRE  VALUES ('Ditto','아이돌')

INSERT INTO HR.GENRE  VALUES ('Butter','아이돌')

INSERT INTO HR.GENRE  VALUES ('ShutDown','힙합')

INSERT INTO HR.GENRE  VALUES ('삭제','발라드')

INSERT INTO HR.GENRE  VALUES ('ShootMe','락')


SELECT * FROM  MUSIC m  INNER JOIN GENRE g ON  m.제목  = g.제목 

SELECT * FROM MUSIC m  LEFT OUTER JOIN GENRE g  ON (m.제목  =g.제목)

SELECT * FROM MUSIC m  right OUTER JOIN GENRE g  ON (m.제목  =g.제목)


INSERT INTO MEMBER2 VALUES ('com','com','com','com')

UPDATE "MEMBER2" SET tel='999' WHERE id='com'

DELETE FROM MEMBER2 WHERE id='com'

SELECT * FROM MEMBER2 



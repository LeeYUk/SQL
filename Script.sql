CREATE TABLE "HR"."MEMBER"
(
	"ID" VARCHAR2(10),
	"PW" VARCHAR2(10),
	"NANE" VARCHAR2(10),
	"TEL" VARCHAR2(10)
)

CREATE TABLE "HR"."BBS"
(
	id varchar2(100),
	title varchar2(100),
	content varchar2(100),
	writer varchar2(100)
)

CREATE TABLE "HR".HR.PRODUCT
(
	id varchar2(200),
	name varchar2(200),
	content varchar2(200),
	price varchar2(200),
	company varchar2(200),
	img varchar2(200)
)

-- 한줄복사는 ctrl + alt + 화살표아래
-- 한줄삭제: ctrl + D
-- 저장할 대상: 엔티티(회원정보, 게시판, 상품), 엔티티간의 관계: 회원이 상품을 주문하다(주문정보)
-- 			 엔티티 + 관계 ==> 테이블로 만들기
CREATE TABLE HR.orderlist
(
	"no" varchar2(100),
	member_id varchar2(100),
	HR.PRODUCT_id varchar2(100),
	total_count varchar2(100)
)


CREATE TABLE HR.depart
(
	id varchar2(10),
	name varchar2(10),
	instructor varchar2(10)
)

CREATE TABLE HR.student
(
	id varchar2(10),
	name varchar2(10),
	tel varchar2(10),
	depart_id varchar2(10)
)

CREATE TABLE HR.subject
(
	id varchar2(10),
	title varchar2(10),
	depart_id varchar2(10)
)

ALTER TABLE HR.STUDENT MODIFY id NOT NULL

DROP TABLE HR.DEPART 

DROP TABLE HR.STUDENT 

DROP TABLE HR.SUBJECT 


CREATE TABLE HR.depart2
(
	id varchar2(10) NOT NULL PRIMARY key,
	name varchar2(10),
	instructor varchar2(10)
)

CREATE TABLE HR.student2
(
	id varchar2(10),
	name varchar2(10),
	tel varchar2(10),
	depart_id varchar2(10)
)

ALTER TABLE HR.STUDENT2 ADD CONSTRAINTS pk_st2 PRIMARY KEY (id)

ALTER TABLE HR.STUDENT2 ADD CONSTRAINTS fk_st2 FOREIGN KEY (depart_id) 
REFERENCES HR.depart2 (id)

DROP TABLE HR.depart2

DROP TABLE HR.STUDENT2

INSERT INTO HR."MEMBER" VALUES ('555','555','jung','011',sysdate)

SELECT * FROM HR."MEMBER"


INSERT INTO HR.BBS 
VALUES (HR.bbs_id_seq.nextval,'happy','happy day','ice')

SELECT * FROM HR."BBS"

CREATE TABLE HR.orderlist3
(
	id number(20,0),
	title varchar2(10),
	price number(20,0)
)


INSERT INTO HR.ORDERLIST3  
VALUES (HR.or_seq.nextval,'happy',12)

INSERT INTO HR.ORDERLIST3  
VALUES (HR.or_seq.nextval,'hi',15)

INSERT INTO HR.ORDERLIST3  
VALUES (HR.or_seq.nextval,'if',10)

SELECT * FROM HR.ORDERLIST3

SELECT * FROM HR.ORDERLIST3 ORDER BY id -- 오름차순

SELECT * FROM HR.ORDERLIST3 ORDER BY id DESC -- 내림차순

SELECT * FROM HR.ORDERLIST3 WHERE id>=3 ORDER BY id -- 3보다 


CREATE TABLE HR.DEPT
(
DEPTNO NUMBER(2),

DNAME VARCHAR2(14 BYTE),

LOC VARCHAR2(13 BYTE)
)


CREATE TABLE HR.EMP
(
EMPNO NUMBER(4),

ENAME VARCHAR2(10 BYTE),

JOB VARCHAR2(9 BYTE),

MGR NUMBER(4),

HIREDATE DATE,

SAL NUMBER(7,2),

COMM NUMBER(7,2),

DEPTNO NUMBER(2)
)


CREATE TABLE HR.SALGRADE
(
GRADE NUMBER,

LOSAL NUMBER,

HISAL NUMBER
)

SELECT * FROM HR.EMP -- selection

SELECT DEPTNO FROM HR.EMP -- projection

SELECT DISTINCT DEPTNO  FROM HR.EMP -- DISTINCT

SELECT ENAME,SAL * 12 AS yearsal FROM HR.EMP

SELECT * FROM HR.EMP ORDER BY SAL -- 오름차순

SELECT * FROM HR.EMP ORDER BY SAL DESC -- 내림차순

SELECT * FROM HR.EMP WHERE DEPTNO =30 ORDER BY EMPNO desc 

SELECT * FROM HR.EMP WHERE NOT DEPTNO =30 ORDER BY EMPNO desc 

SELECT * FROM HR.EMP WHERE DEPTNO =30 AND JOB ='SALESMAN'

SELECT * FROM HR.EMP WHERE DEPTNO =30 OR JOB ='SALESMAN'

SELECT * FROM HR.EMP WHERE SAL >=3000

SELECT * FROM HR.EMP WHERE SAL !=3000

SELECT * FROM HR.EMP WHERE JOB IN ('SALESMAN','MANAGER')

SELECT * FROM HR.EMP WHERE JOB IN ('SALESMAN','MANAGER') ORDER BY job

CREATE TABLE HR.dept_temp2 AS SELECT * FROM HR.DEPT

SELECT * FROM HR.dept_temp2




CREATE TABLE HR.product
(
	id varchar2(100),
	name varchar2(100),
	content varchar2(100),
	price number(38,0),
	company varchar2(100),
	img varchar2(100)
)

SELECT * FROM HR.PRODUCT ORDER BY PRICE DESC -- 내림차순 정렬후 전체컬럼 검색 
 
SELECT NAME ,CONTENT,PRICE,COMPANY  FROM HR.PRODUCT ORDER BY COMPANY -- COMPANY로 오름차순 정렬후 특정 엔티티 출력
 
SELECT DISTINCT COMPANY FROM HR.PRODUCT -- company의 목록을 검색(중복제거)
 
SELECT NAME, COMPANY FROM HR.PRODUCT WHERE PRICE =5000 -- PRICE가 5000인 제품명과 회사명
 
SELECT NAME,PRICE,COMPANY  FROM HR.PRODUCT WHERE PRICE = 3000 OR PRICE = 6000 -- 7
  
SELECT COMPANY, NAME FROM HR.PRODUCT WHERE COMPANY !='c100' -- 8
 
SELECT NAME, PRICE FROM HR.PRODUCT WHERE COMPANY  = 'c100' OR COMPANY = 'c200' -- 9

-- SELECT NAME, PRICE FROM HR.PRODUCT WHERE COMPANY  IN ('c100','c200')

-- SELECT *FROM HR.PRODUCT WHERE 

UPDATE HR.PRODUCT SET CONTENT ='품절' WHERE PRICE =5000 -- 12

SELECT  * FROM HR.PRODUCT 

UPDATE HR.PRODUCT SET IMG ='o.png' , PRICE =10000 WHERE ID IN ('100','102') -- 13

DELETE FROM  HR.PRODUCT WHERE COMPANY ='c100' -- 회사명이 c100인 경우 모든 정보 삭제

DELETE FROM "HR.PRODUCT" --테이블의 모든 정보 삭제





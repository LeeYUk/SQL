SELECT LENGTH (ID), LENGTH (NAME) FROM HR.PRODUCT -- 특정 컬럼의 문자열길이

SELECT CONCAT(id ,':') FROM HR.PRODUCT -- 특정 컬럼에 특정문자 합하기

-- SELECT id || ':' || FROM HR.PRODUCT 

SELECT LENGTH (trim(ename)) FROM HR.emp

SELECT LENGTH (ename) FROM HR.EMP 

SELECT TRIM(BOTH 'A' FROM ename) FROM HR.EMP -- 양쪽끝에 A를 제거

SELECT TRIM(LENGTH 'A' FROM ename) FROM HR.EMP --앞쪽에 A 를 제거

SELECT TRIM(TRAILING 'A' FROM ename) FROM HR.EMP -- 뒷쪽에 A를 제거

SELECT REPLACE (ename, ' ','') FROM HR.EMP --공백 제거

UPDATE HR.EMP SET COMM =0 WHERE COMM IS NULL 

SELECT *FROM  HR.EMP 

SELECT SAL + COMM AS tatal FROM HR.EMP
   

SELECT count(*) FROM HR.EMP

SELECT count(SAL) FROM HR.EMP

SELECT count(SAL) FROM HR.EMP WHERE JOB ='SALESMAN'

SELECT count(SAL),AVG(SAL),MIN(SAL),MAX(SAL)  FROM HR.EMP WHERE JOB ='SALESMAN'

SELECT JOB , count(SAL),AVG(SAL),MIN(SAL),MAX(SAL)  FROM HR.EMP GROUP BY JOB  

-- SELECT JOB , count(SAL),AVG(SAL),MIN(SAL),MAX(SAL) FROM HR.EMP GROUP BY JOB ORDER BY DESC  

-- HAVING COUNT(SAL)>=4 검색후 필터링 하고자하는경우
-- order by job desc --이미검색후 내림 차순


SELECT count(*) -- 1
FROM EMP e 

SELECT count(*) --2 
FROM EMP e 
WHERE DEPTNO = 20 OR MGR <= 7700


SELECT MIN(SAL) -- 3
FROM EMP e 
WHERE DEPTNO = 10 OR DEPTNO = 20

SELECT DEPTNO, avg(SAL) --4 
FROM EMP 
GROUP BY DEPTNO

SELECT DEPTNO, SUM(SAL) -- 5
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO 

SELECT DEPTNO, avg(SAL)-- 6
FROM EMP 
GROUP BY DEPTNO
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO DESC 

SELECT COUNT(*), AVG(SAL)  -- 7
FROM EMP 
WHERE JOB = 'MANAGER'

SELECT COUNT(*)  -- 8
FROM EMP 
WHERE ENAME LIKE '%S%'

SELECT COUNT(*)  -- 9
FROM EMP 
WHERE SAL >= 3000 AND COMM IS NOT NULL 
ORDER BY SAL DESC


CREATE TABLE "HR"."BBS2" 
   (	"no" NUMBER(38,0), 
	"TITLE" VARCHAR2(100), 
	"CONTENT" VARCHAR2(100), 
	"WRITER" VARCHAR2(100)
	)
	
CREATE TABLE "HR"."MEMBER2" 
 (	
   "ID" VARCHAR2(10), 
	"PW" VARCHAR2(10), 
	"NANE" VARCHAR2(10), 
	"TEL" VARCHAR2(10) 
)

-- join: 왜하는가? 검색을 하고싶은데 항목들이 여러개의 테이블에 흩어져있는 경우
-- 테이블을 모아서 (합해서) 검색
-- 2개의 테이블의 공통된 값들만 join해서 검색
SELECT * FROM  MEMBER2 m , BBS2 b WHERE m.ID =b.WRITER 

SELECT b."no" ,title, NANE  FROM  MEMBER2 m , BBS2 b WHERE m.ID =b.WRITER 


--- inner join:테이블간 공통된 값만 추출
-- emp테이블과 dept테이블을 조인하세요
-- 하나의 컬럼이상의 동일한 컬럼이 있어야 함
-- empno,ename,job,deptno,loc컬럼 검색
-- join조건: deptno

SELECT e.EMPNO ,e.ENAME ,e.JOB ,d.DEPTNO ,d.LOC FROM DEPT d , EMP e  WHERE d.DEPTNO = e.DEPTNO 

SELECT  * FROM  MEMBER2 m LEFT OUTER JOIN BBS2 b ON (m.ID=b.WRITER) -- LEFT jon

SELECT  * FROM  MEMBER2 m RIGHT OUTER JOIN BBS2 b ON (m.ID=b.WRITER) -- RIGHT JOIN

-- left/right outer join 
-- 1.emp테이블의 정보는 다보이게 하고 싶음, dept는 맞는 것만 오른쪽에 붙여주고 싶음
-- 2.dept테이블의 정보는 다보이게 하고 싶음, emp 맞는 것만 오른쪽에 붙여주고 싶음

SELECT * FROM EMP e LEFT OUTER JOIN DEPT d ON (e.DEPTNO =d.DEPTNO)

SELECT * FROM EMP e RIGHT OUTER JOIN DEPT d ON (e.DEPTNO =d.DEPTNO)


SELECT * FROM  MEMBER2 m , BBS2 b WHERE m.ID =b.WRITER

SELECT * FROM  MEMBER2 m LEFT OUTER JOIN BBS2 b ON (m.ID =b.WRITER) 

SELECT * FROM  MEMBER2 m RIGHT OUTER JOIN BBS2 b ON (m.ID =b.WRITER) 


CREATE TABLE company 
(
	id varchar2(100),
	name varchar2(100),
	addr varchar2(100),
	tel varchar2(100)
)

INSERT INTO company VALUES ('c100','good','seoul','011')

INSERT INTO company VALUES ('c200','joa','busan','012')

INSERT INTO company VALUES ('c300','maria','ulsan','013')

INSERT INTO company VALUES ('c400','my','kwangju','014')

SELECT * FROM COMPANY

-- select * FROM  COMPANY c ,PRODUCT p WHERE p.COMPANY = c.ID 

SELECT * FROM  COMPANY c INNER JOIN PRODUCT p  ON  p.COMPANY  = c.id 

SELECT * FROM PRODUCT p  LEFT OUTER JOIN COMPANY c  ON (p.COMPANY  =c.ID)

SELECT * FROM PRODUCT p  RIGHT OUTER JOIN COMPANY c  ON (p.COMPANY  =c.ID)
 
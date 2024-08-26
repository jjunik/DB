SELECT department_id FROM EMPLOYEES; 

SELECT employee_id, FIRST_name, salary FROM employees
WHERE DEPARTMENT_ID in(10,30) AND salary >= 1500;

-- 관리자가 없는 모든 사원에 이름 및 직종을 출력하세요
SELECT first_name , job_id FROM EMPLOYEES 
WHERE MANAGER_ID IS NULL;

-- it_porg or sa_man 급여 1000,3000, 5000 이 아난 사원들 이름 직종 급여
SELECT first_name, job_id, salary FROM EMPLOYEES 
WHERE JOB_ID IN('IT_PROG', 'SA_MAN') AND SALARY NOT IN(1000,3000,5000);

-- TBL_STUDENT
-- BAN_CHAR  체크 제약조건 위배
-- INSERT INTO TBL_STUDENT (ID, NAME,MAJOR,GENDER,BIRTH) VALUES(0,'홍길동', '컴공','A','1980-01-02');

-- BAN_DATE 체크제약조건을 위배
-- INSERT INTO TBL_STUDENT (ID, NAME,MAJOR,GENDER,BIRTH) VALUES(0,'홍길동', '컴공','A','1979-01-02');

-- PRIMARY KEY 중복 오류
-- INSERT INTO TBL_STUDENT (ID, NAME,MAJOR,GENDER,BIRTH) VALUES(1,'박디비', '컴공','W','1990-02-06');

SELECT * FROM TBL_STUDENT;

-- DEFAULT 값 사용해보기
INSERT INTO TBL_STUDENT (ID, NAME,MAJOR,BIRTH) VALUES(2,'홍길동', '컴공','1999-01-02');

-- INSERT 할 때 컬럼명을 생략하면 DEFAULT 값을 넣을 수 없다.
INSERT INTO TBL_STUDENT VALUES(0,'김자바', '컴공','1985-11-22');

-- FLOWER 테이블에 데이터 넣기
-- 꽃 이름, 꽃 색깔, 가격 / 장미꽃, 빨간색, 3000
-- INSERT INTO FLOWER(F_NAME,F_COLOR, F_PRICE) VALUES('장미꽃', '빨간색', 3000);
INSERT INTO FLOWER VALUES('장미꽃', '빨간색', 3000);
INSERT INTO FLOWER VALUES('해바라기', '노란색', 3000);
INSERT INTO FLOWER VALUES('튤립', '흰색', 3000);

-- POT 테이블에 데이터 추가
-- 화분번호, 색깔, 모양, 꽃이름
-- 화분테이블에 데이터를 추가할 때 꽃 테이블에 있는 꽃만 추가할 수 있다.
INSERT INTO POT VALUES (202408260001,'빨간색','네모','장미꽃');

CREATE TABLE FLOWER2(
F_NAME2 VARCHAR2(200) PRIMARY KEY,
	F_COLOR2 VARCHAR2(100),
	F_PRICE2 NUMBER
);

DROP TABLE FLOWER2;
-- 다른 테이블에 있는 데이터를 조회해서 추가하는것이 가능하다.
INSERT INTO FLOWER2(F_NAME2,F_COLOR2,F_PRICE2)
SELECT F_NAME, F_COLOR, F_PRICE
FROM FLOWER 
WHERE F_PRICE >= 4000;

SELECT * FROM FLOWER2;

INSERT ALL
	INTO FLOWER VALUES('할미꽃','보라색',5000)
	INTO FLOWER2 VALUES('백합','흰색',7000)
SELECT * FROM DUAL; // DUAL : 가상의 테이블

SELECT * FROM FLOWER F;
SELECT * FROM FLOWER2 F;

SELECT * FROM FLOWER ;
DELETE FROM FLOWER  WHERE F_NAME = '장미꽃';

-- PK와 FK로 연결된 테이블에서 외래키로 참조되고있는 데이터는
-- 부모 테이블에서 삭제가 불가능하다.
-- 자식테이블에서 먼저 삭제하고 난 후 삭제가능
DELETE FROM POT 
WHERE F_NAME = '장미꽃';

-- STUDENT 테이블에서 이름이 홍길동인 사람 삭제
DELETE FROM TBL_STUDENT
WHERE NAME = '홍길동';

SELECT * FROM TBL_STUDENT;

-- 학생테이블에서 학번이 1 인 학생으ㅜ ㅣ이름을 홍길동 성별은 남자로
UPDATE TBL_STUDENT 
SET NAME = '홍길동',
 GENDER = 'M'
WHERE ID = 1;

-- 회원과 관련된 기능
-- 로그인 -> SELECT
-- 회원가입 -> INSERT
-- 회원정보수정 -> UPDATE
-- 회원탈퇴 -> DELETE

-- 상품과 관련된 기능
-- 상품검색 -> SELECT
-- 상품추가 -> INSERT
-- 재고처리(100 -> 99) -> UPDATE
-- 상품삭제 -> DELETE

-- 사원 테이블에서 급여를 많이 받는 순서대로 사번, 이름, 급여 입사일 순을 ㅗ출력 급여가 같으면 입사일이 빠른순
SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY ,HIRE_DATE 
FROM EMPLOYEES 
ORDER BY SALARY DESC , HIRE_DATE ASC ;
-- 컬럼의 순서를 알고 있다면 번호로 정렬할 수 있다
-- ORDER BY '8' DESC, '6' ASC;

-- 사원테이블에서 부서번호가 빠른순, 부서번호가 같다면 직종이 빠른순,직종도 같다면 급여 많은 순
SELECT EMPLOYEE_ID ,FIRST_NAME ,DEPARTMENT_ID, JOB_ID, SALARY
FROM EMPLOYEES 
ORDER BY DEPARTMENT_ID ASC, JOB_ID ASC, SALARY DESC;

SELECT EMPLOYEE_ID ,FIRST_NAME ,SALARY, HIRE_DATE
FROM EMPLOYEES WHERE SALARY >= 15000
ORDER BY HIRE_DATE ASC;

--- 문자와 관련된 함수

--ASCII()
-- 지정된 문자의 ASCII값을 반환다.
SELECT ASCII('A') FROM DUAL

--CHR()
-- 지정된 숫자의 ASCCII 문자를 반환한다''
SELECT CHR(65) FROM 

-- RPAD(데이터, 고정길이, 문자)
-- 데이터를 왼쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정 문자를 채워 반환
SELECT RPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- LPAD(데이터, 고정길이, 문자)
-- 데이터를 오른쪽으로 몰아서 정렬 후 생긴 빈 공백에 특정 문자를 채워 반환
SELECT LPAD(DEPARTMENT_NAME,10,'*') FROM DEPARTMENTS;

-- TRIM()
-- 문자열의 공백문자들을 삭제한다.
SELECT TRIM('   TRIM   ') FROM DUAL;

-- RTRIM() 오른쪽 공백제거
-- LTRIM() 왼쪽 공백제거

-- INSTR()
-- 특정문자의 위치를 반환
SELECT INSTR('HELLOW', 'O') FROM DUAL;

-- INSTR(데이터, 찾을문자, 검색위치, 몇번째 나오는지)
SELECT INSTR('HELLOW', 'L', 1,2) FROM DUAL;

-- 찾는 문자열이 없으면 0을 반환한다.
SELECT INSTR('HELLOW', 'Z')FROM DUAL;

-- INITCAP()
-- 첫 문자를 대문자로 변환하는 함수
SELECT INITCAP('good/morning') FROM DUAL;

-- LENGTH()
-- 주어진 문자열의 길이를 반환
SELECT LENGTH('JHON') FROM DUAL;

-- CONCAT()
-- 주어진 두 문자열을 연결
SELECT CONCAT('HELLOW ', 'WORLD') FROM DUAL;

-- SUBSTR()
-- 문자열의 시작 위치부터 길이만큼 자른 후 반환
-- 길이는 생략 가능하며, 생략 시 문자열의 끝까지 반환한다.
SELECT SUBSTR ('Hello Oracle', 2), SUBSTR('Hello Oracle',7,5) FROM DUAL;

-- REPLACE(데이터, 원래글자, 바꿀글자)
SELECT REPLACE('GOOD MORNING','MORNING','EVENING') FROM DUAL;

-- UPPER()
-- 주어진 문자열을 전부 대문자로 바꾼다.
SELECT UPPER('good morning') FROM dual;
SELECT LOWER('GOOD MORNING') FROM DUAL;

-- 1.
SELECT REPLACE(FIRST_NAME,'el','**') FROM EMPLOYEES
WHERE DEPARTMENT_ID = 50;

-- 2.
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES
WHERE LENGTH(FIRST_NAME) >= 6;

-- 3.
SELECT REPLACE(' H E L L O ',' ','') FROM DUAL;

CREATE TABLE PRODUCT2(
 "NO" NUMBER PRIMARY KEY,
 NAME VARCHAR(100) NOT NULL,
 PRICE NUMBER,
 P_DATE DATE
);

INSERT INTO PRODUCT2 VALUES(1000,'컴퓨터',100,SYSDATE);
INSERT INTO PRODUCT2 VALUES(1002,'냉장고',200,'21/03/29');
INSERT INTO PRODUCT2 VALUES(1003,'에어컨',300,'20/12/15');
INSERT INTO PRODUCT2 VALUES(1004,'오디오',20,'20/12/15');
INSERT INTO PRODUCT2 VALUES(1001,'세탁기',60,'21/04/15');

SELECT * FROM PRODUCT2;

UPDATE PRODUCT2 SET 
PRICE = 120
WHERE "NO" = 1000;

DELETE FROM PRODUCT2
WHERE NAME = '세탁기';

SELECT "NO",NAME,PRICE,P_DATE FROM PRODUCT2
ORDER BY PRICE DESC ;
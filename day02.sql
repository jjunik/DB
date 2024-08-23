CREATE TABLE TBL_USER (
U_ID varchar2(100) PRIMARY KEY,
U_PW varchar2(100),
U_NAME varchar2(100),
U_ADDRESS VARCHAR2(100),
U_EMAIL VARCHAR2(100),
U_BIRTH DATE
);

CREATE TABLE PRODUCT(
P_NUM NUMBER PRIMARY KEY,
P_NAME VARCHAR2(100),
P_PRICE NUMBER,
P_COUNT NUMBER
);

CREATE TABLE TBL_ORDER(
O_NUM NUMBER PRIMARY KEY,
O_DATE DATE,
U_ID VARCHAR2(100),
P_NUM NUMBER,
CONSTRAINTS FK_U_ID FOREIGN KEY(U_ID) REFERENCES TBL_USER(U_ID),
CONSTRAINTS FK_P_NUM FOREIGN KEY(P_NUM) REFERENCES PRODUCT(P_NUM)
);


CREATE TABLE FLOWER(
	F_NAME VARCHAR2(100) PRIMARY KEY,
	F_COLOR VARCHAR2(100),
	F_PRICE NUMBER
);

CREATE TABLE POT(
	C_NUM NUMBER PRIMARY KEY,
	C_COLOR VARCHAR2(100),
	C_SHAPE VARCHAR2(100),
	F_NAME VARCHAR2(100),
	CONSTRAINTS FK_F_NAME FOREIGN KEY(F_NAME) REFERENCES FLOWER(F_NAME)
);

CREATE TABLE CD(
C_TITLE VARCHAR2(300) PRIMARY KEY,
PRICE NUMBER,
CATEGORY VARCHAR2(200),
TRACK_LIST VARCHAR2(100),
A_NAME VARCHAR2(100),
CONSTRAINT FK_CD FOREIGN KEY(A_NAME) REFERENCES ARTIST(A_NAME)
);

CREATE TABLE ARTIST(
A_NAME VARCHAR2(100) PRIMARY KEY,
A_COUNTRY VARCHAR(100),
A_DEBUT NUMBER
);

CREATE TABLE TRACK(
T_TITLE VARCHAR2(300) PRIMARY KEY,
RUNTIME NUMBER,
C_TITLE VARCHAR2(300),
CONSTRAINT FK_TITLE FOREIGN KEY(C_TITLE) REFERENCES CD(C_TITLE)
); 





CREATE TABLE EMPLOYEE(
E_NUM NUMBER PRIMARY KEY,
E_NAME VARCHAR2(100),
E_POSITION VARCHAR2(100),
M_NUM NUMBER,
CONSTRAINT FK_MAJOR FOREIGN KEY(M_NUM) MAJOR(M_NUM)
);

CREATE TABLE MAJOR(
M_NUM NUMBER PRIMARY KEY,
M_NAME VARCHAR2(100),
E_NAME VARCHAR2(100),
E_NUM NUMBER
);


CREATE TABLE E_FAMILY(
F_NAME VARCHAR2(100),
F_AGE NUMBER,
E_NUM NUMBER,
CONSTRAINT FK_EMP FOREIGN KEY(E_NUM) EMPLOYEE(E_NUM)
);

CREATE TABLE RECORD(
R_DATE DATE,
E_NUM NUMBER,
CONSTRAINT FK_EMP FOREIGN KEY(E_NUM) EMPLOYEE(E_NUM)
);

SELECT EMPLOYEE_ID,FIRST_NAME FROM EMPLOYEES;

SELECT * FROM COLS WHERE TABLE_NAME = 'EMPLOYEES';

-- 사원테이블의 모든 정보를 조회하세요
SELECT * FROM EMPLOYEES ;

-- DEPARTMENT 테이블의 모든 정보를 조회하세요
SELECT * FROM DEPARTMENTS ;

-- 사원테이블에서 이름, 직종, 급여를 조회
SELECT FIRST_NAME,JOB_ID,SALARY FROM EMPLOYEES;

SELECT EMPLOYEE_ID,FIRST_NAME,JOB_ID,SALARY,COMMISSION_PCT,SALARY*COMMISSION_PCT FROM EMPLOYEES;

-- 사원 테이블에서 급여가 10000 이상인 사원들의 정보를 사버느 이름, 급여순으로 출력
SELECT EMPLOYEE_ID,FIRST_NAME,SALARY FROM EMPLOYEES WHERE SALARY >= 10000;

-- 사원 테이블에서 이름이 MICHAEL 인 사원의 사번, 이름을 조회
-- 문자열 데이터 는 ''
SELECT EMPLOYEE_ID,FIRST_NAME FROM EMPLOYEES WHERE FIRST_NAME = 'Michael';

-- 사원테이블에서 직종이 IT_PROG 인 사원들의 정보를 사번, 이름, 직종 급여순으로 조회
SELECT EMPLOYEE_ID,FIRST_NAME ,JOB_ID,SALARY FROM EMPLOYEES WHERE JOB_ID = 'IT_PROG';

-- 사원테이블에서 급여가 10000이상 13000이하인 사원의 정보를 이름 급여 순으로 조회
SELECT FIRST_NAME, SALARY FROM EMPLOYEES WHERE 10000 <= SALARY AND SALARY <= 13000;

-- 사원테이블에서 입사일이 05년09월21일 이후에 입사한 사번 이름 입사일
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE >= '2005-09-21';

-- 사원테이블에서 2006년도에 입사한 사원들의 정보를 사번, 이름, 직종, 입사일순으로 출력
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE >= '2006-01-01' AND HIRE_DATE <= '2006-12-31';

-- 직종이 SA_MAN 이거나 IT_PROG 인 사원 모든정보
SELECT * FROM EMPLOYEES WHERE JOB_ID = 'SA_MAN' OR JOB_ID = 'IT_PROG';

-- 급여 2200,3200,5000,6000 사번 이름 직종 급여
SELECT EMPLOYEE_ID, FIRST_NAME,JOB_ID,SALARY FROM EMPLOYEES WHERE SALARY = 2200 OR SALARY = 3200 OR SALARY = 5000 OR SALARY = 6000;
-- BETWEEN
select employee_id, first_name, salary from employees where salary between 5000 and 6000;
-- IN(값,값,값)
SELECT  employee_id, first_name,JOB_ID, salary 
FROM EMPLOYEES 
WHERE SALARY IN (2200,3200,5000,6000);

SELECT * FROM EMPLOYEES WHERE JOB_ID NOT IN('SA_MAN', 'IT_PROG');

-- 사원테이블에서 사원들의 이름 중 M 으로 시작하는 사원들의 정보를 사벼느 이름 직종 순
SELECT employee_id, first_name,JOB_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE 'M%';

-- 이름이 d로 끝나는 사번 이름 직종
SELECT employee_id, first_name,JOB_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE '%d';

-- 이름에 A가 포함돼있는 이름 직종
SELECT first_name,JOB_ID FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a%';

-- 이름의 첫글자가 M 7글자 이름 사번 이름
SELECT employee_id, first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE 'M______';

-- 이름의 세번째 글자 a 사원들의 정보 사번 이름
SELECT employee_id, first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE '__a%';

-- 이름에 o 들어가면서 a로 끝나는 사원 이름 급여
SELECT first_name, SALARY FROM EMPLOYEES WHERE FIRST_NAME LIKE '%o%a'; 

-- 이름 H시작 6글자 이상 사원들 사번 이름
SELECT employee_id, first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE 'H_____%';

-- 사원테이블에서 s가 들어있지 않은 사원 사번 이름으로 검색
SELECT employee_id, first_name FROM EMPLOYEES WHERE FIRST_NAME NOT LIKE '%s%';

SELECT * FROM EMPLOYEES WHERE FIRST_NAME LIKE '%el%' OR FIRST_NAME LIKE '%en%';

-- 언더바 자체를 조회하고싶으면 이스케이프문자 '%\_%'; 를 써야 한다.
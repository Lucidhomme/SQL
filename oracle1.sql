SELECT  *
FROM    EMPLOYEE ;

-- SINGLELINE COMMENT
/*
MULTILINE COMMENT
*/

SELECT LOWEST , 
       HIGHEST
FROM   SAL_GRADE ;

SELECT JOB_ID,
       JOB_TITLE,
       MIN_SAL,
       MAX_SAL
FROM   JOB ;

SELECT *
FROM   EMPLOYEE ;

SELECT JOB_ID , DEPT_ID
FROM   EMPLOYEE ;

SELECT *
FROM   DEPARTMENT ;
--이름변경 시, AS생략가능(별칭은 숫자로 시작하거나 특수문자 및 공백이 있을경우 ""표시해주어야함)
SELECT EMP_NAME 이름,
       SALARY*12 AS "1년 급여",
       ( SALARY+( SALARY*BONUS_PCT))*12 AS "총 소득"
FROM   EMPLOYEE ;

SELECT EMP_ID,
       EMP_NAME,
       '재직' AS 근무여부
FROM   EMPLOYEE ;

SELECT DISTINCT DEPT_ID
FROM EMPLOYEE ;

SELECT DISTINCT JOB_ID, DEPT_ID
FROM EMPLOYEE ;

-- 행에 대한 제한은  WHERE 절로 작성하면 됨.
SELECT *
FROM EMPLOYEE 
WHERE DEPT_ID = 90 AND SALARY >= 5000000 ;

--사원테이블에서 90번부서나 20번 부서에 소속된 사원의 이름, 부서코드, 급여를 조회하세요
--논리합 OR 연산자 사용
SELECT DISTINCT EMP_NAME AS 이름,
                DEPT_ID AS 부서,
                SALARY AS 급여
FROM            EMPLOYEE
WHERE           (DEPT_ID = '20' 
OR              DEPT_ID = '90')
AND             SALARY >= 3000000 ;

SELECT EMP_ID ||EMP_NAME||SALARY
FROM   EMPLOYEE ;

SELECT EMP_NAME||'의 월급은'||SALARY||'원 입니다'
FROM   EMPLOYEE ;

SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
WHERE  SALARY BETWEEN 3500000 AND 5500000 ;

SELECT EMP_NAME, SALARY
FROM   EMPLOYEE
WHERE  EMP_NAME LIKE '김%' ;

SELECT EMP_NAME, PHONE
FROM   EMPLOYEE
WHERE  PHONE LIKE '___9_______' ;

SELECT *
FROM   EMPLOYEE ;

--사원테이블에서 EMAIL 앞자리가 3자리인 로우의 이름, 이메일 조회
SELECT EMP_NAME,
       EMAIL
FROM   EMPLOYEE
WHERE  EMAIL LIKE '____%' ;
--이 경우 기존의 언더바를 표현하기에 모호하므로 문자로 표현
SELECT EMP_NAME,
       EMAIL
FROM   EMPLOYEE
WHERE  EMAIL LIKE '___#_%' ESCAPE '#' ;

SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
WHERE  EMP_NAME NOT LIKE '김%' ;

SELECT EMP_NAME, 
       MGR_ID, 
       DEPT_ID
FROM   EMPLOYEE
WHERE  MGR_ID IS NULL 
AND    DEPT_ID IS NULL ;

SELECT EMP_NAME,
       MGR_ID,
       DEPT_ID
FROM   EMPLOYEE
WHERE  MGR_ID IS NOT NULL
AND    DEPT_ID IS NOT NULL ;

SELECT EMP_NAME, SALARY, DEPT_ID
FROM   EMPLOYEE
WHERE (DEPT_ID = '20'
OR DEPT_ID = '90')
AND SALARY >= '3000000' ;

----------------------------- 


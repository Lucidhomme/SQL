--UPDATE
--*서브쿼리 사용 시, WHERE조건에 중복된 데이터가 있는 경우 다중행이 조회될수도 있음
UPDATE DEPARTMENT
SET    DEPT_NAME = '전략기획팀'
WHERE  DEPT_ID = '90' ;

SELECT *
FROM   DEPARTMENT ;

UPDATE EMPLOYEE
SET    JOB_ID = (SELECT JOB_ID
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '성해교'),
       SALARY = (SELECT SALARY
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '성해교')
WHERE  EMP_NAME = '심하균' ;

SELECT *
FROM   EMPLOYEE ;
---결과값 조회에 다중행이 안걸리는 경우 이렇게도 처리가능함
UPDATE EMPLOYEE
SET    (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
                            FROM  EMPLOYEE
                            WHERE EMP_NAME = '성해교')
WHERE  EMP_NAME = '심하균' ;

SELECT *
FROM   EMPLOYEE ;

--디폴트는 무조건 사용가능한게 아니라 테이블 생성 시!! 디폴트옵션을 주었다면 업데이트에도 적용가능함
SELECT *
FROM EMPLOYEE ;

UPDATE EMPLOYEE
SET    MARRIAGE = DEFAULT
WHERE  EMP_ID = '210' ;

SELECT *
FROM   EMPLOYEE ;

--
UPDATE EMPLOYEE
SET    BONUS_PCT = 0.3
WHERE  DEPT_ID = (SELECT DEPT_ID
                  FROM   DEPARTMENT
                  WHERE  DEPT_NAME = '해외영업2팀');

SELECT DEPT_ID
                  FROM   DEPARTMENT
                  WHERE  DEPT_NAME = '해외영업2팀'; 
SELECT *
FROM   EMPLOYEE ;

--
---*(외래키 특징 : 부모키에 의존하거나 NULL값을 허용한다) 데이터가 들어있지않으면 수정가능하지만 데이터가 들어있는데 부모키로 지정된 컬럼은 수정이 불가능함(WHY? 외래키로 지정된애들이 있기때문에 무결성에 위배)
SELECT *
FROM   DEPARTMENT ;

UPDATE EMPLOYEE
SET    DEPT_ID = '65'
WHERE  DEPT_ID IS NULL ;
--
--타입,칼럼 개수 및 순서,사이즈가 맞아야함
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, EMAIL, PHONE, HIRE_DATE, JOB_ID, SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID)
VALUES               ('900', '811126-1484710','오윤하','oyuh@vcc.com','01012345678','06/01/01','J7',3000000,0,'N','176','90');

SELECT *
FROM   EMPLOYEE
WHERE  EMP_ID = '900';
--
--NULL값 입력(데이터입력 시 해당컬럼 생략하는 방법과 VALUES절에서 NULL이나 '' 사용)
--*묵시적방법
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, PHONE, HIRE_DATE, JOB_ID, SALARY, BONUS_PCT,MARRIAGE)
VALUES      ('880', '860412-2377610','한채연','0193382662','06/01/01','J7',3000000,0,'N');

SELECT *
FROM   EMPLOYEE ;
--*명시적방법
INSERT INTO EMPLOYEE
VALUES ('840', '하지언', '870115-2253408', 'ju_ha@vcc.com',NULL,'07/06/15','J7',NULL,NULL,'N','','');

SELECT *
FROM   EMPLOYEE ;

--DEFAULT사용
--디폴트설정이 된 컬럼은 디폴트로 나오지만 별도로 설정된 값이 없으면 NULL으로 입력됨
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, SALARY, MARRIAGE)
VALUES               ('860', '810429-2165344','선예진',DEFAULT,DEFAULT) ;

SELECT *
FROM   EMPLOYEE ;

--서브쿼리 이용해 인서트
CREATE TABLE EMP
(EMP_ID  CHAR(3),
 EMP_NAME VARCHAR2(20),
 DEPT_NAME VARCHAR2(20));
 
INSERT INTO EMP
(SELECT EMP_ID, EMP_NAME, DEPT_NAME
 FROM  EMPLOYEE
 LEFT OUTER JOIN  DEPARTMENT USING (DEPT_ID));

SELECT *
FROM   EMP;

SELECT *
FROM  JOB;

--부모키 자식키 관계에서 무결성고려해야하는 여부(부모키에 입력하거나 자식키에서 삭제하는거 이외에는 제약이 있음)
-------부모---자식
--입력  X      O
--수정  O      O
--삭제  O      X

---EMPLOYEE테이블에 부모키 DEPT_ID 중 45가 없음
INSERT INTO EMPLOYEE(EMP_ID, EMP_NO, EMP_NAME, DEPT_ID)
VALUES               ('990', '810116-2154219','김태휘','45');

SELECT *
FROM   EMPLOYEE ;

--DELETE(DROP은 테이블삭제고 DELETE는 특정행만 날리겠다!)

--Location테이블에 location_ID로 전이시키는 부모의 역할
DELETE FROM DEPARTMENT
WHERE LOC_ID NOT LIKE 'A%';

SELECT *
FROM   DEPARTMENT ;

--테이블 내 전체데이터를 삭제할때 TRUNCATE사용(롤백 불가능(테이블에 바로 반영), 제약조건 있으면 사용불가)
--COMMIT(MEAN:테이블에 반영하겠습니다), ROLLBACK(MEAN : 테이블에 반영하지 않겠습니다)
--조건걸고 삭제하는 건 배우지않음

--RESTRICTED DELETE
DELETE FROM JOB
WHERE JOB_ID = 'J2';

DELETE FROM EMPLOYEE
WHERE  EMP_ID = '141';

--TRANSACTION
--하나의 집합과정으로 은행에서 입출금할때 꺼낸계좌와 들어간 계좌의 작업이 같이 끝나야 커밋/롤백이 가능함. 정상적으로 못끝내면 다시 원복
--DML구문시작될때 시작해서 DDL구문 시작될때 트랜잭션 자동종료되서 롤백이 안되니 유의!!

 
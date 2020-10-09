CREATE TABLE TEST
(ID   NUMBER(5),
 NAME CHAR(10),
 ADDRESS VARCHAR2(50)
 ) ;
 
SELECT *
FROM   TEST ;

CREATE TABLE TABLE_NOTNULL
(ID  CHAR(3) NOT NULL,
 SNAME VARCHAR2(20)) ;
 
INSERT INTO TABLE_NOTNULL
VALUES ('100', 'ORACLE') ;
INSERT INTO TABLE_NOTNULL
VALUES (NULL,'ORACLE') ;

--������ ������ ������ �����ͺ��̽����� �ߺ��� �����Ͱ� ���� ���ü� ����
CREATE TABLE TABLE_NOTNULL2
 (ID   CHAR(3)
  SNAME VARCHAR2(20),
  CONSTRAINT TN2_ID_NN NOT NULL (ID)) ;
  
--DDL
--CREATE TABLE
--Pascal case : StudentEntity (Ŭ������ ���鶧 ���̾�)
--Came case : numberOfGrade (�Լ������Ҷ� ���̾�)
--Snake case : service_member_tbl (���������Ҷ� ���̾�)

DROP TABLE StudentEntity ;

CREATE TABLE StudentEntity(
   SSN   VARCHAR2(50), 
   NAME  VARCHAR2(20), 
   GENDER CHAR(1),
   ADDRESS VARCHAR2(50),
   JOB   VARCHAR2 (100),
   PRIMARY KEY(SSN, NAME)
  );
--������ �����̸Ӹ�(���� �÷����� �����̸Ӹ� Ű 2�������ȵɶ� ����)


INSERT INTO StudentEntity
VALUES ('830910-1xxxxxx', '������', 'M', 'SEOUL', 'INSTRUCTOR') ;

INSERT INTO StudentEntity
VALUES ('830910-2xxxxxx', '�Ӽ���', 'M', 'SEOUL', 'INSTRUCTOR') ;

--�⺻Ű�� ������ ������ �����͸� ����� ����
--UNIQUE+NOT NULL = PRIMARY KEY
--REFERENCE TABLE�� ���� �θ�Ű�� �����ϴ� �ܷ�Ű�� ���� NULL�� ���
--NOT_NULL�� ���̺��� ������ ������ �Ŵ� ���´� �ȵ�


CREATE TABLE StudentEntitysub(
     PHONE   VARCHAR2(13) PRIMARY KEY,
     MAJOR   VARCHAR2(50),
     SSN     VARCHAR2(50),
     NAME   VARCHAR2(20),
     FOREIGN KEY (SSN, NAME) REFERENCES StudentEntity(SSN, NAME) );
--������ �����̸Ӹ�Ű�� ���� �Ѿ�ü� �ֱ⶧���� �÷������� REFERENCE �ȵ�
    
SELECT *
FROM   StudentEntity ;
    
INSERT INTO StudentEntitysub
VALUES ('010-0000-0000', '�濵�а�', '900000-0000000', '��ƹ���') ;
--�ְ����ϴ� ���̺��� �ܷ�Ű�� �θ�Ű�� ���ǵ� �����Ͱ�(SSN, NAME)�� ���ų� NULL���� �ƴϱ� ������ ����

INSERT INTO StudentEntitysub
VALUES ('010-0000-0000', '�濵�а�', NULL, NULL) ;

SELECT *
FROM   StudentEntitysub ;




CREATE TABLE TABLE_FK
(ID   CHAR(3),
 SNAME VARCHAR2(20),
 LID   CHAR(2) REFERENCES LOCATION (LOCATION_ID));

INSERT INTO TABLE_FK
VALUES ('200', 'ORACLE', 'A1');

INSERT INTO TABLE_FK
VALUES ('100', 'ORACLE', NULL) ;

INSERT INTO TABLE_FK
VALUES (NULL, 'ORACLE', 'U1') ;

SELECT *
FROM   TABLE_FK ;

CREATE TABLE TABLE_FK2
(ID    CHAR(10),
 SNAME VARCHAR2(20),
 GENDER VARCHAR2(5));

INSERT INTO TABLE_FK2
VALUES ('100', 'ORACLE', 'U1') ;


SELECT *
FROM   TABLE_FK2 ;

SELECT *
FROM   TABLE_FK
JOIN   TABLE_FK2 USING(ID) ;


DROP TABLE TABLE_FK3 ;

CREATE TABLE TABLE_FK3
(ID CHAR(3),
 SNAME VARCHAR2(20),
 LID CHAR(2),
 FOREIGN KEY(LID)REFERENCE LOCATION(LOCATION_ID)) ;
 

CREATE TABLE StudentEntity(
   SSN   VARCHAR2(50) PRIMARY KEY,
   NAME  VARCHAR2(20) NOT NULL,
   GENDER CHAR(1),
   ADDRESS VARCHAR2(50),
   JOB   VARCHAR2 (100)
  );

INSERT INTO StudentEntity
VALUES ('830910-1xxxxxx', '������', 'M', 'SEOUL', 'INSTRUCTOR') ;

INSERT INTO StudentEntity
VALUES ('830910-1xxxxxx', '������', 'M', 'SEOUL', 'INSTRUCTOR') ;  
--�ߺ�x 
INSERT INTO StudentEntity
VALUES (NULL, '������', 'M', 'SEOUL', 'INSTRUCTOR') ;   
--NULL�� ���X  
INSERT INTO StudentEntity(NAME, GENDER, ADDRESS, JOB)
VALUES ('������', 'M', 'SEOUL', 'INSTRUCTOR') ;     
--���������� NULL������ �ν�

INSERT INTO StudentEntity
VALUES ('830910-1xxxxxx', '������', 'MALE', 'SEOUL', 'INSTRUCTOR') ;
--����� ��������

SELECT *
FROM   StudentEntity ;
  

DROP TABLE StudentEntity ;
--�θ�Ű�� �ڽİ��� ���踦 �ΰ��������� �θ�Ű�� �ش��ϴ� ���̺� ����� ��������?? �̷����� �������� �����÷����� �����ɶ� ����Ű �÷����� ���� �����ϵ��� �� �� ������ �̿������ؾ���

CREATE TABLE TABLE_CHECK
(EMP_ID    CHAR(3) PRIMARY KEY,
 SALARY    NUMBER CHECK (SALARY >0),
 MARRIAGE  CHAR(1),
 CONSTRAINT CHK_MRG CHECK(MARRIAGE IN ('Y', 'N')) ) ;

INSERT INTO TABLE_CHECK
VALUES ('100', -100, 'Y') ;

INSERT INTO TABLE_CHECK
VALUES ('100', 500, '?') ;

CREATE TABLE STUDENT(
     STU_ID NUMBER PRIMARY KEY) ;

CREATE TABLE SUBJECT(
     SJT_ID NUMBER PRIMARY KEY) ;

CREATE TABLE ENROLL(
     STU_ID NUMBER,
     SJT_ID NUMBER,               
     PRIMARY KEY(STU_ID, SJT_ID),
     FOREIGN KEY(STU_ID) REFERENCES STUDENT(STU_ID),
     FOREIGN KEY(SJT_ID) REFERENCES SUBJECT(SJT_ID)
) ;
    
CREATE TABLE ENROLL(
     STU_ID NUMBER REFERENCES STUDENT(STU_ID),
     SJT_ID NUMBER REFERENCES SUBJECT(SJT_ID),               
     PRIMARY KEY(STU_ID, SJT_ID),
) ;


CREATE TABLE TABLE_SUBQUERY2 (EID, ENAME, SALARY, DNAME, JTITLE)
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_NAME, JOB_TITLE
   FROM EMPLOYEE
   LEFT JOIN DEPARTMENT USING(DEPT_ID)
   LEFT JOIN JOB USING(JOB_ID) ;

SELECT *
FROM   TABLE_SUBQUERY2 ;

--�ַ� �������� �� ��� �б��������� ���� ���
--�������̺�� ������� ��� ���۰��������� ��Ƽ���̺�� ������� ��� ���ۺҰ���
CREATE OR REPLACE VIEW V_EMP
AS SELECT EMP_NAME, DEPT_ID
   FROM   EMPLOYEE
   WHERE  DEPT_ID = '90' ;
   
SELECT *
FROM   V_EMP ;

SELECT COLUMN_NAME, DATA_TYPE, NULLABLE
FROM   USER_TAB_COLS
WHERE  TABLE_NAME = 'V_EMP' ;

CREATE OR REPLACE VIEW V_EMP_DEPT_JOB
AS SELECT EMP_NAME,
          DEPT_NAME,
          JOB_TITLE
FROM  EMPLOYEE
LEFT JOIN DEPARTMENT USING(DEPT_ID)
LEFT JOIN JOB USING(JOB_ID)
WHERE JOB_TITLE = '���' ;

CREATE OR REPLACE VIEW V_EMP (ENAME,Gender,WORKYEAR)
AS SELECT EMP_NAME,
          DECODE(SUBSTR(EMP_NO, 8,1),'1','����','3','����','����'),
          ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12, 0)
FROM  EMPLOYEE ;

CREATE OR REPLACE VIEW V_DEPT_SALAVG("Did", "Davg")
AS SELECT NVL(DEPT_ID, 'N/A'),
          ROUND(AVG(SALARY),-3)
FROM      EMPLOYEE
GROUP BY  DEPT_ID ;

SELECT EMP_NAME, SALARY
FROM   EMPLOYEE
JOIN   V_DEPT_SALAVG ON(NVL(DEPT_ID, 'N/A') = "Did")
WHERE  SALARY > "Davg"
ORDER BY 2 DESC ;

SELECT ROWNUM, EMP_NAME, SALARY
FROM  (SELECT NVL(DEPT_ID,'N/A')AS "Did",
              ROUND(AVG(SALARY),-3) AS "Davg"
       FROM  EMPLOYEE
       GROUP BY DEPT_ID) INLV
JOIN  EMPLOYEE ON(NVL(DEPT_ID, 'N/A') = INLV."Did")
WHERE SALARY > INLV."Davg"
ORDER BY 3 DESC ;
---SALARY�� �������� ���������ϴϱ� �ο���� ����

SELECT ROWNUM, EMP_NAME, SALARY
FROM  (SELECT NVL(DEPT_ID,'N/A')AS "Did",
              ROUND(AVG(SALARY),-3) AS "Davg"
       FROM  EMPLOYEE
       GROUP BY DEPT_ID) INLV
JOIN  EMPLOYEE ON(NVL(DEPT_ID, 'N/A') = INLV."Did")
WHERE SALARY > INLV."Davg" 
AND   ROWNUM <= 5;
---�ο���� ���� ���ڸ� ���ڴ��� �ֻ����� �������� 2��,3�� ��������, ��� ������ �����ѵ� ���� ���ļ����� ���������� �����ϰ� �ο���� �ο��ؾ���  ex)TOP5

SELECT ROWNUM, EMP_NAME, SALARY
FROM  (SELECT EMP_NAME, SALARY
       FROM  (SELECT NVL(DEPT_ID,'N/A')AS "Did",
                     ROUND(AVG(SALARY),-3) AS "Davg"
              FROM  EMPLOYEE
              GROUP BY DEPT_ID) INLV
       JOIN  EMPLOYEE ON(NVL(DEPT_ID, 'N/A') = INLV."Did")
       WHERE SALARY > INLV."Davg"
       ORDER BY 2 DESC)
WHERE   ROWNUM <= 5;

CREATE SEQUENCE TEST_SEQ ;
-- NEXTVAL
-- CURRVAL

SELECT TEST_SEQ.NEXTVAL
FROM  DUAL ;

SELECT TEST_SEQ.CURRVAL
FROM   DUAL ;






--DML (������ ���۾�)
--INSERT
INSERT INTO ���̺��([�÷�����, �÷�, ....])
VALUES (��, ��, .....) ;
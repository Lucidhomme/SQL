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
--�̸����� ��, AS��������(��Ī�� ���ڷ� �����ϰų� Ư������ �� ������ ������� ""ǥ�����־����)
SELECT EMP_NAME �̸�,
       SALARY*12 AS "1�� �޿�",
       ( SALARY+( SALARY*BONUS_PCT))*12 AS "�� �ҵ�"
FROM   EMPLOYEE ;

SELECT EMP_ID,
       EMP_NAME,
       '����' AS �ٹ�����
FROM   EMPLOYEE ;

SELECT DISTINCT DEPT_ID
FROM EMPLOYEE ;

SELECT DISTINCT JOB_ID, DEPT_ID
FROM EMPLOYEE ;

-- �࿡ ���� ������  WHERE ���� �ۼ��ϸ� ��.
SELECT *
FROM EMPLOYEE 
WHERE DEPT_ID = 90 AND SALARY >= 5000000 ;

--������̺��� 90���μ��� 20�� �μ��� �Ҽӵ� ����� �̸�, �μ��ڵ�, �޿��� ��ȸ�ϼ���
--���� OR ������ ���
SELECT DISTINCT EMP_NAME AS �̸�,
                DEPT_ID AS �μ�,
                SALARY AS �޿�
FROM            EMPLOYEE
WHERE           (DEPT_ID = '20' 
OR              DEPT_ID = '90')
AND             SALARY >= 3000000 ;

SELECT EMP_ID ||EMP_NAME||SALARY
FROM   EMPLOYEE ;

SELECT EMP_NAME||'�� ������'||SALARY||'�� �Դϴ�'
FROM   EMPLOYEE ;

SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
WHERE  SALARY BETWEEN 3500000 AND 5500000 ;

SELECT EMP_NAME, SALARY
FROM   EMPLOYEE
WHERE  EMP_NAME LIKE '��%' ;

SELECT EMP_NAME, PHONE
FROM   EMPLOYEE
WHERE  PHONE LIKE '___9_______' ;

SELECT *
FROM   EMPLOYEE ;

--������̺��� EMAIL ���ڸ��� 3�ڸ��� �ο��� �̸�, �̸��� ��ȸ
SELECT EMP_NAME,
       EMAIL
FROM   EMPLOYEE
WHERE  EMAIL LIKE '____%' ;
--�� ��� ������ ����ٸ� ǥ���ϱ⿡ ��ȣ�ϹǷ� ���ڷ� ǥ��
SELECT EMP_NAME,
       EMAIL
FROM   EMPLOYEE
WHERE  EMAIL LIKE '___#_%' ESCAPE '#' ;

SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
WHERE  EMP_NAME NOT LIKE '��%' ;

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


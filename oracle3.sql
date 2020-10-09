SELECT *
FROM   EMPLOYEE ;

SELECT EMP_NAME, SALARY, NVL(BONUS_PCT,0)
FROM   EMPLOYEE
WHERE  SALARY > 3500000 ;

SELECT EMP_NAME,
       (SALARY*12)+((SALARY*12)*BONUS_PCT)
FROM   EMPLOYEE
WHERE  SALARY > 3500000 ;

SELECT EMP_NAME,
       (SALARY*12)+((SALARY*12)*NVL(BONUS_PCT,0))
FROM   EMPLOYEE
WHERE  SALARY > 3500000 ;

SELECT EMP_NAME,
       EMP_NO,
       SUBSTR(EMP_NO, -7, 1),
       DECODE(SUBSTR(EMP_NO, -7, 1),'1','����','2','����') AS GENDER,
       DECODE(SUBSTR(EMP_NO, -7, 1),'1','����','3','����','����') AS GENDER2
FROM   EMPLOYEE
WHERE  DEPT_ID = '50' ;

SELECT *
FROM   EMPLOYEE 
WHERE  JOB_ID = 'J4' ;

SELECT EMP_NAME,
       DECODE(MGR_ID, NULL, '������','����')
FROM   EMPLOYEE
WHERE  JOB_ID = 'J4' ;

SELECT EMP_NAME,
       MGR_ID,
       NVL2(MGR_ID, '����', '������') AS ����
FROM   EMPLOYEE
WHERE  JOB_ID = 'J4' ;


SELECT *
FROM   JOB ;

SELECT *
FROM   EMPLOYEE ;

--���(j7) 20 �븮(j6) 15 ����(j5) 10 ���� �����λ�

SELECT EMP_NAME,
       JOB_ID,
       SALARY,
       DECODE(JOB_ID,'J7',(SALARY*1.2),'J6',(SALARY*1.15),'J5',(SALARY*1.1)) AS �����λ�������
FROM   EMPLOYEE 
WHERE  JOB_ID = 'J5' OR JOB_ID = 'J6' OR JOB_ID = 'J7';

SELECT EMP_NAME,
       JOB_ID,
       SALARY,
       CASE JOB_ID WHEN 'J7' THEN (SALARY*1.2) 
                   WHEN 'J6' THEN (SALARY*1.15) 
                   WHEN 'J5' THEN (SALARY*1.1) ELSE SALARY 
       END AS �����λ�������
FROM   EMPLOYEE 
WHERE  JOB_ID = 'J5' OR JOB_ID = 'J6' OR JOB_ID = 'J7';

SELECT EMP_NAME,
       JOB_ID,
       SALARY,
       CASE WHEN JOB_ID = 'J7' THEN SALARY*1.2 
            WHEN JOB_ID = 'J6' THEN SALARY*1.15 
            WHEN JOB_ID = 'J5' THEN SALARY*1.1 ELSE SALARY 
            END AS �λ�޿� 
FROM   EMPLOYEE 
WHERE  JOB_ID = 'J5' OR JOB_ID = 'J6' OR JOB_ID = 'J7';


--������̺��� �޿��� �������� ����� �޿������ Ȯ���ϰ� �ʹ�(�޿��� 3000000���ϸ� �ʱ�, 4000000���ϸ� �߱�, 4000000�ʰ��� ��ް�����)
SELECT *
FROM   EMPLOYEE ;

SELECT  EMP_NAME,
        JOB_ID,
        SALARY,
        CASE WHEN SALARY <= 3000000 THEN '�ʱް�����' 
             WHEN SALARY > 3000000 AND SALARY <= 4000000 THEN '�߱ް�����' 
             WHEN SALARY > 4000000 THEN '��ް�����' 
        END AS �޿����
FROM    EMPLOYEE ;

--�������̴� ������ ���������� �������� ���;��ϰ� ����Ʈ�� ���,NULL�� ���������ΰ��� NULLS LAST��밡��
SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
WHERE  DEPT_ID = '50'
OR     DEPT_ID IS NULL
ORDER BY SALARY DESC ;

SELECT EMP_NAME,
       HIRE_DATE,
       DEPT_ID
FROM   EMPLOYEE
WHERE  HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY DEPT_ID DESC NULLS LAST, HIRE_DATE, EMP_NAME ;

SELECT EMP_NAME AS �̸�,
       HIRE_DATE AS �Ի���,
       DEPT_ID AS �μ��ڵ�
FROM   EMPLOYEE
WHERE  HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY �μ��ڵ� DESC, �Ի���, �̸� ;

SELECT EMP_NAME AS �̸�,
       HIRE_DATE AS �Ի���,
       DEPT_ID AS �μ��ڵ�
FROM   EMPLOYEE
WHERE  HIRE_DATE > TO_DATE('20030101', 'YYYYMMDD')
ORDER BY 3 DESC, 2,1 ;


--�׷��Լ��� ����ϱ����� �׷��� �̾��� �־����.�ܵ����ΰ� �ƴ� �׷���� ���� ���

--�����Լ�(�׷����)����Ҷ� SELECT���� �׷��Լ��� ���� �Ϲ��÷��� ������ �� ����
--ex)SELECT DEPT_ID,
--          SUM(SALARY)
--    FROM  EMPLOYEE ;

--�׷���̸� ����ϸ� SELECT���� ��밡���ϴ�
--SELECT DEPT_ID,
--SUM(SALARY)
--FROM   EMPLOYEE 
--GROUP BY DEPT_ID 
--ORDER BY 2 ;

--�׷�������� ��õ� ���� �������� �����Լ��� �־ ���� ���ǵ� �� �ִ�
--(�������� �������� ����ϱ� ���ؼ��� �׷���̿� ���γ־����, �Լ���ø����Ҷ��� �׷���̿� ��õǾ��־ ����� ��������)
--ex) SELECT DEPT_ID
--           MAX(SUM(SALARY))
--    FROM  EMPLOYEE
--    GROUP BY DEPT_ID ;

SELECT DEPT_ID,
       SUM(SALARY)
FROM   EMPLOYEE 
GROUP BY DEPT_ID 
ORDER BY 2 ;

SELECT *
FROM   EMPLOYEE ;

SELECT JOB_ID,
       ROUND(AVG(SALARY))
FROM   EMPLOYEE 
GROUP BY JOB_ID 
ORDER BY 2 ;

SELECT 
       DECODE(SUBSTR(EMP_NO, 8,1),'1','����','3','����','����') AS ����,
       ROUND(AVG(SALARY)) 
FROM   EMPLOYEE
GROUP BY DECODE(SUBSTR(EMP_NO, 8,1),'1','����','3','����','����') ;

---- �׷�Ұ谪 �������ϴ� �Լ� ROLLUP
--ex) GROUP BY ROLLUP(DEPT_ID, EMP_NAME)
SELECT DEPT_ID,
       EMP_NAME,
       COUNT(*)
FROM  EMPLOYEE
GROUP BY ROLLUP(DEPT_ID, EMP_NAME) ;

--WHERE�� (����)���̺� ���� ����, HAVING�� �׷쿡 ���� ����(WHERE�������� �����Լ� ��� �Ұ���)
SELECT DEPT_ID, SUM(SALARY)
FROM   EMPLOYEE
GROUP BY DEPT_ID
HAVING SUM(SALARY) > 9000000 ;

SELECT DEPT_ID, SUM(SALARY)
FROM   EMPLOYEE
WHERE  SUM(SALARY) > 9000000
GROUP BY DEPT_ID ;


SELECT *
FROM   EMPLOYEE ;

SELECT EMP_NAME,
       DEPT_NAME
FROM   EMPLOYEE E, DEPARTMENT D
WHERE  E.DEPT_ID = D.DEPT_ID ;
--Equals ����,DEPT_ID�� �α��� �־ �ָŸ�ȣ��

SELECT EMP_NAME,
       DEPT_NAME
FROM   EMPLOYEE E
JOIN   DEPARTMENT D USING(DEPT_ID) ;
--ANSI ǥ��, �����̺� ���� �⺻Ű�� �ܷ�Ű ���踦 �ΰ��־ Į������ �ٸ��� ON���� ��밡��

SELECT DEPT_NAME,
       LOC_DESCRIBE
FROM   LOCATION L
JOIN   DEPARTMENT D ON(LOCATION_ID = LOC_ID) ;


SELECT EMP_NAME,
       SALARY,
       SLEVEL
FROM   EMPLOYEE E, SAL_GRADE S
WHERE  SALARY BETWEEN LOWEST AND HIGHEST ;
--NOT Equals ����, �������� LOWEST�� HIGHEST ���̿� �ִ�

SELECT EMP_NAME,
       SALARY,
       SLEVEL,
       JOB_TITLE
FROM   EMPLOYEE E, SAL_GRADE S, JOB J
WHERE  SALARY BETWEEN LOWEST AND HIGHEST 
AND    E.JOB_ID = J.JOB_ID ;

SELECT EMP_NAME,
       SALARY,
       SLEVEL,
       JOB_TITLE,
       DEPT_NAME
FROM   EMPLOYEE E, SAL_GRADE S, JOB J, DEPARTMENT D
WHERE  SALARY BETWEEN LOWEST AND HIGHEST 
AND    E.JOB_ID = J.JOB_ID 
AND    E.DEPT_ID = D.DEPT_ID ;

SELECT EMP_NAME,
       SALARY,
       SLEVEL
FROM   EMPLOYEE E
JOIN   SAL_GRADE S ON(SALARY BETWEEN LOWEST AND HIGHEST) ;

SELECT *
FROM   EMPLOYEE ;

SELECT *
FROM   DEPARTMENT ;

SELECT EMP_NAME,
       DEPT_NAME,
       D.DEPT_ID
FROM   DEPARTMENT D, EMPLOYEE E
WHERE  D.DEPT_ID = E.DEPT_ID(+) ;

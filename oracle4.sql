--������ equals join(�⺻Ű�� �ܷ�Ű ���谡�ִ� ����)�� NOT equals join(�⺻Ű�� �ܷ�Ű ����X)���� ������
--ANSIǥ�ؿ��� USING������ �̿��Ѱ� = equals join(���踦 ���� ���̺����), ON������ �̿��� �� = NOT equals join(���踦 �������ʴ� ���̺� ����)
--LEFT,RIGHT,FULL �����Ǵ� ���� ����
--����Ŭ������ (+)�� �ݴ����� ������ �����Ͱ� ���� EX) D.DEPT_ID(+) = E.DEPT_ID ; : E.DEPT_ID�� ������ ������ ���� 
--NATURAL, CROSS ���� ���� ��� X
--���̺��� �������� Ű�� �ִ��� �������� �θ�Ű�� �ܷ�Ű�� �Ǿ�� ���踦 ���� �� ����

SELECT EMP_NAME, DEPT_NAME
FROM   EMPLOYEE
JOIN   DEPARTMENT USING(DEPT_ID)
WHERE  JOB_ID = 'J6' ;

SELECT EMP_NAME, LOC_ID
FROM   EMPLOYEE2
JOIN   DEPARTMENT USING(DEPT_ID, LOC_ID) ;

SELECT DEPT_NAME,
       LOC_DESCRIBE
FROM   DEPARTMENT
JOIN   LOCATION ON(LOC_ID = LOCATION_ID) ;

SELECT EMP_NAME, DEPT_NAME
FROM   EMPLOYEE
LEFT JOIN DEPARTMENT USING (DEPT_ID) ;

SELECT EMP_NAME, DEPT_NAME
FROM   EMPLOYEE
RIGHT JOIN DEPARTMENT USING (DEPT_ID) ;

SELECT EMP_NAME, DEPT_NAME
FROM   EMPLOYEE
FULL JOIN DEPARTMENT USING (DEPT_ID) ;

SELECT *
FROM   EMPLOYEE ;

SELECT E.EMP_NAME AS ����,
       M.EMP_NAME AS ������,
       P.EMP_NAME AS ��ް�����
FROM   EMPLOYEE E
LEFT JOIN   EMPLOYEE M ON (E.MGR_ID = M.EMP_ID)
LEFT JOIN   EMPLOYEE P ON (M.MGR_ID = P.EMP_ID)
ORDER BY 1 ;

SELECT EMP_NAME,
       JOB_TITLE,
       DEPT_NAME
FROM   EMPLOYEE 
JOIN   JOB USING(JOB_ID)
JOIN   DEPARTMENT USING(DEPT_ID)
ORDER  BY 1 ;

SELECT EMP_NAME,
       JOB_TITLE,
       DEPT_NAME,
       LOC_DESCRIBE,
       COUNTRY_NAME,
       SLEVEL
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
JOIN   DEPARTMENT USING(DEPT_ID)
JOIN   LOCATION ON(LOC_ID = LOCATION_ID)
JOIN   COUNTRY USING(COUNTRY_ID)
JOIN   SAL_GRADE ON(SALARY BETWEEN LOWEST AND HIGHEST) 
ORDER BY 1 ;

SELECT COUNTRY_NAME,
       LOC_DESCRIBE,
       DEPT_NAME,
       EMP_NAME,
       JOB_TITLE,
       SLEVEL
FROM   COUNTRY
JOIN   LOCATION USING(COUNTRY_ID)
RIGHT JOIN   DEPARTMENT ON(LOCATION_ID = LOC_ID)
RIGHT JOIN   EMPLOYEE USING(DEPT_ID)
JOIN   JOB USING(JOB_ID)
JOIN   SAL_GRADE ON(SALARY BETWEEN LOWEST AND HIGHEST)
ORDER BY 6 ;

SELECT EMP_NAME,
       DEPT_NAME
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
JOIN   DEPARTMENT USING(DEPT_ID)
JOIN   LOCATION ON(LOC_ID=LOCATION_ID)
WHERE  JOB_TITLE='�븮'
AND    LOC_DESCRIBE LIKE '�ƽþ�%' ;

SELECT EMP_ID,
       ROLE_NAME
FROM   EMPLOYEE_ROLE  
MINUS
SELECT EMP_ID,
       ROLE_NAME
FROM   ROLE_HISTORY ;

SELECT EMP_NAME,
       JOB_ID,
       HIRE_DATE
FROM   EMPLOYEE
WHERE  DEPT_ID = '20' 
UNION
SELECT DEPT_NAME,
       DEPT_ID,
       NULL
FROM   DEPARTMENT
WHERE  DEPT_ID = '20' ;


SELECT EMP_NAME,
       EMP_NO,
       JOB_ID
FROM   EMPLOYEE
WHERE  DEPT_ID = '20'
UNION
SELECT DEPT_NAME,
       DEPT_ID
FROM   DEPARTMENT
WHERE  DEPT_ID = '20' ;


SELECT EMP_NAME,
       TO_CHAR(SALARY)
FROM   EMPLOYEE
WHERE  DEPT_ID = '20'
UNION
SELECT DEPT_NAME,
       DEPT_ID
FROM   DEPARTMENT
WHERE  DEPT_ID = '20' 
ORDER BY 2 ;

SELECT EMP_ID,
       EMP_NAME,
       '������' AS ����
FROM   EMPLOYEE
WHERE  EMP_ID = '141'
AND    DEPT_ID = '50'
UNION
SELECT EMP_ID,
       EMP_NAME,
       '����' AS ����
FROM   EMPLOYEE
WHERE  DEPT_ID = '50'
AND    EMP_ID != '141' ;

SELECT *
FROM   EMPLOYEE ;

SELECT EMP_ID,
       EMP_NAME,
       CASE WHEN EMP_ID = 141 THEN '������'
       ELSE '����'
       END AS ����
FROM   EMPLOYEE
WHERE  DEPT_ID = '50' ;

SELECT EMP_NAME,
       '���'����
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '���'
UNION
SELECT EMP_NAME, 
       '�븮'����
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '�븮'
ORDER BY 2,1 ;


SELECT EMP_NAME,
       JOB_ID,
       SALARY
FROM   EMPLOYEE
WHERE  JOB_ID = (SELECT JOB_ID
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '���¿�')
AND    SALARY > (SELECT SALARY
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '���¿�') ;

SELECT EMP_NAME,
       JOB_ID,
       SALARY
FROM   EMPLOYEE
WHERE  SALARY = (SELECT MIN(SALARY)
                 FROM EMPLOYEE) ;
                 
SELECT EMP_NAME,
       JOB_ID,
       SALARY
FROM   EMPLOYEE
WHERE  SALARY = (SELECT MAX(SALARY)
                 FROM EMPLOYEE) ;
                 
SELECT DEPT_NAME,
       SUM(SALARY)
FROM   EMPLOYEE
LEFT JOIN   DEPARTMENT USING(DEPT_ID)
GROUP  BY DEPT_ID, DEPT_NAME 
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                      FROM EMPLOYEE
                      GROUP BY DEPT_ID) ;
--�� �������� ������ �� ������ ���ƾ��ϰ� �������� Ÿ���� ���ƾ���
--NOT IN ���� NULL�� ���� �������� �ȵ�

SELECT EMP_ID,
       EMP_NAME,
       '������' AS ����
FROM   EMPLOYEE
WHERE  EMP_ID IN (SELECT MGR_ID FROM EMPLOYEE)
UNION
SELECT EMP_ID,
       EMP_NAME,
       '����'
FROM   EMPLOYEE
WHERE  EMP_ID NOT IN (SELECT MGR_ID FROM EMPLOYEE
                      WHERE  MGR_ID IS NOT NULL)
ORDER BY 3,1;

SELECT *
FROM   EMPLOYEE ;

SELECT EMP_ID,
       EMP_NAME,
       '������' AS ����
FROM   EMPLOYEE
WHERE  EMP_ID IN (SELECT MGR_ID FROM EMPLOYEE)
UNION
SELECT EMP_ID,
       EMP_NAME,
       '����'
FROM   EMPLOYEE
WHERE  EMP_ID NOT IN (SELECT MGR_ID FROM EMPLOYEE
                     WHERE MGR_ID IS NOT NULL)
ORDER BY 3,1;


SELECT EMP_ID,
       EMP_NAME,
       CASE WHEN MGR_ID IS NOT NULL THEN '������'
       ELSE '����'
       END AS ����
FROM   EMPLOYEE
ORDER BY 3,1 ; 

SELECT EMP_ID,
       EMP_NAME,
       CASE WHEN EMP_ID IN (SELECT MGR_ID FROM EMPLOYEE) THEN '������'
       ELSE '����'
       END AS ����
FROM   EMPLOYEE
ORDER BY 3,1 ;

---�������� ��õ� ��������
--A >ALL B   B�ִ밪���� ū A
--A <ALL B   B�ּҰ����� ����A
--A <ANY B  B�ִ밪���� ���� A
--A >ANY B  B�ּҰ����� ū A
SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '�븮'
AND    SALARY > ANY (SELECT SALARY
                     FROM   EMPLOYEE
                     JOIN   JOB USING(JOB_ID)
                     WHERE  JOB_TITLE = '����');
                     
SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '�븮'
AND    SALARY < ANY (SELECT SALARY
                     FROM   EMPLOYEE
                     JOIN   JOB USING(JOB_ID)
                     WHERE  JOB_TITLE = '����');

SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '�븮'
AND    SALARY > ALL (SELECT SALARY
                     FROM   EMPLOYEE
                     JOIN   JOB USING(JOB_ID)
                     WHERE  JOB_TITLE = '����');
                     
SELECT EMP_NAME,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  JOB_TITLE = '�븮'
AND    SALARY < ALL (SELECT SALARY
                     FROM   EMPLOYEE
                     JOIN   JOB USING(JOB_ID)
                     WHERE  JOB_TITLE = '����');
                     
--1. ���޺� ��ձ޿�(����� ���Ǹ� ���ؼ� ����5�ڸ����� ����)
SELECT *
FROM   EMPLOYEE ;


SELECT JOB_ID,
       TRUNC(AVG(SALARY),-5) AS ���޺���ձ޿�
FROM   EMPLOYEE
GROUP BY JOB_ID 
ORDER BY 1 ;

SELECT JOB_TITLE,
       TRUNC(AVG(SALARY),-5) AS ���޺���ձ޿�
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
GROUP BY JOB_TITLE 
ORDER BY 1 ;

--2. ��ձ޿��� �޴� ������ �̸�, ����, �޿��� ��ȸ
SELECT EMP_NAME,
       JOB_TITLE,
       SALARY
FROM   EMPLOYEE
JOIN   JOB USING(JOB_ID)
WHERE  (JOB_ID, SALARY) IN (SELECT JOB_ID, TRUNC(AVG(SALARY),-5)
                        FROM   EMPLOYEE
                        GROUP BY JOB_ID);
--�������� ���߿� ��������(WHERE���� ��������)

SELECT EMP_NAME,
       JOB_TITLE,
       SALARY
FROM   (SELECT JOB_ID, TRUNC(AVG(SALARY),-5) AS JOB_AVG
        FROM   EMPLOYEE
        GROUP BY JOB_ID) V
JOIN   EMPLOYEE E ON(SALARY = JOB_AVG AND E.JOB_ID = V.JOB_ID)
JOIN   JOB J ON(J.JOB_ID = E.JOB_ID)
ORDER BY JOB_TITLE ;
--UPDATE
--*�������� ��� ��, WHERE���ǿ� �ߺ��� �����Ͱ� �ִ� ��� �������� ��ȸ�ɼ��� ����
UPDATE DEPARTMENT
SET    DEPT_NAME = '������ȹ��'
WHERE  DEPT_ID = '90' ;

SELECT *
FROM   DEPARTMENT ;

UPDATE EMPLOYEE
SET    JOB_ID = (SELECT JOB_ID
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '���ر�'),
       SALARY = (SELECT SALARY
                 FROM   EMPLOYEE
                 WHERE  EMP_NAME = '���ر�')
WHERE  EMP_NAME = '���ϱ�' ;

SELECT *
FROM   EMPLOYEE ;
---����� ��ȸ�� �������� �Ȱɸ��� ��� �̷��Ե� ó��������
UPDATE EMPLOYEE
SET    (JOB_ID, SALARY) = (SELECT JOB_ID, SALARY
                            FROM  EMPLOYEE
                            WHERE EMP_NAME = '���ر�')
WHERE  EMP_NAME = '���ϱ�' ;

SELECT *
FROM   EMPLOYEE ;

--����Ʈ�� ������ ��밡���Ѱ� �ƴ϶� ���̺� ���� ��!! ����Ʈ�ɼ��� �־��ٸ� ������Ʈ���� ���밡����
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
                  WHERE  DEPT_NAME = '�ؿܿ���2��');

SELECT DEPT_ID
                  FROM   DEPARTMENT
                  WHERE  DEPT_NAME = '�ؿܿ���2��'; 
SELECT *
FROM   EMPLOYEE ;

--
---*(�ܷ�Ű Ư¡ : �θ�Ű�� �����ϰų� NULL���� ����Ѵ�) �����Ͱ� ������������� �������������� �����Ͱ� ����ִµ� �θ�Ű�� ������ �÷��� ������ �Ұ�����(WHY? �ܷ�Ű�� �����Ⱦֵ��� �ֱ⶧���� ���Ἲ�� ����)
SELECT *
FROM   DEPARTMENT ;

UPDATE EMPLOYEE
SET    DEPT_ID = '65'
WHERE  DEPT_ID IS NULL ;
--
--Ÿ��,Į�� ���� �� ����,����� �¾ƾ���
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, EMAIL, PHONE, HIRE_DATE, JOB_ID, SALARY, BONUS_PCT, MARRIAGE, MGR_ID, DEPT_ID)
VALUES               ('900', '811126-1484710','������','oyuh@vcc.com','01012345678','06/01/01','J7',3000000,0,'N','176','90');

SELECT *
FROM   EMPLOYEE
WHERE  EMP_ID = '900';
--
--NULL�� �Է�(�������Է� �� �ش��÷� �����ϴ� ����� VALUES������ NULL�̳� '' ���)
--*���������
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, PHONE, HIRE_DATE, JOB_ID, SALARY, BONUS_PCT,MARRIAGE)
VALUES      ('880', '860412-2377610','��ä��','0193382662','06/01/01','J7',3000000,0,'N');

SELECT *
FROM   EMPLOYEE ;
--*��������
INSERT INTO EMPLOYEE
VALUES ('840', '������', '870115-2253408', 'ju_ha@vcc.com',NULL,'07/06/15','J7',NULL,NULL,'N','','');

SELECT *
FROM   EMPLOYEE ;

--DEFAULT���
--����Ʈ������ �� �÷��� ����Ʈ�� �������� ������ ������ ���� ������ NULL���� �Էµ�
INSERT INTO EMPLOYEE (EMP_ID, EMP_NO, EMP_NAME, SALARY, MARRIAGE)
VALUES               ('860', '810429-2165344','������',DEFAULT,DEFAULT) ;

SELECT *
FROM   EMPLOYEE ;

--�������� �̿��� �μ�Ʈ
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

--�θ�Ű �ڽ�Ű ���迡�� ���Ἲ����ؾ��ϴ� ����(�θ�Ű�� �Է��ϰų� �ڽ�Ű���� �����ϴ°� �̿ܿ��� ������ ����)
-------�θ�---�ڽ�
--�Է�  X      O
--����  O      O
--����  O      X

---EMPLOYEE���̺� �θ�Ű DEPT_ID �� 45�� ����
INSERT INTO EMPLOYEE(EMP_ID, EMP_NO, EMP_NAME, DEPT_ID)
VALUES               ('990', '810116-2154219','������','45');

SELECT *
FROM   EMPLOYEE ;

--DELETE(DROP�� ���̺������ DELETE�� Ư���ุ �����ڴ�!)

--Location���̺� location_ID�� ���̽�Ű�� �θ��� ����
DELETE FROM DEPARTMENT
WHERE LOC_ID NOT LIKE 'A%';

SELECT *
FROM   DEPARTMENT ;

--���̺� �� ��ü�����͸� �����Ҷ� TRUNCATE���(�ѹ� �Ұ���(���̺� �ٷ� �ݿ�), �������� ������ ���Ұ�)
--COMMIT(MEAN:���̺� �ݿ��ϰڽ��ϴ�), ROLLBACK(MEAN : ���̺� �ݿ����� �ʰڽ��ϴ�)
--���ǰɰ� �����ϴ� �� ���������

--RESTRICTED DELETE
DELETE FROM JOB
WHERE JOB_ID = 'J2';

DELETE FROM EMPLOYEE
WHERE  EMP_ID = '141';

--TRANSACTION
--�ϳ��� ���հ������� ���࿡�� ������Ҷ� �������¿� �� ������ �۾��� ���� ������ Ŀ��/�ѹ��� ������. ���������� �������� �ٽ� ����
--DML�������۵ɶ� �����ؼ� DDL���� ���۵ɶ� Ʈ����� �ڵ�����Ǽ� �ѹ��� �ȵǴ� ����!!

 
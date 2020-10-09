-- basic select
-- 1.�� ������б��� �а��̸��� �迭 ǥ��(��� ��� "�а� ��", "�迭")
SELECT *
FROM   TB_DEPARTMENT ;

SELECT DEPARTMENT_NAME AS "�а� ��", 
       CATEGORY AS "�迭"
FROM   TB_DEPARTMENT ;

-- 2. �а��� �а�����

SELECT DEPARTMENT_NAME||'�� ������'||CAPACITY||'�� �Դϴ�'
FROM   TB_DEPARTMENT ;

-- 3. ������а� �ٴϴ� ���л� �� ���� �������� ���л��� ã�ƶ�

SELECT DEPARTMENT_NO
FROM   TB_DEPARTMENT
WHERE  DEPARTMENT_NAME = '������а�' ; 

SELECT STUDENT_NAME, ABSENCE_YN
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = '001' 
AND    ABSENCE_YN = 'Y'
AND    STUDENT_SSN LIKE '_______2%' ;

SELECT STUDENT_SSN
FROM   TB_STUDENT ; 

-- 4. ���������� ���⵵�� ��⿬ü�ڵ��� ã�� �̸��� �Խ��Ѵ�
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO, STUDENT_NAME
FROM   TB_STUDENT
WHERE  STUDENT_NO = 'A513079'
OR STUDENT_NO = 'A513090'
OR STUDENT_NO = 'A513091'
OR STUDENT_NO = 'A513110'
OR STUDENT_NO = 'A513119' ;

--5. ���������� 20���̻� 30�� ������ �а����� �а� �̸��� �迭
SELECT DISTINCT DEPARTMENT_NAME, CATEGORY
FROM   TB_DEPARTMENT
WHERE  CAPACITY >= '20'
AND    CAPACITY <= '30' ;


--6. ������ �����ϰ�� ��� �������� �Ҽ� �а��� ������ �ִ�.�̶� �� ������б� ������ �̸��� �˾Ƴ���
SELECT DEPARTMENT_NO, PROFESSOR_NAME
FROM   TB_PROFESSOR ;

SELECT PROFESSOR_NAME
FROM   TB_PROFESSOR
WHERE  DEPARTMENT_NO IS NULL ;

--7. ����� ������ �а��� �����Ǿ� ���� ���� �л�Ȯ��
SELECT STUDENT_NAME
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO IS NULL ;

--8. ���������� �����ϴ� ������� ��������� �����ȣ ��ȸ
SELECT CLASS_NO
FROM   TB_CLASS
WHERE  PREATTENDING_CLASS_NO IS NOT NULL ;

--9. �� ���б� �迭 ��ȸ
SELECT DISTINCT CATEGORY
FROM   TB_DEPARTMENT ;

--10. 02�й� ���ְ����ڸ����� ��������ϴµ� ���л��� �����ϰ� �������� �л����� �й� �̸� �ֹι�ȣ�� ����϶�
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO, 
       STUDENT_NAME,
       STUDENT_SSN
FROM   TB_STUDENT
WHERE  ABSENCE_YN = 'N'
AND    ENTRANCE_DATE LIKE '02%'
AND    STUDENT_ADDRESS LIKE '���ֽ�%' ;
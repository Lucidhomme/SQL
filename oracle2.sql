SELECT *
FROM   COLUMN_LENGTH ;

SELECT LENGTH(CHARTYPE),
       LENGTH(VARCHARTYPE)
FROM   COLUMN_LENGTH ;      

SELECT *
FROM   EMPLOYEE ;

SELECT EMAIL,
       INSTR(EMAIL,'c',-1,2) ��ġ
FROM   EMPLOYEE ;

SELECT EMAIL,
       INSTR(EMAIL,'c',INSTR(EMAIL, '.')-1 ) ��ġ
FROM   EMPLOYEE ;

SELECT EMAIL AS ����������,
       LENGTH(EMAIL) AS ��������,
       LPAD(EMAIL, 20,'.') AS ������,
       LENGTH(LPAD(EMAIL, 20, '.')) AS �������
FROM   EMPLOYEE ;

SELECT EMAIL ����������,
       LENGTH(EMAIL) ��������,
       RPAD(EMAIL, 20, '.') ������,
       LENGTH(LPAD(EMAIL, 20, '.')) �������
FROM   EMPLOYEE ;

--TRIM���� '123'�� 123�� �ƴ϶� 1�Ǵ� 2�Ǵ� 3�� �������� ����, ������ ��ҹ��� ����
SELECT LTRIM('   tech')
FROM   DUAL ;

SELECT LTRIM('   tech', '.')
FROM   DUAL ;

SELECT LTRIM('000123', '0')
FROM   DUAL ;

SELECT LTRIM('123123tech', '123')
FROM  DUAL ;

SELECT LTRIM('123123tech123', '123')
FROM DUAL ;

SELECT LTRIM('xyxzyytech', 'xyz') 
FROm DUAL ;

SELECT LTRIM('6372tech', '01234567889')
FROM DUAL ;

SELECT RTRIM('tech   ')
FROM   DUAL ;

SELECT RTRIM('tech...', '.')
FROM   DUAL ;

SELECT RTRIM('tech11123', '123')
FROM   DUAL ;

SELECT RTRIM('123tech123', '123')
FROM   DUAL ;

SELECT RTRIM('XYZtechXYZ', 'XYZ')
FROm   DUAL ;

SELECT RTRIM('xyztechXyz', 'Xyz')
FROm   DUAL ;

SELECT TRIM('  tech  ')
FROM   DUAL ;

SELECT TRIM('a' FROM 'aatechaaa')
FROM   DUAL ;

SELECT TRIM(LEADING '0' FROM '000123')
FROM   DUAL ;

SELECT TRIM(TRAILING '1' FROM 'TECH1') 
FROM   DUAL ;

SELECT TRIM(BOTH '1' FROM '123tech111')
FROM   DUAL ;

SELECT TRIM(LEADING '.' FROM '..tech..')
FROM   DUAL ;
--------------TRIM���� '123'�� 123�� �ƴ϶� 1�Ǵ� 2�Ǵ� 3�� �������� ����, ������ ��ҹ��� ����

SELECT SUBSTR('This is a test', 6, 2) 
FROM   DUAL ;

SELECT SUBSTR('This is a test', 6)
FROM   DUAL ;

SELECT SUBSTR('�̰��� �����Դϴ�', 3, 4)
FROm   DUAL ;

SELECT SUBSTR('TechOnTheNet', 1, 4)
FROM   DUAL ;

SELECT SUBSTR('TechOnTheNet', -3,3)
FROm   DUAL ;

SELECT SUBSTR('TechOnTheNet', -6,3)
FROM   DUAL ;

SELECT SUBSTR('TechOnTheNet', -8,2)
FROM   DUAL ;

SELECT *
FROM   EMPLOYEE ;

-- ������̺��� �Ի����Ͽ��� �Ի�⵵�� ����ϼ���!!
-- "            ����� �̸��Ͽ��� ���Ͼ��̵� ����ϼ���!!
SELECT SUBSTR(HIRE_DATE, 1, 2)
FROM   EMPLOYEE ;

SELECT EMAIL,
       SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1)
FROM   EMPLOYEE ;

SELECT EMAIL,
       SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1)
FROM   EMPLOYEE
WHERE  LENGTH(SUBSTR(EMAIL, 1, INSTR(EMAIL, '@')-1)) >= 6 ;

SELECT ROUND(125.315)
FROM   DUAL ;

SELECT ROUND(125.315, 0)
FROM   DUAL ; 

SELECT ROUND(125.315, -1)
FROM   DUAL ; 

SELECT ROUND(125.315, 3)
FROM  DUAL ;

SELECT ROUND(-125.315, -1)
FROM  DUAL ;

SELECT TRUNC(125.315, -1)
FROM   DUAL ;

SELECT TRUNC(-125.315, -3)
FROM   DUAL ;

SELECT SYSDATE
FROM   DUAL ;

---������̺��� �Ի����� �������� �ٹ������� 20���� �Ǵ� ���ڸ� ��ȸ�϶�
SELECT *
FROM   EMPLOYEE ;

SELECT HIRE_DATE,
       ADD_MONTHS(HIRE_DATE, 240)
FROM   EMPLOYEE ;

---���� ��¥�� �������� �ټӳ���� 20�� �̻��� ����� �̸�, �Ի���, �ټӳ���� ��ȸ�ϼ���
SELECT SYSDATE
FROM   DUAL ;

SELECT *
FROM   EMPLOYEE ;

SELECT EMP_NAME AS �̸�,
       HIRE_DATE AS �Ի���,
       TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE) / 12) AS �ټӳ��
FROM   EMPLOYEE 
WHERE  MONTHS_BETWEEN(SYSDATE, HIRE_DATE) >= 240 ;

SELECT *
FROM   EMPLOYEE ;

SELECT SUBSTR(EMP_NO, 1, 6) AS "���ڸ�",
       SUBSTR(EMP_NO, 8) AS "���ڸ�",
       SUBSTR(EMP_NO, 1, 6) + SUBSTR(EMP_NO, 8),
       TO_NUMBER(SUBSTR(EMP_NO , 1, 6) ) + TO_NUMBER(SUBSTR(EMP_NO , 8) )
FROM   EMPLOYEE ;

--������̺��� ���� ����� �̸�, �ֹι�ȣ�� ��ȸ�ϼ���!
SELECT *
FROM   EMPLOYEE ;

SELECT EMP_NO,
       EMP_NAME
FROM   EMPLOYEE 
WHERE  SUBSTR(EMP_NO, 8, 1) = 2 ;

SELECT EMP_NO,
       EMP_NAME
FROM   EMPLOYEE 
WHERE  TO_NUMBER(SUBSTR(EMP_NO, 8, 1) ) = 2 ;

--���ڶ�� �ؼ� �� �׳� ������ ���� ���ڿ��� ���ڳ� ��¥�� ���ΰ� ''ǥ��
--����Ŭ���� DUAL�̶�� �������̺� ����
--CHAR(20)�̸� �����϶��� �״�� 20 ȣ���ϰ� CHAR(20)�̸� �ѱ��϶��� �÷�����(20����Ʈ)-�����ͱ���(�ѱ� 1����=3����Ʈ�϶� �������������̸� x6���ڸ� 18����Ʈ)=2����Ʈ, ������������ + (�÷����̿��� �����ͱ��� �� ���� 2����Ʈ) = 8

SELECT TO_CHAR(1234, '99999') 
FROM   DUAL ;

SELECT TO_CHAR(1234, '09999')
FROM   DUAL ;

SELECT TO_CHAR(1234, 'L99999')
FROM   DUAL ;

SELECT TO_CHAR(1234, '99,999')
FROM   DUAL ;

SELECT TO_CHAR(1234, '09,999')
FROM   DUAL ;

SELECT TO_CHAR(1234, '999')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'PM HH24:MI:SS')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'AM HH:MI:SS')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'MON DY, YYYY')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'YYYY-fmMM-DD DAY')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'YYYY-MM-fmDD DAY')
FROM   DUAL ;

SELECT TO_CHAR(SYSDATE, 'Year, Q')
FROM   DUAL ;

SELECT EMP_NAME AS �̸�,
       TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') AS �Ի���
FROM   EMPLOYEE
WHERE  JOB_ID = 'J7' ;

SELECT EMP_NAME AS �̸�,
       TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��"') AS �Ի���
FROM   EMPLOYEE
WHERE  JOB_ID = 'J7' ;

SELECT EMP_NAME AS �̸�,
       SUBSTR(HIRE_DATE,1,2) ||'��'|| SUBSTR(HIRE_DATE,4,2) ||'��'|| SUBSTR(HIRE_DATE,7,2) ||'��' AS �Ի���
FROM   EMPLOYEE
WHERE  JOB_ID = 'J7' ;

SELECT EMP_NAME AS �̸�,
       HIRE_DATE AS �⺻�Ի���,
       TO_CHAR(HIRE_DATE, 'YYYY/MM/DD HH24:MI:SS') AS ���Ի���
FROM   EMPLOYEE
WHERE  JOB_ID IN('J1', 'J2') ;

SELECT EMP_NAME
FROM   EMPLOYEE
WHERE  HIRE_DATE = '04/04/30' ;

SELECT EMP_NAME
FROM   EMPLOYEE
WHERE  HIRE_DATE = '90/04/01' ;
--��¥������ �������� ��/�ϸ������� �񱳰��������� ��¥������ �������� �񱳺Ұ���(�̷����� �ٸ� ������ �ʿ�)
SELECT EMP_NAME,
       HIRE_DATE
FROM   EMPLOYEE
WHERE  HIRE_DATE = TO_DATE('900401 133030', 'YYMMDD HH24MISS') ;

SELECT EMP_NAME,
       HIRE_DATE
FROM   EMPLOYEE
WHERE  TO_CHAR(HIRE_DATE, 'YYMMDD') = '900401' ;

-------

SELECT TO_DATE('20100101', 'YYYYMMDD')
FROM   DUAL ;

SELECT TO_CHAR('20100101', 'YYYY, MON')
FROM   DUAL ;

SELECT TO_CHAR( TO_DATE('20100101', 'YYYYMMDD'), 'YYYY, MON')
FROM   DUAL ;

SELECT TO_DATE( '041030 143000', 'YYMMDD HH24MISS')
FROM   DUAL ;

SELECT TO_CHAR( TO_DATE('041030 143000', 'YYMMDD HH24MISS'), 'DD-MON-YY HH:MI:SS PM')
FROM   DUAL ;

SELECT TO_DATE( '980630', 'YYMMDD')
FROM   DUAL ;

SELECT TO_CHAR( TO_DATE('980630', 'YYMMDD'), 'YYYY.MM.DD')
FROM   DUAL ;

SELECT EMP_NAME,
       HIRE_DATE,
       TO_CHAR(HIRE_DATE, 'YYYY/MM/DD')
FROM   EMPLOYEE
WHERE  EMP_NAME = '�Ѽ���' ;

SELECT '2009/10/14' AS ����,
       '95/10/27' AS �Է�,
       TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'YYYY/MM/DD') AS YY����1,
       TO_CHAR(TO_DATE('95/10/27', 'YY/MM/DD'), 'RRRR/MM/DD') AS YY����2,
       TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'YYYY/MM/DD') AS RR����1,
       TO_CHAR(TO_DATE('95/10/27', 'RR/MM/DD'), 'RRRR/MM/DD') AS RR����2
FROM   DUAL ;

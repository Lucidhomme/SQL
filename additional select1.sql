--1.������а� �л����� �й��� �̸�,���г⵵�� ���г⵵�� ���������� �����Ͻÿ�(����� �й�,�̸�,���г⵵�� ǥ��) (*ORDER BY �����÷� DESC|ASC)
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO AS �й�,
       STUDENT_NAME AS �̸�,
       ENTRANCE_DATE AS ���г⵵
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = '002' 
ORDER BY ENTRANCE_DATE ASC ;

--2.���� �� �̸��� �����ڰ� �ƴ� ������ �̸��� �ֹι�ȣ ���(������� ����� �ٸ��� ������ ���� ����)
SELECT *
FROM   TB_PROFESSOR ;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM   TB_PROFESSOR 
WHERE  LENGTH(PROFESSOR_NAME) != '3' ;

--3. �� ��������� ���ڱ����� �̸��� ���̸� ����ϵ� ������������(�� ���̰� �ƴ϶� �׳� �����̰� ���糯¥-���̷� ������)
SELECT *
FROM   TB_PROFESSOR ;

SELECT SYSDATE
FROM   DUAL ;

SELECT PROFESSOR_NAME AS �����̸�,
       TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12) AS ����
FROM   TB_PROFESSOR 
WHERE  SUBSTR(PROFESSOR_SSN,8,1) = '1'  
ORDER BY TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12) ASC; 

SELECT PROFESSOR_NAME AS �����̸�,
       TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER('19'||SUBSTR(PROFESSOR_SSN,1,2))
FROM   TB_PROFESSOR
WHERE  SUBSTR(PROFESSOR_SSN, 8,1) = '1'
ORDER BY 2,1 ;
       

--4. ������ �̸� �� ���� �����ϰ� �̸��� ���(��� ����� "�̸�")
SELECT *
FROM   TB_PROFESSOR ;

SELECT SUBSTR(PROFESSOR_NAME,2) AS �̸�
FROM   TB_PROFESSOR ;

--5. �� ������б��� ����� �����ڵ��� ã�Ƴ������Ѵ�.(19�� ������ ���X)
SELECT *
FROM   TB_STUDENT ;


SELECT STUDENT_NO,
       STUDENT_NAME,
       TO_CHAR(ENTRANCE_DATE,'RRRR') - (SUBSTR(STUDENT_SSN, 1, 2)+1900) AS ���г���
FROM   TB_STUDENT 
WHERE  TO_CHAR(ENTRANCE_DATE,'RRRR') - (SUBSTR(STUDENT_SSN, 1, 2)+1900) = '20' ;



--*ENTRANCE_DATE �յ��ڸ����� STUDENT_SSN ���ڸ� 2�� ������ 20�̻��� ��츦 ���ؾ��ҵ�?! ENTRANCE_DATE�� 03������ ��ȯ


--6. 2020�� ũ���������� ���������ϱ��
SELECT TO_CHAR(TO_DATE('20201225'), 'DAY')
FROM   DUAL ;

--7. 
SELECT TO_CHAR(TO_DATE('99/10/11','YY/MM/DD'),'RRRR/MM/DD')
FROM   DUAL ;

SELECT TO_CHAR(TO_DATE('49/10/11','YY/MM/DD'),'RRRR/MM/DD')
FROM   DUAL ;

SELECT TO_CHAR(TO_DATE('49/10/11','RR/MM/DD'),'RRRR/MM/DD')
FROM   DUAL ;

SELECT TO_CHAR(TO_DATE('99/10/11','RR/MM/DD'),'RRRR/MM/DD')
FROM   DUAL ;


--8. �� ������б��� 2000�⵵ ���� �����ڵ��� �й��� A�� �����Ѵ�. 2000�� �����й��� ���� �л����� �й��� �̸���??
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME,
       STUDENT_NO
FROM   TB_STUDENT
WHERE  SUBSTR(STUDENT_NO,1,1) != 'A' ;

--9. �й��� A517178�� �ѾƸ� �л��� �� ������ ���Ͻÿ�(���ȭ�� ��� ����, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ� ǥ��)
SELECT *
FROM   TB_GRADE;

SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO,
       ROUND(AVG(POINT),1) AS ����      
FROM   TB_GRADE
GROUP BY STUDENT_NO
HAVING STUDENT_NO = 'A517178' ;

--10. �а��� �л����� ���Ͽ� "�а���ȣ", "�л���"�� ���·� ����� ����� ������� ����Ͻÿ�
SELECT *
FROM   TB_STUDENT ;

SELECT DISTINCT DEPARTMENT_NO AS �а���ȣ
FROM   TB_STUDENT ;

SELECT DISTINCT DEPARTMENT_NO AS �а���ȣ,
       COUNT (*) AS �л���
FROM   TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1 ;

--11. ���������� �������� ���� �л��� ���� ����ΰ�?

SELECT *
FROM   TB_STUDENT ;

SELECT COUNT(*)
FROM   TB_STUDENT
WHERE  COACH_PROFESSOR_NO IS NULL ;


--12. �й��� A112113�� ���� �л��� �⵵ �� ������ ���Ͻÿ�(����� �⵵, �⵵ �� �����̶�� ǥ��, ������ �ݿø��Ͽ� �Ҽ��� ���� ���ڸ�)
SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_GRADE ;

SELECT SUBSTR(TERM_NO,1,4) AS �⵵,
       ROUND(AVG(POINT),1) AS �⵵������
FROM   TB_GRADE
WHERE STUDENT_NO = 'A112113' 
GROUP BY SUBSTR(TERM_NO,1,4) 
ORDER BY 1 ;

--13. �а��� ���л� ���� �ľ��ϰ��� �Ѵ�. �а���ȣ�� ���л� ���� ǥ���Ͻÿ�
SELECT *
FROM   TB_STUDENT ;

SELECT DEPARTMENT_NO AS �а���ȣ,
       SUM(CASE WHEN ABSENCE_YN = 'Y' THEN 1 ELSE 0 END) AS ���л���
FROM   TB_STUDENT 
--WHERE  ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO
ORDER BY 1;

SELECT DEPARTMENT_NO,
       COUNT(*)
FROM   TB_STUDENT
WHERE ABSENCE_YN = 'Y'
GROUP BY DEPARTMENT_NO
ORDER BY 1 ;

--14. ���������� �л����� ���� ã�ƶ�
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME,
       COUNT(*)
FROM   TB_STUDENT
GROUP BY STUDENT_NAME 
HAVING COUNT(*) > 1
ORDER BY 1 ;

--15.  �й��� A112113 �� ���� �л��� �⵵, �б� �� ������ �⵵ �� ���� ���� , ��
������ ���ϴ� SQL ���� �ۼ��Ͻÿ�. (��, ������ �Ҽ��� 1 �ڸ������� �ݿø��Ͽ�
ǥ��,ROLLUP���)

SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_GRADE ;

SELECT  SUBSTR(term_no,1,4) �⵵, 
        SUBSTR(term_no,5,2) �б�, 
        ROUND(AVG(point),1) ����
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(term_no,1,4), SUBSTR(term_no,5,2));


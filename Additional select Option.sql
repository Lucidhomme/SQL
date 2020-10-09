--1. �л��̸��� �ּ����� ǥ���Ͻÿ�. ��, ��� ����� "�л� �̸�", "�ּ���"�� �ϰ�,������ �̸����� �������� ǥ���ϵ��� ����.
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME AS "�л� �̸�", 
       STUDENT_ADDRESS AS �ּ���
FROM   TB_STUDENT ;

--2. �������� �л����� �̸��� �ֹι�ȣ�� ���̰� ���� ������ ȭ�鿡 ����Ͻÿ�.
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME,
       STUDENT_SSN
FROM   TB_STUDENT
WHERE  ABSENCE_YN = 'Y'
ORDER BY STUDENT_SSN DESC ;

--3. �ּ����� �������� ��⵵�� �л��� �� 1900 ��� �й��� ���� �л����� �̸��� �й�,�ּҸ� �̸��� ������������ ȭ�鿡 ����Ͻÿ�. ��, ���������� "�л��̸�","�й�","������ �ּ�" �� ��µǵ��� ����.
SELECT *
FROM  TB_STUDENT ;

SELECT *
FROM  TB_CLASS ;

SELECT *
FROM  TB_DEPARTMENT ;

SELECT *
FROM  TB_GRADE ;

SELECT STUDENT_NAME,
       STUDENT_NO,
       STUDENT_ADDRESS
FROM   TB_STUDENT
WHERE ((STUDENT_ADDRESS LIKE '������%' OR STUDENT_ADDRESS LIKE '��⵵%') AND (SUBSTR(STUDENT_NO,1,1)) = '9')
ORDER BY 1;

---4.���� ���а� ���� �� ���� ���̰� ���� ������� �̸��� Ȯ���Ҽ� �ִ� �������ۼ��Ͻÿ�.(���а��� '�а��ڵ�'�� �а� ���̺�(TB_DEPARTMENT)�� ��ȸ�ؼ� ã��
SELECT *
FROM   TB_PROFESSOR ;

SELECT *
FROM   TB_DEPARTMENT ;

SELECT PROFESSOR_NAME,
       PROFESSOR_SSN
FROM   TB_PROFESSOR
WHERE  DEPARTMENT_NO = '005'
ORDER  BY 2 ;

--5.  2004 �� 2 �б⿡ 'C3118100' ������ ������ �л����� ������ ��ȸ�Ϸ��� ����. ������ 
--���� �л����� ǥ���ϰ�, ������ ������ �й��� ���� �л����� ǥ���ϴ� ������ �ۼ��غ��ÿ�.

SELECT *
FROM   TB_GRADE ;
 
SELECT STUDENT_NO,
       POINT
FROM   TB_GRADE
WHERE  TERM_NO = '200402'
AND    CLASS_NO = 'C3118100'
ORDER BY 2 ;

--6. �й�, �̸�, �а��̸��� �л��̸����� �������������Ͽ� ����Ͻÿ�

SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM  TB_DEPARTMENT ;

SELECT STUDENT_NO,
       STUDENT_NAME,
       DEPARTMENT_NAME
FROM   TB_STUDENT
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO)
ORDER BY 2 ;


--7. �������б��� ���� �̸��� ������ �а� �̸��� ����ϼ���
SELECT *
FROM   TB_DEPARTMENT ;

SELECT *
FROM   TB_CLASS ;

SELECT CLASS_NAME,
       DEPARTMENT_NAME
FROM   TB_DEPARTMENT
JOIN   TB_CLASS USING(DEPARTMENT_NO) ;

--8. ���� �����̸��� ã������ �Ѵ�. �����̸��� �����̸��� ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT *
FROM  TB_CLASS ;

SELECT *
FROM  TB_PROFESSOR ;

SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_PROFESSOR
JOIN   TB_CLASS USING(DEPARTMENT_NO) ;

SELECT C.CLASS_NAME,
       P.PROFESSOR_NAME
FROM   TB_PROFESSOR P
JOIN   TB_CLASS C ON(P.DEPARTMENT_NO = C.DEPARTMENT_NO);
---�ܷ�Ű������ �ȵǳ�???
SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_PROFESSOR
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO)
JOIN   TB_CLASS USING(DEPARTMENT_NO) ;

SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_PROFESSOR , TB_CLASS 
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO);

----�̰Ŵ� 3�������ߴµ� �� �ȵ���?
SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_PROFESSOR
JOIN   TB_CLASS_PROFESSOR USING(PROFESSOR_NO)
JOIN   TB_CLASS USING(CLASS_NO) ;

--9. 8���� ��� �� '�ι���ȸ'�迭�� ���� ������ �����̸��� ã������ �Ҷ�, �̿� �ش��ϴ� ���� �̸��� �����̸��� ����Ͻÿ�
SELECT *
FROM   TB_DEPARTMENT ;

SELECT *
FROM   TB_GRADE ;

SELECT *
FROM   TB_STUDENT ;

SELECT CLASS_NAME,
       PROFESSOR_NAME
FROM   TB_PROFESSOR R
JOIN   TB_CLASS_PROFESSOR CR USING(PROFESSOR_NO)
JOIN   TB_CLASS C USING(CLASS_NO)
JOIN   TB_DEPARTMENT D ON(D.DEPARTMENT_NO = R.DEPARTMENT_NO)
WHERE  CATEGORY = '�ι���ȸ';

--10. '�����а�' �л����� ������ ���Ϸ��� �Ѵ�.�����а� �л����� "�й�", "�л� �̸�", "��ü ����"�� ����ϴ� SQL������ �ۼ��Ͻÿ�(������ �Ҽ��� 1�ڸ������� �ݿø��Ͽ� ǥ���Ѵ�)
SELECT S.STUDENT_NO,
       S.STUDENT_NAME,
       ROUND(AVG(POINT),1)
FROM   TB_STUDENT S
JOIN   TB_DEPARTMENT D USING(DEPARTMENT_NO)
JOIN   TB_GRADE G ON(G.STUDENT_NO = S.STUDENT_NO)
WHERE  DEPARTMENT_NAME = '�����а�'
GROUP BY S.STUDENT_NO, S.STUDENT_NAME ;

--11. �й��� A313047�� �л��� �б��� �ȳ������ִ�.������������ ������ �����ϱ����� �а��̸�, �л��̸�,���������̸��� �ʿ��ϴ�.
--(����� �а��̸�, �л��̸�,���������̸��������)
SELECT *
FROM   TB_STUDENT ;
SELECT *
FROM   TB_DEPARTMENT ;
SELECT *
FROM   TB_PROFESSOR ;
SELECT *
FROM   TB_CLASS_PROFESSOR ;
SELECT *
FROm   TB_GRADE ;

SELECT DEPARTMENT_NAME AS �а��̸�,
       STUDENT_NAME AS �л��̸�,
       PROFESSOR_NAME AS ���������̸�
FROM   TB_STUDENT   
JOIN   TB_PROFESSOR USING(DEPARTMENT_NO)
JOIN   TB_DEPARTMENT USING(DEPARTMENT_NO)
WHERE  STUDENT_NO = 'A313047' ;

SELECT DEPARTMENT_NAME AS �а��̸�,
       STUDENT_NAME AS �л��̸�,
       PROFESSOR_NAME AS ���������̸�
FROM   TB_STUDENT S   
JOIN   TB_DEPARTMENT D USING(DEPARTMENT_NO)
JOIN   TB_PROFESSOR USING(DEPARTMENT_NO)
WHERE  STUDENT_NO = 'A313047' ;


SELECT D.DEPARTMENT_NAME AS �а��̸�,
       S.STUDENT_NAME AS �л��̸�,
       P.PROFESSOR_NAME AS ���������̸�
FROM   TB_STUDENT S   
JOIN   TB_PROFESSOR P ON(S.COACH_PROFESSOR_NO = P.PROFESSOR_NO)
JOIN   TB_DEPARTMENT D ON(D.DEPARTMENT_NO = S.DEPARTMENT_NO)
WHERE  STUDENT_NO = 'A313047' ;


--12. 2007�⵵�� �ΰ������ ������ ������ �л��� ã�� �л��̸��� �����б⸦ ǥ���ϴ� SQL������ �ۼ��Ͻÿ�
SELECT *
FROM   TB_STUDENT ;
SELECT *
FROM   TB_CLASS ;
SELECT *
FROM   TB_GRADE ;

SELECT STUDENT_NAME,
       TERM_NO
FROM   TB_STUDENT
JOIN   TB_GRADE USING(STUDENT_NO)
JOIN   TB_CLASS USING(CLASS_NO)
WHERE  CLASS_NAME = '�ΰ������' 
AND    SUBSTR(TERM_NO,1,4) = '2007' ;

--13. ��ü�� �迭 ���� �� ���� ��米���� �� �� �������� ���� ������ ã�� �� �����̸��� �а��̸��� ����ϴ� ������ �ۼ��Ͻÿ�
SELECT *
FROM   TB_DEPARTMENT ;

SELECT *
FROM   TB_CLASS ;

SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_CLASS_PROFESSOR ;

SELECT *
FROM   TB_PROFESSOR ;

SELECT C.CLASS_NAME,
       D.DEPARTMENT_NAME
FROM   TB_DEPARTMENT D
LEFT JOIN   TB_CLASS C USING(DEPARTMENT_NO)
LEFT JOIN   TB_CLASS_PROFESSOR CP ON (C.CLASS_NO = CP.CLASS_NO)
WHERE  CATEGORY = '��ü��' AND PROFESSOR_NO IS NULL ;
----LEFT�ϸ� ������ LEFT �Ⱦ��� �ȳ����µ�..?

--14. ������ ���ݾ��� �л����� ���������� �Խ��ϰ��� �Ѵ�.�л��̸��� �������� �̸��� ã�� ���� ���� ������ ���� �л��� ��� �������� ����������
--ǥ���ϵ��� �ϴ� SQL�� �ۼ��Ͻÿ�(�� ����� �л��̸�,���������� ǥ���ϸ� ���й��л��� ���� ǥ�õǵ����Ѵ�)
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME �л��̸�,
       DECODE(PROFESSOR_NAME,NULL,'��������������',PROFESSOR_NAME) �������� 
FROM   TB_DEPARTMENT 
LEFT JOIN   TB_STUDENT  USING(DEPARTMENT_NO)
LEFT JOIN   TB_PROFESSOR  ON(COACH_PROFESSOR_NO = PROFESSOR_NO) 
WHERE  DEPARTMENT_NAME = '���ݾƾ��а�' 
ORDER BY STUDENT_NO DESC ;
---  LEFT�����ϴϱ� ������..
    
--15. ���л��� �ƴ� �л� �� ������ 4.0�̻��� �л��� ã�� �� �л��� �й�,�̸�,�а��̸�,������ ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_GRADE ;

SELECT *
FROM   TB_DEPARTMENT ;

SELECT STUDENT_NO,
       STUDENT_NAME,
       DEPARTMENT_NAME,
       AVG(POINT)
FROM   TB_DEPARTMENT
JOIN   TB_STUDENT USING(DEPARTMENT_NO)
JOIN   TB_GRADE USING(STUDENT_NO)
WHERE  ABSENCE_YN = 'N'
GROUP BY STUDENT_NO, STUDENT_NAME, DEPARTMENT_NAME 
HAVING AVG(POINT) >= 4.0 ;


--16. ȯ�������а� ����������� ���� ������ �ľ��� �� �ִ� SQL���� �ۼ��Ͻÿ�
SELECT CLASS_NO,
       CLASS_NAME,
       AVG(POINT)
FROM   TB_DEPARTMENT
JOIN   TB_CLASS USING(DEPARTMENT_NO)
JOIN   TB_GRADE USING(CLASS_NO)
WHERE  DEPARTMENT_NAME = 'ȯ�������а�'
AND    CLASS_TYPE LIKE '����%'
GROUP BY CLASS_NO, CLASS_NAME ;

--17. �� ������б��� �ٴϰ� �ִ� �ְ��� �л��� ���� �� �л����� �̸��� �ּҸ� ����ϴ� SQL���� �ۼ��Ͻÿ�
SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_DEPARTMENT ;

SELECT STUDENT_NAME,
       STUDENT_ADDRESS
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = (SELECT STUDENT_NAME
                        FROM   TB_STUDENT
                        WHERE  STUDENT_NAME = '�ְ���') ;
                        
SELECT STUDENT_NAME,
       STUDENT_ADDRESS
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO IN (SELECT DEPARTMENT_NO
                         FROM   TB_STUDENT
                         WHERE  STUDENT_NAME = '�ְ���') ; 




--18.������а����� �� ������ ���� ���� �л��� �̸��� �й��� ǥ���ϴ� SQL���� �ۼ� (�ζ��κ�� �ֻ��� ��� �ϳ��� ������ ���� ����)
SELECT STUDENT_NAME,
       STUDENT_NO
FROM  TB_DEPARTMENT
JOIN  TB_STUDENT USING(DEPARTMENT_NO)
JOIN  TB_GRADE   USING(STUDENT_NO)
WHERE DEPARTMENT_NAME = '������а�'
GROUP BY STUDENT_NAME, STUDENT_NO 
HAVING AVG(POINT) = (SELECT MAX(AVG(POINT))
                     FROM TB_GRADE
                     GROUP BY STUDENT_NAME, STUDENT_NO);
---�� Ʋ������??

SELECT ROWNUM,
       STUDENT_NAME,
       STUDENT_NO
FROM  (SELECT STUDENT_NAME, STUDENT_NO
        FROM(SELECT STUDENT_NO,
                    AVG(POINT)
              FROM TB_GRADE
              GROUP BY STUDENT_NO
              ORDER BY 2 DESC)
        JOIN TB_STUDENT USING(STUDENT_NO)
        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
        WHERE DEPARTMENT_NAME = '������а�'
        AND  ROWNUM = 1
        GROUP BY STUDENT_NAME, STUDENT_NO
        ) ;

--19. �������б��� "ȯ�������а�"�� ���� ���� �迭 �а����� �а��� �������� ������ �ľ��ϱ� ���� SQL���� ã���ÿ�(����� "�迭 �а���", "��������"���� ǥ�õǰ� ������ �Ҽ��� ���ڸ����� �ݿø�)
SELECT *
FROM   TB_DEPARTMENT ;
SELECT *
FROM   TB_CLASS ;
SELECT *
FROM   TB_GRADE ;

SELECT DEPARTMENT_NAME AS "�迭 �а���", 
       ROUND(AVG(POINT),1) AS ��������
FROM   TB_DEPARTMENT
JOIN   TB_CLASS USING(DEPARTMENT_NO)
JOIN   TB_GRADE USING(CLASS_NO)
WHERE  CATEGORY = (SELECT CATEGORY
                   FROM   TB_DEPARTMENT
                   WHERE  DEPARTMENT_NAME = 'ȯ�������а�')
AND    CLASS_TYPE LIKE '����%'
GROUP BY DEPARTMENT_NAME ;
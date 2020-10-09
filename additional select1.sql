--1.영어영문학과 학생들의 학번과 이름,입학년도를 입학년도가 빠른순으로 정렬하시오(헤더는 학번,이름,입학년도로 표시) (*ORDER BY 기준컬럼 DESC|ASC)
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO AS 학번,
       STUDENT_NAME AS 이름,
       ENTRANCE_DATE AS 입학년도
FROM   TB_STUDENT
WHERE  DEPARTMENT_NO = '002' 
ORDER BY ENTRANCE_DATE ASC ;

--2.교수 중 이름이 세글자가 아닌 교수의 이름과 주민번호 출력(결과값이 예상과 다르게 나오는 이유 생각)
SELECT *
FROM   TB_PROFESSOR ;

SELECT PROFESSOR_NAME, PROFESSOR_SSN
FROM   TB_PROFESSOR 
WHERE  LENGTH(PROFESSOR_NAME) != '3' ;

--3. 춘 기술교대의 남자교수들 이름과 나이를 출력하되 오름차순으로(만 나이가 아니라 그냥 나이이고 현재날짜-나이로 구하자)
SELECT *
FROM   TB_PROFESSOR ;

SELECT SYSDATE
FROM   DUAL ;

SELECT PROFESSOR_NAME AS 교수이름,
       TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12) AS 나이
FROM   TB_PROFESSOR 
WHERE  SUBSTR(PROFESSOR_SSN,8,1) = '1'  
ORDER BY TRUNC(MONTHS_BETWEEN(SYSDATE,TO_DATE(SUBSTR(PROFESSOR_SSN,1,6),'RR/MM/DD'))/12) ASC; 

SELECT PROFESSOR_NAME AS 교수이름,
       TO_NUMBER(TO_CHAR(SYSDATE,'YYYY')) - TO_NUMBER('19'||SUBSTR(PROFESSOR_SSN,1,2))
FROM   TB_PROFESSOR
WHERE  SUBSTR(PROFESSOR_SSN, 8,1) = '1'
ORDER BY 2,1 ;
       

--4. 교수들 이름 중 성을 제외하고 이름만 출력(출력 헤더는 "이름")
SELECT *
FROM   TB_PROFESSOR ;

SELECT SUBSTR(PROFESSOR_NAME,2) AS 이름
FROM   TB_PROFESSOR ;

--5. 춘 기술대학교의 재수생 입학자들을 찾아내려고한다.(19살 입학은 재수X)
SELECT *
FROM   TB_STUDENT ;


SELECT STUDENT_NO,
       STUDENT_NAME,
       TO_CHAR(ENTRANCE_DATE,'RRRR') - (SUBSTR(STUDENT_SSN, 1, 2)+1900) AS 입학나이
FROM   TB_STUDENT 
WHERE  TO_CHAR(ENTRANCE_DATE,'RRRR') - (SUBSTR(STUDENT_SSN, 1, 2)+1900) = '20' ;



--*ENTRANCE_DATE 앞두자리에서 STUDENT_SSN 앞자리 2개 뺀것이 20이상일 경우를 구해야할듯?! ENTRANCE_DATE에 03형식을 변환


--6. 2020년 크리스마스는 무슨요일일까요
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


--8. 춘 기술대학교의 2000년도 이후 입학자들은 학번이 A로 시작한다. 2000년 이전학번을 받은 학생들의 학번과 이름은??
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME,
       STUDENT_NO
FROM   TB_STUDENT
WHERE  SUBSTR(STUDENT_NO,1,1) != 'A' ;

--9. 학번이 A517178인 한아름 학생의 총 평점을 구하시오(출력화면 헤더 평점, 점수는 반올림하여 소수점 이하 한자리 표시)
SELECT *
FROM   TB_GRADE;

SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NO,
       ROUND(AVG(POINT),1) AS 평점      
FROM   TB_GRADE
GROUP BY STUDENT_NO
HAVING STUDENT_NO = 'A517178' ;

--10. 학과별 학생수를 구하여 "학과번호", "학생수"의 형태로 헤더를 만들어 결과값을 출력하시오
SELECT *
FROM   TB_STUDENT ;

SELECT DISTINCT DEPARTMENT_NO AS 학과번호
FROM   TB_STUDENT ;

SELECT DISTINCT DEPARTMENT_NO AS 학과번호,
       COUNT (*) AS 학생수
FROM   TB_STUDENT
GROUP BY DEPARTMENT_NO
ORDER BY 1 ;

--11. 지도교수를 배정받지 못한 학생의 수는 몇명인가?

SELECT *
FROM   TB_STUDENT ;

SELECT COUNT(*)
FROM   TB_STUDENT
WHERE  COACH_PROFESSOR_NO IS NULL ;


--12. 학번이 A112113인 김고운 학생의 년도 별 평점을 구하시오(헤더는 년도, 년도 별 평점이라고 표시, 점수는 반올림하여 소수점 이하 한자리)
SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_GRADE ;

SELECT SUBSTR(TERM_NO,1,4) AS 년도,
       ROUND(AVG(POINT),1) AS 년도별평점
FROM   TB_GRADE
WHERE STUDENT_NO = 'A112113' 
GROUP BY SUBSTR(TERM_NO,1,4) 
ORDER BY 1 ;

--13. 학과별 휴학생 수를 파악하고자 한다. 학과번호와 휴학생 수를 표시하시오
SELECT *
FROM   TB_STUDENT ;

SELECT DEPARTMENT_NO AS 학과번호,
       SUM(CASE WHEN ABSENCE_YN = 'Y' THEN 1 ELSE 0 END) AS 휴학생수
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

--14. 동명이인인 학생들의 수를 찾아라
SELECT *
FROM   TB_STUDENT ;

SELECT STUDENT_NAME,
       COUNT(*)
FROM   TB_STUDENT
GROUP BY STUDENT_NAME 
HAVING COUNT(*) > 1
ORDER BY 1 ;

--15.  학번이 A112113 인 김고운 학생의 년도, 학기 별 평점과 년도 별 누적 평점 , 총
평점을 구하는 SQL 문을 작성하시오. (단, 평점은 소수점 1 자리까지맊 반올림하여
표시,ROLLUP사용)

SELECT *
FROM   TB_STUDENT ;

SELECT *
FROM   TB_GRADE ;

SELECT  SUBSTR(term_no,1,4) 년도, 
        SUBSTR(term_no,5,2) 학기, 
        ROUND(AVG(point),1) 평점
FROM TB_GRADE
WHERE STUDENT_NO = 'A112113'
GROUP BY ROLLUP(SUBSTR(term_no,1,4), SUBSTR(term_no,5,2));


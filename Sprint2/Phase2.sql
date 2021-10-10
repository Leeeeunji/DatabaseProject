-- Type1
SELECT PostTitle, PostText, Writer, Subject, TeacherID
FROM POST
WHERE PostNumber = '';
-- 특정 글 제목, 내용, 작성자, 과목

SELECT CourseName
FROM COURSE
WHERE CourseNumber = '';
-- 특정 과목의 이름



-- Type3
SELECT STUDENT.Name, COUNT(*) AS Cnt
FROM COURSE, TAKING_COURSE, STUDENT
WHERE COURSE.CourseNumber = TAKING_COURSE.CourseNumber
AND STUDENT.StudentNumber = TAKING_COURSE.StudentNumber
AND STUDENT.StudentId = TAKING_COURSE.StudentId
AND COURSE.Subject = 'Math'
GROUP BY STUDENT.StudentNumber, STUDENT.StudentId
HAVING COUNT(*) >= 2;
-- 학생별 서로 다른 수학 과목을 2개이상 듣는 학생의 이름과 그 수

SELECT COURSE.Subject, COUNT(*) AS Cnt, AVG(COUNT(*)) AS Avg
FROM COURSE, TAKING_COURSE, STUDENT
WHERE COURSE.CourseNumber = TAKING_COURSE.CourseNumber
AND STUDENT.StudentNumber = TAKING_COURSE.StudentNumber
AND STUDENT.StudentId = TAKING_COURSE.StudentId
GROUP BY COURSE.Subject;
-- 과목별 학생 수와 평균



-- Type5
SELECT TEACHER.Name, TEACHER.Phone_Number, TEACHER.Major 
FROM TEACHER, POST
WHERE NOT EXISTS (SELECT 1 FROM POST WHERE POST.TeacherID = TEACHER.TeacherID);
-- 회원가입은 했지만 하나도 글을 쓰지 않은 선생님들의 이름과 전화번호 전공을 쿼리

SELECT COURSE.CourseNumber, COURSE.Subject
FROM COURSE, TAKING_COURSE
WHERE NOT EXISTS (SELECT 1 FROM TAKING_COURSE WHERE COURSE.CourseNumber = TAKING_COURSE.CourseNumber)
-- 과목 개설은 되었지만 해당 과목을 수강신청한 학생은 없는 과목



-- Type7
SELECT PostTitle, Writer 
FROM (SELECT * FROM POST WHERE Subject = 'English');
-- 과목이 영어인 글의 제목

SELECT Name, Major, Email_Address
FROM (SELECT * FROM TEACHER WHERE Major = 'ComputerScience');
-- 전공이 컴퓨터공학인 선생님의 이름 및 전공



-- Type9
SELECT STUDENT.Name, COUNT(*) AS Cnt
FROM COURSE, TAKING_COURSE, STUDENT
WHERE COURSE.CourseNumber = TAKING_COURSE.CourseNumber
AND STUDENT.StudentNumber = TAKING_COURSE.StudentNumber
AND STUDENT.StudentId = TAKING_COURSE.StudentId
AND COURSE.Subject = 'Math'
GROUP BY STUDENT.StudentNumber, STUDENT.StudentId
HAVING COUNT(*) >= 2
ORDER BY STUDENT.NAME ASC;
-- 학생별 서로 다른 수학 과목을 2개이상 듣는 학생의 이름과 수 그리고 이를 학생의 이름을 기준으로 오름차순 정렬

SELECT TEACHER.Name, COUNT(*) AS StudentCnt
FROM TEACHER, COURSE, MATCHING
WHERE TEACHER.TeacherNumber = MATCHING.TeacherNumber
AND COURSE.CourseNumber = MATCHING.CourseNo
AND TEACHER.Major = 'ComputerScience'
AND COURSE.Subject = 'Math'
GROUP BY TEACHER.TeacherNumber, TEACHER.TeacherID
ORDER BY StudentCnt DESC;
-- 전공이 컴퓨터공학이고 수학 과목을 가르치는 선생님의 이름과 매칭된 학생 수를 내림차순으로 정렬 



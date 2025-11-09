CREATE VIEW StudentCourseView AS
SELECT s.Student_ID, s.Name AS Student_Name, c.Course_Name, i.Name AS Instructor_Name
FROM Student s
JOIN Enrollment e ON s.Student_ID = e.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID
JOIN Instructor i ON c.Instructor_ID = i.Instructor_ID;


SELECT * FROM StudentCourseView;

CREATE INDEX idx_student_name ON Student(Name);

SELECT INDEX_NAME, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME='STUDENT';


CREATE SEQUENCE student_seq
START WITH 1003
INCREMENT BY 1
NOCACHE;

INSERT INTO Student VALUES (student_seq.NEXTVAL, 'Rahul Patil', 'rahul@college.edu', '9876500000', 'Nashik');

CREATE SYNONYM stud FOR Student;

SELECT * FROM stud;
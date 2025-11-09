CREATE TABLE Instructor (
    Instructor_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Department VARCHAR2(30),
    Email VARCHAR2(50)
);

CREATE TABLE Course (
    Course_ID NUMBER PRIMARY KEY,
    Course_Name VARCHAR2(50),
    Credits NUMBER,
    Instructor_ID NUMBER,
    FOREIGN KEY (Instructor_ID) REFERENCES Instructor(Instructor_ID)
);

CREATE TABLE Student (
    Student_ID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Email VARCHAR2(50),
    Phone VARCHAR2(15),
    Address VARCHAR2(100)
);

CREATE TABLE Enrollment (
    Enrollment_ID NUMBER PRIMARY KEY,
    Student_ID NUMBER,
    Course_ID NUMBER,
    Enrollment_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

-- Insert fresh data
INSERT INTO Instructor VALUES (1, 'Dr. Sharma', 'Computer', 'sharma@college.edu');
INSERT INTO Instructor VALUES (2, 'Prof. Mehta', 'Mathematics', 'mehta@college.edu');

INSERT INTO Course VALUES (101, 'DBMS', 4, 1);
INSERT INTO Course VALUES (102, 'Discrete Math', 3, 2);

INSERT INTO Student VALUES (1001, 'Ritul Ingole', 'ritul@college.edu', '9876543210', 'Pune');
INSERT INTO Student VALUES (1002, 'Aryan Deshmukh', 'aryan@college.edu', '9823456789', 'Nagpur');

INSERT INTO Enrollment VALUES (1, 1001, 101, SYSDATE);
INSERT INTO Enrollment VALUES (2, 1002, 102, SYSDATE);

COMMIT;

/* view */
CREATE VIEW StudentCourseView AS
SELECT s.Student_ID, s.Name AS Student_Name, c.Course_Name, i.Name AS Instructor_Name
FROM Student s
JOIN Enrollment e ON s.Student_ID = e.Student_ID
JOIN Course c ON e.Course_ID = c.Course_ID
JOIN Instructor i ON c.Instructor_ID = i.Instructor_ID;


SELECT * FROM StudentCourseView;


/* index*/
CREATE INDEX idx_student_name ON Student(Name);

SELECT INDEX_NAME, TABLE_NAME FROM USER_INDEXES WHERE TABLE_NAME='STUDENT';


/*sequence*/
CREATE SEQUENCE student_seq
START WITH 1003
INCREMENT BY 1
NOCACHE;

INSERT INTO Student VALUES (student_seq.NEXTVAL, 'Rahul Patil', 'rahul@college.edu', '9876500000', 'Nashik');


/*synonym*/
CREATE SYNONYM stud FOR Student;

SELECT * FROM stud;

-- EX1
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    date_of_birth DATE,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Student (student_id, full_name, date_of_birth, email) VALUES
(1, 'Nguyen Van A', '2003-05-10', 'a@gmail.com'),
(2, 'Tran Thi B', '2004-08-20', 'b@gmail.com'),
(3, 'Le Van C', '2003-12-01', 'c@gmail.com');

-- Lấy ra toàn bộ danh sách sinh viên
SELECT * FROM Student;

-- Lấy ra mã sinh viên và họ tên của tất cả sinh viên
SELECT student_id, full_name
FROM Student;

-- EX2
INSERT INTO Student (student_id, full_name, date_of_birth, email) VALUES
(4, 'Tran Thi D', '2003-01-25', 'd@gmail.com'),
(5, 'Le Van E', '2001-02-01', 'e@gmail.com');

-- Cập nhật email cho sinh viên có student_id = 3
UPDATE Student
SET email = 'cuong@gmail.com'
WHERE student_id = 3;

-- Cập nhật ngày sinh cho sinh viên có student_id = 2
UPDATE Student
SET date_of_birth = '2002-02-22'
WHERE student_id = 2;

-- Xóa một sinh viên có student_id = 5
DELETE FROM Student
WHERE student_id = 5;

SELECT * FROM Student;

-- EX3
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(100) NOT NULL,
    credit INT NOT NULL,
    CONSTRAINT chk_credit CHECK (credit > 0)
);
INSERT INTO Subject (subject_id, subject_name, credit) VALUES
(1, 'CSDL', 3),
(2, 'Lap trinh Java', 4),
(3, 'Frontend', 3);

UPDATE Subject
SET credit = 4
WHERE subject_id = 1;

UPDATE Subject
SET subject_name = 'Lap trinh Java nang cao'
WHERE subject_id = 2;

-- EX4
CREATE TABLE Enrollment (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    enroll_date DATE NOT NULL,

    CONSTRAINT pk_enrollment
        PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_enrollment_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_enrollment_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id)
);

INSERT INTO Enrollment (student_id, subject_id, enroll_date) VALUES
(1, 1, '2024-09-01'),
(1, 2, '2024-09-01'),
(2, 1, '2024-09-02'),
(2, 3, '2024-09-02');

SELECT * FROM Enrollment;

SELECT * FROM Enrollment
WHERE student_id = 1;

-- EX5
CREATE TABLE Score (
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    mid_score DECIMAL(4,2) NOT NULL,
    final_score DECIMAL(4,2) NOT NULL,

    CONSTRAINT pk_score
        PRIMARY KEY (student_id, subject_id),

    CONSTRAINT fk_score_student
        FOREIGN KEY (student_id)
        REFERENCES Student(student_id),

    CONSTRAINT fk_score_subject
        FOREIGN KEY (subject_id)
        REFERENCES Subject(subject_id),

    CONSTRAINT chk_mid_score
        CHECK (mid_score BETWEEN 0 AND 10),

    CONSTRAINT chk_final_score
        CHECK (final_score BETWEEN 0 AND 10)
);
INSERT INTO Score (student_id, subject_id, mid_score, final_score) VALUES
(1, 1, 7.5, 8.0),
(2, 3, 7.0, 8.5);

UPDATE Score
SET final_score = 5.0
WHERE student_id = 1;

SELECT * FROM Score;

SELECT * FROM Score
WHERE final_score >= 8;

-- EX6
INSERT INTO Student (student_id, full_name, date_of_birth, email) VALUES
(10, 'Nguyen Van Z', '2010-10-10', 'nvz@gmail.com');

INSERT INTO Enrollment (student_id, subject_id, enroll_date) VALUES
(10, 1, '2024-09-01'),
(10, 2, '2024-09-01');

INSERT INTO Score (student_id, subject_id, mid_score, final_score) VALUES
(10, 1, 7.5, 8.0),
(10, 2, 7.0, 8.5);

UPDATE Score
SET final_score = 10.0
WHERE student_id = 10 AND subject_id = 1;


DELETE FROM Enrollment
WHERE student_id = 10 AND subject_id = 2;

SELECT * FROM Student;
SELECT * FROM Score;
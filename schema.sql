-- Student database schema (works in SQLite; small changes needed for MySQL)

DROP TABLE IF EXISTS enrollments;
DROP TABLE IF EXISTS courses;
DROP TABLE IF EXISTS students;

CREATE TABLE students (
    student_id    INTEGER PRIMARY KEY,
    first_name    TEXT NOT NULL,
    last_name     TEXT NOT NULL,
    email         TEXT NOT NULL UNIQUE,
    enrolled_year INTEGER NOT NULL
);

CREATE TABLE courses (
    course_id   INTEGER PRIMARY KEY,
    course_name TEXT NOT NULL,
    credits     INTEGER NOT NULL
);

CREATE TABLE enrollments (
    enrollment_id INTEGER PRIMARY KEY,
    student_id    INTEGER NOT NULL,
    course_id     INTEGER NOT NULL,
    grade         INTEGER,           -- 0 to 100, NULL if not graded yet
    semester      TEXT NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id)  REFERENCES courses(course_id)
);



-- Drop tables if they already exist (clean start)
-- Child table first, then parents
BEGIN EXECUTE IMMEDIATE 'DROP TABLE issuedbooks'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE books';       EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP TABLE students';    EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- Drop sequences if they exist
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE book_seq';    EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE student_seq'; EXCEPTION WHEN OTHERS THEN NULL; END;
/
BEGIN EXECUTE IMMEDIATE 'DROP SEQUENCE issue_seq';   EXCEPTION WHEN OTHERS THEN NULL; END;
/

-- SEQUENCES (auto generate IDs)

CREATE SEQUENCE book_seq    START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE student_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE issue_seq   START WITH 1 INCREMENT BY 1;

-- TABLE: BOOKS
-- Stores all books available in the library

CREATE TABLE books (
    book_id   NUMBER        PRIMARY KEY,
    title     VARCHAR2(100) NOT NULL,
    author    VARCHAR2(100),
    category  VARCHAR2(50)
);


-- TABLE: STUDENTS
-- Stores registered library members

CREATE TABLE students (
    student_id NUMBER        PRIMARY KEY,
    name       VARCHAR2(100) NOT NULL,
    email      VARCHAR2(100),
    join_date  DATE DEFAULT SYSDATE
);

-- TABLE: ISSUEDBOOKS
-- Tracks which student borrowed which book
-- return_date is NULL if book is not yet returned
CREATE TABLE issuedbooks (
    issue_id    NUMBER  PRIMARY KEY,
    book_id     NUMBER  REFERENCES books(book_id),
    student_id  NUMBER  REFERENCES students(student_id),
    issue_date  DATE    NOT NULL,
    return_date DATE            -- NULL means book not returned yet
);

-- Confirm tables were created
SELECT table_name FROM user_tables
WHERE table_name IN ('BOOKS', 'STUDENTS', 'ISSUEDBOOKS')
ORDER BY table_name;

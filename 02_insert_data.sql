
-- BOOKS (15 books across 5 categories)
-- Fiction
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The Alchemist',         'Paulo Coelho',      'Fiction');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'To Kill a Mockingbird', 'Harper Lee',        'Fiction');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The Great Gatsby',      'F. Scott Fitzgerald','Fiction');

-- Science
INSERT INTO books VALUES (book_seq.NEXTVAL, 'A Brief History of Time','Stephen Hawking',  'Science');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Cosmos',                 'Carl Sagan',       'Science');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The Selfish Gene',       'Richard Dawkins',  'Science');

-- History
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Sapiens',               'Yuval Noah Harari', 'History');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The Diary of a Young Girl','Anne Frank',     'History');

-- Technology
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Clean Code',            'Robert C. Martin',  'Technology');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The Pragmatic Programmer','Andrew Hunt',     'Technology');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Introduction to Algorithms','Thomas Cormen', 'Technology');

-- Self Help
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Atomic Habits',         'James Clear',       'Self Help');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Think and Grow Rich',   'Napoleon Hill',     'Self Help');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'The 7 Habits',          'Stephen Covey',     'Self Help');
INSERT INTO books VALUES (book_seq.NEXTVAL, 'Deep Work',             'Cal Newport',       'Self Help');

-- STUDENTS (12 students)
-- Some joined recently, some joined 3+ years ago (inactive)

INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ravi Kumar',   'ravi@college.com',   TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Priya Sharma', 'priya@college.com',  TO_DATE('2024-03-15','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Arjun Reddy',  'arjun@college.com',  TO_DATE('2023-06-20','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Sneha Patel',  'sneha@college.com',  TO_DATE('2024-07-01','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Kiran Mehta',  'kiran@college.com',  TO_DATE('2024-09-05','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Ananya Nair',  'ananya@college.com', TO_DATE('2025-01-12','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Vikram Singh', 'vikram@college.com', TO_DATE('2025-02-20','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Pooja Iyer',   'pooja@college.com',  TO_DATE('2025-03-01','YYYY-MM-DD'));

-- These 4 are old/inactive students (joined 3+ years ago, never borrowed recently)
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Rohit Verma',  'rohit@college.com',  TO_DATE('2021-05-10','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Divya Rao',    'divya@college.com',  TO_DATE('2020-08-22','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Suresh Babu',  'suresh@college.com', TO_DATE('2021-11-30','YYYY-MM-DD'));
INSERT INTO students VALUES (student_seq.NEXTVAL, 'Meera Joshi',  'meera@college.com',  TO_DATE('2020-03-14','YYYY-MM-DD'));

-- ISSUEDBOOKS
-- Some returned, some overdue (return_date is NULL + issue_date > 14 days ago)


-- Returned books (on time)
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 1,  1, TO_DATE('2025-05-01','YYYY-MM-DD'), TO_DATE('2025-05-10','YYYY-MM-DD'));
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 3,  2, TO_DATE('2025-05-05','YYYY-MM-DD'), TO_DATE('2025-05-14','YYYY-MM-DD'));
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 7,  4, TO_DATE('2025-04-20','YYYY-MM-DD'), TO_DATE('2025-04-30','YYYY-MM-DD'));
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 12, 5, TO_DATE('2025-05-10','YYYY-MM-DD'), TO_DATE('2025-05-20','YYYY-MM-DD'));
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 9,  6, TO_DATE('2025-03-15','YYYY-MM-DD'), TO_DATE('2025-03-25','YYYY-MM-DD'));
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 4,  7, TO_DATE('2025-04-01','YYYY-MM-DD'), TO_DATE('2025-04-12','YYYY-MM-DD'));

-- OVERDUE books (return_date is NULL and issue_date is more than 14 days ago)
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 2,  1, TO_DATE('2025-03-01','YYYY-MM-DD'), NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 5,  2, TO_DATE('2025-02-15','YYYY-MM-DD'), NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 8,  3, TO_DATE('2025-04-10','YYYY-MM-DD'), NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 10, 4, TO_DATE('2025-03-20','YYYY-MM-DD'), NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 13, 5, TO_DATE('2025-01-25','YYYY-MM-DD'), NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 6,  8, TO_DATE('2025-02-28','YYYY-MM-DD'), NULL);

-- Recent issues (not yet overdue)
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 11, 6, SYSDATE - 3, NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 14, 7, SYSDATE - 5, NULL);
INSERT INTO issuedbooks VALUES (issue_seq.NEXTVAL, 15, 8, SYSDATE - 7, NULL);

COMMIT;

-- Quick summary check
SELECT 'Books'       AS table_name, COUNT(*) AS total FROM books       UNION ALL
SELECT 'Students',                  COUNT(*)          FROM students     UNION ALL
SELECT 'Issued Books',              COUNT(*)          FROM issuedbooks;

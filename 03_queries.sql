

-- QUERY 1: Overdue Books Report
-- Find all books not returned where issue_date > 14 days ago
-- Concepts: IS NULL, WHERE, date arithmetic (SYSDATE - issue_date)

SELECT
    ib.issue_id,
    s.name                              AS student_name,
    s.email,
    b.title                             AS book_title,
    b.category,
    ib.issue_date,
    TRUNC(SYSDATE - ib.issue_date)      AS days_kept
FROM issuedbooks ib
JOIN students s ON ib.student_id = s.student_id
JOIN books    b ON ib.book_id    = b.book_id
WHERE ib.return_date IS NULL
  AND ib.issue_date < SYSDATE - 14
ORDER BY days_kept DESC;


-- QUERY 2: Penalty Report
-- Show fine amount for each overdue book (₹2 per day overdue)
-- Concepts: CASE WHEN, date arithmetic, calculated column

SELECT
    s.name                                          AS student_name,
    b.title                                         AS book_title,
    ib.issue_date,
    TRUNC(SYSDATE - ib.issue_date)                  AS days_kept,
    TRUNC(SYSDATE - ib.issue_date) - 14             AS overdue_days,
    CASE
        WHEN TRUNC(SYSDATE - ib.issue_date) > 14
        THEN (TRUNC(SYSDATE - ib.issue_date) - 14) * 2
        ELSE 0
    END                                             AS fine_amount
FROM issuedbooks ib
JOIN students s ON ib.student_id = s.student_id
JOIN books    b ON ib.book_id    = b.book_id
WHERE ib.return_date IS NULL
  AND ib.issue_date < SYSDATE - 14
ORDER BY fine_amount DESC;


-- QUERY 3: Most Popular Book Categories
-- Which category is borrowed the most
-- Concepts: COUNT, GROUP BY, ORDER BY

SELECT
    b.category,
    COUNT(ib.issue_id)   AS times_borrowed
FROM books b
JOIN issuedbooks ib ON b.book_id = ib.book_id
GROUP BY b.category
ORDER BY times_borrowed DESC;


-- QUERY 4: Inactive Students
-- Students who have NEVER borrowed any book
-- Concepts: LEFT JOIN, IS NULL

SELECT
    s.student_id,
    s.name,
    s.email,
    s.join_date
FROM students s
LEFT JOIN issuedbooks ib ON s.student_id = ib.student_id
WHERE ib.issue_id IS NULL
ORDER BY s.join_date;


-- QUERY 5: Delete Inactive Student Accounts
-- Remove students who joined more than 3 years ago
-- and have never borrowed any book


-- First PREVIEW who will be deleted (run this before DELETE)
SELECT
    s.student_id,
    s.name,
    s.join_date
FROM students s
LEFT JOIN issuedbooks ib ON s.student_id = ib.student_id
WHERE ib.issue_id IS NULL
  AND s.join_date < SYSDATE - (3 * 365);

-- Then run this to actually delete them
DELETE FROM students
WHERE student_id IN (
    SELECT s.student_id
    FROM students s
    LEFT JOIN issuedbooks ib ON s.student_id = ib.student_id
    WHERE ib.issue_id IS NULL
      AND s.join_date < SYSDATE - (3 * 365)
);

COMMIT;

-- Confirm remaining students after cleanup
SELECT student_id, name, join_date FROM students ORDER BY join_date;

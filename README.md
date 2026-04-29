# 📚 Digital Library Audit System

An Oracle 21c SQL project that tracks book loans in a college library
and generates audit reports for overdue books, penalties, and inactive accounts.

Built as part of the **Virtusa SQL Project**.

---

## 📌 What This Project Does

- Tracks which student borrowed which book and when
- Finds overdue books (not returned within 14 days)
- Calculates fine amount per overdue book (₹2/day)
- Shows which book categories are most popular
- Identifies and cleans up inactive student accounts

---

## 🗂️ Project Structure

```
digital_library/
│
├── 01_create_tables.sql    # 3 tables + sequences
├── 02_insert_data.sql      # Sample books, students, issued records
├── 03_queries.sql          # All 5 audit queries
└── README.md
```

---

## 🗄️ Database Schema

```
BOOKS (book_id PK, title, author, category)
          │
          └──► ISSUEDBOOKS (issue_id PK, book_id FK, student_id FK,
                             issue_date, return_date)
                                │
STUDENTS (student_id PK, name, email, join_date)
```

---

## 📊 Queries & What They Answer

| # | Query | SQL Concepts |
|---|---|---|
| 1 | Which books are overdue? | IS NULL, date arithmetic |
| 2 | Penalty report with fine amount | CASE WHEN, calculated column |
| 3 | Most popular categories | COUNT, GROUP BY, ORDER BY |
| 4 | Students who never borrowed | LEFT JOIN, IS NULL |
| 5 | Delete 3+ year inactive accounts | DELETE, subquery |

---

## ▶️ How to Run (SQL*Plus)

```sql
@01_create_tables.sql
@02_insert_data.sql
@03_queries.sql
```

---

## 🛠️ Oracle SQL Concepts Used

| Concept | Where Used |
|---|---|
| PRIMARY KEY, FOREIGN KEY | All 3 tables |
| SEQUENCES | Auto-generate IDs |
| IS NULL | Find unreturned books |
| SYSDATE - date | Calculate days kept |
| CASE WHEN | Fine calculation logic |
| COUNT + GROUP BY | Category popularity |
| LEFT JOIN + IS NULL | Inactive students |
| DELETE + subquery | Clean up old accounts |
| TRUNC() | Remove time from date diff |

---

## 📚 What I Learned

- Designing a 3-table relational schema with foreign keys
- Using IS NULL to find missing/incomplete records
- Calculating date differences using SYSDATE arithmetic
- Applying CASE WHEN for conditional fine calculation
- Using LEFT JOIN to find records with no match (inactive students)
- Writing a safe DELETE using a subquery with preview first

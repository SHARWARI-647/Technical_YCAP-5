# Day 3 – NoSQL Fundamentals with MongoDB

📅 **Day 3: NoSQL Fundamentals — MongoDB**

Day 3 of the Technical-Ycap Training Program focused on understanding NoSQL databases and performing practical database operations using MongoDB. The session covered document-oriented database concepts, CRUD operations, data filtering, sorting, and aggregation.

## 🧠 Topics Covered

- Introduction to NoSQL databases and MongoDB
- Differences between SQL and NoSQL databases
- Database, collections, and documents
- Creating databases and collections
- Inserting documents using `insertOne()` and `insertMany()`
- Retrieving documents using `find()` and `findOne()`
- Updating documents using `updateOne()` and `updateMany()`
- Deleting documents using `deleteOne()` and `deleteMany()`
- Sorting records using `sort()`
- Retrieving specific records using `skip()` and `limit()`
- Aggregation framework and pipelines

## 👨‍💻 Practical Work – Employee Database Using MongoDB

Created and practised MongoDB queries using an `employees` collection containing employee information.

**Collection Fields:**
- `employee_id`
- `name`
- `department`
- `role`
- `salary`
- `joining_date`

### CRUD Operations

- Inserted single and multiple employee documents.
- Retrieved employee records using filtering conditions.
- Updated individual and multiple employee documents.
- Deleted specific and multiple records.
- Sorted employee records based on salary.
- Used `skip()` and `limit()` to retrieve selected records.

### Aggregation Operations

Practised MongoDB aggregation pipelines using:

| Operator | Purpose |
|---|---|
| `$group` | Groups documents based on a specified field |
| `$sum` | Calculates the total or count |
| `$avg` | Calculates the average salary |
| `$min` | Finds the minimum salary |
| `$max` | Finds the maximum salary |
| `$sort` | Sorts aggregation results |

Also performed department-wise employee grouping and salary analysis.

## 📂 Practical Files

This folder contains MongoDB scripts and queries practised during Day 3:

- `insert-employee-data.js`
- `find-queries.js`
- `update-delete-queries.js`
- `aggregation-queries.js`

## 🚀 Learning Outcomes

- Understood the fundamentals of NoSQL and document-oriented databases.
- Gained practical experience with MongoDB database and collection management.
- Learned to perform CRUD operations on documents.
- Practised filtering, sorting, skipping, and limiting records.
- Applied aggregation pipelines for employee data analysis.
- Understood the differences between relational and NoSQL databases.

## 🏆 Overall Training Learning Outcomes

After completing the three-day Technical-Ycap Training Program, I gained practical knowledge of:

- SQL and NoSQL database fundamentals.
- MySQL database creation and query execution.
- Relational database design and table relationships.
- Food Ordering System database development.
- MongoDB document management and CRUD operations.
- Aggregation pipelines and data analysis.
- Applying database concepts to practical scenarios.

## 📌 Note

All Day 1, Day 2, and Day 3 practical work is organized into their respective folders/branches of this repository.

This repository represents my learning journey through the **Technical-Ycap Training Program**, covering MySQL, practical SQL development, and MongoDB fundamentals.

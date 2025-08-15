# HR Analysis using SQL
📌 Project Overview

This project demonstrates HR data management and analysis using SQL. It includes creating a database from scratch, defining tables for employees, departments, jobs, and locations, and performing SQL queries to gain insights into workforce structure, performance, and trends.

🗂 Database & Tables

The database schema is designed to reflect a realistic HR system:

1. Countries

Stores country information for locations.

CREATE TABLE countries(
    country_id VARCHAR(2) NOT NULL,
    country_name VARCHAR(40) DEFAULT NULL,
    region_id DECIMAL(10,0) DEFAULT NULL,
    PRIMARY KEY(country_id),
    KEY countr_reg_fk(region_id)
);

2. Departments

Stores information about company departments.

CREATE TABLE DEPARTMENTS(
    DEPARTMENT_ID DECIMAL(4,0) NOT NULL DEFAULT '0',
    DEPARTMENT_NAME VARCHAR(40) NOT NULL,
    MANAGER_ID DECIMAL(7,0) DEFAULT NULL,
    LOCATION_ID DECIMAL(5,0) DEFAULT NULL,
    PRIMARY KEY (DEPARTMENT_ID),
    KEY DEPT_MGR_FK(MANAGER_ID),
    KEY DEPT_LOCATION_IX (LOCATION_ID)
);

3. Employees

Stores employee details.

CREATE TABLE EMPLOYEES(
    EMPLOYEE_ID DECIMAL (7,0) NOT NULL DEFAULT '0',
    FIRST_NAME VARCHAR(30) DEFAULT NULL,
    LAST_NAME VARCHAR(35) NOT NULL,
    EMAIL VARCHAR(35) NOT NULL,
    PHONE_NUMBER VARCHAR(30) DEFAULT NULL,
    HIRE_DATE DATE NOT NULL,
    JOB_ID VARCHAR(15) NOT NULL,
    SALARY DECIMAL (9,2) DEFAULT NULL,
    COMMISSION_PCT DECIMAL (3,2) DEFAULT NULL,
    MANAGER_ID DECIMAL (7,0) DEFAULT NULL,
    DEPARTMENT_ID DECIMAL(5,0) DEFAULT NULL,
    PRIMARY KEY (EMPLOYEE_ID),
    UNIQUE KEY EMP_EMAIL_UK(EMAIL),
    KEY EMP_DEPARTMENT_IX (DEPARTMENT_ID),
    KEY EMP_JOB_IX(JOB_ID),
    KEY EMP_MANAGER_IX(MANAGER_ID),
    KEY EMP_NAME_IX (LAST_NAME, FIRST_NAME)
);

4. Jobs

Stores job roles and salary ranges.

CREATE TABLE JOBS (
    JOB_ID VARCHAR(20) NOT NULL DEFAULT '',
    JOB_TITLE VARCHAR(45) NOT NULL,
    MIN_SALARY DECIMAL (7,0) DEFAULT NULL,
    MAX_SALARY DECIMAL (7,0) DEFAULT NULL,
    PRIMARY KEY(JOB_ID)
);

5. Job History

Tracks employee job changes and department transfers.

CREATE TABLE JOB_HISTORY(
    EMPLOYEE_ID DECIMAL (7,0) NOT NULL,
    START_DATE DATE NOT NULL,
    END_DATE DATE NOT NULL,
    JOB_ID VARCHAR(10) NOT NULL,
    DEPARTMENT_ID DECIMAL (5,0) DEFAULT NULL,
    PRIMARY KEY(EMPLOYEE_ID, START_DATE),
    KEY JHIST_DEPARTMENT_IX(DEPARTMENT_ID),
    KEY JHIST_EMPLOYEE_IX(EMPLOYEE_ID),
    KEY JHIST_JOB_IXG(JOB_ID)
);

6. Locations

Stores location information for departments and offices.

CREATE TABLE LOCATIONS(
    LOCATION_ID DECIMAL (5,0) NOT NULL DEFAULT '0',
    STREET_ADDRESS VARCHAR(50) DEFAULT NULL,
    POSTAL_CODE VARCHAR(15) DEFAULT NULL,
    CITY VARCHAR(30) NOT NULL,
    STATE_PROVINCE VARCHAR(30) DEFAULT NULL,
    COUNTRY_ID VARCHAR(2) DEFAULT NULL,
    PRIMARY KEY (LOCATION_ID),
    KEY LOC_CITY_IX(CITY),
    KEY LOC_COUNTRY_IX(COUNTRY_ID),
    KEY LOC_STATE_PROVINCE_IX(STATE_PROVINCE)
);

🛠 Tools & Technologies

SQL (MySQL / PostgreSQL / SQLite)

SQL Clients: MySQL Workbench, DBeaver, or pgAdmin

📊 Analysis Performed

After creating the database, you can run SQL queries to analyze:

Employee Demographics

Count employees by department and gender

Average age and salary per department

Employee Performance & Job Roles

Identify top-performing employees

Count employees by job role

Attrition & Transfers

Employees leaving the company

Departmental transfers from JOB_HISTORY

Salary & Compensation

Min, max, and average salaries per department

Commission distribution across employees

Location & Regional Analysis

Employees per city, state, or country

Department distribution across locations

📌 Sample Query
-- Count employees by department
SELECT D.DEPARTMENT_NAME, COUNT(E.EMPLOYEE_ID) AS employee_count
FROM EMPLOYEES E
JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY D.DEPARTMENT_NAME;

-- Average salary by job role
SELECT JOB_ID, AVG(SALARY) AS avg_salary
FROM EMPLOYEES
GROUP BY JOB_ID;

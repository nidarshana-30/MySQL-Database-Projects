# Layoff Dataset Analysis – Data Cleaning & EDA using SQL
## 📌 Project Overview

This project focuses on performing data cleaning and exploratory data analysis (EDA) on a layoff dataset using SQL. The main objective is to transform raw data into a clean, structured format and gain insights on layoffs across industries, companies, and locations.

## 🗂 Dataset Description

* Dataset Name: Layoff Dataset

* Format: CSV / SQL table

* Columns include (examples):

* Company – Name of the company

* Industry – Sector or industry

* Location – City or country of layoffs

* Date – Date of layoff

* Employees_Laid_Off – Number of employees affected


## 🧹 Data Cleaning Steps

Performed using SQL queries:

* Removed duplicates – Ensured no repeated records exist.

* Handled missing values – Applied NULL checks and replaced or removed missing entries.

* Standardized formats – Dates formatted to YYYY-MM-DD, company and industry names cleaned for consistency.

* Validated numeric fields – Ensured Employees_Laid_Off contains positive integers.

* Created derived columns – For example, extracted Year and Month from Date for temporal analysis.

## 📊 Exploratory Data Analysis (EDA)

Performed using SQL queries and aggregations:

Layoffs by Year:

    SELECT YEAR(Date) AS Year, SUM(Employees_Laid_Off) AS Total_Layoffs
    FROM layoffs
    GROUP BY YEAR(Date)
    ORDER BY Year;


Top Companies with Maximum Layoffs:

    SELECT Company, SUM(Employees_Laid_Off) AS Total_Layoffs
    FROM layoffs
    GROUP BY Company
    ORDER BY Total_Layoffs DESC
    LIMIT 10;


Industry-wise Layoffs:

    SELECT Industry, SUM(Employees_Laid_Off) AS Total_Layoffs
    FROM layoffs
    GROUP BY Industry
    ORDER BY Total_Layoffs DESC;


Location-wise Layoffs:

    SELECT Location, SUM(Employees_Laid_Off) AS Total_Layoffs
    FROM layoffs
    GROUP BY Location
    ORDER BY Total_Layoffs DESC;


Monthly Layoff Trends:

    SELECT YEAR(Date) AS Year, MONTH(Date) AS Month, SUM(Employees_Laid_Off) AS Total_Layoffs
    FROM layoffs
    GROUP BY YEAR(Date), MONTH(Date)
    ORDER BY Year, Month;

## 🔍 Key Insights

* The highest number of layoffs occurred in [Year].

* Top industries impacted: [Industry 1, Industry 2, ...].

* Companies with largest layoffs: [Company 1, Company 2, ...].

* Layoffs are concentrated in [Top Cities/Locations].

* Seasonal trends observed: Layoffs spike in [Month/Quarter].

## 🛠 Tools & Technologies

* Database: MySQL / PostgreSQL / SQLite

* Querying: SQL (SELECT, GROUP BY, JOIN, WHERE, CASE)

* Data Visualization (optional): Tableau / Power BI / Excel


Querying: SQL (SELECT, GROUP BY, JOIN, WHERE, CASE)

Data Visualization (optional): Tableau / Power BI / Excel

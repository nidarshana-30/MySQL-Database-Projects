-- EXPLORATORY DATA ANALYSIS --

SELECT  *
FROM layoff_stand1;

SELECT  MAX(total_laid_off),MAX(percentage_laid_off)
FROM layoff_stand1;

SELECT  *
FROM layoff_stand1
WHERE percentage_laid_off=1
ORDER BY funds_raised_millions DESC;

SELECT  company, SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company
ORDER BY 2 DESC;

SELECT MIN(`date`),MAX(`date`)
FROM layoff_stand1;

SELECT  industry, SUM(total_laid_off)
FROM layoff_stand1
GROUP BY industry
ORDER BY 2 DESC;

SELECT  country, SUM(total_laid_off)
FROM layoff_stand1
GROUP BY country
ORDER BY 2 DESC;

SELECT  *
FROM layoff_stand1;

SELECT YEAR( `date`), SUM(total_laid_off)
FROM layoff_stand1
GROUP BY YEAR( `date`)
ORDER BY 1 DESC;

SELECT stage, SUM(total_laid_off)
FROM layoff_stand1
GROUP BY stage
ORDER BY 2 DESC;

SELECT  company,SUM(percentage_laid_off)
FROM layoff_stand1
GROUP BY company
ORDER BY 2 DESC;

SELECT SUBSTRING(`date`,1,7) AS 'month',SUM(total_laid_off)
FROM layoff_stand1
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY SUBSTRING(`date`,1,7)
ORDER BY 1 ;

WITH ROLL AS
(
SELECT SUBSTRING(`date`,1,7) AS mon,SUM(total_laid_off) AS total
FROM layoff_stand1
WHERE SUBSTRING(`date`,1,7) IS NOT NULL
GROUP BY mon
ORDER BY 1 
)
SELECT mon,total,SUM(total) OVER(ORDER BY mon) AS roll_no
FROM ROLL;

SELECT  company, SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company
ORDER BY 2 DESC;

SELECT  company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company,YEAR(`date`)
ORDER BY 3 DESC;


WITH company_yr (company,yrs,total_lay) AS 
(
SELECT  company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company,YEAR(`date`)
)
SELECT*
FROM company_yr;

WITH company_yr (company,yrs,total_lay) AS 
(
SELECT  company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company,YEAR(`date`)
)
SELECT*,DENSE_RANK() OVER(PARTITION BY yrs ORDER BY total_lay DESC) AS ranking
FROM company_yr
WHERE yrs IS NOT NULL
ORDER BY ranking ASC ;

WITH company_yr (company,yrs,total_lay) AS 
(
SELECT  company,YEAR(`date`), SUM(total_laid_off)
FROM layoff_stand1
GROUP BY company,YEAR(`date`)
),
company_yr_rank AS
(
SELECT*,DENSE_RANK() OVER(PARTITION BY yrs ORDER BY total_lay DESC) AS ranking
FROM company_yr
WHERE yrs IS NOT NULL
)
SELECT * 
FROM company_yr_rank
WHERE ranking <=5;



























































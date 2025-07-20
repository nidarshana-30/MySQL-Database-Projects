-- DATA CLEANING --

SELECT * 
FROM layoffs;

-- 1. Remove Duplicates --
-- 2. Standardize the data --
-- 3. Null values and blank values --
-- 4. remove any columns --

CREATE TABLE layoff_stand
LIKE layoffs;
SELECT * FROM layoff_stand;
INSERT layoff_stand
SELECT *FROM layoffs;    # we just created the table to copy that raw data into this table because for best practices,
                             #we just want to keep raw data without any editing so that we just copied those data into another table

-- REMOVE DUPLICATES --

SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',
stage,country,funds_raised_millions) AS row_no
FROM layoff_stand; # just partitioning to see rows

WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',
stage,country,funds_raised_millions) AS row_no
FROM layoff_stand
)
SELECT*
FROM duplicate_cte
WHERE row_no>1;   # we just partitioning the dataset into row_number so we can identify the duplicates which is repeated

SELECT*
FROM layoff_stand
WHERE company='cazoo'; # to check the duplicate

WITH duplicate_cte AS
(
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',
stage,country,funds_raised_millions) AS row_no
FROM layoff_stand
)
DELETE
FROM duplicate_cte
WHERE row_no>1;  # DELETE is not updated so we can't use delete directly

CREATE TABLE `layoff_stand1`(
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_no` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

SELECT *FROM layoff_stand1;

INSERT INTO layoff_stand1
SELECT*,
ROW_NUMBER() OVER(PARTITION BY company,location,industry,total_laid_off,percentage_laid_off,'date',
stage,country,funds_raised_millions) AS row_no
FROM layoff_stand;

SELECT *FROM layoff_stand1
WHERE row_no>1;

DELETE FROM layoff_stand1
WHERE row_no>1;

SELECT *FROM layoff_stand1;

-- Standardizing data --
#finding issues in data and fixing it

SELECT TRIM(company),company
FROM layoff_stand1;  # wejust trim the data because that column has many space in left side 

UPDATE layoff_stand1
SET company=TRIM(company); # updated the trimmed data into company

SELECT DISTINCT industry
FROM layoff_stand
ORDER BY industry; # just check in industry wheather that has same content but different field name,if it is different then change into same field name

SELECT *
FROM layoff_stand
WHERE industry LIKE 'Crypto%'; # its just checking process 

UPDATE layoff_stand
SET industry='Crypto'
WHERE industry LIKE 'Crypto%'; # update crypto currency into crypto in industry column

SELECT DISTINCT industry
FROM layoff_stand
ORDER BY 1; #checking process

SELECT DISTINCT location
FROM layoff_stand1
ORDER BY 1; # no change in this column because it is perfect

SELECT DISTINCT country
FROM layoff_stand1
ORDER BY 1; # checking process

SELECT *
FROM layoff_stand1
WHERE country LIKE 'United States.%';# again checking process

SELECT DISTINCT country,TRIM(TRAILING '.' FROM country) 
FROM layoff_stand1
ORDER BY 1;# deleting the .

UPDATE layoff_stand1
SET country=TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%'; #update the UN. into UN

SELECT *
FROM layoff_stand1
WHERE country LIKE 'United States.%'; #pdated checked 

SELECT `date`,
STR_TO_DATE(`date`,'%m/%d/%Y')
FROM layoff_stand1
ORDER BY 1;  # convert into date

SELECT `date` FROM layoff_stand1 LIMIT 10;# checking


UPDATE layoff_stand1
SET `date` = STR_TO_DATE(`date`, '%m/%d/%Y')
WHERE `date` LIKE '%/%/%';#update the date

SELECT DISTINCT *FROM layoff_stand1; #final check table

ALTER TABLE layoff_stand MODIFY `date` DATE;# change into date column from text mode

SELECT  *FROM layoff_stand1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS null;
 

 
SELECT  *FROM layoff_stand1
WHERE industry IS NULL
OR industry='';

UPDATE layoff_stand1
SET industry = NULL
WHERE TRIM(industry) = '';


SELECT  *FROM layoff_stand1
WHERE company='Airbnb';

SELECT st1.industry AS Industry1, st2.industry AS Industry2
FROM layoff_stand1 st1
JOIN layoff_stand1 st2
ON st1.company = st2.company
AND st1.location = st2.location
WHERE (st1.industry IS NULL OR TRIM(st1.industry) = '')
  AND st2.industry IS NOT NULL;


UPDATE layoff_stand1 st1
JOIN layoff_stand1 st2
ON st1.company=st2.company
SET st1.industry=st2.industry
WHERE st1.industry IS NULL 
AND st2.industry IS NOT NULL;

SELECT  *FROM layoff_stand1
WHERE industry IS NULL
OR industry='';

SELECT  *FROM layoff_stand1
WHERE company LIKE 'Bally%';

SELECT  *
FROM layoff_stand1;

SELECT  *FROM layoff_stand1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS null;

DELETE
FROM layoff_stand1
WHERE total_laid_off IS NULL
AND percentage_laid_off IS null;

SELECT  *
FROM layoff_stand1;

ALTER TABLE layoff_stand1
DROP COLUMN row_no;































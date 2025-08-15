create database HR;
use HR;
create table countries(
country_id varchar(2) not null,
country_name varchar(40) default null,
region_id decimal(10,0) default null,
primary key(country_id), key countr_reg_fk(region_id));

insert into countries (country_id,country_name, region_id) values('AR', 'ARGENTINA','2');
insert into countries (country_id,country_name, region_id) values('AU', 'AUSTRALIA','3');
insert into countries (country_id,country_name, region_id) values('BE', 'BELGIUM', '1');
insert into countries (country_id,country_name, region_id) values('BR', 'BRAZIL','2');
insert into countries (country_id,country_name, region_id) values('CA', 'CANADA', '2');
insert into countries (country_id,country_name, region_id) values('CH', 'SWITZERLAND', '1');
insert into countries (country_id,country_name, region_id) values('CN', 'CHINA','3');
insert into countries (country_id,country_name, region_id) values('DE', 'GERMANY', '1');
insert into countries (country_id,country_name, region_id) values('DK', 'DENMARK', '1');
insert into countries (country_id,country_name, region_id) values('EG','EGYPT','4');
insert into countries (country_id,country_name, region_id) values('FR', 'FRANCE', '1');
insert into countries (country_id,country_name, region_id) values('HK', 'HONGKONG','3');
insert into countries (country_id,country_name, region_id) values('IL', 'ISRAEL', '4');
insert into countries (country_id,country_name, region_id) values('IN','INDIA','3');
insert into countries (country_id,country_name, region_id) values('IT', 'ITALY', '1');
insert into countries (country_id,country_name, region_id) values('JP','JAPAN', '3');
insert into countries (country_id,country_name, region_id) values('KW', 'KUWAIT', '4');
insert into countries (country_id,country_name, region_id) values('MX', 'MEXICO', '2');
insert into countries (country_id,country_name, region_id) values('NG', 'NIGERIA','4');
insert into countries (country_id,country_name, region_id) values('NL', 'NETHERLANDS', '1');
insert into countries (country_id,country_name, region_id) values('SG','SINGAPORE','3');
insert into countries (country_id,country_name, region_id) values('UK', 'UNITED KINGDOM', '1');
insert into countries (country_id,country_name, region_id) values('US', 'UNITED STATES OF AMERICA', '2');
insert into countries (country_id,country_name, region_id) values('ZM','ZAMBIA', '4');
insert into countries (country_id,country_name, region_id) values('ZW', 'ZIMBABWE','4');

DROP TABLE countries;
select * from countries;

CREATE TABLE DEPARTMENTS(
DEPARTMENT_ID DECIMAL(4,0) NOT NULL DEFAULT '0',
DEPARTMENT_NAME VARCHAR(40) NOT NULL,
MANAGER_ID DECIMAL(7,0) DEFAULT NULL,
LOCATION_ID DECIMAL(5,0) DEFAULT NULL,
PRIMARY KEY (DEPARTMENT_ID), KEY DEPT_MGR_FK(MANAGER_ID),
KEY DEPT_LOCATION_IX (LOCATION_ID));

INSERT INTO DEPARTMENTS (DEPARTMENT_ID, DEPARTMENT_NAME, MANAGER_ID, LOCATION_ID)values
('10', 'ADMINISTRATION', '200', '1700'),
('20', 'MARKETING', '201', '1800'),
('30', 'PURCHASING', '114', '1700'), 
('40', 'HUMAN RESOURCES', '203', '2400'), 
('50', 'SHIPPING', '121', '1500'),
('60', 'IT', '103', '1400'),
 ('70', 'PUBLIC RELATIONS', '204', '2700'),
 ('80', 'SALES', '145', '2500'),
('90', 'EXECUTIVE', '100', '1700'),
('100', 'FINANCE','109','1700'),
('110', 'ACCOUNTING', '205', '1700'),
('120' ,'TREASURY', '0', '1700'),
('130', 'CORPORATE TAX', '0', '1700'),
('140', 'CONTROL AND CREDIT', '0', '1700'),
('150', 'SHAREHOLDER SERVICES', '0', '1700'),
('160', 'BENEFITS', '0', '1700'),
('170', 'MANUFACTURING', '0', '1700'),
('180', 'CONSTRUCTION', '0', '1700'),
('190', 'CONTRACTING', '0', '1700'),
('200', 'OPERATIONS', '0', '1700'),
('210', 'IT SUPPORT', '0', '1700'),
('220', 'NOC', '0', '1700'),
('230', 'IT HELPDESK', '0', '1700'),
('240', 'GOVERNMENT SALES', '0', '1700'),
('250', 'RETAIL SALES', '0', '1700'),
('260', 'RECRUITING', '0', '1700'),
('270', 'PAYROLL','0','1700');

select * from DEPARTMENTS;

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

INSERT INTO EMPLOYEES (EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER,HIRE_DATE,JOB_ID, SALARY ,COMMISSION_PCT,MANAGER_ID, DEPARTMENT_ID)values

(100, 'Daniel', 'Smith', 'DSMITH', '515.123.7632', '1987-06-18', 'IT_PROG', 16211.79, 0.18, 120, 43),
(101, 'Daniel', 'Ernst', 'DERNST', '515.123.3153', '1987-06-18', 'FI_MGR', 14192.68, 0.07, 130, 42),
(102, 'Daniel', 'De Haan', 'DDEHAAN', '515.123.3371', '1987-06-18', 'PR_REP', 19701.38, 0.07, 101, 50),
(103, 'Bruce', 'King', 'BKING', '515.123.1783', '1987-06-18', 'HR_REP', 13006.10, 0.22, 101, 75),
(104, 'Valli', 'Jones', 'VJONES', '515.123.3079', '1987-06-18', 'SA_MAN', 6803.15, 0.07, 155, 19),
(105, 'David', 'Pataballa', 'DPATABALLA', '515.123.8482', '1987-06-18', 'IT_PROG', 18978.12, 0.06, 115, 35),
(106, 'Valli', 'Smith', 'VSMITH', '515.123.9138', '1987-06-18', 'SA_MAN', 13783.91, 0.10, 147, 52),
(107, 'Valli', 'Ernst', 'VERNST', '515.123.4250', '1987-06-18', 'SA_MAN', 12345.67, 0.08, 130, 18),
(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-18', 'FI_ACCOUNT', 12000.00, NULL, 108, 100),
(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-18', 'FI_ACCOUNT', 9000.00, NULL, 108, 100),
(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-18', 'FI_ACCOUNT', 8200.00, NULL, 108, 100),
(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-18', 'FI_ACCOUNT', 7700.00, NULL, 108, 100),
(112, 'Jose', 'Urman', 'JURMAN', '515.124.4469', '1987-06-18', 'FI_ACCOUNT', 7800.00, NULL, 108, 100),
(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-18', 'FI_ACCOUNT', 6900.00, NULL, 108, 100),
('114', 'steven', 'king', 'sking','515.123.4567', '1987-06-18', 'AD_PRES', '24000.00','0.00','0','90');

select * from EMPLOYEES;

CREATE TABLE JOB_HISTORY(
EMPLOYEE_ID DECIMAL (7,0) NOT NULL,
START_DATE DATE NOT NULL,
END_DATE DATE NOT NULL,
JOB_ID VARCHAR(10) NOT NULL,
DEPARTMENT_ID DECIMAL (5,0) DEFAULT NULL,
PRIMARY KEY(EMPLOYEE_ID, START_DATE),
KEY JHIST_DEPARTMENT_IX(DEPARTMENT_ID),
KEY JHIST_EMPLOYEE_IX(EMPLOYEE_ID),
KEY JHIST_JOB_IXG(JOB_ID));

INSERT INTO JOB_HISTORY (EMPLOYEE_ID, START_DATE, END_DATE, JOB_ID, DEPARTMENT_ID) VALUES
('102', '1993-01-13', '1998-07-25', 'IT_PROG', '60'),
('101', '1989-09-22', '1993-10-28', 'AC_ACCOUNT', '110'),
('101', '1993-10-29', '1997-03-16', 'AC_MGR', '110'),
('201', '1996-02-17', '1999-12-19', 'MK_REP', '20'),
('114', '1998-03-24', '1999-12-31', 'ST_CLERK', '50'),
('122', '1999-01-02', '1999-12-31', 'ST_CLERK', '50'),
('200', '1987-09-17', '1993-06-18', 'AD_ASST', '90'),
('176', '1998-03-25', '1998-12-31', 'SA_REP', '80'),
('176', '1999-01-11', '1999-12-31', 'SA_MAN', '80');

select* from JOB_HISTORY;


CREATE TABLE JOBS (JOB_ID VARCHAR(20) NOT NULL DEFAULT '',
JOB_TITLE VARCHAR(45) NOT NULL,
MIN_SALARY DECIMAL (7,0) DEFAULT NULL,
MAX_SALARY DECIMAL (7,0) DEFAULT NULL,
PRIMARY KEY(JOB_ID));

INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY) VALUES
('AD_PRES', 'PRESIDENT', '20000', '40000'),
('AD_VP', 'ADMINISTRATION VICE PRISIDENT', '15000', '30000'),
('AD_ASST', 'ADMINISTRATION ASSISTANT', '3000', '6000'), 
('FI_MGR', 'FINANCE MANAGER', '8200', '16000'),
('FI_ACCOUNT', 'ACCOUNTANT', '4200', '900'),
 ('AC_MGR','ACCOUNTING MANAGER', '8200', '16000'),
('AC_ACCOUNT', 'PUBLIC ACCOUNTANT', '4200', '9000'),
 ('SA_MAN', 'SALES MANAGER', '10000', '20000'),
('SA_REP', 'SALES REPRESENTATIVE', '6000', '12000'),
 ('PU_MAN', 'PURCHASING MANAGER', '8000', '15000'),
('PU_CLERK', 'PURCHASING CLERK', '2500','5500'),
('ST_MAN', 'STOCK MANAGER', '5500','8500'),
('ST_CLERK', 'STOCK CLERK', '2000', '5000'),
('SH_CLERK','SHIPPING CLERK', '2500', '5500'),
('IT_PROG', 'PROGRAMMER', '4000', '10000'),
 ('MK_MAN', 'MARKETING MANAGER', '9000', '15000'),
('MK_REP', 'MARKETING REPRESENTATIVE', '4000', '9000'),
('HR_REP', 'HUMAN RESOURCES REPRESENTATIVE', '4000', '9000'),
('PR_REP',  'PUBLIC RELATIONS REPRESENTATIVE', '4500','10500');

SELECT * FROM JOBS;


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
KEY LOC_STATE_PROVINCE_IX(STATE_PROVINCE));


INSERT INTO LOCATIONS (LOCATION_ID, STREET_ADDRESS, POSTAL_CODE, CITY, STATE_PROVINCE, COUNTRY_ID) VALUES
(1000, '1297 VIA COLA DI RIE', '00144', 'ROME', '', 'IT'),
(1100, '93091 CALLE DELLA TESTA', '30121', 'VENICE', 'VENETO', 'IT'),
(1200, '2017 SHIBUYA CROSS', '1500002', 'TOKYO', 'TOKYO PREFECTURE', 'JP'),
(1300, '9454 HIROSHIMA AVE', '7300037', 'HIROSHIMA', '', 'JP'),
(1400, '19 DE JULIO STREET', '11200', 'MONTEVIDEO', 'MONTEVIDEO DEPARTMENT', 'UY'),
(1500, 'AV. PAULISTA', '01310000', 'SÃO PAULO', 'SÃO PAULO', 'BR'),
(1600, 'BUND FINANCE CENTER', '200120', 'SHANGHAI', 'SHANGHAI MUNICIPALITY', 'CN'),
(1700, 'KAPALI CARSISI', '34000', 'ISTANBUL', 'ISTANBUL', 'TR'),
(1800, 'RUE DE LA PAIX', '75002', 'PARIS', 'ÎLE-DE-FRANCE', 'FR'),
(1900, 'ALEXANDERPLATZ 1', '10178', 'BERLIN', 'BERLIN', 'DE'),
(2000, 'RUA AUGUSTA', '1160054', 'LISBON', 'LISBON DISTRICT', 'PT'),
(2100, 'KAMPALA ROAD', '25601', 'KAMPALA', 'CENTRAL REGION', 'UG'),
(2200, 'COLLINS STREET', '3000', 'MELBOURNE', 'VICTORIA', 'AU'),
(2300, 'QUEEN STREET', '6011', 'WELLINGTON', 'WELLINGTON REGION', 'NZ'),
(2400, 'MAIN STREET', 'D02', 'DUBLIN', 'LEINSTER', 'IE'),
(2500, '5TH AVENUE', '10001', 'NEW YORK', 'NEW YORK', 'US'),
(2600, 'BAY STREET', 'M5J2N8', 'TORONTO', 'ONTARIO', 'CA'),
(2700, 'ALVARO OBREGON', '06700', 'MEXICO CITY', 'CDMX', 'MX'),
(2800, 'STADIUM ROAD', '54000', 'LAHORE', 'PUNJAB', 'PK'),
(2900, 'MAHATMA GANDHI ROAD', '560001', 'BANGALORE', 'KARNATAKA', 'IN'),
(3000, 'CORNICHE STREET', '12345', 'DOHA', 'DOHA MUNICIPALITY', 'QA'),
(3100, 'RUA DA BAHIA', '30160011', 'BELO HORIZONTE', '', 'BR'),
(3200, 'NILE AVENUE', '00200', 'CAIRO', 'CAIRO GOVERNORATE', 'EG'),
(3300, 'SHEIKH ZAYED ROAD', '00000', 'DUBAI', 'DUBAI EMIRATE', 'AE'),
(3400, 'ORCHARD ROAD', '238801', 'SINGAPORE', 'CENTRAL REGION', 'SG');


select * from LOCATIONS;


CREATE TABLE REGIONS (REGION_ID DECIMAL (6,0) NOT NULL,
REGION_NAME VARCHAR(35) DEFAULT NULL,
PRIMARY KEY (REGION_ID),
UNIQUE KEY SSS (REGION_NAME));

INSERT INTO REGIONS(REGION_ID, REGION_NAME) VALUES
('1', 'EUROPE\r'),
('2', 'AMERICAS\r'),
('3', 'ASIA\r'),
('4', 'MIDDLE EAST AND AFRICA\r');

select first_name "First Name", last_name "Last Name" from employees;  /*change name using aliasing */
select distinct department_id from employees;     /*unique values*/
select * from employees order by first_name desc;     /*desc order*/

select first_name, last_name, salary, salary*.15 PF from EMPLOYEES; -- new column that PF as salary of 15%
select employee_id, first_name, last_name, salary from EMPLOYEES order by salary; -- order by salary
select sum(salary) from EMPLOYEES;  -- sum of salary
select max(salary), min(salary) from EMPLOYEES; -- max,min of salary
select avg (salary), count(*) from EMPLOYEES;  -- avg of salary, count of the table
select count(*) count from EMPLOYEES; --  count of the employee table


select count(distinct job_id) from employees; -- unique count through id
select upper(first_name) from employees; -- uppercase
select substring(first_name, 1,3) from employees; -- substring the first name it will slice the name
Select 171*214+625 result; -- just performing calculation
select concat(first_name,' ',last_name) 'Employee Name' from employees; -- concat the name fields
Select trim(first_name) from employees; -- trim the white space 
select first_name, last_name, length (first_name)+length(last_name) 'Length of Names' from employees; -- len of the names
select * from employees where first_name REGEXP '[0-9]'; -- regexp used for checking the values in it or not
select employee_id, first_name from employees limit 10; -- show only 10 rows
select first_name, last_name, round(salary/12,2) as 'Monthly Salary' from employees; -- monthly salary calculation with 2 decimals 

select first_name, last_name, salary from employees where salary not between 10000 and 15000; -- not in the 10000,15000 in salary
select first_name, last_name, department_id from employees where department_id in (30,100) order by department_id asc; -- dptid in 30, 100 that should be ordered
select first_name, last_name, salary, department_id from employees where salary not between 10000 and 15000 and department_id in (30,100); -- combain both conditions in and function
select first_name, last_name, hire_date from employees where year(hire_date) like '1987%'; -- in hiredate should be in 1987 that should filter
select last_name, job_id, salary from employees where job_id in ('IT_PROG', 'SH_CLERK') and salary not in(4500, 10000,15000); -- it or sr in jobid and salary should not be in 4500,10000or 15000
select last_name from employees where last_name like '______' ; -- show only lastname contains 6 characters 
select last_name from employees where last_name like '__e%'; -- 3rd letter should be e 

select distinct job_id from employees; -- unique id
select first_name, last_name, salary, salary*.20 BONUS from employees; -- calculate bonus 20% in salary 
select * from employees where last_name in ('BLAKE', 'SCOTT', 'KING', 'FORD'); -- select only these names
select round(max(salary),0) from employees where job_id='IT_PROG'; -- from this jobid calculate max
select avg(salary), count(*) from employees where department_id=90; -- dptid = 90 should calculate salary avg and count them
select round(max(salary),0) 'Maximum', round(min(salary),0) 'Minimum',
round(sum(salary),0) 'Sum', round(avg(salary),0) 'Average' from employees; -- 0 decimal for all aggregate function through salary 
SELECT job_id, COUNT(*) FROM employees GROUP BY job_id; -- same jobid , no of employees

select max(salary)-min(salary) difference from employees; -- balance check
select manager_id, min(salary) from employees where manager_id is not null 
group by manager_id order by min(salary) desc; -- from managerid calculate min salary if we use more that 1 collunm name in the select we can use groupby 
select department_id, sum(salary) from employees group by department_id; -- sum of salary in dptid
select job_id, avg (Salary) from employees where job_id <> 'IT_PROG' group by job_id; -- avg salary for jobid is not in it prog 
select job_id,sum(salary), avg (salary), max(salary), min(salary) from employees 
where department_id='90' group by job_id; -- dptid should be 90 that perform all aggregate functions from jobid
select job_id, max(salary) from employees group by job_id having max(salary)>=4000; -- max salary that should have >4000 that is from jobid
select department_id, avg (salary), count(*) from employees group by department_id having count(*)>30; -- no of employess have more than 10 and calculate avg salary in dptid

/*WAQ to find the name(first_name, last_name) and the salary of the emp who have a higher salary than emp whose last_name='Bull'*/
select first_name, last_name, salary from employees
where salary>(select salary from employees where last_name='Bull');

/*WAQ to find the first_name, last_name of all emp who works in IT dept*/
 select first_name, last_name from employees where department_id in(
select department_id from departments where department_name='IT'); 

/*WAQ to find the first_name, last_name of the emp who have a manager and worked in a USA based department*/
select first_name, last_name from employees
where manager_id in (select employee_id from employees where department_id in (select department_id from departments where location_id in (select location_id from locations where country_id='US')));

/*WAQ to find first_name, last_name of emp who are managers*/
select first_name, last_name from employees where (employee_id in (select manager_id from employees));

/*WAQ to find first_name, last_name and salary of the emp whose salary is greater then the average salary*/
select first_name, last_name, salary from employees where
salary > (select avg(salary) from employees);

/*WAQ to find the first_name, last_name and salary of emp whose salary is equal to minimum salary for their job grade*/
select first_name, last_name, salary from employees where
employees.salary = (select min_salary from jobs where
employees.job_id=jobs.job_id);


/*WAQ to find the first_name, last_name and salary of the emp who earns more than the avg salary and works in any of IT dept*/
 select first_name, last_name, salary from employees where department_id in 
 (select department_id from departments where department_name like 'IT%') and salary > (select avg(salary) from employees);

/*WAQ to find the first_name, last_name and salary of the emp who earns more then the earning of Mr. Bell*/
select first_name, last_name, salary from employees where salary > (select salary from employees where last_name='Bell') 
order by first_name;

/*WAQ to find the first_name, last_name and salary of emp who earn the
same salary as the minimum salary for all departments*/
select * from employees where salary = (select min(salary) from employees);

/*WAQ to find the first_name, last_name and salary of emp whose salary if greater then the avg salary of all departments*/
SELECT * 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);


/*WAQ to find first_name, last_name and salary of employees who earns a 106 salary that is greater than the salary of all the shipping clerk
(job_id=SH_CLERK). sort the results of the salary of the lowest to highest*/
select first_name, last_name, job_id, salary from employees where salary > all (select salary from employees where job_id='SH_CLERK')
order by salary;

/*WAQ to find the first_name, last_name of the employees who are not supervisors*/
select b.first_name,b.last_name from employees b where not exists (select 'A' from employees a where a.manager_id=b.employee_id);

/*WAQ to display the employee id, first_name, last name and department names of all employees*/
select employee_id, first_name, last_name, (select department_name  from departments d 
where e.department_id=d.department_id) department from employees e order by department;

/*WAQ to display the employee id, first name, last name, salary of all employees whose salary is above average for their departments*/
select employee_id, first_name from employees as a where salary> (select avg(salary) from employees where department_id=a.department_id);

/*WAQ to fetch even numbered records from employee table*/
 set @i=0; 
 select i, employee_id from (select @i := @i+1 as i, employee_id from employees) a where mod(a.i,2)=0;

/*WAQ to find the 5th maximum salary in the employees table*/
select distinct salary from employees e1 where 5 = (select count(distinct salary) from employees e2 where e2.salary>= e1.salary);

/*WAQ to find the 4th minimum salary in the employees table*/
select distinct salary from employees e1 where 4 = (select count(distinct salary) from employees e2 where e2.salary<= e1.salary);

/*WAQ to select last 10 records from a table*/
select * from (select * from employees order by employee_id
desc limit 10) sub order by employee_id asc;

/*WAQ to list the department id and name of all the departments
where no employee is working*/
select * from departments where department_id not in (select department_id from employees);

/*WAQ to get 3 maximum salaries*/
select distinct salary from employees a where 3 >= (select
 count(distinct salary) from employees b where b.salary >= a.salary) order by a.salary desc;


/*WAQ to get 3 minimum salaries*/
select distinct salary from employees a where 3 >= (select count(distinct salary) from employees b 
where b.salary <= a.salary) order by a.salary desc;

/*WAQ to get nth max salaries of employee*/
select * from employees emp1 where (1) =(select count(distinct(emp2.salary)) from employees emp2
where emp2.salary > emp1.salary);

/*WAQ to find the addresses (location_id, street_address, city, state_province, country_name) of all the departments*/
select location_id, street_address, city, state_province, country_name 
from locations
natural join countries;

/*WAQ to find the name (first_name, last_name), department_id
and name of all the employees*/
select first_name, last_name, department_id, department_name
from employees
join departments using(department_id);

/*WAQ to find the first_name, last_name, job, department_id and name of the employees who works in london*/
select e.first_name,e.last_name,e.job_id,e.department_id,d.department_name from employees e join departments d 
on(e.department_id = d.department_id ) join locations i on (d.location_id=i.location_id) where upper(i.city)='SEATTLE';

/*WAQ to find the employee id, last_name along with their manager id and last_name*/
select e.employee_id 'Emp_Id', e.last_name 'Employee',
m.employee_id 'Mgr_Id', m.last_name 'Manager'
from employees e join employees m on
(e.manager_id = m.employee_id);

/*WAQ to find the first name, last name and hire date of the employees who was hired after 'Jones'*/
select e.first_name,e.last_name,e.hire_date from employees e
join employees davies
on(davies.last_name='Jones') where davies.hire_date < e.hire_date;

/*WAQ to get the department name and no of employees in the department*/
select department_name as 'Department Name', count(*) as
'No Of Employees' from departments inner join employees on employees.department_id=departments.department_id group by
departments.department_id, department_name order by department_name;

/*WAQ to find the employee id, job title, number of days between ending date and starting date for all jobs in department 90*/
 select employee_id, job_title, end_date-start_date Days from job_history natural join jobs where department_id=90;

/*WAQ to display the department id and first_name of manager*/
 select d.department_id, d.department_name,d.manager_id,e.first_name  from departments d 
 inner join employees e on(d.manager_id =  e.employee_id);

/*WAQ to display the department name, manager name and city*/
select d.department_name,e.first_name, l.city from departments d
join employees e on (d.manager_id=e.employee_id) join locations l using (location_id);

/*WAQ to display the job title and average salary of employees*/
 select job_title, avg (Salary) from employees natural join jobs group by job_title;


 /*WAQ to display job title, employee name and the difference between salary of the employee and minimum salary for the job*/
select job_title, first_name, salary-min_salary 'Salary-Min_Salary' from 
employees natural join jobs;

/*WAQ to display the job history that were done by any employee who is currently drawing more than 10000 of salary*/
select jh.* from job_history jh
join employees e on(jh.employee_id = e.employee_id)
where salary>10000;

/*WAQ to display the department name, first_name, last_name, hire_Date, salary of the manager for all managers whose exp is more then 25 yrs*/
select first_name, last_name, hire_date, salary, (datediff(now(), hire_date)/365) as experience 
from departments d join employees e on(d.manager_id = e.employee_id) where (datediff(now(), hire_date))/365>25;


/*WAQ to display the first day of the month 3 months before the current
2019-09-03 2019-06-01*/
select date(((period_add(extract(year_month from curdate()),-3)*100)+1));

/*WAQ to display the last day of the month 3 months before the current month*/
SELECT 
  LAST_DAY(CURDATE() - INTERVAL 3 MONTH) AS lastdayofthemonth;
;


/*WAQ to get distinct mondays from hiredate in employee table*/
SELECT DISTINCT STR_TO_DATE(CONCAT(YEARWEEK(hire_date, 1), '1'), '%X%V%w') AS monday_date
FROM employees;


/*WAQ to get the first day of the current year*/
SELECT MAKEDATE(EXTRACT(YEAR FROM CURDATE()), 1) AS first_day_of_year;

/*WAQ to get last day of the current year*/
select str_to_date(concat(12,31, extract(year from curdate())), '%m%d%Y');

/*WAQ to calculate the age in year*/
SELECT 
  YEAR(CURRENT_TIMESTAMP) - YEAR('1967-06-09') 
  - (RIGHT(CURRENT_TIMESTAMP, 5) < RIGHT('1967-06-09', 5)) 
  AS age;


/*WAQ to get current date January 8, 2020*/
select date_format(curdate(), '%M%e, %Y') as 'Current_Date';

/*WAQ to get the current date in Wednesday January 2020*/
select date_format(now(), '%W %M%Y');


/*WAQ to extract the year from the current date*/
select extract(year from now());

/*WAQ to get DATE value from a given day 730677*/
select from_days (730690);

/*WAQ to get first_name, hiredate from employees
where hiredate between 1987-06-01 and 1987-07-30*/
select first_name, hire_date from employees where hire_date
 between '1987-06-01 00:00:00' and '1987-07-30 23:19:59'; 


/*WAQ to display the current date in the foll format
Wednesday 8th January 2020 00:00:00*/
select date_format(curdate(), '%W %D %M%Y %T');

/*WAQ to display the current date in format 08/01/2020*/
select date_format(curdate(), '%d/%m/%Y');

/*WAQ to display current date in format 12:00 AM Jan 8,2020*/
select date_format(curdate(), '%1:%i %p %b %e, %Y');

/*WAQ to get firstname, lastname who joined in the month of june*/
select first_name, last_name from employees where month(hire_date)=6;

/*WAQ to get the years in which more then 10 emp joined*/
select date_format(hire_date, '%Y') from employees group by date_format(hire_date, '%Y') having count (Employee_id)>10;


/*WAQ to get firstname of employees who joined in 1987*/
select first_name, hire_date from employees where year(hire_date)=1987;


/*WAQ to get department name, manager ger name and salary of the manager for all
managers whose exp is more then 25 years*/
select department_name, first_name, salary from departments d join
employees e on(d.manager_id=e.manager_id)
where (sysdate()-hire_date)/365 > 25;


/*WAQ to get employee id last name and date of first salary of the employees*/
select employee_id, last_name, hire_date, last_day(hire_date) from employees; 

/*WAQ to get first name, hiredate and exp of the employees*/
select first_name, sysdate(), hire_date, datediff (sysdate(), hire_date)/365 from employees;


/*WAQ to get department id, year and number of employees joined*/
select department_id, date_format(hire_date, '%Y'), count(employee_id) from employees group by department_id, date_format(hire_date, '%Y')
order by department_id;


/*WAQ to get job_id and related employee id*/
 select job_id,group_concat(employee_id, '') 'Employees ID' from employees group by job_id;



/*WAQ to get job_id and related employee id*/
select job_id, group_concat(employee_id, '') 'Employees ID' from employees group by job_id;

/*WAQ to update the portion of the phone number in the emp table Within the phone number the substring '124' will be replaced by '999'/'27*/
update employees set phone_number=replace(phone_number, '124', '999') where
phone_number like '%124%';
select * from employees where phone_number like '%999%';


/*WAQ to get details of emp where the length of the first namegreater then or equal to 8*/
select * from employees where length (first_name)>=8;

/*WAQ to display leading zeros before maximum and minimum salary*/
select job_id, LPAD (max_salary, 7, '0')' Max Salary', LPAD(min_salary, 7,0)  'Min Salary' from jobs;

/*WAQ to append '@example.com' to email field*/

update employees set email=concat(email,'@example.com');
select * from employees;

/*WAQ to get employee id firstname and hiremonth*/
select employee_id, first_name, MID(hire_date, 6,2) as hire_month from
employees;


/*WAQ to get employee id, email id(discard the last three characters*/
select employee_id, reverse (substr(reverse (email), 4)) as Email_id from employees;


/*WAQ to find all emp where first name are in upper case*/
select * from employees where first_name=BINARY UPPER(first_name);

/*WAQ to extract the last 4 characters of phone number*/
select right(phone_number, 4) as 'Ph No' from employees;


/*WAQ to get last word of the street address*/
SELECT 
  location_id, 
  street_address, 
  SUBSTRING_INDEX(
    REPLACE(
      REPLACE(
        REPLACE(street_address, ',', ' '), 
      ')', ''), 
    '(', ' '), 
  ' ', -1) AS `Last word of street address`
FROM 
  locations;


/*WAQ to get locations that have minimum street length*/
 select * from locations where length(street_address) <= (select min(length(street_address)) from
locations);


/*WAQ to display the first word from those job titles which contains more the one words*/
select job_title, substr(job_title, 1, instr(job_title,' ')-1) from jobs;


/*WAQ to display the length of first name for employees where last name contains character 'c' after 2nd position*/
select first_name, last_name from employees where
instr(last_name, 'C')>2;

/*WAQ that displays the firstname and the length of the firstname
for all emp whose name starts with letters 'A', 'J' or 'M'
give each column an appriopriate label, sort the result by firstname*/
select first_name "Name", length (first_name) "Length"
from employees
where first_name like '%' or first_name like 'M%' or first_name
like 'A%' order by first_name;



/*WAQ to display the firstname and salary for all emp format the salary to be 10 char long, left padded with th e$ symbol, label SALARY*/
select first_name, lpad (salary, 10, '$') SALARY from employees;


/*WAQ to display the first 8 char of the emp first_name and indicate
the amount of their salaries with $ sign. each $ sign signifies a thous dollars. sort the data in descending order of salary*/
select left(first_name, 8), repeat('$', floor (salary/1000)) 'Salary($)',
salary from employees order by salary desc;



/*WAQ to display the employees with their code, first name, last name and hiredate who hired either on seventh day of any month or seventh month in any year*/
select employee_id, first_name, last_name, hire_date from employees
where position("97" in date_format(hire_date, '%d %m %Y'))>0;







create table Employee
(Employee_id int  PRIMARY KEY,
First_name varchar(30), 
Last_Name varchar(30),
Salary int,
Joining_date smalldatetime ,
Department varchar(30),)

select * from Employee

 insert into Employee values (1,'Anika','Arora',100000,'2020-02-14 9:00:00','HR')

 insert into Employee values (2,'Veena','Verma',80000,'2011-06-15 9:00:00','Admin')

 insert into Employee values (3,'Vishal','Singhal',300000,'2020-02-16 9:00:00','HR')

  insert into Employee values (4,'Sushanth','Singh',500000,'2020-02-17 9:00:00','Admin')

 insert into Employee values (5,'Bhupal','Bhati',500000,'2011-06-18 9:00:00','Admin')

 insert into Employee values (6,'Dheeraj','Diwan',200000,'2011-06-19 9:00:00','Account')

 insert into Employee values (7,'Karan','Kumar',75000,'2020-01-14 9:00:00','Account')

 insert into Employee values (8,'Chandrika','Chauhan',90000,'2011-04-15 9:00:00','Admin')

 create table EmployeeBonus(Employee_ref_id int foreign key(Employee_ref_id) 
 references employee (employee_id) ,
 Bonus_Amount int , Bonus_Date smalldatetime)

 select * from EmployeeBonus

 insert into EmployeeBonus values
 (1,5000,'2020-02-16 0:00:00'),
 (2,3000,'2011-06-16 0:00:00'),
 (3,4000,'2020-02-16 0:00:00'),
 (1,4500,'2020-02-16 0:00:00'),
 (2,3500,'2011-06-16 0:00:00')

 create table EmployeeTitle
 (Employee_ref_id int , 
 Employee_title varchar (30), 
 Affective_Date smalldatetime)

 insert into employeetitle values
 (1,'Manager','2016-02-20 0:00:00'),
 (2,'Executive','2016-06-11 0:00:00'),
 (8,'Executive','2016-06-11 0:00:00'),
 (5,'Manager','2016-06-11 0:00:00'),
 (4,'Asst.Manager','2016-06-11 0:00:00'),
 (7,'Executive','2016-06-11 0:00:00'),
 (6,'Lead','2016-06-11 0:00:00'),
 (3,'Lead','2016-06-11 0:00:00')

 select * from EmployeeTitle

--1 Display the “FIRST_NAME” from Employee table using the alias name as Employee_name.
select First_name as employee_name from employee 

--2 Display “LAST_NAME” from Employee table in upper case.
select last_name, upper(last_name) as 'upper case' from employee


--3 Display unique values of DEPARTMENT from EMPLOYEE table.
select distinct department from employee

--4 Display the first three characters of LAST_NAME from EMPLOYEE table.
select SUBSTRING(last_name,1,3) as last_name from employee

--5 Display the unique values of DEPARTMENT from EMPLOYEE table and prints its length.
select distinct department,len(department) from employee

--6 Display the FIRST_NAME and LAST_NAME from EMPLOYEE table into a single column AS FULL_NAME.a space char should separate them.*/
 select first_name+' '+last_name as Full_name from employee 

--7 DISPLAY all EMPLOYEE details from the employee table order by FIRST_NAME Ascending.
select *from employee order by First_name asc

--8. Display all EMPLOYEE details order by FIRST_NAME Ascending and DEPARTMENT Descending.
select * from employee order by First_name asc ,department desc

--9 Display details for EMPLOYEE with the first name as “VEENA” and “KARAN” from EMPLOYEE table.
select * from employee where first_name in ('veena','karan')

--10 Display details of EMPLOYEE with DEPARTMENT name as “Admin”
select * from employee where department = 'Admin'

--11 DISPLAY details of the EMPLOYEES whose FIRST_NAME contains ‘V
select * from employee where first_name like '%v%'

--12 DISPLAY details of the EMPLOYEES whose SALARY lies between 100000 and 500000.
select * from employee where salary between 100000 and 500000

--13 Display details of the employees who have joined in Feb-2020.
select * from Employee where Joining_date  


--14 Display employee names with salaries >= 50000 and <= 100000.
select * from employee where salary >= 50000 and salary <= 100000

--15 NOT AVAILABLE IN QUESTION LIST

--16 DISPLAY details of the EMPLOYEES who are also Managers.
select et.employee_ref_id,et.employee_title,et.affective_date,eb.bonus_amount,eb.bonus_date 
from employeetitle et inner join employeebonus eb 
on et.employee_ref_id = eb.employee_ref_id where employee_title = 'manager'

--17 DISPLAY duplicate records having matching data in some fields of a table.
select * from employee where salary in (select salary from employee group by salary having count(salary)>1) and 
department in (select department from employee group by department having count(department)>1) 

--18 Display only odd rows from a table
SELECT * FROM employee WHERE employee_id % 2  != 0

--19 Clone a new table from EMPLOYEE table.
select * into employee_new from employee
select * from employee_new


--20 DISPLAY the TOP 2 highest salary from a table.
 select top 2 salary from employee order by salary desc

 --21. DISPLAY the list of employees with the same salary.
 select first_name,last_name from employee where salary in 
 (select salary from employee group by salary having count(salary) > 1)

 --22 Display the second highest salary from a table.
select max(salary) as maxsal from employee where salary < 
(select max(salary) from employee)

--23 Display the first 50% records from a table.

select top 50 percent * from employee

--24. Display the departments that have less than 4 people in it.
select department from employee group by department having count(*) < 4 

--25. Display all departments along with the number of people in there.
select department,count(*) as 'number of people' from employee group by department

--26 Display the name of employees having the highest salary in each department.
select first_name+' '+last_name as full_name, 
department,salary from employee where salary in
(select max(salary) from employee group by department)


--27 Display the names of employees who earn the highest salary.
select first_name,last_name from employee where salary in (select max(salary) from employee)

--28 Diplay the average salaries for each department 
select department,avg(salary) as avg_sal from employee group by department


--29 display the name of the employee who has got maximum bonus
select et.employee_title from employeetitle et inner join employeebonus 
eb on et.employee_ref_id = eb.employee_ref_id where bonus_amount =
(select max(bonus_amount) from employeebonus)

--30 Display the first name and title of all the employees

select e.first_name,et.employee_title from employee e inner join employeetitle 
et on e.employee_id =et.employee_ref_id
 Create table Employ(
 EmpID INT Primary Key ,
 Name VARCHAR(50)not null,
 age int DEFAULT 25,
 Email VARCHAR(100) UNIQUE, 
 );
 select * from employ

 create table depart1(
 DeptID INT Primary Key,
 DeptName VARCHAR(50) unique,
 Location VARCHAR(50) DEFAULT 'Head Office'
 );

 select * from depart1
 
 insert into employ values (101,'prachi',20,'prachiak@gmail.com')
 insert into employ values (105,'priya',20,'priyaiak@gmail.com')
 insert into employ (EMPID,NAME,EMAIL)values (110,'abhy','abhya@gmail.com')
 select * from employ ; -----age= 25
 insert into employ values(102,'abhi',36,'abhi4@gmail.com')
 insert into employ (EMPID,NAME,EMAIL)values (118,'ajay','ajay@gmail.com')
 select * from employ ; -----age= 25
 insert into employ values (106,'prac',20,'pracak@gmail.com')

 insert into depart1 values (101,'it','clerkoffice')
 insert into depart1(DEPTID,DEPTNAME) values (102,'itcc');
 select * from depart1 ;----Location ='head office'
 
 ------------------DDL---------------------------------------
 create table projects(
 ProjectID INT Primary Key,
 ProjectName VARCHAR(50),
 DeptID INT Foreign Key references Depart(DeptID) ON DELETE 
 CASCADE ON UPDATE CASCADE
 );
 select * from projects
 insert into projects values(1,'data evolution',101);
 insert into projects values(2,'analysis',102);
 insert into projects values(3,'management',107);
 insert into projects values(101,'data ',101);

 ----------------------Try inserting an employee without a name → should fail. --------
 insert into employ values (100,20,'riya@gmail.com')

------------------------------------- Try inserting an employee with duplicate email → should fail. 
 insert into employ values (123,'riya',19,'prachiak@gmail.com')

 select * from depart1
 select * from employ
 select * from projects


 -------------------Delete a department → all linked employees and projects should be automatically deleted. 
 delete from depart1 
 where deptname='IT';
  
  ----------Update DeptID in a department
update  depart1
set deptid=103 
where deptid=106;



------------------------------------assignment 2------------------------------

drop table students


 Create table students(
 studentID INT Primary Key ,
 Name VARCHAR(50)not null,
 age int ,
 city varchar(50) default 'pune' ,
 Email VARCHAR(100) UNIQUE, 
 );

 select * from students

 create table course(
 courseid int primary key ,
 coursename varchar(50) not null,
 durationmonths int default 6,
 );
 select * from course

 create table enroll(
 Enrid int primary key,
 studentid int, foreign key(studentid) references students (studentid) 
 ON delete cascade , 
 courseid int, foreign key(courseid) references course (courseid)
 on delete cascade 
 );
 select * from enroll

 alter table enroll add marks int;

 aLTER TABLE Students ALTER COLUMN City VARCHAR(100);

 ----------------------DML--------------------------

 Insert into students values (1,'prerna',23,'daund','prernabulani03@gmail.com')
 Insert into students values (2,'angel',24,'hyderabad','angeldhale8@gmail.com')
 Insert into students values (3,'shruti',25,'pune','shrutishimpi29@gmail.com')
 Insert into students values (4,'mahima',21,'dehu','mahimajagtap17@gmail.com')
 Insert into students values (5,'anjali',26,'goa','anjalisonawane15@gmail.com')
 Insert into students values (6,'anj',28,'daund','anjawane15@gmail.com')

 select * from students

 insert into course values (1,'blended',3)
 insert into course values (2,'biotech',8)
 insert into course values (3,'python',6)
 insert into course values (4,'pyth',4)

 select * from course

 insert into enroll values (102,1,1,86)
 insert into enroll values (103,2,2,95)
 insert into enroll values (104,3,3,90)
 insert into enroll values (105,4,4,60)
 select * from enroll

 update students
 set city='mumbai'
 where studentid=5

 update enroll
 set marks=67
 where enrid=104

 delete from students where studentid=3
 delete from course where courseid=2


 ------------------DQL----------------------
 select * from students
 select name,city
 from students

 select * from students where age > 21

 select * from students
 order by name asc

 SELECT City, COUNT(*) AS TotalStudents 
FROM Students 
GROUP BY City;

SELECT marks, AVG(Marks) AS AvgMarks 
FROM enroll 
GROUP BY marks; 

SELECT City, COUNT(*) AS TotalStudents 
FROM Students 
GROUP BY City 
HAVING COUNT(*) > 1; 

select distinct city from students

SELECT TOP 3 * FROM enroll ORDER BY Marks DESC;




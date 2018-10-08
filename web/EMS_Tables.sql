/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  Seaton Harnse
 * Created: Sep 14, 2018
 */
/*
show tables;

create table CourseMaster
(
    c_Id INTEGER NOT NULL AUTO_INCREMENT, /*NOT NULL not required but convention
    name varchar(25),
    duration varchar(15), 
    technology varchar(25),
    PRIMARY KEY (c_id)
);

create table studentMaster
(
    s_Id INTEGER NOT NULL AUTO_INCREMENT,
    name varchar(25),
    password varchar(25),
    email varchar(30),
    mobile varchar(15),         /*for international Mobibles
    city varchar(25),
    PRIMARY KEY (s_id)
);
create table CoursesEnrolled
(
    en_id integer NOT NULL AUTO_INCREMENT,
    studentId integer, 
    courseId integer, 
    fees integer,
    PRIMARY KEY (en_Id),
    FOREIGN KEY (studentId) REFERENCES studentMaster(s_Id),
    FOREIGN KEY (courseId)  REFERENCES CourseMaster(c_id)
);

create table feesPaid
(
    f_id integer NOT NULL AUTO_INCREMENT,
    studentid integer,
    amount integer DEFAULT 0,
    PRIMARY KEY (f_id),
    FOREIGN KEY (studentid) REFERENCES studentMaster(s_Id)
);


--for testing


drop table feesPaid;

--ALTER TABLE feesPaid
--ADD COLUMN amount integer;

select * from feesPaid;

select c_id, name from courseMaster 
    where c_id NOT IN (select courseId from CoursesEnrolled where studentId = 1);
select c_id, name from courseMaster;
select * from coursesEnrolled;  */


/*
select 
    en_id, studentMaster.s_id, studentMaster.name, courseMaster.name     
from 
    coursesEnrolled
left join
    studentMaster ON studentMaster.s_id = coursesEnrolled.studentId
left join
    courseMaster ON courseMaster.c_id = coursesEnrolled.courseId
ORDER BY studentMaster.name, courseMaster.name;
  

select * from feespaid;


drop table feespaid;

ALTER TABLE feesPaid
ALTER mount drop DEFAULT


ALTER TABLE feesPaid
ALTER amount SET DEFAULT 0;

insert into feesPaid (studentid) values(1);

select * from feesPaid;

  */
/*

-- efficient selecting studentId Matching student from studentMaster
select studentId, name
    from coursesEnrolled
left join
    studentMaster ON studentMaster.s_id = coursesEnrolled.studentId
GROUP BY name;


select 
     studentMaster.name, courseMaster.name
from 
    coursesEnrolled
left join
    studentMaster ON studentMaster.s_id = coursesEnrolled.studentId
left join
    courseMaster ON courseMaster.c_id = coursesEnrolled.courseId
where s_id = 1 -- or where studentMaster.name = 'Ravi Ranjan' 0r ? --where coursesEnrolled .studentId = ? " or coursesEnrolled.studentId=?
ORDER BY courseMaster.name;


select studentMaster.name as Name, sum(fees) as totalFees
    from coursesEnrolled
inner join
    studentMaster ON studentMaster.s_id = coursesEnrolled.studentId
where studentId = 1;    


select amount 
    from studentMaster
inner join
    feesPaid on feesPaid.studentid = studentMaster.s_Id
where 
    studentMaster.s_Id = 1;

*/
select * from feesPaid;
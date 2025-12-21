 create database;
 create database sunbeam_db;
  use sunbeam_db;
 Create table users (email varchar(50) PRIMARY KEY NOT NULL , password varchar(12) NOT NULL , roll ENUM('admin','student')NOT NULL);

Create table courses(course_id INT PRIMARY KEY,course_name varchar(10),description VARCHAR(50),fees INT ,start_data DATE , end_date DATE, video_expire_days INT);
 create table students(reg_no INT PRIMARY KEY,name varchar(15) NOT NULL ,email varchar(50), course_id INT ,mobile_no INT NOT NULL, profile_pic BLOB);

create table videos(video_id INT PRIMARY KEY , course_id INT, title VARCHAR (15),discription VARCHAR (50),youtube_url VARCHAR (50),added_at DATE ,FOREIGN KEY(COURSE_ID) references courses(course_id));

--INSERT USER-
insert into users values("neha@gmail.com","1234",'student');
insert into users values("trupti@gmail.com","5678",'student');
insert into users values("dake@gmail.com","7890",'student');

--INSERT COURSE-
insert into courses values(1,'IIT-MERN','SUNBEAM',10000,'2025-12-20','2026-1-20',30);
insert into courses values(2,'IIT-AI','AI -ML COURSE',40000,'2025-12-24','2026-1-24',5);
insert into courses values(3,'ANDROID','ANDROID COURSE',9900,'2025-12-20','2026-1-15',5);

--INSERT STUDENTS-
insert into students(reg_no,name,email,course_id,mobile_no) values (1,'neha','neha@gmail.com',1,1234567890);
insert into students(reg_no,name,email,course_id,mobile_no) values (2,'trupti','trupti@gmail.com',2,1934567890);
insert into students(reg_no,name,email,course_id,mobile_no) values (4,'dake','dake@gmail.com',2,1938767890);

--INSERT VIDEOS-
insert into videos values(1,1,'intro to mern','begining with mern stack','youtube.com/mern1',CURDATE());
insert into videos values(2,2,'intro to ai','begining with ai & ml','youtube.com/ai1',CURDATE());
insert into videos values(3,3,'app dev','begining with android','youtube.com/android1',CURDATE());

--sql commands ans-
--1
select*from courses;
--2
select s.reg_no,s.name,s.email,s.mobile_no,c.course_id,c.course_name from students s inner join courses c on s.course_id = c.course_id;
--3
select s.reg_no,s.name,s.email,s.mobile_no,c.* from students s inner join courses c on s.course_id= c.course_id;
--4
SELECT 
    c.course_id AS course_id,
    c.course_name AS course_name,
    c.description,
    c.video_expire_days,
    v.video_id AS video_id,
    v.title AS video_title,
    v.added_at
FROM students s
JOIN courses c     ON c.course_id = s.course_id
JOIN videos v      ON v.course_id = c.course_id
WHERE s.email = 'neha@gmail.com'
  AND NOW() <= DATE_ADD(v.added_at, INTERVAL c.video_expire_days DAY);
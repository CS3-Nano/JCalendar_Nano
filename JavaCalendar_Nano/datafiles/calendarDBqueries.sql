create database calendarDB;
use calendarDB;

create table calendardb.login(
	userID int,
	username varchar(20),
	passwrd varchar(20),
	primary key(username,passwrd),
	foreign key(userID) references calendardb.users(user_id)
);

create table users(
	user_id int not null primary key auto_increment,
	user_fname varchar(30),
	user_lname varchar(30),
	user_contact varchar(10)
);

create table eventsTbl(
	evnt_id int(8) primary key not null auto_increment,
	evnt_start datetime not null,
	evnt_end datetime not null,
	evnt_descriptio varchar(50),
	evnt_owner int,
	foreign key(evnt_owner) REFERENCES calendardb.users(user_id)
);

insert into calendardb.users(user_fname,user_lname,user_contact) values('inesh','supun','0123456789');
insert into calendardb.login(userID,username,passwrd) values(1,'supun92','toyota');

insert into calendardb.users(user_fname,user_lname,user_contact) values('akila','dhanushka','0987654321');
insert into calendardb.login(userID,username,passwrd) values(2,'ineshd','nissan');

insert into calendardb.users(user_fname,user_lname,user_contact) values('akila','supun','0124356798');
insert into calendardb.login(userID,username,passwrd) values(3,'isurum','honda');

insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-05 10:45','2015-06-05 12.30','weekly meeting',2);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-06 10:30','2015-06-06 01:00','movie',2);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-12 10:45','2015-06-14 10:45','camping',2);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-10 08:20','2015-06-10 9:20','weekly meeting',3);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-10 08:20','2015-06-10 9:20','weekly meeting',2);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-10 08:20','2015-06-10 9:20','weekly meeting',1);
insert into calendardb.eventstbl (evnt_start,evnt_end,evnt_descriptio,evnt_owner) values('2015-06-07 01:30','2015-06-07 03:30','movie',3);

select * from users;
select * from login;
select * from eventstbl;


drop table admin;
drop table seat;
drop table passenger;
drop table cancellation;
drop table payment;
drop table booking;
drop table flight;
drop table flight_customer;


--drop table flight_customer
create table flight_customer
(
user_id number(20) NOT NULL,
title varchar2(5),
first_name varchar2(20),
last_name varchar2(20),
email_id varchar2(50),
password varchar2(20),
date_Of_birth Date,
gender varchar2(10),
phone_number varchar2(10) NOT NULL,
CONSTRAINT USER_PRIMARY_KEY PRIMARY KEY (USER_ID));

insert into flight_customer values (1,'Mr.','Siddhesh','Yeole','siddheshyeole13@gmail.com','Sidd@123','13-SEP-1999','Male','9657109699');
insert into flight_customer values (2,'Mr.','Supriya','Modi','sup@gmail.com','sup@123','30-DEC-99','Female','9920544462');
insert into flight_customer values (3,'Ms.','Linda','John','lin@gmail.com','lin@123','01-JAN-99','Female','9829400131');
insert into flight_customer values (4, 'Ms.', 'Darshita','Patil','dar@gmail.com','dar@123','02-JUN-00','Female','9900882019');
insert into flight_customer values (5, 'Mr.', 'Aman','Kushwah','amr@gmail.com','amra@456','05-JAN-00','Male','9900892019');

--select * from flight_customer

--drop table flight
create table flight
(	
flight_id number(20),
flight_name varchar2(20),
source Varchar2(20),
destination Varchar2(20),
departure_time Timestamp,
arrival_time Timestamp,
source_terminal Varchar2(2),
destination_terminal Varchar2(2),
total_seats number(2),
fare float(6),
flight_status Varchar2(10),
CONSTRAINT FLIGHT_PRIMARY_KEY PRIMARY KEY (FLIGHT_ID));

insert into flight values(101,'RiseFly','Mumbai','Delhi','10-Aug-2021 11:05:00','10-Aug-2021 12:05:00','T1','T2',60,3000,'Active');
insert into flight values(102,'RiseFly','Delhi','Mumbai','10-Aug-2021 10:30:00','10-Aug-2021 11:30:00','T2','T1',60,3000,'Active');
insert into flight values(103,'RiseFly','Mumbai','Chennai','10-Aug-2021 05:00:00','10-Aug-2021 07:00:00','T3','T2',60,4000,'Active');
insert into flight values(104,'RiseFly','Chennai','Mumbai','10-Aug-2021 02:00:00','10-Aug-2021 04:00:00','T1','T2',60,4000,'Active');
insert into flight values(105,'RiseFly','Delhi','Chennai','10-Aug-2021 03:00:00','10-Aug-2021 04:00:00','T9','T2',60,5000,'Active');
insert into flight values(106,'RiseFly','Chennai','Delhi','10-Aug-2021 04:00:00','10-Aug-2021 05:00:00','T9','T2',60,5000,'Active');
insert into flight values(107,'RiseFly','Mumbai','Chennai','10-Aug-2021 04:00:00','10-Aug-2021 05:00:00','T9','T2',60,5000,'Active');
--select * from flight

--drop table booking
create table booking
(
booking_id number(20),
booking_date Timestamp,
travel_start_date Date,
travel_end_date Date,
user_id number(20),
Flight_Id number(20),
class_type Varchar2(20),
journey_type Varchar2(20),
parent_booking_id number(20) CONSTRAINT BOOKINGS_SELF_KEY REFERENCES BOOKING(BOOKING_ID),
no_of_seats_booked_by_user number(2),
booking_status Varchar2(20),
CONSTRAINT BOOKING_PRIMARY_KEY PRIMARY KEY (BOOKING_ID),
CONSTRAINT BOOKING_FOREIGN_KEY_CUSTOMER FOREIGN KEY (USER_ID) REFERENCES flight_customer(USER_ID),
CONSTRAINT BOOKING_FOREIGN_KEY_FLIGHT FOREIGN KEY (FLIGHT_ID) REFERENCES FLIGHT(FLIGHT_ID));


insert into booking values(501,'03-Jun-2021 11:05:30','13-JUN-21','13-JUN-21',1,101, 'Economy','One_Way',null,1,'Confirmed');
insert into booking values(502,'15-Jul-2021 12:00:00','03-AUG-21','03-AUG-21',2,102, 'Economy','One_Way',null,1,'Payment_Failed');
insert into booking values(503,'02-APR-2021 01:00:00 PM','07-APR-20','07-APR-20',3,103, 'Business','One_Way',null,1,'Cancelled');
insert into booking values(504,'11-MAY-2021 11:00:00 AM','13-MAY-21','13-MAY-21',4,104, 'Business','One_Way',null,2,'Confirmed');
insert into booking values(505,'12-MAY-2021 11:00:00 AM','14-MAY-21','14-MAY-21',5,105, 'Economy','One_Way',null,1,'Confirmed');
insert into booking values(506,'15-JUL-2021 12:00:00 PM','03-SEP-21','03-SEP-21',2,101, 'Business','Return',null,1,'Confirmed');
insert into booking values(507,'15-JUL-2021 12:00:00 PM','03-SEP-21','03-SEP-21',2,101, 'Business','Return',506,1,'Confirmed');
insert into booking values(508,'11-MAY-2021 11:00:00 AM','13-MAY-21','13-MAY-21',1,103, 'Economy','Return',null,1,'Cancelled');
insert into booking values(509,'11-MAY-2021 11:00:00 AM','14-MAY-21','14-MAY-21',1,104, 'Economy','One_Way',508,1,'Cancelled');
insert into booking values(510,'11-MAY-2021 11:00:00 AM','13-MAY-21','13-MAY-21',3,105, 'Economy','Return',null,2,'Cancelled');
insert into booking values(511,'11-MAY-2021 11:00:00 AM','14-MAY-21','14-MAY-21',3,106, 'EconomyY','One_Way',510,2,'Cancelled');
insert into booking values(512,'15-JUL-2021 12:00:00 AM','22-AUG-21','23-Aug-21',2,103, 'Business','Return',null,2,'Confirmed');
insert into booking values(513,'15-JUL-2021 12:00:00 AM','23-AUG-21','24-AUG-21',2,104, 'Business','One_Way',512,2,'Partial_Cancellation');
insert into booking values(514,'16-JUL-2021 12:00:00 AM','11-AUG-21','11-AUG-21',4,102, 'Business','Return',null,2,'Confirmed');
insert into booking values(515,'16-JUL-2021 12:00:00 AM','15-AUG-21','15-AUG-21',4,101, 'Business','One_Way',514,2,'Partial_Cancellation');
insert into booking values(516,'16-JUL-2021 12:00:00 AM','15-AUG-21','15-AUG-21',5,101, 'Economy','One_Way',null,1,'Confirmed');

--select * from booking;

--drop table payment
create table payment
(
payment_id number(20),
amount float(6),
payment_status varchar2(20),
payment_method varchar2(20),
booking_id number(20),
CONSTRAINT PAYMENT_PRIMARY_KEY PRIMARY KEY(PAYMENT_ID),
FOREIGN KEY (BOOKING_ID) REFERENCES BOOKING(BOOKING_ID));

insert into payment values(1001,3000,'Successful','Card',501);
insert into payment values(1002,3000,'Payment_Failed','Card',502);
insert into payment values(1003,3000,'Successful','Card',503);
insert into payment values(1004,6000,'Successful','Card',504);
insert into payment values(1005,3000,'Successful','Card',505);
insert into payment values(1006,6000,'Successful','Gpay',506);
insert into payment values(1007,8000,'Successful','NetBanking',508);
insert into payment values(1008,8000,'Successful','Card',510);
insert into payment values(1009,16000,'Successful','Card',512);
insert into payment values(1010,12000,'Payment_Failed','Card',514);
insert into payment values(1011,12000,'Successful','Card',514);
insert into payment values(1012,3000,'Payment_Failed','Card',516);
insert into payment values(1013,3000,'Successful','Card',516);

--select * from payment

--drop table cancellation
create table cancellation
(
cancellation_date Timestamp,
refund_amount Float(6),
refund_status Varchar2(20),
payment_id number(20),
CONSTRAINT CANCELLATION_FOREIGN_KEY FOREIGN KEY (PAYMENT_ID) REFERENCES PAYMENT(PAYMENT_ID));

insert into cancellation values('5-Apr-2020 03:00:00 PM' , 2200 , 'Successful' ,1003);
insert into cancellation values('13-May-2021 11:00:00' , 4400, 'Successful' ,1007);
insert into cancellation values('13-May-2021 11:00:00' ,4400, 'Successful',1008);
insert into cancellation values('22-Jul-2021 12:00:00',800,'Successful',1009);
insert into cancellation values('22-Jul-2021 12:00:00',2700,'Successful',1011);

--select * from cancellation;

--drop table passenger
create table passenger
(
passenger_id number(20),
passenger_first_name varchar(20),
passenger_last_name varchar(20),
passenger_gender varchar(20),
passenger_age number(2),
category varchar(20),
user_id number(20),
CONSTRAINT PASSENGER_PRIMARY_KEY PRIMARY KEY(PASSENGER_ID),
FOREIGN KEY (USER_ID) REFERENCES FLIGHT_CUSTOMER(USER_ID));

insert into passenger values(2001 ,'Siddhesh','Yeole','Male',21,'Adult',1);
insert into passenger values(2002 , 'Supriya' , 'Modi' ,'Female',21,'Adult',2);
insert into passenger values(2003 , 'Linda', 'John' ,'Female',22,'Adult',3);
insert into passenger values(2004 , 'Darshita' , 'Patil' ,'Female',20,'Adult',4);
insert into passenger values(2005 , 'Aman', 'Kushwah','Male',21,'Adult',5);
insert into passenger values(2006 , 'Vishnu', 'Sri','Female',22,'Adult',4);
insert into passenger values(2007 , 'Vinit', 'Soni','Male',1,'Child',4);
insert into passenger values(2008 , 'Jevina', 'Verghese','Female',19,'Adult',4);
insert into passenger values(2009 , 'Rushabh', 'Kothari','Male',24,'Adult',4);
insert into passenger values(2010 , 'Preeti', 'Singh','Female',20,'Adult',4);
insert into passenger values(2011 , 'Supriya', 'Modi','Female',21,'Adult',2);
insert into passenger values(2012 , 'Kunal', 'Chugriya','Male',22,'Adult',4);
insert into passenger values(2013 , 'Rutik', 'Katkamwar','Male',21,'Adult',1);
insert into passenger values(2014 , 'Jayesh', 'Firewale','Male',21,'Adult',4);

--select * from passenger

--drop table seat
create table seat
(
seat_no varchar2(5),
booking_id number(20),
seat_status varchar2(10),
passenger_id number(20),
CONSTRAINT SEAT_PRIMARY_KEY PRIMARY KEY (seat_no,booking_id),
CONSTRAINT SEAT_FK_BOOKING FOREIGN KEY(BOOKING_ID) REFERENCES BOOKING(BOOKING_ID),
CONSTRAINT SEAT_FK_PASSENGER FOREIGN KEY(PASSENGER_ID) REFERENCES PASSENGER (PASSENGER_ID));

insert into seat values('1A','501','Booked','2001');
insert into seat values('3D','502','Available','2002');
insert into seat values('6F','503','Available','2003');
insert into seat values('9C','504','Booked','2004');
insert into seat values('9B','504','Booked','2005');
insert into seat values('10C','505','Booked','2006');
insert into seat values('4F','506','Booked','2007');
insert into seat values('5D','507','Booked','2007');
insert into seat values('7C','508','Available','2008');
insert into seat values('2B','509','Available','2008');
insert into seat values('6D','510','Available','2009');
insert into seat values('6E','510','Available','2010');
insert into seat values('8D','511','Available','2009');
insert into seat values('3D','511','Available','2010');
insert into seat values('4D','512','Booked','2011');
insert into seat values('4E','512','Booked','2012');
insert into seat values('5E','513','Available','2011');
insert into seat values('5F','513','Available','2012');
insert into seat values('2A','514','Booked','2013');
insert into seat values('2B','514','Booked','2014');
insert into seat values('3A','515','Booked','2013');
insert into seat values('3B','515','Available','2014');
insert into seat values('3D','516','Booked','2005');

--select * from seat;


create table admin
(
admin_user_name varchar2(20),
admin_email varchar2(30),
password varchar2(20),
CONSTRAINT ADMIN_PRIMARY_KEY PRIMARY KEY(ADMIN_USER_NAME));

insert into admin values('Admin','admin@gmail.com', 'Admin' );
insert into admin values('Supriya','sup@gmail.com', 'Supriya' );
insert into admin values('Siddhesh','sid@gmail.com', 'Siddhesh' );
insert into admin values('Darshita','dar@gmail.com', 'Darshita' );
insert into admin values('Linda','lin@gmail.com', 'Linda' );
insert into admin values('Aman','amr@gmail.com', 'Aman' );

--select * from admin;


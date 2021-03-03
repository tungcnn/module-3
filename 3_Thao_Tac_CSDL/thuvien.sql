create database thuvien;
use thuvien;

create table category (
	id int(6) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    _name varchar(30) NOT NULL
);

create table book (
	id int(6) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    _name varchar(30) NOT NULL,
    category_id int(6) NOT NULL,
    foreign key(category_id) references category(id)
);

create table student (
	student_number varchar(15) PRIMARY KEY NOT NULL,
    student_name varchar(50) NOT NULL,
    address varchar(50),
    city varchar(50),
    country varchar(50),
    email varchar (50),
    image longblob
);

create table borroworder (
	student_number varchar(15), 
    foreign key(student_number) references student(student_number),
    book_id int(6) unique,
	foreign key(book_id) references book(id)
);

insert into category(_name) value('Trinh Thám');
insert into category(_name) value('Tình cảm');
insert into category(_name) value('Khoa Học Viễn Tưởng');
insert into category(_name) value('Kinh Dị');
insert into category(_name) value('Thơ');

insert into book(_name, category_id) values ('Sherlock Holmes', 1);
insert into book(_name, category_id) values ('Conan', 1);
insert into book(_name, category_id) values ('Ngôn Tình 1', 2);
insert into book(_name, category_id) values ('Ngôn Tình 2', 2);
insert into book(_name, category_id) values ('Star Wars', 3);
insert into book(_name, category_id) values ('Dune', 3);
insert into book(_name, category_id) values ('Chuyện ma 1', 4);
insert into book(_name, category_id) values ('Chuyện ma 2', 4);
insert into book(_name, category_id) values ('Tập thơ của Xuân Diệu', 5);
insert into book(_name, category_id) values ('Truyện Kiều', 5);

insert into student values ('CG001', 'Tung', '1 Ton Duc Thang', 'Ha Noi', 'Viet Nam', 'a@gmail.com', 'avatar1');
insert into student values ('CG002', 'Tai', '1 Le Thai Tong', 'Ha Noi', 'Viet Nam', 'b@gmail.com', 'avatar2');
insert into student values ('CG003', 'Thai', '1 Kim Ma', 'Ha Noi', 'Viet Nam', 'c@gmail.com', 'avatar');
insert into student values ('CG004', 'Thong', '1 Dao Tan', 'Ha Noi', 'Viet Nam', 'd@gmail.com', 'avatar');
insert into student values ('CG005', 'Tam', '1 Cau Giay', 'Ha Noi', 'Viet Nam', 'e@gmail.com', 'avatar');

insert into borroworder values ('CG001', 1);
insert into borroworder values ('CG001', 2);
insert into borroworder values ('CG003', 3);
insert into borroworder values ('CG005', 4);
insert into borroworder values ('CG005', 5);


DELIMITER //
create procedure test () 
begin 
	declare counter int default 0;
	while counter < 100000 do
		insert into book(_name, category_id) values(
			'Book',
            1
        );
        set counter = counter + 1;
	end while;
end//
DELIMITER ;
call test;

create view test as 
select s.student_number, s.student_name, b._name as BookTitle, c._name as Category
from student s
join borroworder bo on bo.student_number = s.student_number
join book b on b.id = bo.book_id
join category c on b.category_id = c.id;

select * from test;
create database person;
use person;
create table person (
	id char(50) primary key,
    _name char(50),
    username char(50),
    email char(50),
    address char(100)
);
insert into person values ("1", "Tung", "Tung DZ", "Tung@gmail.com", "Ha Noi");
insert into person values ("2", "Thai", "Thai DZ", "Thai@gmail.com", "Laos");
insert into person values ("3", "Thong", "Thong DZ", "Thong@gmail.com", "Thai Lan");
insert into person values ("4", "Tam", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("5", "Tien", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("6", "Phuc", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("7", "Hang", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("8", "Minh", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("9", "Thao", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("10", "Duy", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("11", "Hien", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("12", "Tus", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("13", "Sang", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("14", "Toan", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("15", "Quan", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("16", "Son MC", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("17", "Kieu Anh", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("18", "The", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("19", "Trang Le", "Tam DZ", "Tam@gmail.com", "Campuchia");
insert into person values ("20", "Kim Oanh", "Tam DZ", "Tam@gmail.com", "Campuchia");

select * from person
limit 5
offset 5;


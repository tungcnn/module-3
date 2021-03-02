create database student;
use student;

create table khoa (
	id char(10) primary key,
    ten varchar(30),
    dienthoai char(10)
);

create table giangvien (
	id int primary key,
    ten varchar(30),
    luong decimal(5, 2),
    khoa_id char(10), 
    foreign key(khoa_id) references khoa(id),
    namsinh int,
    que varchar(30)
);

create table sinhvien (
	id int primary key,
    ten varchar(30),
    khoa_id char(10),
    foreign key(khoa_id) references khoa(id),
    namsinh int,
    que varchar(30)
);

create table detai (
	id char(10) primary key,
    ten varchar(30),
    kinhphi int,
    noithuctap varchar(30)
);

create table huongdan (
	sinhvien_id int,
    foreign key(sinhvien_id) references sinhvien(id),
    detai_id char(10),
    foreign key(detai_id) references detai(id),
    giangvien_id int,
    foreign key(giangvien_id) references giangvien(id),
    ketqua decimal(5,2)
);

insert into khoa values(1, 'Dia Ly va QLTN', '0987256745');
insert into khoa values(2, 'Toan', '0356764512');
insert into khoa values(3, 'Vat Ly', '0863124678');
insert into khoa values(4, 'Cong Nghe Sinh Hoc', '0987467214');
insert into khoa values(5, 'Ki Su', '0172836579');

insert into giangvien values(1, 'Mai Cong Son', 30.00, 1, 2000, 'Ca Mau');
insert into giangvien values(2, 'Kieu Anh', 31.00, 2, 2001, 'Hue');
insert into giangvien values(3, 'The', 29.00, 2, 1999, 'Tp.Ho Chi Minh');
insert into giangvien values(4, 'John Toan', 15.00, 5, 1998, 'Hai Phong');
insert into giangvien values(5, 'Quan', 14.00, 4, 1999, 'Ha Noi');
insert into giangvien values(6, 'Chau Le', 50.00, 3, 2000, 'Ha Dong');
insert into giangvien values(7, 'La Thi Cuc Thuy', 20.00, 5, 2002, 'Dong Thap');
insert into giangvien values(8, 'Nguyen Thi Kim Oanh', 20.00, 3, 1995, 'Ha Noi');
insert into giangvien values(9, 'Dung', 21.00, 4, 1995, 'Thanh Hoa');
insert into giangvien values(10, 'Nhan', 60.00, 5, 1990, 'Da Nang');

insert into sinhvien values(1, 'Tung', 1, 1998, 'Ha Noi');
insert into sinhvien values(2, 'Thong', 1, 1999, 'Ha Noi');
insert into sinhvien values(3, 'Thai', 1, 2000, 'Ha Noi');
insert into sinhvien values(4, 'Toan', 2, 2001, 'Ha Noi');
insert into sinhvien values(5, 'Tam', 2, 1997, 'Ha Noi'); 
insert into sinhvien values(6, 'Tien', 2, 1996, 'Ha Noi');
insert into sinhvien values(7, 'Hiep', 3, 1995, 'Ha Noi');
insert into sinhvien values(8, 'Bao', 3, 1994, 'Ha Noi');
insert into sinhvien values(9, 'Hang', 3, 2002, 'Ha Noi');
insert into sinhvien values(10, 'Minh', 4, 1990, 'Ha Noi');
insert into sinhvien values(11, 'Hien', 4, 1990, 'Ha Noi');
insert into sinhvien values(12, 'Duy', 4, 1991, 'Ha Noi');
insert into sinhvien values(13, 'Tus', 5, 1992, 'Ha Noi');
insert into sinhvien values(14, 'Phuc', 5, 1993, 'Ha Noi');
insert into sinhvien values(15, 'Sang', 5, 1995, 'Ha Noi');
insert into sinhvien values(16, 'Thao', 1, 1996, 'Ha Noi');
insert into sinhvien values(17, 'Thien', 2, 2000, 'Ha Noi');
insert into sinhvien values(18, 'Tai', 3, 2001, 'Ha Noi');
insert into sinhvien values(19, 'Van', 4, 2003, 'Ha Noi');
insert into sinhvien values(20, 'Viet Anh', 5, 1998, 'Ha Noi');
insert into sinhvien values(21, 'Le Van Son', 3, 1999, 'Vinh');

insert into detai values(1, 'De Tai 1', 700, 'FPT');
insert into detai values(2, 'De Tai 2', 200, 'Facebook');
insert into detai values(3, 'De Tai 3', 900, 'Google');
insert into detai values(4, 'De Tai 4', 400, 'Amazon');
insert into detai values(5, 'De Tai 5', 500, 'Tesla');

insert into huongdan values(1, 5, 1, 10.00);
insert into huongdan values(9, 4, 1, 9.00);
insert into huongdan values(3, 3, 1, 10.00);
insert into huongdan values(7, 2, 1, 8.00);
insert into huongdan values(2, 1, 1, 10.00);
insert into huongdan values(6, 1, 1, 8.00);
insert into huongdan values(11, 3, 3, 9.00);
insert into huongdan values(13, 5, 2, 10.00);
insert into huongdan values(15, 2, 4, 10.00);
insert into huongdan values(10, 4, 5, 8.00);
insert into huongdan values(13, 2, 2, 10.00);
insert into huongdan values(5, 3, 3, 10.00);
insert into huongdan values(18, 4, 4, 10.00);

/*Câu 1*/
select gv.id, gv.ten, k.ten
from giangvien gv
join khoa k
on gv.khoa_id = k.id;

/*Câu 2*/
select gv.id, gv.ten, k.ten
from giangvien gv
join khoa k
on gv.khoa_id = k.id
where k.ten = 'Dia Ly va QLTN';

/*Câu 3*/
select k.ten, count(sv.id) as so_luong
from sinhvien sv
join khoa k
on k.id = sv.khoa_id
where k.ten = 'Cong Nghe Sinh Hoc';

/*Câu 4*/
select sv.id, sv.ten, (2021 - sv.namsinh) as tuoi
from sinhvien sv
join khoa k
on k.id = sv.khoa_id
where k.ten = 'Toan';

/*Câu 5*/
select k.ten, count(gv.id) as so_luong
from giangvien gv
join khoa k
on k.id = gv.khoa_id
where k.ten = 'Cong Nghe Sinh Hoc';

/*Câu 6*/
select sv.*
from sinhvien sv
where not exists(select sinhvien_id from huongdan hd where hd.sinhvien_id = sv.id );

/*Câu 7*/
select k.id, k.ten, count(gv.id) as so_luong
from khoa k
join giangvien gv
on k.id = gv.khoa_id
group by k.ten;

/*Câu 8*/
select k.dienthoai
from khoa k
join sinhvien sv
on k.id = sv.khoa_id
where sv.ten = 'Le Van Son';

/*Câu 9*/
select gv.id, gv.ten, k.ten, count(hd.giangvien_id) as count
from giangvien gv
join huongdan hd
on gv.id = hd.giangvien_id
join khoa k
on k.id = gv.khoa_id
group by gv.ten
having count >= 3;

/*Câu 10*/
SELECT 
    dt.id, dt.ten, COUNT(*) AS count
FROM
    detai dt
        JOIN
    huongdan hd ON dt.id = hd.detai_id
        JOIN
    sinhvien sv ON sv.id = hd.sinhvien_id
GROUP BY dt.ten
HAVING count >= 2;
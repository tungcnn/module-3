create database demo;
use demo;

create table Products (
	id int primary key,
    productCode int,
    productName varchar(30),
    productPrice float,
    productAmount int,
    productDescription varchar(100),
    productStatus varchar(30)
);
insert into products values (1, 1, 'Iphone', 12.5, 10, 'Ngon', 'Good');
insert into products values (2, 2, 'Iphone', 12.5, 10, 'Ngon', 'Good');
insert into products values (3, 3, 'Iphone', 12.5, 10, 'Ngon', 'Good');
insert into products values (4, 4, 'Iphone', 12.5, 10, 'Ngon', 'Good');
insert into products values (5, 5, 'Iphone', 12.5, 10, 'Ngon', 'Good');

create unique index idx_productCode
on products(productCode);

create index idx2 
on products(productName, productPrice);

explain select * from Products;

create view _view as
select productCode, productName, productPrice, productStatus
from products;

select * from _view;

delimiter //
create procedure get_info() 
begin
	select * from products;
end //

create procedure add_product(
	id int,
    productCode int,
    productName varchar(30),
    productPrice float,
    productAmount int,
    productDescription varchar(100),
    productStatus varchar(30)
)
begin
	insert into products values (id, productCode, productName, productPrice, productAmount, productDescription, productStatus);
end //

create procedure update_product(
	_id int,
    _code int,
    _name varchar(30),
    _price float,
    _amount int,
    _description varchar(100),
    _status varchar(30)
)
begin
	update products
    set 
    productCode = _code, 
    productName = _name,
    productPrice = _price,
    productAmount = _amount,
    productDescription = _description,
    productStatus = _status
    where id = _id;
end //

create procedure delete_product(
	_id int
)
begin
	delete from products where id = _id;
end //
delimiter ;

call get_info;
call add_product(6, 6, 'Samsung', 13.5, 10, 'Ngon', 'Great');
call update_product(1, 10, 'Pixel 4', 10.5, 100, 'Ngon cuc', 'Great');
call delete_product(3);
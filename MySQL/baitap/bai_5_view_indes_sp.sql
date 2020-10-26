drop database if exists bai_tap_5;
create database bai_tap_5;
use bai_tap_5;

create table products(
id int primary key,
product_code varchar(45),
product_name varchar(45),
product_price double,
product_amount varchar(45),
product_description varchar(45),
product_status varchar(45)
);

insert into products(id, product_code, product_name, product_price, product_amount, product_description , product_status)
values 
(1, 'IP01', 'iPhoneX', 690, 'USA', 'Hàng Quốc Tế', 'Chất Lượng Tốt'),
(2, 'SS02', 'TVSamSung', 550, 'KRA', 'Hàng Quốc Tế', 'Chất Lượng Tốt'),
(3, 'LP03', 'Latop DELL', 690, 'USA', 'Hàng Quốc Tế', 'Chất Lượng Tốt');

create index index_product_code
on products (product_code);

select *
from products
where product_code = 'IP01';

-- Tạo view
CREATE VIEW products_views AS

SELECT product_code, product_name, product_price, product_status

FROM  products;

select * from products_views;

-- sửa đổi view
CREATE OR REPLACE VIEW products_views AS

SELECT product_code, product_name, product_price, product_status

FROM products

WHERE product_price = 690;

select * from products_views;


 -- xoá view
DROP VIEW products_views;


DELIMITER //

CREATE PROCEDURE findAllproduct_name()

BEGIN

  SELECT * FROM products;

END //

DELIMITER ;

call findAllproduct_name();

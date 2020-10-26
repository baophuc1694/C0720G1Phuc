drop database if exists bai_4_cac_ham_thong_dung;
create database bai_4_cac_ham_thong_dung;
use bai_4_cac_ham_thong_dung;
create table student(
id int,
ten varchar(45),
tuoi int,
khoa_hoc varchar(45),
so_tien double
);

insert into student(id, ten, tuoi, khoa_hoc, so_tien)
values 
(1, 'Hoang', 21, 'CNTT', 400000),
(2, 'Viet', 19, 'DTVT', 320000 ),
(3, 'Thanh', 18, 'KTDN', 400000),
(4, 'Nhan', 19, 'CK', 450000),
(5, 'Huong',20, 'TCNN', 500000),
(5, 'Huong', 20, 'TCNH', 200000);

select * from student;
select id, ten, tuoi, khoa_hoc, so_tien
from student
where id = 5 and ten = 'Huong';

select ten, sum(so_tien)
from student
where ten = 'Huong';

select ten
 from student
 group by ten;

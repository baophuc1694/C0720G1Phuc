create database case_study_1;
use case_study_1;

-- Task 2:
 select * from 
 nhan_vien
 where ho_ten like "T%" or ho_ten like "H%";
 -- Hết Task 2.
 
 -- Task 3:
 select * 
 from
 khach_hang
 where (year(now()) - year(ngay_sinh) between 18 and 50) and (dia_chi in ('Đà Năng', 'Quảng Trị'));
 
 
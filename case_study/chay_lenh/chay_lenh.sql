create database case_study_1;
use case_study_1;
select *
from nhan_vien;
-- Task 2
select *
from nhan_vien
where ho_ten like "T%" or ho_ten like "H%";
-- regexp '^([a-zA-Z]+[ ])+[H,K,T][a-zA-Z]+$' and length(ho_ten) <= 15;
-- Hết Task2

-- Task 3


select *
from khach_hang
where (year(now()) - year(ngay_sinh) between 18 and 50) and (dia_chi in ('Đà Nẵng','Quảng Trị'));
-- Hết Task 3

-- Task 4
select count(hd.id_khach_hang) as 'so_lan_dat_phong', kh.ho_ten, l.ten_loai_khach
from hop_dong hd
	right join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
	inner join loai_khach l on l.id_loai_khach = kh.id_loai_khach
where l.ten_loai_khach = 'Diamond'
group by kh.id_khach_hang
order by count(hd.id_khach_hang);
-- Hết Task 4

-- Task 5
create view thong_ke as
select sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) as 'tong_tien', kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.id_hop_dong, hdct.id_dich_vu_di_kem, hdct.so_luong,
	   dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, dv.id_loai_dich_vu
from khach_hang kh
	left join hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
	left join loai_khach lk on lk.id_loai_khach = kh.id_loai_khach
	left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
	left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
	left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
group by hd.id_hop_dong
order by sum(dv.chi_phi_thue + hdct.so_luong * dvdk.gia);
select * from thong_ke;
-- Hết Task 5

-- Task 6
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
	left join hop_dong hd using(id_dich_vu)
	left join loai_dich_vu ldv using(id_loai_dich_vu)
where dv.ten_dich_vu not in (
	select dv.ten_dich_vu
    from dich_vu dv
		left join hop_dong hd using(id_dich_vu)
	where hd.ngay_lam_hop_dong > '2019-01-01' and hd.ngay_lam_hop_dong < '2019-03-31' and dv.ten_dich_vu is not null
)
group by dv.ten_dich_vu;
-- Hết Task 6

-- Task 7:
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
	left join hop_dong hd using(id_dich_vu)
	left join loai_dich_vu ldv using(id_loai_dich_vu)
where year (hd.ngay_lam_hop_dong) = '2018' and  year(hd.ngay_lam_hop_dong) <> '2019'
group by dv.ten_dich_vu;
-- Hết Task 7..

-- Task 8
-- cách 1:
select distinct kh.ho_ten
from khach_hang kh;

-- cách 2:
select kh.ho_ten
from khach_hang kh
group by kh.ho_ten;

-- Task 9:
select month(hd.ngay_lam_hop_dong) as 'thang', count(kh.id_khach_hang) as 'so_lan_dat_phong'
from hop_dong hd
	join khach_hang kh using(id_khach_hang)
where year(hd.ngay_lam_hop_dong) = '2019'
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- Task 10:
select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as 'so_luong_dich_vu_di_kem'
from hop_dong hd
	left join hop_dong_chi_tiet hdct using(id_hop_dong)
group by hd.id_hop_dong;

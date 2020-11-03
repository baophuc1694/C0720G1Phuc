create database case_study_1;
use case_study_1;
select *
from nhan_vien;
-- Task 2 : 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu 
 -- là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select *
from nhan_vien
where ho_ten like "T%" or ho_ten like "H%";
-- regexp '^([a-zA-Z]+[ ])+[H,K,T][a-zA-Z]+$' and length(ho_ten) <= 15;
-- Hết Task2

-- Task 3:	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.


select *
from khach_hang
where (year(now()) - year(ngay_sinh) between 18 and 50) and (dia_chi in ('Đà Nẵng','Quảng Trị'));
-- Hết Task 3

-- Task 4 :Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select count(hd.id_khach_hang) as 'so_lan_dat_phong', kh.ho_ten, l.ten_loai_khach
from hop_dong hd
	right join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
	inner join loai_khach l on l.id_loai_khach = kh.id_loai_khach
where l.ten_loai_khach = 'Diamond'
group by kh.id_khach_hang
order by count(hd.id_khach_hang);
-- Hết Task 4

-- Task 5 : 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau:
--  ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phòng
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

-- Task 6 : 6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 
 -- (Quý 1 là tháng 1, 2, 3).
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

-- Task 7: 	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả 
 -- các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu
from dich_vu dv
	left join hop_dong hd using(id_dich_vu)
	left join loai_dich_vu ldv using(id_loai_dich_vu)
where year (hd.ngay_lam_hop_dong) = '2018' and  year(hd.ngay_lam_hop_dong) <> '2019'
group by dv.ten_dich_vu;
-- Hết Task 7..

-- Task 8 : 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau
-- cách 1:
select distinct kh.ho_ten
from khach_hang kh;

-- cách 2:
select kh.ho_ten
from khach_hang kh
group by kh.ho_ten;

-- Hết Task 8.

-- Task 9: Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng 
-- trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hd.ngay_lam_hop_dong) as 'thang', count(kh.id_khach_hang) as 'so_lan_dat_phong'
from hop_dong hd
	join khach_hang kh using(id_khach_hang)
where year(hd.ngay_lam_hop_dong) = '2019'
group by month(hd.ngay_lam_hop_dong)
order by month(hd.ngay_lam_hop_dong);

-- Hết Task 9.

-- Task 10:	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem
select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as 'so_luong_dich_vu_di_kem'
from hop_dong hd
	left join hop_dong_chi_tiet hdct using(id_hop_dong)
group by hd.id_hop_dong;
-- Hết Task 10.

-- Task 11:	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có 
-- TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung, kh.ho_ten, kh.dia_chi
from dich_vu_di_kem dvdk
	left join hop_dong_chi_tiet hdct using(id_dich_vu_di_kem)
    left join hop_dong hd using(id_hop_dong)
    left join khach_hang kh using(id_khach_hang)
    left join loai_khach lk using(id_loai_khach)
where lk.ten_loai_khach = 'Diamond' and kh.dia_chi in ('Vinh'or 'Quảng Ngãi')
group by dvdk.ten_dich_vu_di_kem;

-- Hết Task 11...

-- Task 12:

select hd.id_hop_dong,hd.ngay_lam_hop_dong, nv.ho_ten, kh.ho_ten, kh.sdt, dv.ten_dich_vu, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as 'so_luong'
from hop_dong hd
	left join hop_dong_chi_tiet hdct using(id_hop_dong)
    left join nhan_vien nv using(id_nhan_vien)
    left join khach_hang kh using(id_khach_hang)
    left join dich_vu dv using(id_dich_vu)
where hd.ngay_lam_hop_dong > '2019-09-30' and hd.ngay_lam_hop_dong < '2020-01-01'
and dv.ten_dich_vu not in (
	select dv.ten_dich_vu
    from dich_vu dv
		left join hop_dong hd using(id_dich_vu)
	where hd.ngay_lam_hop_dong > '2018-12-31' and hd.ngay_lam_hop_dong < '2019-07-01' and dv.ten_dich_vu is not null
)
group by hd.id_hop_dong;

-- Task 13:
create view thong_tin as
select dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung, count(hdct.id_dich_vu_di_kem) as 'so_lan_su_dung'
from dich_vu_di_kem dvdk
	left join hop_dong_chi_tiet hdct using(id_dich_vu_di_kem)
group by dvdk.id_dich_vu_di_kem;

select *
from thong_tin
where so_lan_su_dung in (
	select max(so_lan_su_dung)
    from thong_tin
    where so_lan_su_dung is not null
);
-- Hết Task 13...


-- Task 14:
select hd.id_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, count(hdct.id_dich_vu_di_kem) as 'so_lan_su_dung'
from hop_dong hd
	join hop_dong_chi_tiet hdct using(id_hop_dong)
    join dich_vu_di_kem dvdk using(id_dich_vu_di_kem)
    join dich_vu dv using(id_dich_vu)
    join loai_dich_vu ldv using(id_loai_dich_vu)
group by dvdk.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) = 1;

-- Hết Task 14....

-- Task 15:
select nv.id_nhan_vien, nv.ho_ten, td.trinh_do, bp.ten_bo_phan, nv.sdt, nv.dia_chi, count(hd.id_nhan_vien) as so_luong_hop_dong
from nhan_vien nv
	left join hop_dong hd using(id_nhan_vien)
    left join trinh_do td using(id_trinh_do)
    left join bo_phan bp using(id_bo_phan)
where nv.id_nhan_vien not in (
	select nv.id_nhan_vien
    from nhan_vien nv
		left join hop_dong hd using(id_nhan_vien)
    where year(hd.ngay_lam_hop_dong) = 2018 and hd.id_nhan_vien is not null
    group by hd.id_nhan_vien
    having count(hd.id_nhan_vien) > 3
)
group by nv.id_nhan_vien
order by nv.id_nhan_vien;
 
 -- Hết Task 15...
 
 -- Task 16: 
 delete from nhan_vien
where nhan_vien.id_nhan_vien not in (
	select danh_sach.id_nhan_vien
    from (
		select nv.id_nhan_vien
        from nhan_vien nv
			left join hop_dong hd using(id_nhan_vien)
		where year(hd.ngay_lam_hop_dong) in ('2020')
        group by nv.id_nhan_vien
    ) as danh_sach
);


 update loai_khach
 set ten_loai_khach='Diamond'
 where ten_loai_khach='Platinium' and id_loai_khach in (
 select Tongtienthanhtoan_loai_khach.id_loai_khach
 from (
 select lk.id_loai_khach, sum(hd.tong_tien*23000) as tongtienthanhtoan
 from loai_khach lk
 inner join khach_hang kh on kh.id_loai_khach=lk.id_loai_khach
 inner join hop_dong hd on hd.id_khach_hang = kh.id_khach_hang
 where year(hd.ngay_lam_hop_dong)='2019'
 group by lk.id_loai_khach
 ) as Tongtienthanhtoan_loai_khach
 where Tongtienthanhtoan_loai_khach.tongtienthanhtoan>10000000
 );
  select * from ten_loai_khach;

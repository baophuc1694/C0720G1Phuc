drop database if exists case_study_1;

use case_study_1;

insert into vi_tri(id_vi_tri, ten_vi_tri)
values 
(1, 'Lễ Tân'),
(2, 'Phục Vụ'),
(3, 'Chuyên Viên'),
(4, 'Giám Sát'),
(5, 'Quản Lý'),
(6, 'Giám Đốc')
;

insert into trinh_do(id_trinh_do, trinh_do)
values 
(1, 'Đại Học'),
(2, 'Cao Đẳng'),
(3, 'Trung Cấp'),
(4, 'Sau Đại Học');

insert into bo_phan(id_bo_phan, ten_bo_phan)
values
(1, 'Sale- Makerting'),
(2, 'Hành Chính'),
(3, 'Phục Vụ'),
(4, 'Quản Lý');

insert into loai_khach(id_loai_khach, ten_loai_khach)
values 
(1, 'Diamond'),
(2, 'Platinum'),
(3, 'Gold'),
(4, 'Silver'),
(5, 'Normal');

insert into kieu_thue(id_kieu_thue, ten_kieu_thue, gia)
values 
(1, 'Thuê theo ngày', 1000000),
(2, 'Thuê theo tuần', 6800000),
(3, 'Thuê theo tháng', 28000000),
(4, 'Thuê theo quý', 80000000),
(5, 'Thuê theo năm', 336000000);

insert into loai_dich_vu(id_loai_dich_vu, ten_loai_dich_vu)
values
(1, 'Villa'),
(2, 'House'),
(3, 'Room');

insert into dich_vu_di_kem(id_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
values 
(1, 'Massage', 100, 'USD','Khả Dụng'),
(2, 'Karaoke', 50, 'USD', 'Khả Dụng'),
(3, 'Sea Food', 200, 'USD', 'Khả Dụng'),
(4, 'Drink', 30, 'USD', 'Khả Dụng'),
(5, 'Car', 70, 'USD', 'Khả Dụng' );

insert into dich_vu(id_dich_vu, ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, trang_thai, id_kieu_thue, id_loai_dich_vu)
values 
(1, 'Villa Vip', 120, 5, '7', '6800000', 'Khả Dụng', 2, 1 ),
(2, 'Villa Thường', 100, 4, '6', '6300000', 'Khả Dụng', 1, 1 ),
(3, 'House', 80, 3, '4', '28000000', 'Khả Dụng', 3, 2 ),
(4, 'Room', 60, 2, '3', '80000000', 'Khả Dụng', 4, 3 )
;

insert into nhan_vien(id_nhan_vien, ho_ten, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi, id_vi_tri, id_trinh_do, id_bo_phan)
values 
(1, 'Tôn Ngộ Không',' 1990-02-10', '201693000', '11000000', '0935240000', 'khong@gmail.com', 'Đà Nẵng', 5, 1, 4 ),
(2, 'Trư Bát Giới', '1991-12-09', '201693001', '9000000', '0935240001', 'gioi@gmail.com', 'Quảng Trị', 4, 1, 2 ),
(3, 'Sa Ngộ Tĩnh', '1992-03-04', '201693002', '7000000', '0935240002', 'tinh@gmail.com', 'Quảng Nam', 2, 2, 3 ),
(4, 'Đường Tăng', '1993-05-20', '201693003', '6000000', '093524003', 'tang@gmail.com', 'Quảng Ngãi', 1, 3, 3 ),
(5, 'Ngưu Ma Vương', '1988-10-10', '201693004', '15000000', '0935240004', 'vuong@gmail.com', 'Sài Gòn', 6, 4, 4 )
;

insert into khach_hang(id_khach_hang, ho_ten, ngay_sinh, so_cmnd, sdt, email, dia_chi, id_loai_khach)
values 
(1, 'Ronaldo', '1994-06-01', '201000000', '0935000000', 'Ro@gmail.com', 'Đà Nẵng', 1 ),
(2, 'Messi', '1996-08-11', '201000001', '0935000001', 'Si@gmail.com', 'Sài Gòn', 2 ),
(3, 'David Villa', '1992-07-10', '201000002', '0935000002', 'Vid@gmail.com', 'Quảng Ngãi', 3 ),
(4, 'Torres', '1991-01-0', '201000003', '0935000003', 'Res@gmail.com', 'Quảng Trị', 4 ),
(5, 'Ramos', '1990-02-20', '201000004', '0935000005', 'Mos@gmail.com', 'Hà Nội', 5 ),
(6, 'Pique', '1990-05-30', '201000004', '0935000005', 'Mos@gmail.com', 'Vinh', 1 );

insert into hop_dong(id_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien, id_nhan_vien, id_khach_hang, id_dich_vu)
values 
(1, '2020-01-01', '2020-01-03', 2000000, 6800000, 1, 1, 1),
(2, '2020-02-01', '2020-02-03', 2000000, 6300000, 2, 2, 2),
(3, '2020-03-01', '2020-03-03', 2000000, 28000000, 3, 3, 3),
(4, '2020-04-01', '2020-04-03', 2000000, 80000000, 4, 4, 4);

insert into hop_dong_chi_tiet(id_hop_dong_chi_tiet, so_luong, id_hop_dong, id_dich_vu_di_kem)
values 
(1, 1, 1, 1),
(2, 1, 2, 2),
(3, 1, 3, 3),
(4, 1, 4, 4);
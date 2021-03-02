create database hireVehicle;
use hirevehicle;

create table NHACUNGCAP (
	MaNhaCC char(6) primary key,
    TenNhaCC varchar(255),
    DiaChi varchar(255),
    SoDT varchar(50),
    MaSoThue varchar(255)
);

create table LOAIDICHVU (
	MaLoaiDV char(4) primary key,
    TenLoaiDV varchar(255)
);

create table MUCPHI (
	MaMP char(4) primary key,
    DonGia varchar(255),
    MoTa varchar(255)
);

create table DONGXE (
	DongXe varchar(20) primary key,
    HangXe varchar(255),
    SoChoNgoi int
);

create table DANGKYCUNGCAP (
	MaDKCC char(5) primary key,
    MaNhaCC char(6),
    foreign key (MaNhaCC) references NHACUNGCAP(MaNhaCC),
    MaLoaiDV char(4),
    foreign key (MaLoaiDV) references LOAIDICHVU(MaLoaiDV),
    DongXe varchar(20), 
    foreign key (DongXe) references DONGXE(DongXe),
    MaMP char(4),
    foreign key (MaMP) references MUCPHI(MaMP),
    NgayBatDauCungCap varchar(255),
    NgayKetThucCungCap varchar(255)
);

Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC001','Cty TNHH Toàn Phát', 'Hai Chau', '051133999888', '568941');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC002','Cty Cổ Phần Đông Du', 'Lien Chieu', '051133999889', '456789');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC003','Ôngguyễn Văn A', 'Hoa Thuan', '051133999890', '321456');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC004','Cty Cổ Phần Toàn Cầu Xanh', 'Hai Chau', '05113658945', '513364');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC005','Cty TNHH AMA', 'Thanh Khe', '051103875466', '546546');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC006','Bà Trần Thị Bích Vân', 'Lien Chieu', '05113587469', '524545');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC007','Cty TNHH Phan Thành', 'Thanh Khe', '05113987456', '113021');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC008','Ông Phan Đìnham', 'Hoa Thuan', '05113532456', '121230');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC009','Tập đoàn Đôngam Á', 'Lien Chieu', '05113987121', '533654');
Insert Into NHACUNGCAP (MaNhaCC, TenNhaCC, DiaChi, SoDT, MaSoThue) Values ('NCC010','Cty Cổ Phần Rạng đông', 'Lien Chieu', '05113569654', '187864');

Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV01','Dịch vụ xe taxi');
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV02','Dịch vụ xe buýt công cộng theo tuyến cố định');
Insert Into LOAIDICHVU (MaLoaiDV, TenLoaiDV) Values ('DV03','Dịch vụ cho thuê xe theo hợp đồng');

Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP01', '10000','Áp dụng từgày 1/2015');
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP02', '15000','Áp dụng từgày 2/2015');
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP03', '20000','Áp dụng từgày 1/2010');
Insert Into MUCPHI (MaMP,DonGia,MoTa) Values ('MP04', '25000','Áp dụng từgày 2/2011');

Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Hiace', 'Toyota', 16);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Vios', 'Toyota', 5);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Escape', 'Ford', 5);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Cerato', 'KIA', 7);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Forte', 'KIA', 5);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Starex', 'Huyndai', 7);
Insert Into DONGXE (DongXe,HangXe,SoChoNgoi) Values ('Grand-i10', 'Huyndai', 7);

Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK001', 'NCC001', 'DV01', 'Hiace', 'MP01', '2015/11/20', '2016/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK002', 'NCC002', 'DV02', 'Vios', 'MP02', '2015/11/20', '2017/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK003', 'NCC003', 'DV03', 'Escape', 'MP03', '2017/11/20', '2018/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK004', 'NCC005', 'DV01', 'Cerato', 'MP04', '2015/11/20', '2019/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK005', 'NCC002', 'DV02', 'Forte', 'MP03', '2019/11/20', '2020/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK006', 'NCC004', 'DV03', 'Starex', 'MP04', '2016/11/10', '2021/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK007', 'NCC005', 'DV01', 'Cerato', 'MP03', '2015/11/30', '2016/01/25');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK008', 'NCC006', 'DV01', 'Vios', 'MP02', '2016/02/28', '2016/08/15');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK009', 'NCC005', 'DV03', 'Grand-i10', 'MP02', '2016/04/27', '2017/04/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK010', 'NCC006', 'DV01', 'Forte', 'MP02', '2016/11/21', '2016/02/22');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK011', 'NCC007', 'DV01', 'Forte', 'MP01', '2016/12/25', '2017/02/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK012', 'NCC007', 'DV03', 'Cerato', 'MP01', '2016/04/14', '2017/12/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK013', 'NCC003', 'DV02', 'Cerato', 'MP01', '2015/12/21', '2016/12/21');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK014', 'NCC008', 'DV02', 'Cerato', 'MP01', '2016/05/20', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK015', 'NCC003', 'DV01', 'Hiace', 'MP02', '2018/04/24', '2019/11/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK016', 'NCC001', 'DV03', 'Grand-i10', 'MP02', '2016/06/22', '2016/12/21');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK017', 'NCC002', 'DV03', 'Cerato', 'MP03', '2016/09/30', '2019/09/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK018', 'NCC008', 'DV03', 'Escape', 'MP04', '2017/12/13', '2018/09/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK019', 'NCC003', 'DV03', 'Escape', 'MP03', '2016/01/24', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK020', 'NCC002', 'DV03', 'Cerato', 'MP04', '2016/05/03', '2017/10/21');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK021', 'NCC006', 'DV01', 'Forte', 'MP02', '2015/01/30', '2016/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK022', 'NCC002', 'DV02', 'Cerato', 'MP04', '2016/07/25', '2017/12/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK023', 'NCC002', 'DV01', 'Forte', 'MP03', '2017/11/30', '2018/05/20');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK024', 'NCC003', 'DV03', 'Forte', 'MP04', '2017/12/23', '2019/11/30');
Insert Into DANGKYCUNGCAP (MaDKCC,MaNhaCC,MaLoaiDV,DongXe,MaMP,NgayBatDauCungCap,NgayKetThucCungCap) Values ('DK025', 'NCC003', 'DV03', 'Hiace', 'MP02', '2016/08/24', '2017/10/25');
 
/*Câu 3*/
select * from DONGXE where SoChoNgoi > 5;

/*Câu 4*/
SELECT NCC.MaNhaCC, NCC.TenNhaCC, DX.HangXe, MP.DonGia, DKCC.MaDKCC
FROM NHACUNGCAP AS NCC 
JOIN DANGKYCUNGCAP AS DKCC
ON NCC.MaNhaCC = DKCC.MaNhaCC
JOIN MUCPHI AS MP
ON MP.MaMp = DKCC.MaMp
JOIN DONGXE DX
ON DX.DongXe = DKCC.DongXe
WHERE (DX.HangXe = 'Toyota' AND MP.DonGia = 15000) 
OR (DX.HangXe = 'KIA' and MP.DonGia = 20000);

/*Câu 5*/
SELECT *
FROM NhaCungCap
ORDER BY TenNhaCC ASC, MaSoThue DESC;

/*Câu 6*/
SELECT NCC.TenNhaCC, COUNT(NCC.MaNhaCC) AS SoLanCungCap
FROM NHACUNGCAP NCC
JOIN DANGKYCUNGCAP DK
ON NCC.MaNhaCC = DK.MaNhaCC
WHERE DK.NgayBatDauCungCap = '2015/11/20'
GROUP BY NCC.TenNhaCC;

/*Câu 7*/
SELECT DISTINCT HangXe
From DONGXE;

/*Câu 8*/
SELECT DK.MaDKCC, NCC.MaNhaCC, NCC.TenNhaCC, NCC.DiaChi, NCC.MaSoThue, DV.TenLoaiDV, MP.DonGia, DX.HangXe, DK.NgayBatDauCungCap, DK.NgayKetThucCungCap
FROM DANGKYCUNGCAP DK
JOIN NHACUNGCAP NCC
ON DK.MaNhaCC = NCC.MaNhaCC
JOIN LOAIDICHVU DV
ON DV.MaLoaiDV = DK.MaLoaiDV
JOIN MUCPHI MP
on MP.MaMP = DK.MaMP
JOIN DONGXE DX
ON DX.DongXe = DK.DongXe;
/*Câu 9*/
SELECT NCC.TenNhaCC, NCC.MaNhaCC, NCC.DiaChi, NCC.SoDT, DX.DongXe
FROM NHACUNGCAP NCC
JOIN DANGKYCUNGCAP DK
ON NCC.MaNhaCC = DK.MaNhaCC
JOIN DONGXE DX
ON DX.DongXe = DK.DongXe
WHERE (DX.DongXe = 'Hiace' OR DX.DongXe = 'Cerato');

/*Câu 10*/
SELECT *
FROM NHACUNGCAP NCC
WHERE NOT EXISTS(SELECT MaNhaCC FROM DANGKYCUNGCAP DK WHERE NCC.MaNhaCC = DK.MaNhaCC);
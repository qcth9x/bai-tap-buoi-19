create database phim;
use phim;

CREATE TABLE User(
	id int  primary key,
	hoTen varchar(255),
	SDT varchar(255),
	gioiTinh varchar(255)
);

CREATE TABLE Category(
	id varchar(255) primary key,
	tenDanhMuc varchar(255)
);

CREATE TABLE Movie(
	id varchar(255)  primary key,
	tenPhim varchar(255),
	theLoai varchar(255),
	idDanhMuc varchar(255),
	ngaySanXuat varchar(255),
	giaPhim varchar(255),
	foreign key (idDanhMuc) references Category(id)
);

CREATE TABLE Rent(
	id varchar(255) primary key,
	thoiGianThue varchar(255),
	idNguoiThue int,
	idPhim varchar(255),
	idDanhMuc varchar(255),
	soTien varchar(255),
	thoiGianTra varchar(255),
	foreign key (idDanhMuc) references Category(id),
	foreign key (idPhim) references Movie(id),
	foreign key (idNguoiThue) references User(id)
);

INSERT INTO User (id , hoTen , SDT , gioiTinh)
VALUES 
	(1,'Le Van A','0987654321','Nam'), 
	(2,'Le Van D','00987654322','Nam'), 
	(3, 'Le Van C', '0987654311', 'Nam');
    
INSERT INTO Category(id , tenDanhMuc)
VALUES 
	('dm01','Phim 18+'),
	('dm02','Phim 16+');


INSERT INTO Movie(id , tenPhim , theLoai , idDanhMuc , ngaySanXuat , giaPhim )
 VALUES 
	('m01','tam quoc chi','phim co trang', 'dm01', '10/8/2010', '350000'),
	('m02','hong lau mong', 'phim co trang', 'dm01', '10/7/2010', '200000'),
	('m03','thuy huu', 'phim co trang', 'dm01', '10/8/2010', '100000'),
	('m04','tay du ky', 'phim co trang','dm01' ,'10/8/2010', '150000');

INSERT INTO Rent(id , thoiGianThue , idNguoiThue , idPhim , idDanhMuc , soTien , thoiGianTra)
VALUES
	('VT1','10:00ngay10/02/2023', 1 , 'm01', 'dm01' ,'200000' , '11:00ngay10/02/2023'),
	('VT2','10:00ngay10/02/2023', 2 , 'm02', 'dm01' , '300000' , '11:00ngay10/02/2023'),
	('VT3','10:00ngay10/02/2023', 3 , 'm03', 'dm01' , '400000' , '11:00ngay10/02/2023'),
	('VT4','10:00ngay10/02/2023', 4 , 'm04', 'dm01' , '250000' , '11:00ngay10/02/2023');
    select * from Rent;

SELECT hoTen, tenPhim, theLoai, soTien, thoiGianThue, thoiGianTra
FROM User
inner join Rent ON User.id = Rent.idNguoiDung
inner join Movie ON Rent.idPhim = Movie.id
WHERE soTien <= 300000
AND theLoai != 'Hanh dong'
USE resort_db;

-- VillaType table 
INSERT INTO 
	VillaType(VillaTypeID,VillaTypeName)
VALUES 
	('T1','One-bedroom Villa without pool'),
    ('T2','One-bedroom Villa with pool'),
    ('T3','Two-bedroom Villa without pool'),
    ('T4','Two-bedroom Villa with pool'),
    ('T5','Three-bedroom Suite Villa');
    
-- Villa table 
INSERT INTO 
	Villa(VillaID,VillaName,VillaCostPerDay,VillaTypeID)
VALUES 
	('V10','Serene Bliss',260.04,'T2'),
    ('V11','Old Trafford',515.35,'T1'),
    ('V12','Heaven Ruler',450.15,'T3'),
    ('V13','Stamford Bridge',654.65,'T4'),
    ('V14','Phoco Area',950.85,'T5'),
    ('V15','Hang Day',654.65,'T4'),
    ('V16','Goodi Park',768.45,'T5'),
    ('V17','Song Lahm',1100.00,'T5'),
    ('V18','Thien Truong',800.00,'T2'),
    ('V19','Wembley Cave',750.00,'T3');

-- Customer table 
INSERT INTO 
	Customer(CustomerID,CustomerName,CustomerPhNum)
VALUES 
	('C001','Tony Stark','0145784536'),
    ('C002','Thor Odinson','0245676453'),
    ('C003','Scarlet Witchy','0345635986'),
    ('C004','Peter Parker','0445632934'),
    ('C005','Kha Ba Ngo','0451962604'),
    ('C006','Nick Fury','0825187310'),
    ('C007','Bond James','0976345789'),
    ('C008','Cee Jay','0986761727');
    
-- Reservation table 
INSERT INTO 
	Reservation(ReservationID,ReservationDate,CustomerID)
VALUES 
	('R012','2020-04-26','C001'),
    ('R123','2020-05-21','C002'),
    ('R234','2020-06-15','C003'),
    ('R345','2020-07-03','C004'),
    ('R456','2020-09-05','C005'),
    ('R567','2020-08-04','C006'),
    ('R678','2020-01-13','C007'),
    ('R789','2018-01-10','C007'),
    ('R890','2018-01-18','C008');

-- Villa_Reservation table 
INSERT INTO 
	Villa_Reservation(ReservationID,VillaID,DateFrom,DateTo)
VALUES 
	('R012','V10','2020-04-26','2020-04-30'),
    ('R123','V13','2020-05-25','2020-05-29'),
    ('R234','V12','2020-06-20','2020-06-28'),
    ('R345','V15','2020-07-10','2020-07-15'),
    ('R345','V11','2020-07-12','2020-07-15'),
    ('R456','V11','2020-09-09','2020-09-20'),
    ('R456','V17','2020-09-15','2020-09-22'),
    ('R567','V14','2020-08-04','2020-08-08'),
    ('R678','V11','2020-01-14','2020-01-20'),
    ('R789','V17','2018-01-12','2018-01-21'),
    ('R789','V16','2018-02-01','2018-02-06'),
    ('R890','V10','2018-01-19','2018-01-29');
    
-- Payment table 
INSERT INTO 
	Payment(PaymentID,ReservationID,PaymentDate,PaymentAmount)
VALUES 
	('P001','R012','2020-04-30',1040.16),
    ('P002','R123','2020-05-29',2618.60),
    ('P003','R234','2020-06-28',2601.20),
    ('P004','R345','2020-07-15',3273.25),
    ('P005','R456','2020-09-20',5668.85),
    ('P006','R567','2020-08-08',3803.40),
    ('P007','R345','2020-07-25',1546.05),
    ('P008','R678','2020-01-20',3092.10),
    ('P009','R789','2018-01-22',9900.00),
    ('P010','R890','2018-01-29',2600.40),
    ('P011','R789','2018-02-16',3842.25),
    ('P012','R456','2020-09-22',7700.00);

-- Activity table 
INSERT INTO 
	Activity(ActivityID,ActivityName,ActivityCost,ActivityType)
VALUES 
	('A01','Swimming',150.00,'B'),
    ('A02','Rock Climbing',200.00,'0'),
    ('A03','Hiking',250.00,'O'),
    ('A04','Cooking',275.00,'I'),
    ('A05','Petsitiing',325.00,'I'),
    ('A06','Camping',300.00,'B'),
    ('A07','Package-1',425.00,'O'),
    ('A08','Package-2',800.00,'B'),
    ('A09','Package-3',525.00,'I');

-- Staff table 
INSERT INTO 
	Staff(StaffID,StaffName,ManagerID)
VALUES 
	('S1','Tobey Marshall',null),
    ('S2','Dino Brewster','S1'),
    ('S3','Julia Maddon',null),
    ('S4','Lil Pete','S3'),
    ('S5','Kid Cudi','S1'),
    ('S6','Ryan Beck','S3');
    
-- ActivityBooking table 
INSERT INTO 
	ActivityBooking(ActivityID,ReservationID,ActivityTime,NumPeople,GuideID)
VALUES 
	('AB01','R012','2020-04-27 13:30:00',5,'S1'),
    ('AB02','R123','2020-05-26 12:00:00',6,'S2'),
    ('AB03','R234','2020-06-21 16:30:00',4,'S3'),
    ('AB04','R345','2020-07-14 16:00:00',3,'S4'),
    ('AB05','R456','2020-09-15 17:30:00',7,'S5'),
    ('AB06','R567','2020-08-05 14:30:00',9,'S3');
    
-- SupportStaff table 
INSERT INTO 
	SupportStaff(RosterID,ActivityID,ReservationID,ActivityTime,StaffID,HoursNeeded)
VALUES 
	('R0001','A01','R012','2020-04-27 13:30:00','S2',4.00),
    ('R0002','A02','R123','2020-05-26 12:00:00','S4',6.00),
    ('R0003','A03','R234','2020-06-21 16:30:00','S4',5.00),
    ('R0004','A04','R345','2020-07-14 16:00:00','S5',7.00),
    ('R0005','A05','R456','2020-09-15 17:30:00','S2',9.00),
    ('R0006','A06','R567','2020-08-05 14:30:00','S5',8.00);
    
-- Package table 
INSERT INTO 
	Package(PackageActivityID,ChildActivityID)
VALUES 
	('A07','A02'),
    ('A07','A03'),
    ('A08','A05'),
    ('A08','A04'),
    ('A08','A06'),
    ('A09','A04'),
    ('A09','A05');
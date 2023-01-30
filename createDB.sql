-- create schema
CREATE SCHEMA resort_db 

-- create tabales 
CREATE TABLE VillaType (
	VillaTypeID CHAR(5) NOT NULL,
	VillaTypeName VARCHAR (60) NOT NULL,
    PRIMARY KEY(VillaTypeID)
);

CREATE TABLE Villa (
	VillaID CHAR(5) NOT NULL,
	VillaName VARCHAR (60) NOT NULL,
    VillaCostPerDay DECIMAL(6,2) NOT NULL, 
    VillaTypeID CHAR(5),
    PRIMARY KEY(VillaID),
    FOREIGN KEY(VillaTypeID) REFERENCES VillaType(VillaTypeID)
);

CREATE TABLE Customer (
	CustomerID CHAR(5) NOT NULL, 
    CustomerName VARCHAR(60) NOT NULL,
    CustomerPhNum CHAR(10) NOT NULL,
    PRIMARY KEY(CustomerID)
);

CREATE TABLE Reservation (
	ReservationID CHAR(5) NOT NULL,
    ReservationDate DATE NOT NULL, 
    CustomerID CHAR(5) NOT NULL,
    PRIMARY KEY(ReservationID),
    FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Villa_Reservation (
	ReservationID CHAR(5) NOT NULL,
	VillaID CHAR(5) NOT NULL,
    DateFrom DATE NOT NULL,
    DateTo DATE NOT NULL, 
    PRIMARY KEY(ReservationID, VillaID),
    FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID),
	FOREIGN KEY(VillaID) REFERENCES Villa(VillaID)
);

CREATE TABLE Payment (
	PaymentID CHAR(5) NOT NULL,
	ReservationID CHAR(5) NOT NULL,   
    PaymentDate DATE NOT NULL, 
    PaymentAmount DECIMAL(6,2) NOT NULL,
    PRIMARY KEY(PaymentID),
    FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID)
);

CREATE TABLE Activity (
	ActivityID CHAR(5) NOT NULL, 
    ActivityName VARCHAR(60) NOT NULL,
    ActivityCost DECIMAL(6,2) NOT NULL,
    ActivityType CHAR(1),
    PRIMARY KEY(ActivityID)
);

CREATE TABLE Staff (
	StaffID CHAR(5) NOT NULL, 
    StaffName VARCHAR(60) NOT NULL,
    ManagerID CHAR(5),
    PRIMARY KEY(StaffID)
);

CREATE TABLE ActivityBooking (
	ActivityID CHAR(5) NOT NULL,
	ReservationID CHAR(5) NOT NULL,
    ActivityTime DATETIME NOT NULL,
    NumPeople INT NOT NULL,
    GuideID CHAR(5) NOT NULL,
    PRIMARY KEY(ActivityID, ReservationID, ActivityTime),
	FOREIGN KEY(ReservationID) REFERENCES Reservation(ReservationID),
	FOREIGN KEY(ActivityID) REFERENCES Activity(ActivityID),
	FOREIGN KEY(GuideID) REFERENCES Staff(StaffID)    
);

CREATE TABLE SupportStaff (
	RosterID CHAR(5) NOT NULL,
	ActivityID CHAR(5) NOT NULL,
	ReservationID CHAR(5) NOT NULL,
    ActivityTime DATETIME NOT NULL,
	StaffID CHAR(5) NOT NULL, 
	HoursNeeded INT NOT NULL,
	PRIMARY KEY(RosterID),
	FOREIGN KEY(ActivityID) REFERENCES ActivityBooking(ActivityID),
	FOREIGN KEY(ReservationID) REFERENCES ActivityBooking(ReservationID),
	FOREIGN KEY(ActivityTime) REFERENCES ActivityBooking(ActivityID),
	FOREIGN KEY(StaffID) REFERENCES Staff(StaffID)
);

CREATE TABLE Package (
	PackageActivityID CHAR(5) NOT NULL,
    ChildActivityID CHAR(5) NOT NULL,
	PRIMARY KEY(PackageActivityID,ChildActivityID),
	FOREIGN KEY(PackageActivityID) REFERENCES Activity(ActivityID),
	FOREIGN KEY(ChildActivityID) REFERENCES Activity(ActivityID)    
);


USE resort_db;

-- Task 1: Print all the details (ID, Name, Cost) of the villa. Note that the cost must be prefixed with a '$' sign. Sort the records in order of price with the most expensive villa at the top of the list.
SELECT VillaID, VillaName, concat('$', VillaCostPerDay) 'VillaCostPerDay'
FROM Villa
ORDER BY VillaCostPerDay DESC;

-- Task 2: print the reservation details (VillaID, check in and out dates, along with the number of days) that each of the villas in the reservation are reserved for.
SELECT VillaID, DateFrom, DateTo, DATEDIFF(DateTo, DateFrom) 'Length of stay'
FROM Villa_Reservation; 

-- Task 3: print the all details (Name, Cost) of the villa if they are two-bedroom villas.
SELECT V.VillaName, V.VillaCostPerDay
FROM VillaType VT, Villa V
WHERE V.VillaID = VT.VillaID
AND VT.VillaTypeName like '%two-bedroom%';
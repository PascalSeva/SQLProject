USE CarRental
Go

Select t.TransactionID, t.TransactionDate, t.custID, c.Name as custName, c.Email as custEmail , ca.carID, ca.Make, ca.Model, ca.Year, ca.Color, e.empID, e.name as empName, e.Email as empEmail, d.fromcity, d.fromState, d.fromZip, d.toCity, d.toState, d.toZip
into allInfo --creating a new table with all the column listed above.
from Transactions as t
	inner join
	Customers as c
	ON c.custID = t.custID
	inner join
	Employees as e
	on e.TransactionID = t.TransactionID
	inner join 
	Cars as ca
	on t.carID = ca.carID
	inner join
	Destination as d
	on d.TransactionID = t.TransactionID
SELECT Customer.FirstName, Customer.LastName
FROM Customer INNER JOIN Employee 
	ON Employee.EmployeeId=Customer.SupportRepId 
WHERE Employee.ReportsTo is null
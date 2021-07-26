select FirstName,LastName
from employee   full join employee as e4 
on employee.city=e4.city and e1.reportsto is not null
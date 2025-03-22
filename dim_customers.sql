select * from dbo.customers;

select * from dbo.geography;


select
	c.CustomerID,
	c.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	g.Country,
	g.City
from dbo.customers as c
inner join
	dbo.geography as g
on
	c.GeographyID = g.GeographyID;
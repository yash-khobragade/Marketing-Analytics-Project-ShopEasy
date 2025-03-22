select * from dbo.products;

select 
	ProductID,
	ProductName,
	Price,
	case
		when Price < 50 then 'Low'
		when Price Between 50 AND 200 then 'Medium'
		else 'High'
	end as PriceCategory
from dbo.products;


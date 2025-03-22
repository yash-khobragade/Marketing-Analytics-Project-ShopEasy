select * from customer_journey;

with DuplicateRecords as(
	select 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		Duration,
		ROW_NUMBER() Over(
			partition by CustomerID,ProductID,VisitDate,Stage,Action
			order by journeyid
		) as row_num
	from dbo.customer_journey
)

select *
from DuplicateRecords
where row_num > 1

select 
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Stage,
		Action,
		coalesce(Duration,avg_duration) as Duration
from
	(select 	
		JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		Upper(Stage) as Stage,
		Action,
		Duration,
		avg(duration) over(partition by visitdate) as avg_duration,
		ROW_NUMBER() over(
			partition by CustomerID,ProductID,VisitDate,Upper(Stage),Action
			order by journeyid
		) as row_num
	from 
		dbo.customer_journey) as subquery
where row_num = 1
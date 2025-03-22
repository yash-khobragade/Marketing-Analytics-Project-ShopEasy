select * from dbo.engagement_data;

select
	EngagementID,
	ContentID,
	CampaignID,
	ProductID,
	upper(replace(contenttype, 'Socialmedia', 'Social Media')) as ContentType,
	LEFT(ViewsClicksCombined, CHARINDEX('-', ViewsClicksCombined) - 1) as Views,
	Right(ViewsClicksCombined,len(ViewsClicksCombined) - CHARINDEX('-', ViewsClicksCombined)) as Clicks,
	Likes,
	Format(convert(date, engagementdate), 'dd.MM.yyyy') as EngagementDate
from 
	dbo.engagement_data;
declare @a�o int =2022,
@semana int =23,@dia int =2
declare @inicioa�o datetime=cast(cast( @a�o*10000+101 as varchar) as datetime)
select dateadd(day,(@semana)*7+@dia-DATEPART(WEEKDAY,@inicioa�o),@inicioa�o)
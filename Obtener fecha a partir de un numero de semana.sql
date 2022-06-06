declare @año int =2022,
@semana int =23,@dia int =2
declare @inicioaño datetime=cast(cast( @año*10000+101 as varchar) as datetime)
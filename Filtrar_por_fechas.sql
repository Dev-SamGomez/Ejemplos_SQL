--Filtrar convirtiendo un campo fecha en Numero de Mes del año en curso
--en este caso son los ultimos 3 meses
select * from OrdenesDeVenta where Status='CLOSE' and
DATEPART(MONTH,CONVERT(date,CreatedDate)) between
DATEPART(MONTH,GETDATE()) - 3 and DATEPART(MONTH,GETDATE())
and DATEPART(YEAR,CONVERT(date,CreatedDate)) = DATEPART(YEAR,GETDATE())
order by CreatedDate
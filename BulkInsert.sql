begin
    bulk insert prueba --Iniciamos con la palabra reservada bulk, seguido de insert y la tabla que afectaremos
from 'C:\Users\samuel.gomez\Desktop\Sam\prueba.txt' --Agregamos el archivo
with (datafiletype = 'char', --Especificamos tipo de caracteres
    firstrow = 2, --Opcional, esto para indicarle desde que fila comienza a hacer el bulk insert
    fieldterminator=',', --Determinar donde hara el salto de linea
	rowterminator='\n' --Determinar con que termina
)
select * from prueba
end;
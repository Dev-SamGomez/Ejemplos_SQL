BEGIN
 UPDATE Clientes SET Pais = 'Mexico' WHERE Pais = 'MX'
 SELECT @@ROWCOUNT AS filasAfectadas
END
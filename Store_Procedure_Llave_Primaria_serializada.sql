
CREATE PROCEDURE sp_SerialsGenerator

@NewSerial NVARCHAR(30) OUTPUT
AS

BEGIN TRY

BEGIN

DECLARE @GetID NVARCHAR(25)=NULL;DECLARE @Idt NVARCHAR(10)=NULL;
DECLARE @Letras NVARCHAR(6)=NULL;
DECLARE @Numero BIGINT=NULL;

DECLARE @NumeroString NVARCHAR(15)=NULL;
DECLARE @Letra1 NVARCHAR(3)=NULL;
DECLARE @Letra2 NVARCHAR(3)=NULL;
DECLARE @Letra3 NVARCHAR(3)=NULL;
DECLARE @Letra4 NVARCHAR(3)=NULL;

DECLARE @ASCII_1 INT=NULL;
DECLARE @ASCII_2 INT=NULL;
DECLARE @ASCII_3 INT=NULL;
DECLARE @ASCII_4 INT=NULL;

SET @GetID=(SELECT MAX(IDSerial) FROM EjemploTabla)
	IF @GetID IS NULL OR @GetID=''
		BEGIN
			SET @NewSerial = 'SERIALAAAA0000001'
		END
	ELSE IF @GetID IS NOT NULL OR @GetID<>''
		BEGIN
		SELECT @Idt=(SELECT LEFT(@GetID, 3))
		SELECT @Letras= (SELECT SUBSTRING(@GetID, 4, 4))
		SELECT @Numero= (SELECT RIGHT(@GetID, 7))
		PRINT @Idt; PRINT @Letras; PRINT @Numero;
		IF @Numero < 9999999
			BEGIN
				SELECT @Numero +=1
				SELECT @NumeroString= (SELECT CAST(@Numero AS NVARCHAR(7)))
				WHILE ((SELECT LEN(@NumeroString)) < 7)
					BEGIN
					SELECT @NumeroString = '0' + @NumeroString
					PRINT @NumeroString;
					END
				SELECT @NewSerial = @Idt + @Letras + @NumeroString
			END
		ELSE IF @Numero = 9999999
			BEGIN
				SELECT @NumeroString = '0000001'
				SELECT @Letra1= (SELECT LEFT(@Letras,1))
				SELECT @Letra2= (SELECT SUBSTRING(@Letras,2,1))
				SELECT @Letra3= (SELECT SUBSTRING(@Letras,3,1))
				SELECT @Letra4= (SELECT RIGHT(@Letras,1))
				SELECT @ASCII_1= (SELECT ASCII (@Letra1))
				SELECT @ASCII_2= (SELECT ASCII (@Letra2))
				SELECT @ASCII_3= (SELECT ASCII (@Letra3))
				SELECT @ASCII_4= (SELECT ASCII (@Letra4))

			IF (SELECT @ASCII_4) < 90
				BEGIN
					SELECT @ASCII_4 += 1
				END
			ELSE IF (SELECT @ASCII_4) = 90 And (SELECT @ASCII_3) < 90
				BEGIN
					SELECT @ASCII_4 = 65;
					SELECT @ASCII_3 += 1;
				END
			ELSE IF (SELECT @ASCII_4) = 90 And (SELECT @ASCII_3) = 90 And (SELECT @ASCII_2) < 90
				BEGIN
					SELECT @ASCII_4 = 65;
					SELECT @ASCII_3 = 65;
					SELECT @ASCII_2 += 1
				END
			ELSE IF (SELECT @ASCII_4) = 90 And (SELECT @ASCII_3) = 90 And (SELECT @ASCII_2) = 90 And (SELECT @ASCII_1) < 90
				BEGIN
					SELECT @ASCII_4 = 65;
					SELECT @ASCII_3 = 65;
					SELECT @ASCII_2 = 65;
					SELECT @ASCII_1 += 1
				END
			ELSE IF (SELECT @ASCII_4) = 90 And (SELECT @ASCII_3) = 90 And (SELECT @ASCII_2) = 90 And (SELECT @ASCII_1) = 90
				BEGIN
					SELECT @ASCII_4 = 65; SELECT @ASCII_3 = 65; SELECT @ASCII_2 = 65; SELECT @ASCII_1 = 65
				END
		SELECT @Letra1=(SELECT CHAR(@ASCII_1))
		SELECT @Letra2=(SELECT CHAR(@ASCII_2))
		SELECT @Letra3=(SELECT CHAR(@ASCII_3))
		SELECT @Letra4=(SELECT CHAR(@ASCII_4))
		SELECT @Letras= @Letra1 + @Letra2 + @Letra3 + @Letra4
		SELECT @NewSerial = @Idt + @Letras + @NumeroString
		END
	END
END
END	TRY
BEGIN CATCH

	SELECT @NewSerial = 'FALSE'
DECLARE @ErrorMessage NVARCHAR(4000),  @ErrorSeverity INT, @ErrorState INT;
SELECT @ErrorMessage = ERROR_MESSAGE(),@ErrorSeverity = ERROR_SEVERITY(),@ErrorState = ERROR_STATE();
RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);

END CATCH;
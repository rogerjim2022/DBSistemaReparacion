USE DBRodricel
GO


CREATE FUNCTION dbo.fnc_getTblValoresTexto
(
 @ListaValores NVARCHAR(MAX)
)
RETURNS @Tbl TABLE (ValorId INT IDENTITY(1,1) NOT NULL,Valor NVARCHAR(MAX) NOT NULL) AS
BEGIN
declare @Pos int,@SgtePos int,@ValorEn int

	SELECT @Pos = 0, @SgtePos = 1
	WHILE @SgtePos > 0
	BEGIN
		SELECT @SgtePos = CHARINDEX(',', @ListaValores, @Pos + 1)
		SELECT @ValorEn = (CASE WHEN @SgtePos > 0 THEN @SgtePos ELSE LEN(@ListaValores) + 1 END) - @Pos - 1
      
		INSERT @Tbl(Valor) VALUES (SUBSTRING(@ListaValores, @Pos + 1, @ValorEn))
		SELECT @Pos = @SgtePos
	END
	RETURN
END
GO


-- CREATE PROCEDURE stp_sel_ObtenerSerieCorrelativo
--@nTipoOperacion CHAR(1),
--@nTipoDoc VARCHAR(2),
--@cLocCod VARCHAR(2)

--AS BEGIN
--DECLARE @cSerie VARCHAR(4)
--DECLARE @nNro INT 
--DECLARE @cNro VARCHAR(8)

--IF @nTipoOperacion='V'
--	BEGIN
--	SELECT F = 0
--	END
--ELSE 
--	BEGIN
--	SELECT F = 0
--	END
--	IF @nTipoDoc = 1 AND (SELECT COUNT(*) FROM Locales WHERE nEstado=1 AND cLocCod IN (SELECT Valor FROM dbo.fnc_getTblValoresTexto(@cLocCod)))=1 
--		BEGIN
--			SET @cSerie = (SELECT cSerie FROM SerieVenta WHERE cLocCod = @cLocCod AND cSerie LIKE 'F%')	
--			BEGIN
--			SET @nNro = ISNULL((
--													select  Max(Data.nCorrelativo)
--													from (
--																SELECT MAX(fe.nCorrelativo) nCorrelativo   
--																FROM FactElect fe
--																WHERE fe.cSerie = @cSerie
--															)Data
--															),0) + 1
--															SET @cNro = right('00000000'+convert(varchar(Max),@nNro),8)
--															SELECT cSerie = right(@cSerie,4),cNro = @cNro												
--			END
--		END
--	ELSE 
--		IF @nTipoDoc = 2 AND @cAgeCod  IN (SELECT valor FROM DBO.fnc_getTblValoresTexto((SELECT nConsSisValor FROM Constsistema WHERE nConsSisCod = 536)))
--		BEGIN
--			SET @cSerie = (SELECT cSerie FROM CorrelativoFE WHERE cAgeCod = @cAgeCod AND cSerie LIKE 'F%')	
--			BEGIN
--			SET @nNro = ISNULL((
--													select  Max(Data.nCorrelativo)
--													from (
--																SELECT MAX(fe.nCorrelativo) nCorrelativo   
--																FROM FactElect fe
--																WHERE fe.cSerie = @cSerie
--															)Data
--															),0) + 1
															
--															SET @cNro = right('00000000'+convert(varchar(Max),@nNro),8)
--															SELECT cSerie = right(@cSerie,4),cNro = @cNro															
--			END
--		END	
--	END


--CREATE PROCEDURE stp_ins_GuardarServicios
--AS
--BEGIN
--	INSERT Mov(cMovNro,cOpeCod,cMovDesc,nMovEstado,nMovFlag,nMovNro_Migra) VALUES(@dRegistro,@cOpeCod,'DESEMBOLSO CON ABONO A CTA SUELDO',13,0,0)
--	SET @nMovNro = SCOPE_IDENTITY() --OK

--	UPDATE ColocSueldo SET nEstado=@nPrdEstado, dFechaRegistro=@dRegistro WHERE cCtaCod=@cCtaCod --OK

--	INSERT INTO ColocCalendDet (cCtaCod,nNroCalen,nColocCalendApl,nCuota,nPrdConceptoCod,nMonto,nMontoPagado)
--	VALUES (@cctaCod,2,1,1,8700,@nMontoDesembolso,0.00) --ok

--	INSERT INTO ColocCalendDet (cCtaCod,nNroCalen,nColocCalendApl,nCuota,nPrdConceptoCod,nMonto,nMontoPagado)
--	VALUES (@cctaCod,2,1,1,8701,@nComision,0.00) --ok

--	INSERT INTO MOVCOL (nMovNro, cOpeCod, cCtaCod, nNroCalen,nMonto,nDiasMora,nPlazo, nCredEstado,nSaldoCap,nFlag,nPrepago) 
--	VALUES(@nMovNro,@cOpeCod,@cctaCod,2,@nMontoDesembolso,0,@nPlazo,@nPrdEstado,0.00,NULL,0)--ok

--	INSERT INTO MOVCOLDET(nMovNro,cOpeCod,cCtaCod,nNroCalen,nPrdConceptoCod,nNroCuota,nMonto)
--	VALUES(@nMovNro,@cOpeCod,@cctaCod,2,8700,1,@nMontoDesembolso) --ok

--END
--GO

CREATE PROCEDURE stp_ins_GuardarMarca
@cMarcaCod VARCHAR(10),
@cMarca VARCHAR(200),
@nEstado INT,
@cUltimaActualizacion VARCHAR(25)
AS
BEGIN
BEGIN TRY
IF  EXISTS(SELECT * FROM Marca WHERE cMarcaCod=@cMarcaCod)
	BEGIN
		UPDATE Marca SET cMarca=UPPER(@cMarca),bEstado=@nEstado,cUltimaActualizacion=@cUltimaActualizacion WHERE  cMarcaCod=@cMarcaCod
		SELECT  Resultado='1'	
	END
ELSE
	BEGIN
	DECLARE 
		@cMarCod VARCHAR(6),
		@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
		SET @cSerie='MC'
		SET @nNro = ISNULL((   SELECT MAX(d.cMarcaCod) 
									FROM (SELECT MAX(RIGHT(C.cMarcaCod,3))  cMarcaCod FROM
									Marca C 							
									 ) d),0) + 1
		SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
		SET @cMarCod =@cSerie+@cNro
		INSERT INTO Marca (cMarcaCod,cMarca,bEstado,cUltimaActualizacion)
		VALUES (@cMarCod,UPPER(@cMarca),@nEstado,@cUltimaActualizacion)

		SELECT  Resultado='1'	
	END				
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_sel_MostrarMarcas 
@nTipoListado INT
AS
BEGIN
IF @nTipoListado=1
	BEGIN
	SELECT cMarcaCod, cMarca, bEstado,  CONVERT(VARCHAR(10),CONVERT(DATE,LEFT(cUltimaActualizacion,8),103),103) cUltimaActualizacion FROM Marca 
	END
ELSE IF @nTipoListado=2
	BEGIN
	SELECT cMarcaCod, (cMarcaCod+' - '+cMarca) cMarca, bEstado,  CONVERT(VARCHAR(10),CONVERT(DATE,LEFT(cUltimaActualizacion,8),103),103) cUltimaActualizacion FROM Marca 
	WHERE bEstado=1
	END
END
GO

CREATE PROCEDURE stp_ins_GuardarMarcaModelo
@cMarcaCod VARCHAR(10),
@cModeloCod VARCHAR(10),
@cModelo VARCHAR(200),
@nEstado INT,
@cUltimaActualizacion VARCHAR(25)
AS
BEGIN
BEGIN TRY
IF  EXISTS(SELECT * FROM MarcaModelo WHERE cModeloCod=@cModeloCod)
	BEGIN
		UPDATE MarcaModelo SET cModelo=UPPER(@cModelo),cMarcaCod=@cMarcaCod,bEstado=@nEstado,cUltimaActualizacion=@cUltimaActualizacion WHERE cModeloCod=@cModeloCod
		SELECT  Resultado='1'	
	END
ELSE
	BEGIN
	DECLARE 
		@cModCod VARCHAR(6),
		@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
		SET @cSerie='MD'
		SET @nNro = ISNULL((   SELECT MAX(d.cModeloCod) 
									FROM (SELECT MAX(RIGHT(C.cModeloCod,3))  cModeloCod FROM
									MarcaModelo C 							
									 ) d),0) + 1
		SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
		SET @cModCod =@cSerie+@cNro
		INSERT INTO MarcaModelo (cModeloCod,cMarcaCod,cModelo,bEstado,cUltimaActualizacion)
		VALUES (@cModCod,@cMarcaCod,UPPER(@cModelo),@nEstado,@cUltimaActualizacion)

		SELECT  Resultado='1'	
	END				
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_sel_MostrarMarcaModelo
@nTipoListado INT,
@cMarcaCod VARCHAR(10)
AS
BEGIN
IF @nTipoListado=1
	BEGIN
	SELECT MO.cModeloCod, MA.cMarca, MO.cModelo, MO.bEstado, CONVERT(VARCHAR(10),CONVERT(DATE,LEFT(MO.cUltimaActualizacion,8),103),103) cUltimaActualizacion
	FROM MarcaModelo MO INNER JOIN Marca MA ON MA.cMarcaCod=MO.cMarcaCod ORDER BY MO.cModeloCod
	END
ELSE IF @nTipoListado=2
	BEGIN
	SELECT MO.cModeloCod, MA.cMarca, MO.cModelo, MO.bEstado, CONVERT(VARCHAR(10),CONVERT(DATE,LEFT(MO.cUltimaActualizacion,8),103),103) cUltimaActualizacion
	FROM MarcaModelo MO INNER JOIN Marca MA ON MA.cMarcaCod=MO.cMarcaCod AND MA.cMarcaCod=@cMarcaCod
	ORDER BY MO.cModeloCod
	END
END
GO


CREATE PROCEDURE sp_GeneraMovNro
@pdFecha DATETIME = NULL,  
@psAgeCod CHAR(2) = '07', 
@psUserCod CHAR(4) = 'SIST', 
@psMovNro VARCHAR(25) = NULL OUTPUT, 
@psTabla VARCHAR(40) = 'MOV'
AS
DECLARE @sMovNro VARCHAR(27)
DECLARE @sMaxMov VARCHAR(27)
DECLARE @sMaxMovTmp VARCHAR(27)
DECLARE @sSelect VARCHAR(255)
IF @pdFecha IS NULL  OR @pdFecha = ''   SELECT @pdFecha = GETDATE()

SELECT   @sMaxMov = ''
IF @psMovNro IS NULL  OR LEN(@psMovNro) <> 25 
    SELECT   @sMovNro=CONVERT(varchar(20),@pdFecha,112)+REPLACE(CONVERT(varchar(20),@pdFecha,108),':','') +'100'+@psAgeCod+'__' + @psUserCod
ELSE
     SELECT   @sMovNro=LEFT(@psMovNro,19) + '__' + RIGHT(@psMovNro,4)
 IF UPPER(@psTabla) = 'MOV'  
SELECT @sMaxMov = ISNULL(MAX(cMovNro),'') FROM Mov WITH (NOLOCK) WHERE cMovNro LIKE @sMovNro

SET @sMaxMovTmp = @sMaxMov
If SUBSTRING (@sMaxMovTmp,20,2) = '99'
   SELECT   @sMovNro=LEFT(@sMovNro,19)+'A0'+RIGHT(@sMovNro,4)
            ELSE
            BEGIN
               IF @sMaxMov = ''
                 BEGIN
                  IF @psMovNro IS NULL  OR LEN(@psMovNro) <> 25 
                      SELECT   @sMovNro=CONVERT(VARCHAR(20),@pdFecha,112)+REPLACE(CONVERT(VARCHAR(20),@pdFecha,108),':','') +'100'+@psAgeCod+'00' + @psUserCod
                  ELSE
                      IF SUBSTRING (@sMaxMovTmp,20,2) = '99'
                          SELECT   @sMovNro=LEFT(@sMovNro,19)+'A0'+RIGHT(@sMovNro,4)
	         ELSE	  
	            SELECT   @sMovNro=@psMovNro
                 END
ELSE 
         BEGIN 
            IF ISNUMERIC (SUBSTRING(@sMaxMov,20,2)) = 1
                        SELECT   @sMovNro=LEFT(@sMaxMov,19)+RIGHT( '00'+ LTRIM(STR(CONVERT(int,SUBSTRING(@sMaxMov,20,2))+1)),2) + RIGHT(@sMaxMov,4)
           ELSE
               BEGIN
                     IF (ISNUMERIC (SUBSTRING(@sMaxMov,20,1))  = 0  AND SUBSTRING(@sMaxMov,21,1) < 'Z' ) 
                             IF SUBSTRING(@sMaxMov,21,1) = '9' 
                                   SELECT   @sMovNro = LEFT(@sMaxMov,20) + 'A'  +  RIGHT(@sMaxMov,4)
                             ELSE   
                                   SELECT   @sMovNro = LEFT(@sMaxMov,20) + RIGHT('0' + CHAR(ASCII(SUBSTRING(@sMaxMov,21,1)) +1)   ,1)   +  RIGHT(@sMaxMov,4)

                            ELSE
                                   SELECT   @sMovNro=LEFT(@sMaxMov,19)+  CHAR(ASCII(SUBSTRING(@sMaxMov,20,1)) + 1) + '0' + RIGHT(@sMaxMov,4)
                     END 
           END
END
SELECT @psMovNro = @sMovNro
SELECT  @sMovNro
GO

CREATE PROCEDURE stp_ins_GuardarCargosTabla
@cRHCargoCodTabla VARCHAR(6),
@cRHCargoDescripcion VARCHAR(50),
@nRHCargoSueldoMinimo MONEY,
@nRHCargoSueldoMaximo MONEY,
@cUltimaActualizacion  VARCHAR(25)
AS
BEGIN
BEGIN TRY
IF  EXISTS(SELECT * FROM RHCargosTabla WHERE cRHCargoCodTabla=@cRHCargoCodTabla)
	BEGIN
		UPDATE RHCargosTabla SET cRHCargoDescripcion=@cRHCargoDescripcion,nRHCargoSueldoMinimo=@nRHCargoSueldoMinimo,nRHCargoSueldoMaximo=@nRHCargoSueldoMaximo,cUltimaActualizacion=@cUltimaActualizacion WHERE cRHCargoCodTabla=@cRHCargoCodTabla
		SELECT  Resultado='1'	
	END
ELSE
	BEGIN
	DECLARE 
	@cRHCa VARCHAR(6),
	@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
	SET @cSerie='CG'
	SET @nNro = ISNULL((   SELECT MAX(d.cRHCargoCodTabla) 
								FROM (SELECT MAX(RIGHT(C.cRHCargoCodTabla,3))  cRHCargoCodTabla FROM
								RHCargosTabla C 							
								 ) d),0) + 1
	SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
	SET @cRHCa =@cSerie+@cNro
	
		INSERT INTO RHCargosTabla (cRHCargoCodTabla,cRHCargoDescripcion,nRHCargoSueldoMinimo,nRHCargoSueldoMaximo,cUltimaActualizacion)
		VALUES (@cRHCa,UPPER(@cRHCargoDescripcion),@nRHCargoSueldoMinimo,@nRHCargoSueldoMaximo,@cUltimaActualizacion)
	
		SELECT  Resultado='1'	
	END				
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_ins_GuardarLocales
@cLocCod VARCHAR(2),
@cLocDescripcion VARCHAR(40),
@cLocDireccion VARCHAR(100),
@cLocTelefono VARCHAR(20),
@nEstado INT,
@cUltimaActualizacion  VARCHAR(25)
AS
BEGIN
BEGIN TRY

IF  EXISTS(SELECT * FROM Locales WHERE cLocCod=@cLocCod)
	BEGIN
		UPDATE Locales SET cLocDescripcion=@cLocDescripcion,cLocDireccion=@cLocDireccion,cLocTelefono=@cLocTelefono,nEstado=@nEstado,cUltimaActualizacion=@cUltimaActualizacion WHERE cLocCod=@cLocCod
		SELECT  Resultado='1'	
	END
ELSE
	BEGIN
	DECLARE @Codigo VARCHAR(10)
		DECLARE @nNro INT 
		DECLARE @cNro VARCHAR(3)
		SET @nNro = ISNULL((   SELECT MAX(d.cLocCod) 
								FROM (SELECT MAX(c.cLocCod)  cLocCod FROM
								Locales c 
								 ) d),0) + 1
		SET @cNro = right('00'+convert(varchar(Max),@nNro),2)
		SET @Codigo=@cNro

	INSERT INTO Locales ( cLocCod,cLocDescripcion,cLocDireccion,cLocTelefono,nEstado,cUltimaActualizacion)
	VALUES ( @Codigo,@cLocDescripcion,@cLocDireccion,@cLocTelefono,@nEstado,@cUltimaActualizacion)
	SELECT  Resultado='1'	
	END
					
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_ins_GuardarPersona
@cPersCod VARCHAR(13),
@nPersPersoneria INT,
@cPersNombre VARCHAR(200),
@dPersNac VARCHAR(11),
@cPersEmail VARCHAR(100),
@cPersCelular VARCHAR(10),
@cPersCelular2 VARCHAR(10),
@cPersIDnro VARCHAR(50),
@nTrabajador INT,
@cUltimaActualizacion  VARCHAR(25)
AS
BEGIN
BEGIN TRY

IF  EXISTS(SELECT * FROM Persona WHERE cPersCod=@cPersCod)
	BEGIN
		UPDATE Persona SET cPersNombre=UPPER(@cPersNombre),dPersNac=@dPersNac,cPersIDnro=@cPersIDnro,nTrabajador=@nTrabajador,cPersEmail=@cPersEmail,cPersCelular=@cPersCelular,cPersCelular2=@cPersCelular2,cUltimaActualizacion=@cUltimaActualizacion WHERE cPersCod=@cPersCod
		SELECT  Resultado='1'	
	END
ELSE
	BEGIN
	DECLARE @cCod VARCHAR(15),
	@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
	
	SET @nNro = ISNULL((   SELECT MAX(d.cPersCod) 
								FROM (SELECT MAX(RIGHT(P.cPersCod,3))  cPersCod FROM
								Persona P WHERE LEFT(P.cPersCod,2) = SUBSTRING(@cUltimaActualizacion,18,2)
								AND SUBSTRING(P.cPersCod,3,8)=LEFT(@cUltimaActualizacion,8)
								 ) d),0) + 1
	SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
	SET @cCod =SUBSTRING(@cUltimaActualizacion,18,2)+LEFT(@cUltimaActualizacion,8)+@cNro
	
	IF @nPersPersoneria=1
		BEGIN
		INSERT INTO Persona (cPersCod,cPersNombre,dPersNac,nPersPersoneria,cPersEmail,cPersCelular,cPersCelular2,cPersIDnro,nPersIDTpo,nTrabajador,cUltimaActualizacion)
		VALUES (@cCod,UPPER(@cPersNombre),@dPersNac,@nPersPersoneria,@cPersEmail,@cPersCelular,@cPersCelular2,@cPersIDnro,1,@nTrabajador,@cUltimaActualizacion)
		SELECT  Resultado='1'	
		END
	ELSE
		BEGIN
		INSERT INTO Persona (cPersCod,cPersNombre,dPersNac,nPersPersoneria,cPersEmail,cPersCelular,cPersCelular2,cPersIDnro,nPersIDTpo,nTrabajador,cUltimaActualizacion)
		VALUES (@cCod,UPPER(@cPersNombre),@dPersNac,@nPersPersoneria,@cPersEmail,@cPersCelular,@cPersCelular2,@cPersIDnro,2,0,@cUltimaActualizacion)
		SELECT  Resultado='1'
		END
	END	
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errStatese
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_ins_GuardarProducto
@cProductoCod VARCHAR(13),
@cLocCod VARCHAR(2),
@cNombreProducto VARCHAR(MAX),
@cModelo VARCHAR(200),
@nCantidad INT,
@cPersCodPro VARCHAR(13),
@nPrecioCompra MONEY,
@nPrecioVenta MONEY,
@cUltimaActualizacion  VARCHAR(25)
AS
BEGIN
BEGIN TRY

IF EXISTS(SELECT * FROM Producto WHERE cProductoCod=@cProductoCod)
	BEGIN
				UPDATE Producto SET nStockActual = nStockActual + @nCantidad  WHERE cProductoCod=@cProductoCod
				INSERT INTO ProductoDetalle(cProductoCod,cLocCod,nEntrada,nSalida,nSaldo,cUltimaActualizacion)
				VALUES (@cProductoCod,@cLocCod,@nCantidad,0,@nCantidad,@cUltimaActualizacion)

				SELECT  Resultado='1'	
	END
ELSE
	BEGIN
			DECLARE 
			@cCod VARCHAR(15),
			@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
			SET @cSerie='PD'
			SET @nNro = ISNULL((   SELECT MAX(d.cProductoCod) 
										FROM (SELECT MAX(RIGHT(R.cProductoCod,3))  cProductoCod FROM
										Producto R 							
										 ) d),0) + 1
			SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
			SET @cCod = @cSerie+@cNro
					
				INSERT INTO Producto(cProductoCod,cNombreProducto,cModelo,nStockActual,cPersCodProv,nPrecioCompra,nPrecioVenta,cUltimaActualizacion)
				VALUES (@cCod,UPPER(@cNombreProducto),@cModelo,@nCantidad,@cPersCodPro,@nPrecioCompra,@nPrecioVenta,@cUltimaActualizacion)
						
				INSERT INTO ProductoDetalle(cProductoCod,cLocCod,nEntrada,nSalida,nSaldo,cUltimaActualizacion)
				VALUES (@cCod,@cLocCod,@nCantidad,0,@nCantidad,@cUltimaActualizacion)

				SELECT  Resultado='1'			
	END					
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO

CREATE PROCEDURE stp_ins_GuardarTrabajador
@cPersCod VARCHAR(13),
@cRHCargoCodTabla VARCHAR(6),
@cUser VARCHAR(4),
@cLocalAsig VARCHAR(2),
@dFechaIngreso  VARCHAR(10),
@dFechaCese  VARCHAR(10),
@nRHEstado INT,
@cUltimaActualizacion  VARCHAR(25)
AS
BEGIN
BEGIN TRY
  IF EXISTS(SELECT * FROM RRHH WHERE cPersCod=@cPersCod)
	BEGIN
		UPDATE RRHH SET cRHCargoCodTabla=@cRHCargoCodTabla, nRHEstado=@nRHEstado, cLocalAsig=@cLocalAsig,dFechaIngreso=CONVERT(DATE,@dFechaIngreso,103), dFechaCese=@dFechaCese,cUltimaActualizacion=@cUltimaActualizacion WHERE cPersCod=@cPersCod
		INSERT INTO RHCargos(cPersCod,cRHCargoCodTabla,cLocalAsig,cUltimaActualizacion)
		VALUES (@cPersCod,@cRHCargoCodTabla,@cLocalAsig,@cUltimaActualizacion)
	END
  ELSE
	BEGIN
		IF EXISTS(SELECT * FROM RRHH WHERE cUser=@cUser)
			BEGIN
				SELECT  Resultado='3'
			END
		ELSE
			BEGIN
				DECLARE
				--@nRHEstado INT = 101,
				@cRHCod VARCHAR(6),
				@cClave VARCHAR(20)='123456',
				@cSerie VARCHAR(2), @nNro INT, @cNro VARCHAR(3)
				SET @cSerie='RH'
				SET @nNro = ISNULL((   SELECT MAX(d.cRHCod) 
											FROM (SELECT MAX(RIGHT(R.cRHCod,3))  cRHCod FROM
											RRHH R 							
											 ) d),0) + 1
				SET @cNro = RIGHT('000'+convert(varchar(Max),@nNro),3)
				SET @cRHCod =@cSerie+@cNro

				INSERT INTO RRHH(cRHCod,cPersCod,cRHCargoCodTabla,nRHEstado,cUser,cClave,cLocalAsig,dFechaIngreso,dFechaCese,cUltimaActualizacion)
				VALUES (@cRHCod,@cPersCod,@cRHCargoCodTabla,@nRHEstado,@cUser,@cClave,@cLocalAsig,@dFechaIngreso,@dFechaCese,@cUltimaActualizacion)

				INSERT INTO RHCargos(cPersCod,cRHCargoCodTabla,cLocalAsig,cUltimaActualizacion)
				VALUES (@cPersCod,@cRHCargoCodTabla,@cLocalAsig,@cUltimaActualizacion)
			END
	END
	SELECT  Resultado='1'					
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END 
GO


CREATE PROCEDURE stp_sel_MostrarTrabajador
AS
BEGIN
	SELECT P.cPersCod,(P.cPersIDnro+ ' - ' + P.cPersNombre) AS cPersNombre,RT.cRHCargoDescripcion,LO.cLocDescripcion,RH.cUser,
	CONVERT(VArchar(20),RH.dFechaIngreso,103) dFechaIngreso,CONVERT(VArchar(20),RH.dFechaCese,103) dFechaCese, RH.nRHEstado  
	FROM Persona P INNER JOIN RRHH RH ON RH.cPersCod=P.cPersCod INNER JOIN RHCargosTabla RT ON RT.cRHCargoCodTabla=RH.cRHCargoCodTabla
	INNER JOIN Locales LO ON LO.cLocCod=RH.cLocalAsig
	WHERE P.nPersPersoneria=1  AND nTrabajador=1
END		
GO



CREATE PROCEDURE stp_sel_BuscarPersonasGeneral
@nTipoBusqueda INT,
@cValor VARCHAR(50)
AS
BEGIN
	IF  @nTipoBusqueda=1
		BEGIN
		SELECT  PER.cPersCod, PER.cPersNombre,PER.dPersNac,  CASE WHEN PER.nPersPersoneria=1 THEN 'PERSONA NATURAL' ELSE 'PESONA JURÍDICA' END cPersPersoneria,
		PER.cPersEmail,PER.cPersCelular+' / '+PER.cPersCelular2 AS cPersCelular,PER.cPersIDnro
		FROM Persona PER WHERE PER.cPersNombre LIKE  @cValor + '%'  
		END
	ELSE IF @nTipoBusqueda=2
		BEGIN
		SELECT  PER.cPersCod, PER.cPersNombre,PER.dPersNac,  CASE WHEN PER.nPersPersoneria=1 THEN 'PERSONA NATURAL' ELSE 'PESONA JURÍDICA' END cPersPersoneria,
		PER.cPersEmail,PER.cPersCelular+' / '+PER.cPersCelular2 AS cPersCelular,PER.cPersIDnro
		FROM Persona PER WHERE PER.cPersCod = @cValor 
		END
	ELSE
	BEGIN
		SELECT  PER.cPersCod, PER.cPersNombre,PER.dPersNac,  CASE WHEN PER.nPersPersoneria=1 THEN 'PERSONA NATURAL' ELSE 'PESONA JURÍDICA' END cPersPersoneria,
		PER.cPersEmail,PER.cPersCelular+' / '+PER.cPersCelular2 AS cPersCelular,PER.cPersIDnro
		FROM Persona PER WHERE PER.cPersIDnro like @cValor 

	END	    		
END
GO

CREATE PROCEDURE stp_sel_ConstanteSistema
 @nConsSisCod INT  
AS  
BEGIN  
 SELECT CS.nConsSisCod,CS.cConsSisValor 
 FROM ConstSistema CS  
 WHERE CS.nConsSisCod=@nConsSisCod  
END
GO

CREATE PROCEDURE stp_sel_MostrarCargosTabla
@nTipoListado INT
AS
BEGIN
IF @nTipoListado =1
    BEGIN
	SELECT cRHCargoCodTabla,cRHCargoDescripcion,nRHCargoSueldoMinimo,nRHCargoSueldoMaximo, CONVERT(VARCHAR(10),CONVERT(DATE,LEFT(cUltimaActualizacion,8),103),103) cUltimaActualizacion
	FROM RHCargosTabla
	END
END
GO

CREATE PROCEDURE stp_sel_MostrarLocales
@nTipoListado INT
AS
BEGIN
  IF @nTipoListado=1
	BEGIN
		SELECT cLocCod,UPPER(cLocDescripcion) cLocDescripcion,UPPER(cLocDireccion) cLocDireccion,cLocTelefono,
		CONVERT(VARCHAR(10),CONVERT(DATE, LEFT(cUltimaActualizacion,8),103),103) cUltimaActualizacion,
		RIGHT(cUltimaActualizacion,4) cUsuario,
		CASE WHEN nEstado=1 THEN 'ACTIVO' ELSE 'INACTIVO' END cEstado
		FROM Locales
	END
  ELSE
	BEGIN
		SELECT cLocCod,UPPER(cLocDescripcion) cLocDescripcion,UPPER(cLocDireccion) cLocDireccion,cLocTelefono,
		CONVERT(VARCHAR(10),CONVERT(DATE, LEFT(cUltimaActualizacion,8),103),103) cUltimaActualizacion,
		RIGHT(cUltimaActualizacion,4) cUsuario, (nEstado) cEstado
		FROM Locales WHERE nEstado=1
	END
END
GO

CREATE PROCEDURE stp_sel_MostrarPersonas
@nTipoListado INT
AS
BEGIN
  IF @nTipoListado=1 --LISTADO DE PERSONAS TODOS
	BEGIN	
	SELECT  PER.cPersCod, PER.cPersNombre,PER.dPersNac,  CASE WHEN PER.nPersPersoneria=1 THEN 'PERSONA NATURAL' ELSE 'PESONA JURÍDICA' END cPersPersoneria,
	PER.cPersEmail,PER.cPersCelular,PER.cPersCelular2,PER.cPersIDnro,nTrabajador
	FROM Persona PER
	END
  ELSE  IF @nTipoListado=2 --LISTADO DE TRABAJADORES 
	BEGIN
	SELECT P.cPersCod,(cPersIDnro+ ' - ' + P.cPersNombre) AS cPersNombre,P.dPersNac, '' cPersPersoneria,
	P.cPersEmail,P.cPersCelular,P.cPersCelular2,P.cPersIDnro,nTrabajador FROM 
	Persona P WHERE P.nPersPersoneria=1  AND nTrabajador=1 
	END	
  ELSE IF @nTipoListado=3 --LISTADO DE PROVEEDORES
	BEGIN
	SELECT P.cPersCod,(P.cPersIDnro+' - '+P.cPersNombre) AS cPersNombre,P.dPersNac, '' cPersPersoneria,
	P.cPersEmail,P.cPersCelular,P.cPersCelular2,P.cPersIDnro,nTrabajador FROM 
	Persona P WHERE P.nPersPersoneria=2 -- AND nTrabajador=1
	END	
  ELSE  IF @nTipoListado=4 --LISTADO DE USUARIOS
	BEGIN
	SELECT P.cPersCod,(RH.cUser+ ' - ' + P.cPersNombre) AS cPersNombre,P.dPersNac, '' cPersPersoneria,
	P.cPersEmail,P.cPersCelular,P.cPersCelular2,P.cPersIDnro,nTrabajador FROM 
	Persona P INNER JOIN RRHH RH ON RH.cPersCod=P.cPersCod 
	WHERE P.nPersPersoneria=1  AND nTrabajador=1
	END
END
GO

CREATE PROCEDURE stp_sel_ObtenerMenuUser
@cUser VARCHAR(4) 
AS
BEGIN
	SELECT m.cMenuId, m.cMenuPadre, m.cTitulo, m.cDescripcion, m.cUrl, m.cIcono, m.nPosicion, m.bEstado  
	FROM Menu m
	INNER JOIN Roles r ON m.cMenuId = r.cMenuId
	WHERE r.cUser = @cUser and m.bEstado = 1 and r.bEstado = 1
	GROUP BY m.cMenuId, m.cMenuPadre, m.cTitulo, m.cDescripcion, m.cUrl, m.cIcono,
	m.nPosicion, m.bEstado  ORDER BY  m.nPosicion asc
END
GO

ALTER PROCEDURE stp_ins_HabilitarOpcionesMenu
@cPersCod VARCHAR(13),
@cMenuId VARCHAR(4),
@nEstado INT
AS
BEGIN
BEGIN TRY
DECLARE @cUser VARCHAR(4)
SET @cUser = (SELECT cUser FROM RRHH WHERE cPersCod=@cPersCod)

IF  EXISTS(SELECT * FROM Roles WHERE cMenuId=@cMenuId AND cUser=@cUser)
	BEGIN
		--UPDATE Menu SET bEstado=@nEstado  WHERE (cMenuId =@cMenuId)
		UPDATE Roles SET  bEstado=@nEstado  WHERE (cMenuId =@cMenuId)
		--UPDATE Menu SET bEstado = 1     
		--WHERE cMenuId IN (SELECT valor FROM fnc_getTblValoresTexto(@cMenuId)) AND (cMenuId IS NULL)   
		SELECT  Resultado='1'	 
	END
ELSE
	BEGIN
		INSERT INTO Roles (cUser,cMenuId,bEstado) VALUES (@cUser,@cMenuId,@nEstado)
		SELECT  Resultado='1'	
	END			
END TRY
BEGIN CATCH
SELECT Resultado='0' 
SELECT ERROR_NUMBER() AS errNumber
      ,ERROR_SEVERITY() AS errSeverity
      ,ERROR_STATE() AS errState
      ,ERROR_PROCEDURE() AS errProcedure
      ,ERROR_LINE() AS errLine
      ,ERROR_MESSAGE() AS errMessage
END CATCH
END
GO

ALTER PROCEDURE stp_sel_SeleccionarOperacionMenu '0120190924001'
@cPersCod VARCHAR(13)
AS
BEGIN
DECLARE @cUser VARCHAR(4)
SET @cUser = (SELECT cUser FROM RRHH WHERE cPersCod=@cPersCod)
SELECT DISTINCT M.cMenuId,M.cMenuPadre,M.cDescripcion,M.cIcono,M.nPosicion,M.cUrl, ISNULL(R.Checked,0) AS nEstado
,TipoPermiso = ( 
CASE WHEN R.TipoPermiso IS NULL THEN 0
ELSE (( 
CASE WHEN R.TipoPermiso=1 THEN R.TipoPermiso
ELSE (
CASE WHEN R.TipoPermiso=2 AND (SELECT COUNT(*) FROM Roles WHERE cUser=@cUser AND cMenuId=M.cMenuId )<>0 THEN 1 ELSE 2 END)END))END)
FROM Menu M LEFT JOIN (SELECT DISTINCT cUser,cMenuId, 1 AS Checked, TipoPermiso=( CASE cUser WHEN @cUser THEN 1 ELSE 2 END )
FROM Roles  WHERE cUser=@cUser AND bEstado=1 ) R ON R.cMenuId=M.cMenuId WHERE M.bEstado=1
ORDER BY M.nPosicion   
END
GO



--SELECT * FROM Mov
--SELECT * FROM Servicios
--SELECT * FROM MovOpeServicios
--SELECT * FROM MovOpeServiciosDet
--SELECT * FROM OpeTpo
--SELECT * FROM ProductoConcepto
--SELECT * FROM DOCUMENTO
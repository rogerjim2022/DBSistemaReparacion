USE DBRodricel
GO

CREATE TABLE Locales(
cLocCod VARCHAR(2) NOT NULL,
cLocDescripcion VARCHAR(40) NOT NULL,
cLocDireccion VARCHAR(100) NOT NULL,
cLocTelefono VARCHAR(20) NULL,
nEstado INT NULL,
cUltimaActualizacion  VARCHAR(25) NOT NULL
) 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de los Locales', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'cLocCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o descripción del Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'cLocDescripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dirección Legal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'cLocDireccion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Número(s) Telefónico(s)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'cLocTelefono'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de estado (0: Inactivo / 1:Activo)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'nEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Info de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Locales', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE Persona(
	cPersCod VARCHAR(13) NOT NULL,
	cPersNombre VARCHAR(200) NOT NULL,
	dPersNac VARCHAR(11) NULL,
	nPersPersoneria INT NOT NULL,
	cPersEmail VARCHAR(100) NULL,
	cPersCelular VARCHAR(100) NULL,
	cPersCelular2 VARCHAR(100) NULL,
	cPersIDnro VARCHAR(50) NOT NULL,
	nPersIDTpo INT NOT NULL,
	nTrabajador INT NOT NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de los Personas', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersNombre'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de nacimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'dPersNac'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de personería' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'nPersPersoneria'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Correo electrónico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersEmail'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N° de teléfono móvil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersCelular'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N° de teléfono móvil' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersCelular2'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'N° de documento de identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cPersIDnro'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de documento de identidad' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'nPersIDTpo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Identifica 1-Trabajador, 0-No Trabajador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'nTrabajador'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Persona', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE RHCargos(
	cRHCargoCod  INT IDENTITY(1,1) NOT NULL,
	cPersCod VARCHAR(13) NOT NULL,
	cRHCargoCodTabla  VARCHAR(6) NOT NULL,
	cLocalAsig VARCHAR(2) NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de los Cargos asignado al Trabajador', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de cargo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos', @level2type=N'COLUMN',@level2name=N'cRHCargoCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos', @level2type=N'COLUMN',@level2name=N'cPersCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de cargo oficial' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos', @level2type=N'COLUMN',@level2name=N'cRHCargoCodTabla'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos', @level2type=N'COLUMN',@level2name=N'cLocalAsig'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargos', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE RHCargosTabla(
	cRHCargoCodTabla VARCHAR(6) NOT NULL,
	cRHCargoDescripcion VARCHAR(60) NOT NULL,
	nRHCargoSueldoMinimo MONEY NOT NULL,
	nRHCargoSueldoMaximo MONEY NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de los Cargos Registrados', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del cargo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla', @level2type=N'COLUMN',@level2name=N'cRHCargoCodTabla'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre o descripción' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla', @level2type=N'COLUMN',@level2name=N'cRHCargoDescripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto del sueldo mínimo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla', @level2type=N'COLUMN',@level2name=N'nRHCargoSueldoMinimo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Monto del sueldo máximo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla', @level2type=N'COLUMN',@level2name=N'nRHCargoSueldoMaximo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RHCargosTabla', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE  RRHH(
cRHCod VARCHAR(6) NOT NULL,
cPersCod VARCHAR(13) NOT NULL,
cRHCargoCodTabla VARCHAR(6) NOT NULL,
nRHEstado INT NOT NULL,
cUser CHAR(4) NULL,
cClave VARCHAR(20) NULL,
cLocalAsig VARCHAR(2) NULL,
dFechaIngreso DATE NULL,
dFechaCese DATE NULL,
cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de los Trabajadores', @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de recursos humanos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cRHCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de persona' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cPersCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del cargo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cRHCargoCodTabla'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de personal' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'nRHEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre de usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cUser'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N' Clave del usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cClave'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de área asignado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cLocalAsig'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ingreso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'dFechaIngreso'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de cese' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'dFechaCese'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RRHH', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE Menu(
cMenuId VARCHAR(10) NOT NULL,
cMenuPadre VARCHAR(10) NOT NULL,
cTitulo VARCHAR(100) NOT NULL,
cDescripcion VARCHAR(100) NOT NULL,
cUrl VARCHAR(200) NOT NULL,
cIcono VARCHAR(50) NOT NULL,
nPosicion INT NOT NULL,
bEstado BIT NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda informacion del menu que se mostrara en el sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cMenuId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del ID padre a la que pertenece el item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cMenuPadre'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Titulo del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cTitulo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cDescripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Direccion url del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cUrl'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Icono del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'cIcono'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Posicion del item del menu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'nPosicion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Host donde se realizo el registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Menu', @level2type=N'COLUMN',@level2name=N'bEstado'
GO

CREATE TABLE Roles(
cUser VARCHAR(4) NOT NULL,
cMenuId VARCHAR(10) NOT NULL,
bEstado BIT NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda la informacion de la relacion de items del menu a la que tiene acceso el usuario logueado' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'cUser'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del menu a la que se tiene permiso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'cMenuId'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del permiso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Roles', @level2type=N'COLUMN',@level2name=N'bEstado'
GO

CREATE TABLE Mov
(
nMovNro INT IDENTITY(1, 1) NOT NULL,
cMovNro VARCHAR(25) NOT NULL,
cOpeCod VARCHAR(6) NOT NULL,
cMovDesc VARCHAR(255) NOT NULL,
nMovFlag INT NOT NULL,
cHostMov SYSNAME NULL DEFAULT HOST_NAME(),
cUserDBMov SYSNAME NULL DEFAULT SUSER_SNAME(),
cAppMov SYSNAME NULL DEFAULT APP_NAME()
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Guarda informacion de los movimientos de realizados en el sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nuevo movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'nMovNro'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha/Hora/Agencia/Usuario del movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cMovNro'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del operacion del movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cOpeCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion del movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cMovDesc'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Situacion actual del movimiento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'nMovFlag'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del equipo donde se realizo el registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cHostMov'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Usuario de Base de Datos que realizo el registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cUserDBMov'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Aplicacion desde se realizo el registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mov', @level2type=N'COLUMN',@level2name=N'cAppMov'
GO

CREATE TABLE Constante
(
nConsCod INT NOT NULL,
nConsValor VARCHAR(6) NOT NULL,
cConsDescripcion VARCHAR(255) NOT NULL,
bEstado BIT NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Registro de las constantes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Constante'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo de la constante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Constante', @level2type=N'COLUMN',@level2name=N'nConsCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor de la constante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Constante', @level2type=N'COLUMN',@level2name=N'nConsValor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripcion de la constante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Constante', @level2type=N'COLUMN',@level2name=N'cConsDescripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado de la constante' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Constante', @level2type=N'COLUMN',@level2name=N'bEstado'
GO

CREATE TABLE ConstSistema
(
nConsSisCod INT ,
cConsSisDesc VARCHAR(150),
cConsSisValor VARCHAR(500),
cUltimaActualizacion VARCHAR(25)
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de constante del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConstSistema', @level2type=N'COLUMN',@level2name=N'nConsSisCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la constante del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConstSistema', @level2type=N'COLUMN',@level2name=N'cConsSisDesc'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Valor de la constante del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConstSistema', @level2type=N'COLUMN',@level2name=N'cConsSisValor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Última  de actualización del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConstSistema', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena datos de las constantes del sistema' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ConstSistema'
GO
--CREATE TABLE Log_ErrorAplicacionWeb(
--	nId int  IDENTITY(1,1) NOT NULL,
--	cProceso varchar (500) NULL,
--	cErrNumber varchar (50) NULL,
--	cErrDescription varchar (500) NULL,
--	cErrSource varchar(max) NULL,
--	dErrFecha datetime NULL
--) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id Log' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'nId'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del proceso' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'cProceso'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Numero Error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'cErrNumber'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción Error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'cErrDescription'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado Error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'cErrSource'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha Error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb', @level2type=N'COLUMN',@level2name=N'dErrFecha'
--GO
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tabla Log de Errores Aplicaciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Log_ErrorAplicacionWeb'
--GO
CREATE TABLE DescripcionEquipo
(
nDescEquipo INT NULL,
nBateria INT NULL,
nTapa INT NULL,
nChip INT NULL,
nMemoria INT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Id Descripcion del Equipo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DescripcionEquipo', @level2type=N'COLUMN',@level2name=N'nDescEquipo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 Tiene Bateria, 0 No tiene' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DescripcionEquipo', @level2type=N'COLUMN',@level2name=N'nBateria'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 Tiene Tapa, 0 No tiene' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DescripcionEquipo', @level2type=N'COLUMN',@level2name=N'nTapa'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 Tiene Chip, 0 No tiene' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DescripcionEquipo', @level2type=N'COLUMN',@level2name=N'nChip'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 Tiene Memoria, 0 No tiene' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'DescripcionEquipo', @level2type=N'COLUMN',@level2name=N'nMemoria'
GO

CREATE TABLE Servicios
(
cServCod VARCHAR(13) NOT NULL,
--cPersCod VARCHAR(13) NOT NULL,
nTipoDoc VARCHAR(2) NULL,
cDescDoc VARCHAR(10) NULL,
nTipoComp VARCHAR(2) NULL,
cDescComp VARCHAR(20) NULL,
nCorrelativo VARCHAR(8) NULL,
nProducto INT NOT NULL,
nMarca INT NOT NULL,
nModelo INT NOT NULL,
nColor INT NOT NULL,
nImei INT NULL,
nPin INT NULL,
nDescEquipo INT NULL,
cCapacidad VARCHAR(MAX) NULL,
cDiagnostico VARCHAR(MAX) NULL,
nCosto MONEY NOT NULL,
nAdelanto MONEY NOT NULL,
nSaldo MONEY NOT NULL,
nEstado INT NOT NULL
)
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena datos de los Servicios' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'cServCod'
--EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Cliente' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'cPersCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de Producto, 1 Celular, 2 Tablet, 3 Otros' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nProducto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marcar del producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nMarca'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelo del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nModelo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Color del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nColor'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Imei del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nImei'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Pin del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nPin'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código Descrición del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nDescEquipo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Capacidad del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'cCapacidad'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Diagnostico del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'cDiagnostico'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Costo del Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nCosto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Adelanto del Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nAdelanto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Saldo del Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nSaldo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado del Servicio' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Servicios', @level2type=N'COLUMN',@level2name=N'nEstado'
GO

CREATE TABLE MovServicios(
nMovNro INT NOT NULL,
cOpeCod VARCHAR(6) NOT NULL,
nMonto MONEY NULL,
nSaldo MONEY NULL,
nMoneda INT NOT NULL,
cCtaCod VARCHAR(18) NULL,
cReferencia VARCHAR(302) NULL
) 
GO


CREATE TABLE OpeTpo(
	cOpeCod VARCHAR(6) NOT NULL,
	cOpeDesc VARCHAR(120) NOT NULL,
	bEstado BIT NOT NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de operación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpeTpo', @level2type=N'COLUMN',@level2name=N'cOpeCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción de la operación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpeTpo', @level2type=N'COLUMN',@level2name=N'cOpeDesc'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Activo o Inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpeTpo', @level2type=N'COLUMN',@level2name=N'bEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpeTpo', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maestro de operaciones' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'OpeTpo'
GO

CREATE TABLE ProductoConcepto(
nPrdConceptoCod INT NOT NULL,
cDescripcion VARCHAR(250) NOT NULL,
bEstado BIT NOT NULL,
cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de concepto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoConcepto', @level2type=N'COLUMN',@level2name=N'nPrdConceptoCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del concepto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoConcepto', @level2type=N'COLUMN',@level2name=N'cDescripcion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Activo o Inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoConcepto', @level2type=N'COLUMN',@level2name=N'bEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoConcepto', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Almacena los parámetros definidos para los conceptos de los productos de Servicios y Ventas' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoConcepto'
GO


--CREATE TABLE MovOpeServiciosDet(
--nMovNro INT NOT NULL,
--cOpeCod VARCHAR(6) NOT NULL,
--cCtaCod VARCHAR(18) NOT NULL,
--cCodigoJoyaAdjud VARCHAR(14) NOT NULL,
--nConcepto INT NOT NULL,
--nMontoImporte MONEY NULL
--) 
--GO
--CREATE TABLE MovOpeVentas(
--nMovNro INT NOT NULL,
--cOpeCod VARCHAR(6) NOT NULL,
--nMontoImporte MONEY NULL,
--nMoneda INT NOT NULL,
--cCtaCod VARCHAR(18) NULL,
--cReferencia VARCHAR(302) NULL
--) 
--GO
--CREATE TABLE MovOpeVentasDet(
--nMovNro INT NOT NULL,
--cOpeCod VARCHAR(6) NOT NULL,
--cCtaCod VARCHAR(18) NOT NULL,
--cCodigoJoyaAdjud VARCHAR(14) NOT NULL,
--nConcepto INT NOT NULL,
--nMontoImporte MONEY NULL
--) 
--GO
--CREATE TABLE FactElect(
--	nMovNro INT NOT NULL,
--	cCtaCod VARCHAR(18) NOT NULL,
--	cPersCod VARCHAR(18) NULL,
--	nTipoDoc VARCHAR(2) NULL,
--	cDescDoc VARCHAR(10) NULL,
--	nTipoComp VARCHAR(2) NULL,
--	cDescComp VARCHAR(20) NULL,
--	cSerie VARCHAR(5) NULL,
--	nCorrelativo VARCHAR(8) NULL,
--	dFechaPago DATE NULL,
--	bEstado BIT NOT NULL
--)
--GO
--CREATE TABLE SerieVenta(
--	nIdCorrelativo INT IDENTITY(1,1) NOT NULL,
--	cSerie VARCHAR(5) NOT NULL,
--	cLocCod VARCHAR(2) NOT NULL,
--	cUltimaActualizacion VARCHAR(25) NOT NULL,
--	bEstado BIT NOT NULL
--) 
--GO

CREATE TABLE Producto(
	cProdCod VARCHAR(6) NOT NULL,
	nTipoProducto INT NOT NULL,
	cNombreProducto VARCHAR(MAX) NOT NULL,
	cModelo VARCHAR(200) NOT NULL,
	nStockActual INT NOT NULL,
	cPersCodProv VARCHAR(13) NOT NULL,
	nPrecioCompra MONEY NOT NULL,
	nPrecioVenta MONEY NOT NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'cProdCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'nTipoProducto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'cNombreProducto'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelol del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'cModelo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'nStockActual del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'nStockActual'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Codigo del Proveedor' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'cPersCodProv'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de Compra del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'nPrecioCompra'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Precio de Venta del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'nPrecioVenta'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Producto', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE ProductoDetalle(
	cProductoCod VARCHAR(6) NOT NULL,
	cLocCod VARCHAR(2) NOT NULL,
	nEntrada INT NOT NULL,
	nSalida INT NOT NULL,
	nSaldo INT NOT NULL,
	cUltimaActualizacion VARCHAR(25) NOT NULL
)
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'cProductoCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código del Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'cLocCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de producto que ingresa al Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'nEntrada'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de producto que sale del Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'nSalida'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cantidad de Producto que se encuentra actualmente en el Local' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'nSaldo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ProductoDetalle', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE Marca(
cMarcaCod VARCHAR(10) NOT NULL,
cMarca VARCHAR(200) NOT NULL,
bEstado BIT NOT NULL,
cUltimaActualizacion VARCHAR(25) NOT NULL
) 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marca', @level2type=N'COLUMN',@level2name=N'cMarcaCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Marca Celular' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marca', @level2type=N'COLUMN',@level2name=N'cMarca'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado 1 Activo-0 Inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marca', @level2type=N'COLUMN',@level2name=N'bEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Marca', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE MarcaModelo(
cMarcaCod VARCHAR(10) NOT NULL,
cModeloCod VARCHAR(10) NOT NULL,
cModelo VARCHAR(200) NOT NULL,
bEstado BIT NOT NULL,
cUltimaActualizacion VARCHAR(25) NOT NULL
) 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Marca' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarcaModelo', @level2type=N'COLUMN',@level2name=N'cMarcaCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Código de Modelo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarcaModelo', @level2type=N'COLUMN',@level2name=N'cModeloCod'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Modelo Celular' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarcaModelo', @level2type=N'COLUMN',@level2name=N'cModelo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Estado 1 Activo-0 Inactivo' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarcaModelo', @level2type=N'COLUMN',@level2name=N'bEstado'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última modificación' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'MarcaModelo', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
GO

CREATE TABLE Documento(
nDocTpo INT NOT NULL,
cDocDesc VARCHAR(40) NOT NULL,
cDocAbrev VARCHAR(3) NOT NULL,
cUltimaActualizacion VARCHAR(25) NOT NULL,
) 
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Tipo de documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documento', @level2type=N'COLUMN',@level2name=N'nDocTpo'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Descripción del documento' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documento', @level2type=N'COLUMN',@level2name=N'cDocDesc'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Abrevitaura' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documento', @level2type=N'COLUMN',@level2name=N'cDocAbrev'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Datos de última actualización' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documento', @level2type=N'COLUMN',@level2name=N'cUltimaActualizacion'
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Maestro de documentos' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Documento'
GO



--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (100000,'ORDEN DE SERVICIO - REGISTRO',1,'201909291649291000100JIPR')
--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (100001,'ORDEN DE SERVICIO - ASIGNACIÓN',1,'201909291649291000100JIPR')
--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (100002,'ORDEN DE SERVICIO - FINALIZADO',1,'201909291649291000100JIPR')
--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (100003,'ORDEN DE SERVICIO - CANCELACIÓN',1,'201909291649291000100JIPR')
--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (100004,'ORDEN DE SERVICIO - GARANTÍA',1,'201909291649291000100JIPR')
--INSERT INTO OpeTpo (cOpeCod, cOpeDesc,bEstado,cUltimaActualizacion) VALUES (200000,'VENTA DE PRODUCTO',1,'201909291649291000100JIPR')

--INSERT INTO ProductoConcepto (nPrdConceptoCod,cDescripcion,bEstado,cUltimaActualizacion) VALUES (10,'Adelanto de Servicio',1,'201909291649291000100JIPR')
--INSERT INTO ProductoConcepto (nPrdConceptoCod,cDescripcion,bEstado,cUltimaActualizacion) VALUES (11,'Cancelación de Servicio',1,'201909291649291000100JIPR')


--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (100, N'1', N'DNI', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (100, N'2', N'RUC', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (100, N'3', N'CARNET DE EXTRANJERIA', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (100, N'100', N'TIPO DE DOCUMENTO DE IDENTIDAD', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (101, N'1', N'PERSONA NATURAL', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (101, N'2', N'PERSONA JURIDICA', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (101, N'101', N'TIPO DE PERSONERÍA', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (102, N'101', N'ACTIVO', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (102, N'201', N'VACACIONES', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (102, N'301', N'LIQUIDACIÓN POR DESPIDO', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (102, N'402', N'LIQUIDACIÓN POR RENUNCIA', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (102, N'102', N'TIPO DE ESTADO TRABAJADOR', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (103, N'1', N'CELULAR', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (103, N'2', N'TABLET', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (103, N'3', N'OTROS', 1)
--INSERT Constante ([nConsCod], [nConsValor], [cConsDescripcion], [bEstado]) VALUES (103, N'103', N'TIPO DE PRODUCTO SERVICIO', 1)
--INSERT Documento (nDocTpo,cDocDesc,cDocAbrev,cUltimaActualizacion) VALUES (1,'FACTURA','FAC','201909291649291000100JIPR')
--INSERT Documento (nDocTpo,cDocDesc,cDocAbrev,cUltimaActualizacion) VALUES (2,'RECIBO POR HONORARIOS','RHP','201909291649291000100JIPR')
--INSERT Documento (nDocTpo,cDocDesc,cDocAbrev,cUltimaActualizacion) VALUES (3,'BOLETA DE VENTA','BV','201909291649291000100JIPR')
--INSERT Documento (nDocTpo,cDocDesc,cDocAbrev,cUltimaActualizacion) VALUES (4,'COMPROBANTE DE PAGO','CP','201909291649291000100JIPR')
--INSERT Documento (nDocTpo,cDocDesc,cDocAbrev,cUltimaActualizacion) VALUES (5,'ORDEN DE SERVICIO','OS','201909291649291000100JIPR')

--INSERT [dbo].[ConstSistema] ([nConsSisCod], [cConsSisDesc], [cConsSisValor], [cUltimaActualizacion]) VALUES (1, N'Fecha del Sistema', N'01/10/2019', N'200701101226311090100JIPR')
--INSERT [dbo].[Locales] ([cLocCod], [cLocDescripcion], [cLocDireccion], [cLocTelefono], [nEstado], [cUltimaActualizacion]) VALUES (N'01', N'loca venexue', N'cebvcbwnecwe', N'9888889', 1, N'201909291649291000100JIPR')
--INSERT [dbo].[Locales] ([cLocCod], [cLocDescripcion], [cLocDireccion], [cLocTelefono], [nEstado], [cUltimaActualizacion]) VALUES (N'02', N'LOCAL HUALLGA', N'HUALLAGA 453', N'989995', 1, N'201910011126031000100JIPR')
--INSERT [dbo].[Locales] ([cLocCod], [cLocDescripcion], [cLocDireccion], [cLocTelefono], [nEstado], [cUltimaActualizacion]) VALUES (N'03', N'LOCAL HUALLGA', N'HUALLAGA 453', N'999', 1, N'201909291633391000100JIPR')
--INSERT [dbo].[Locales] ([cLocCod], [cLocDescripcion], [cLocDireccion], [cLocTelefono], [nEstado], [cUltimaActualizacion]) VALUES (N'04', N'LOCAL MORONA', N'MORONA 3434', N'987', 0, N'201909291806291000100JIPR')
--INSERT [dbo].[Locales] ([cLocCod], [cLocDescripcion], [cLocDireccion], [cLocTelefono], [nEstado], [cUltimaActualizacion]) VALUES (N'05', N'local bolognesi', N'bolognesi 323', N'786786', 1, N'201909291645531000100JIPR')

--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'1', N'1', N'Inicio', N'Menu Principal', N'Home/Index', N'entypo-home', 1000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'2', N'2', N'Locales', N'Módulo de Mantenimiento de locales', N'', N'entypo-picture', 2000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'3', N'2', N'Registrar Local', N'Opción para agregar locales', N'Local/RegistroLocal', N'entypo-plus-squared', 2001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'4', N'4', N'Persona', N'Módulo de Mantenimiento de Persona', N'', N'entypo-user', 3000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'5', N'4', N'Registrar Persona', N'Opción para registrar personas', N'Persona/RegistroPersona', N'entypo-user-add', 3001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'6', N'6', N'Recursos Humanos', N'Módulo de configuraciones de RRHH', N'', N'entypo-users', 4000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'7', N'6', N'Registrar Cargos', N'Opción para registrar cargos', N'RRHH/CargosTabla', N'entypo-suitcase', 4001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'8', N'6', N'Registrar Trabajador', N'Opción para registrar trabajadores', N'RRHH/Trabajador', N'entypo-user-add', 4002, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'9', N'9', N'Producto', N'Módulo de Mantenimiento de Producto', N'', N'entypo-box', 5000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'10', N'9', N'Registrar Marcar y Modelo', N'Opción para registrar los modelos y marcas de los celulares', N'Producto/MarcaModelo', N'entypo-ticket', 5001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'11', N'9', N'Registrar Producto', N'Opción para registrar productos', N'Producto/RegistroProducto', N'entypo-archive', 5002, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'12', N'12', N'Ventas', N'Ventas', N'', N'entypo-basket', 6000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'13', N'12', N'Venta de Productos', N'Ventas de Productos', N'Ventas/VentaProducto', N'entypo-credit-card', 6001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'14', N'14', N'Servicios', N'Servicios de Reparación', N'', N'entypo-mobile', 7000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'15', N'14', N'Registro de Servicio', N'Permite registrar el servicio', N'Servicio/RegistroServicio', N'entypo-newspaper', 7001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'16', N'14', N'Servicio Asignado', N'Permite atender el servicio asignado', N'Servicio/ServicioAsignado', N'entypo-login', 7002, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'17', N'14', N'Finalizar Servicio', N'Permite finalizar el servicio', N'Servicio/ServicioFinalizado', N'entypo-logout', 7003, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'18', N'14', N'Garantía', N'Gestionar la garantía del servicio', N'Servicio/ServicioGarantia', N'entypo-tag', 7004, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'19', N'19', N'Reportes', N'Reportes para toma de decisiones', N'', N'entypo-chart-pie', 8000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'20', N'19', N'Reportes Generales', N'Reportes', N'Reportes/ReporteGeneral', N'entypo-chart-line', 8001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'21', N'21', N'Configuración', N'Módulo de configuraciones generales', N'', N'entypo-cog', 9000, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'22', N'21', N'Menús', N'Permiso de opciones al usuairo', N'Configuracion/Menus', N'entypo-flow-cascade', 9001, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'23', N'21', N'Restablecer Contraseña', N'Permite restablecer contraseña del usuario', N'Configuracion/RestableceContrasena', N'entypo-lock', 9002, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'24', N'21', N'Cambiar Contraseña', N'Permite cambiar contraseña del usuario', N'Configuracion/CambiarContrasena', N'entypo-lock-open', 9003, 1)
--INSERT [dbo].[Menu] ([cMenuId], [cMenuPadre], [cTitulo], [cDescripcion], [cUrl], [cIcono], [nPosicion], [bEstado]) VALUES (N'25', N'21', N'Backup', N'Permite guardar una copia de respaldo de la información', N'Configuracion/Backup', N'entypo-lock-open', 9004, 1)

--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190924001', N'PADILLA/RENGIFO,ROGER JIM', N'25/09/1995', 1, N'padillaroger80@gmail.com', N'9989874   ', N'   ', N'73139280', 1, 1, N'201910010808381000100JIPR')
--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190924002', N'MORI/NUÑEZ,RODRIGO', N'15/08/1995', 1, N'rodrigo@gmail.com', N'456456 ', N' 564564t6', N'457678', 1, 1, N'201909291026291000100JIPR')
--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190929001', N'CUEVA/VASQUEZ,LUIS MIGUEL', N'12/09/2019', 1, N'luismiguel@gmail.com', N'978967867', N'97897897', N'9884545', 1, 0, N'201909291759221000100JIPR')
--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190929002', N'SERVICIOS GENERALES SOFT', N'09/10/2019', 2, N'servicios@gmail.com', N'9789789  ', N'  7897897', N'200923428', 2, 0, N'201909291029271000100JIPR')
--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190929003', N'EMPRESA DESARROLALDORES', N'18/09/2019', 2, N'emrpesa@gmail.com', N'', N'  ', N'20094234234', 2, 0, N'201909291026151000100JIPR')
--INSERT [dbo].[Persona] ([cPersCod], [cPersNombre], [dPersNac], [nPersPersoneria], [cPersEmail], [cPersCelular], [cPersCelular2], [cPersIDnro], [nPersIDTpo], [nTrabajador], [cUltimaActualizacion]) VALUES (N'0120190929004', N'ALMACEN SAC - EIRL O', N'22/10/2019', 2, N'almacen@gmail.com', N'9789789  ', N'  67867867', N'30123020344', 2, 0, N'201909291028091000100JIPR')

--INSERT [dbo].[RHCargos] ([cRHCargoCod], [cPersCod], [cRHCargoCodTabla], [cLocalAsig], [cUltimaActualizacion]) VALUES (1, N'0120190924001', N'CG001', N'02', N'201909291447511000100JIPR')

--INSERT [dbo].[RHCargosTabla] ([cRHCargoCodTabla], [cRHCargoDescripcion], [nRHCargoSueldoMinimo], [nRHCargoSueldoMaximo], [cUltimaActualizacion]) VALUES (N'CG001', N'GERENTE GENERAL', 3000.0000, 5000.0000, N'201909241013381000100JIPR')
--INSERT [dbo].[RHCargosTabla] ([cRHCargoCodTabla], [cRHCargoDescripcion], [nRHCargoSueldoMinimo], [nRHCargoSueldoMaximo], [cUltimaActualizacion]) VALUES (N'CG002', N'TÉCNICO EN REPARACIONES', 930.0000, 1200.0000, N'201912010000000000000LUWO')
--INSERT [dbo].[RHCargosTabla] ([cRHCargoCodTabla], [cRHCargoDescripcion], [nRHCargoSueldoMinimo], [nRHCargoSueldoMaximo], [cUltimaActualizacion]) VALUES (N'CG003', N'DELIVERY DE REPUESTOS', 930.0000, 1000.0000, N'201910011148431000100JIPR')
--INSERT [dbo].[RHCargosTabla] ([cRHCargoCodTabla], [cRHCargoDescripcion], [nRHCargoSueldoMinimo], [nRHCargoSueldoMaximo], [cUltimaActualizacion]) VALUES (N'CG004', N'VENDEDOR', 700.0000, 800.0000, N'201910011150471000100JIPR')

--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'1', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'2', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'3', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'4', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'5', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'6', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'7', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'8', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'9', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'10', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'11', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'12', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'13', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'14', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'15', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'16', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'17', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'18', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'19', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'20', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'21', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'22', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'23', 1)
--INSERT [dbo].[Roles] ([cUser], [cMenuId], [bEstado]) VALUES (N'JIPR', N'24', 1)
--INSERT [dbo].[RRHH] ([cRHCod], [cPersCod], [cRHCargoCodTabla], [nRHEstado], [cUser], [cClave], [cLocalAsig], [dFechaIngreso], [dFechaCese], [cUltimaActualizacion]) VALUES (N'RH001', N'0120190924001', N'CG001', 101, N'JIPR', N'123456', N'02', N'20190101', NULL, N'201909291447511000100JIPR')


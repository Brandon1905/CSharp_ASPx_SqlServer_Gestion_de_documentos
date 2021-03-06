USE [master]
GO
/****** Object:  Database [Manejo_registros]    Script Date: 03/10/2020 19:18:52 ******/
CREATE DATABASE [Manejo_registros]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Manejo_registros', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Manejo_registros.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Manejo_registros_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Manejo_registros_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Manejo_registros] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Manejo_registros].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Manejo_registros] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Manejo_registros] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Manejo_registros] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Manejo_registros] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Manejo_registros] SET ARITHABORT OFF 
GO
ALTER DATABASE [Manejo_registros] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Manejo_registros] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Manejo_registros] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Manejo_registros] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Manejo_registros] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Manejo_registros] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Manejo_registros] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Manejo_registros] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Manejo_registros] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Manejo_registros] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Manejo_registros] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Manejo_registros] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Manejo_registros] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Manejo_registros] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Manejo_registros] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Manejo_registros] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Manejo_registros] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Manejo_registros] SET RECOVERY FULL 
GO
ALTER DATABASE [Manejo_registros] SET  MULTI_USER 
GO
ALTER DATABASE [Manejo_registros] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Manejo_registros] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Manejo_registros] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Manejo_registros] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Manejo_registros] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Manejo_registros', N'ON'
GO
ALTER DATABASE [Manejo_registros] SET QUERY_STORE = OFF
GO
USE [Manejo_registros]
GO
/****** Object:  Table [dbo].[TCaso]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCaso](
	[Caso_id] [int] IDENTITY(1,1) NOT NULL,
	[Tramite_id] [int] NOT NULL,
	[Caso_codigo] [varchar](50) NULL,
	[Caso_fechaInicio] [date] NULL,
	[Caso_fechaFinal] [date] NULL,
	[Caso_estado] [varchar](1) NULL,
 CONSTRAINT [TCaso_PK] PRIMARY KEY CLUSTERED 
(
	[Caso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCiclo]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCiclo](
	[Ciclo_id] [int] IDENTITY(1,1) NOT NULL,
	[Tramite_id] [int] NOT NULL,
	[Departamento_id] [int] NOT NULL,
	[Ciclo_orden] [varchar](50) NULL,
	[Ciclo_estado] [varchar](1) NULL,
 CONSTRAINT [TCiclo_PK] PRIMARY KEY CLUSTERED 
(
	[Ciclo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TCodigo]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCodigo](
	[Codigo_id] [int] IDENTITY(1,1) NOT NULL,
	[Organizacion_id] [int] NOT NULL,
	[Codigo_formato] [varchar](50) NULL,
	[Codigo_estado] [varchar](1) NULL,
 CONSTRAINT [TCodigo_PK] PRIMARY KEY CLUSTERED 
(
	[Codigo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDepartamento]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDepartamento](
	[Departamento_id] [int] IDENTITY(1,1) NOT NULL,
	[Organizacion_id] [int] NOT NULL,
	[Departamento_nombre] [varchar](50) NULL,
	[Departamento_tipo] [varchar](50) NULL,
	[Departamento_descripcion] [varchar](50) NULL,
	[Departamento_estado] [varchar](1) NULL,
 CONSTRAINT [TDepartamento_PK] PRIMARY KEY CLUSTERED 
(
	[Departamento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDetalleCaso]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDetalleCaso](
	[DetalleCaso_id] [int] IDENTITY(1,1) NOT NULL,
	[Caso_id] [int] NOT NULL,
	[Ciclo_id] [int] NOT NULL,
	[Documento_id] [int] NOT NULL,
	[DetalleCaso_fechaRecibido] [date] NULL,
	[DetalleCaso_fechaTranspaso] [date] NULL,
	[DetalleCaso_descripcion] [varchar](50) NULL,
	[DetalleCaso_estado] [varchar](1) NULL,
 CONSTRAINT [TDetalleCaso_PK] PRIMARY KEY CLUSTERED 
(
	[DetalleCaso_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TDocumento]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TDocumento](
	[Documento_id] [int] IDENTITY(1,1) NOT NULL,
	[Tramite_id] [int] NOT NULL,
	[Idioma_id] [int] NOT NULL,
	[Documento_nombre] [varchar](50) NULL,
	[Documento_ruta] [varchar](2083) NULL,
	[Documento_tipo] [varchar](50) NULL,
	[Documento_estado] [varchar](1) NULL,
 CONSTRAINT [TDocumento_PK] PRIMARY KEY CLUSTERED 
(
	[Documento_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TEmpleado]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TEmpleado](
	[Empleado_id] [int] IDENTITY(1,1) NOT NULL,
	[Departamento_id] [int] NOT NULL,
	[Empleado_nombre] [varchar](50) NULL,
	[Empleado_apellidos] [varchar](50) NULL,
	[Empleado_fechaNacimiento] [date] NULL,
	[Empleado_puesto] [varchar](50) NULL,
	[Empleado_genero] [varchar](50) NULL,
	[Empleado_estadoCivil] [varchar](50) NULL,
	[Empleado_fechaIngreso] [date] NULL,
	[Empleado_estado] [varchar](1) NULL,
 CONSTRAINT [TEmpleado_PK] PRIMARY KEY CLUSTERED 
(
	[Empleado_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TIdioma]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TIdioma](
	[Idioma_id] [int] IDENTITY(1,1) NOT NULL,
	[Idioma_nombre] [varchar](50) NULL,
	[Idioma_iniciales] [varchar](3) NULL,
	[Idioma_estado] [varchar](1) NULL,
 CONSTRAINT [TIdioma_PK] PRIMARY KEY CLUSTERED 
(
	[Idioma_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TLogin]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TLogin](
	[Login_id] [int] IDENTITY(1,1) NOT NULL,
	[Login_Usuario] [varchar](10) NULL,
	[Login_contraseña] [varchar](8) NULL,
	[Login_correoElectronico] [varchar](50) NULL,
	[Login_administrador] [varchar](13) NULL,
	[Login_estado] [varchar](1) NULL,
 CONSTRAINT [TLogin_PK] PRIMARY KEY CLUSTERED 
(
	[Login_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TOrganizacion]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TOrganizacion](
	[Organizacion_id] [int] IDENTITY(1,1) NOT NULL,
	[Organizacion_nombre] [varchar](50) NULL,
	[Organizacion_tipo] [varchar](50) NULL,
	[Organizacion_descripcion] [varchar](50) NULL,
	[Organizacion_estado] [varchar](1) NULL,
 CONSTRAINT [TOrganizacion_PK] PRIMARY KEY CLUSTERED 
(
	[Organizacion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTipoUsuario]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTipoUsuario](
	[Usuario_id] [int] NULL,
	[Usuario_tipo] [varchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TTramite]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TTramite](
	[Tramite_id] [int] IDENTITY(1,1) NOT NULL,
	[Tramite_nombre] [varchar](50) NULL,
	[Tramite_descripcion] [varchar](50) NULL,
	[Tramite_estado] [varchar](1) NULL,
 CONSTRAINT [TTramite_PK] PRIMARY KEY CLUSTERED 
(
	[Tramite_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TCaso] ON 

INSERT [dbo].[TCaso] ([Caso_id], [Tramite_id], [Caso_codigo], [Caso_fechaInicio], [Caso_fechaFinal], [Caso_estado]) VALUES (1, 1, N'4EPe2', CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), N'A')
INSERT [dbo].[TCaso] ([Caso_id], [Tramite_id], [Caso_codigo], [Caso_fechaInicio], [Caso_fechaFinal], [Caso_estado]) VALUES (2, 1, N'1400s', CAST(N'0001-01-01' AS Date), CAST(N'2021-03-13' AS Date), N'I')
INSERT [dbo].[TCaso] ([Caso_id], [Tramite_id], [Caso_codigo], [Caso_fechaInicio], [Caso_fechaFinal], [Caso_estado]) VALUES (8, 1, N'3wVWE', CAST(N'2020-03-20' AS Date), CAST(N'2020-03-21' AS Date), N'A')
SET IDENTITY_INSERT [dbo].[TCaso] OFF
GO
SET IDENTITY_INSERT [dbo].[TCiclo] ON 

INSERT [dbo].[TCiclo] ([Ciclo_id], [Tramite_id], [Departamento_id], [Ciclo_orden], [Ciclo_estado]) VALUES (6, 4, 3, N'Orden 11', N'A')
INSERT [dbo].[TCiclo] ([Ciclo_id], [Tramite_id], [Departamento_id], [Ciclo_orden], [Ciclo_estado]) VALUES (7, 1, 11, N'Orden 2', N'A')
INSERT [dbo].[TCiclo] ([Ciclo_id], [Tramite_id], [Departamento_id], [Ciclo_orden], [Ciclo_estado]) VALUES (8, 1, 2, N'Orden 3', N'A')
INSERT [dbo].[TCiclo] ([Ciclo_id], [Tramite_id], [Departamento_id], [Ciclo_orden], [Ciclo_estado]) VALUES (9, 1, 3, N'Orden 4', N'A')
SET IDENTITY_INSERT [dbo].[TCiclo] OFF
GO
SET IDENTITY_INSERT [dbo].[TCodigo] ON 

INSERT [dbo].[TCodigo] ([Codigo_id], [Organizacion_id], [Codigo_formato], [Codigo_estado]) VALUES (8, 9, N'ee1', N'A')
INSERT [dbo].[TCodigo] ([Codigo_id], [Organizacion_id], [Codigo_formato], [Codigo_estado]) VALUES (9, 2, N'ee2', N'A')
INSERT [dbo].[TCodigo] ([Codigo_id], [Organizacion_id], [Codigo_formato], [Codigo_estado]) VALUES (10, 9, N'ee3', N'A')
SET IDENTITY_INSERT [dbo].[TCodigo] OFF
GO
SET IDENTITY_INSERT [dbo].[TDepartamento] ON 

INSERT [dbo].[TDepartamento] ([Departamento_id], [Organizacion_id], [Departamento_nombre], [Departamento_tipo], [Departamento_descripcion], [Departamento_estado]) VALUES (2, 9, N'FBI', N'POLICIA', N'NCIS', N'I')
INSERT [dbo].[TDepartamento] ([Departamento_id], [Organizacion_id], [Departamento_nombre], [Departamento_tipo], [Departamento_descripcion], [Departamento_estado]) VALUES (3, 9, N'CIA', N'POLICIA', N'NCIS', N'A')
INSERT [dbo].[TDepartamento] ([Departamento_id], [Organizacion_id], [Departamento_nombre], [Departamento_tipo], [Departamento_descripcion], [Departamento_estado]) VALUES (10, 2, N'OIJ', N'POLICIA', N'NCIS', N'I')
INSERT [dbo].[TDepartamento] ([Departamento_id], [Organizacion_id], [Departamento_nombre], [Departamento_tipo], [Departamento_descripcion], [Departamento_estado]) VALUES (11, 9, N'FBI', N'POLICIA', N'NCISs', N'A')
SET IDENTITY_INSERT [dbo].[TDepartamento] OFF
GO
SET IDENTITY_INSERT [dbo].[TDetalleCaso] ON 

INSERT [dbo].[TDetalleCaso] ([DetalleCaso_id], [Caso_id], [Ciclo_id], [Documento_id], [DetalleCaso_fechaRecibido], [DetalleCaso_fechaTranspaso], [DetalleCaso_descripcion], [DetalleCaso_estado]) VALUES (10, 1, 6, 1, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-26' AS Date), N'Detalle del primer caso.', N'I')
INSERT [dbo].[TDetalleCaso] ([DetalleCaso_id], [Caso_id], [Ciclo_id], [Documento_id], [DetalleCaso_fechaRecibido], [DetalleCaso_fechaTranspaso], [DetalleCaso_descripcion], [DetalleCaso_estado]) VALUES (11, 1, 6, 2, CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), N'Detalle del segundo caso.', N'A')
INSERT [dbo].[TDetalleCaso] ([DetalleCaso_id], [Caso_id], [Ciclo_id], [Documento_id], [DetalleCaso_fechaRecibido], [DetalleCaso_fechaTranspaso], [DetalleCaso_descripcion], [DetalleCaso_estado]) VALUES (12, 1, 6, 1, CAST(N'2020-09-18' AS Date), CAST(N'2020-09-26' AS Date), N'Detalle del tercer caso.', N'A')
INSERT [dbo].[TDetalleCaso] ([DetalleCaso_id], [Caso_id], [Ciclo_id], [Documento_id], [DetalleCaso_fechaRecibido], [DetalleCaso_fechaTranspaso], [DetalleCaso_descripcion], [DetalleCaso_estado]) VALUES (13, 2, 8, 1, CAST(N'0001-01-01' AS Date), CAST(N'0001-01-01' AS Date), N'Detalle del tercer caso.', N'A')
SET IDENTITY_INSERT [dbo].[TDetalleCaso] OFF
GO
SET IDENTITY_INSERT [dbo].[TDocumento] ON 

INSERT [dbo].[TDocumento] ([Documento_id], [Tramite_id], [Idioma_id], [Documento_nombre], [Documento_ruta], [Documento_tipo], [Documento_estado]) VALUES (1, 1, 1, N'Proyecto', N'C:\Users\BRAYAN\Desktop\Proyecto de Programacion III\P3 - Proyecto #1.pdf', N'pdf', N'A')
INSERT [dbo].[TDocumento] ([Documento_id], [Tramite_id], [Idioma_id], [Documento_nombre], [Documento_ruta], [Documento_tipo], [Documento_estado]) VALUES (2, 1, 7, N'Programa del curso', N'C:\Users\BRAYAN\Desktop\EIF207 2020 Estructuras de Datos.pdf', N'pdf', N'I')
INSERT [dbo].[TDocumento] ([Documento_id], [Tramite_id], [Idioma_id], [Documento_nombre], [Documento_ruta], [Documento_tipo], [Documento_estado]) VALUES (3, 1, 1, N'Foto', N'C:\Users\BRAYAN\Pictures\imagenes\bici\IMG-20181020-WA0002.jpeg', N'png', N'I')
INSERT [dbo].[TDocumento] ([Documento_id], [Tramite_id], [Idioma_id], [Documento_nombre], [Documento_ruta], [Documento_tipo], [Documento_estado]) VALUES (5, 4, 2, N'materia', N'C:\Users\BRAYAN\Desktop\Proyecto de Programacion III\P3 - Proyecto #1.pdf', N'pdf', N'I')
SET IDENTITY_INSERT [dbo].[TDocumento] OFF
GO
SET IDENTITY_INSERT [dbo].[TEmpleado] ON 

INSERT [dbo].[TEmpleado] ([Empleado_id], [Departamento_id], [Empleado_nombre], [Empleado_apellidos], [Empleado_fechaNacimiento], [Empleado_puesto], [Empleado_genero], [Empleado_estadoCivil], [Empleado_fechaIngreso], [Empleado_estado]) VALUES (2, 11, N'Brandon', N'Ugalde', CAST(N'0001-01-01' AS Date), N'Jefe', N'Masculino', N'Soltero/a', CAST(N'0001-01-01' AS Date), N'A')
INSERT [dbo].[TEmpleado] ([Empleado_id], [Departamento_id], [Empleado_nombre], [Empleado_apellidos], [Empleado_fechaNacimiento], [Empleado_puesto], [Empleado_genero], [Empleado_estadoCivil], [Empleado_fechaIngreso], [Empleado_estado]) VALUES (3, 2, N'Brayan', N'Ugalde', CAST(N'0001-01-01' AS Date), N'Practicante', N'Masculino', N'Soltero/a', CAST(N'0001-01-01' AS Date), N'A')
INSERT [dbo].[TEmpleado] ([Empleado_id], [Departamento_id], [Empleado_nombre], [Empleado_apellidos], [Empleado_fechaNacimiento], [Empleado_puesto], [Empleado_genero], [Empleado_estadoCivil], [Empleado_fechaIngreso], [Empleado_estado]) VALUES (4, 10, N'Marta', N'Enriquez', CAST(N'2020-09-08' AS Date), N'Gerente', N'Otro', N'Divorciado/a', CAST(N'2020-09-16' AS Date), N'A')
SET IDENTITY_INSERT [dbo].[TEmpleado] OFF
GO
SET IDENTITY_INSERT [dbo].[TIdioma] ON 

INSERT [dbo].[TIdioma] ([Idioma_id], [Idioma_nombre], [Idioma_iniciales], [Idioma_estado]) VALUES (1, N'ingles', N'ing', N'A')
INSERT [dbo].[TIdioma] ([Idioma_id], [Idioma_nombre], [Idioma_iniciales], [Idioma_estado]) VALUES (2, N'español', N'spa', N'I')
INSERT [dbo].[TIdioma] ([Idioma_id], [Idioma_nombre], [Idioma_iniciales], [Idioma_estado]) VALUES (3, N'Mandarin', N'mdr', N'I')
INSERT [dbo].[TIdioma] ([Idioma_id], [Idioma_nombre], [Idioma_iniciales], [Idioma_estado]) VALUES (7, N'Frances', N'frn', N'I')
SET IDENTITY_INSERT [dbo].[TIdioma] OFF
GO
SET IDENTITY_INSERT [dbo].[TLogin] ON 

INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (1, N'brandon', N'gemelo', N'brandonugaldech@gmail.com', N'Administrador', N'A')
INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (2, N'brayan', N'gemelo', N'brayanugalde36@gmail.com', N'Administrador', N'A')
INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (3, N'visitante', N'free', N'correo', N'Usuario', N'A')
INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (4, N'new', N'new', N'new', N'Administrador', N'I')
INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (5, N'Gabriela', N'Profe', N'Gabriela@gmail.com', N'Administrador', N'I')
INSERT [dbo].[TLogin] ([Login_id], [Login_Usuario], [Login_contraseña], [Login_correoElectronico], [Login_administrador], [Login_estado]) VALUES (9, N'new1', N'new1', N'new1@gmail.com', N'Usuario', N'A')
SET IDENTITY_INSERT [dbo].[TLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[TOrganizacion] ON 

INSERT [dbo].[TOrganizacion] ([Organizacion_id], [Organizacion_nombre], [Organizacion_tipo], [Organizacion_descripcion], [Organizacion_estado]) VALUES (1, N'AYA', N'Municipal', N'Suministro de agua', N'A')
INSERT [dbo].[TOrganizacion] ([Organizacion_id], [Organizacion_nombre], [Organizacion_tipo], [Organizacion_descripcion], [Organizacion_estado]) VALUES (2, N'ICE', N'Electricidad', N'Suministro de electricidad', N'I')
INSERT [dbo].[TOrganizacion] ([Organizacion_id], [Organizacion_nombre], [Organizacion_tipo], [Organizacion_descripcion], [Organizacion_estado]) VALUES (3, N'Colosal', N'Radio', N'Informativo', N'A')
INSERT [dbo].[TOrganizacion] ([Organizacion_id], [Organizacion_nombre], [Organizacion_tipo], [Organizacion_descripcion], [Organizacion_estado]) VALUES (9, N'Departamaento de defenza', N'Defenza', N'Justicía del pais', N'A')
SET IDENTITY_INSERT [dbo].[TOrganizacion] OFF
GO
INSERT [dbo].[TTipoUsuario] ([Usuario_id], [Usuario_tipo]) VALUES (1, N'Usuario')
GO
SET IDENTITY_INSERT [dbo].[TTramite] ON 

INSERT [dbo].[TTramite] ([Tramite_id], [Tramite_nombre], [Tramite_descripcion], [Tramite_estado]) VALUES (1, N'Aa', N'Aa', N'I')
INSERT [dbo].[TTramite] ([Tramite_id], [Tramite_nombre], [Tramite_descripcion], [Tramite_estado]) VALUES (4, N'Bb', N'Bb', N'A')
INSERT [dbo].[TTramite] ([Tramite_id], [Tramite_nombre], [Tramite_descripcion], [Tramite_estado]) VALUES (6, N'Cc', N'Cc', N'I')
INSERT [dbo].[TTramite] ([Tramite_id], [Tramite_nombre], [Tramite_descripcion], [Tramite_estado]) VALUES (7, N'Dd', N'Dd', N'A')
SET IDENTITY_INSERT [dbo].[TTramite] OFF
GO
ALTER TABLE [dbo].[TCaso]  WITH CHECK ADD  CONSTRAINT [TCaso_FK] FOREIGN KEY([Tramite_id])
REFERENCES [dbo].[TTramite] ([Tramite_id])
GO
ALTER TABLE [dbo].[TCaso] CHECK CONSTRAINT [TCaso_FK]
GO
ALTER TABLE [dbo].[TCiclo]  WITH CHECK ADD  CONSTRAINT [TCiclo_FK] FOREIGN KEY([Tramite_id])
REFERENCES [dbo].[TTramite] ([Tramite_id])
GO
ALTER TABLE [dbo].[TCiclo] CHECK CONSTRAINT [TCiclo_FK]
GO
ALTER TABLE [dbo].[TCiclo]  WITH CHECK ADD  CONSTRAINT [TCiclo_FK1] FOREIGN KEY([Departamento_id])
REFERENCES [dbo].[TDepartamento] ([Departamento_id])
GO
ALTER TABLE [dbo].[TCiclo] CHECK CONSTRAINT [TCiclo_FK1]
GO
ALTER TABLE [dbo].[TCodigo]  WITH CHECK ADD  CONSTRAINT [TCodigo_FK] FOREIGN KEY([Organizacion_id])
REFERENCES [dbo].[TOrganizacion] ([Organizacion_id])
GO
ALTER TABLE [dbo].[TCodigo] CHECK CONSTRAINT [TCodigo_FK]
GO
ALTER TABLE [dbo].[TDepartamento]  WITH CHECK ADD  CONSTRAINT [TDepartamento_FK] FOREIGN KEY([Organizacion_id])
REFERENCES [dbo].[TOrganizacion] ([Organizacion_id])
GO
ALTER TABLE [dbo].[TDepartamento] CHECK CONSTRAINT [TDepartamento_FK]
GO
ALTER TABLE [dbo].[TDetalleCaso]  WITH CHECK ADD  CONSTRAINT [TDetalleCaso_FK] FOREIGN KEY([Caso_id])
REFERENCES [dbo].[TCaso] ([Caso_id])
GO
ALTER TABLE [dbo].[TDetalleCaso] CHECK CONSTRAINT [TDetalleCaso_FK]
GO
ALTER TABLE [dbo].[TDetalleCaso]  WITH CHECK ADD  CONSTRAINT [TDetalleCaso_FK1] FOREIGN KEY([Ciclo_id])
REFERENCES [dbo].[TCiclo] ([Ciclo_id])
GO
ALTER TABLE [dbo].[TDetalleCaso] CHECK CONSTRAINT [TDetalleCaso_FK1]
GO
ALTER TABLE [dbo].[TDetalleCaso]  WITH CHECK ADD  CONSTRAINT [TDetalleCaso_FK2] FOREIGN KEY([Documento_id])
REFERENCES [dbo].[TDocumento] ([Documento_id])
GO
ALTER TABLE [dbo].[TDetalleCaso] CHECK CONSTRAINT [TDetalleCaso_FK2]
GO
ALTER TABLE [dbo].[TDocumento]  WITH CHECK ADD  CONSTRAINT [TDocumento_FK] FOREIGN KEY([Tramite_id])
REFERENCES [dbo].[TTramite] ([Tramite_id])
GO
ALTER TABLE [dbo].[TDocumento] CHECK CONSTRAINT [TDocumento_FK]
GO
ALTER TABLE [dbo].[TDocumento]  WITH CHECK ADD  CONSTRAINT [TDocumento_FK1] FOREIGN KEY([Idioma_id])
REFERENCES [dbo].[TIdioma] ([Idioma_id])
GO
ALTER TABLE [dbo].[TDocumento] CHECK CONSTRAINT [TDocumento_FK1]
GO
ALTER TABLE [dbo].[TEmpleado]  WITH CHECK ADD  CONSTRAINT [TEmpleado_FK] FOREIGN KEY([Departamento_id])
REFERENCES [dbo].[TDepartamento] ([Departamento_id])
GO
ALTER TABLE [dbo].[TEmpleado] CHECK CONSTRAINT [TEmpleado_FK]
GO
/****** Object:  StoredProcedure [dbo].[CasoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR CASO ===================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoActivar] @Caso_id INT
AS
	BEGIN
		UPDATE TCaso
		SET Caso_estado = 'A'
		WHERE Caso_id = @Caso_id
END
GO
/****** Object:  StoredProcedure [dbo].[CasoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN CASO ======================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoConsultar] @Caso_id INT
AS
BEGIN
	 SELECT *
	 FROM TCaso
	 WHERE Caso_id = @Caso_id
END
GO
/****** Object:  StoredProcedure [dbo].[CasoConsultarCodigo]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CasoConsultarCodigo] @Caso_codigo VARCHAR(50)
AS
BEGIN
	 SELECT *
	 FROM TCaso
	 WHERE Caso_codigo = @Caso_codigo
END
GO
/****** Object:  StoredProcedure [dbo].[CasoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoActivar 1

/*==================================================================================================*/
/*===================ELIMINAR CASO =================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoEliminar] @Caso_id INT 								
AS
BEGIN 
	DELETE FROM TCaso
	WHERE Caso_id = @Caso_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[CasoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoModificar 1,'1','321','17/05/2020','30/10/2020','A'

/*==================================================================================================*/
/*===================INACTIVAR CASO ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoInactivar] @Caso_id INT
AS
	BEGIN
		UPDATE TCaso
		SET Caso_estado = 'I'
		WHERE Caso_id = @Caso_id
END
GO
/****** Object:  StoredProcedure [dbo].[CasoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CasoInsertar] @Tramite_id int,
									@Caso_codigo VARCHAR(50),
									@Caso_fechaInicio DATE,
									@Caso_fechaFinal DATE,
									@Caso_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TCaso(Tramite_id,
							Caso_codigo,
							Caso_fechaInicio,
							Caso_fechaFinal,
							Caso_estado) 

	SELECT  @Tramite_id,
			@Caso_codigo,
			@Caso_fechaInicio,
			@Caso_fechaFinal,
			@Caso_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[CasoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN CASO ======================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoListarA]
AS
BEGIN
	SELECT Caso_id,
			Tramite_id,
			Caso_codigo,
			Caso_fechaInicio,
			Caso_fechaFinal,
			Caso_estado

	FROM TCaso
	WHERE Caso_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[CasoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CasoListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN CASO ======================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoListarI]
AS
BEGIN
	SELECT Caso_id,
			Tramite_id,
			Caso_codigo,
			Caso_fechaInicio,
			Caso_fechaFinal,
			Caso_estado

	FROM TCaso
	WHERE Caso_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[CasoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CasoInsertar '1','123','2020-03-19','2020-11-05','A'

/*==================================================================================================*/
/*===================MODIFICAR CASO ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CasoModificar] @Caso_id INT,
									@Tramite_id INT,
									@Caso_codigo VARCHAR(50),
									@Caso_fechaInicio DATE,
									@Caso_fechaFinal DATE,
									@Caso_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TCaso
		SET	Tramite_id = @Tramite_id,
			Caso_codigo = @Caso_codigo,
			Caso_fechaInicio = @Caso_fechaInicio,
			Caso_fechaFinal = @Caso_fechaFinal,
			Caso_estado = @Caso_estado
		WHERE Caso_id = @Caso_id
	END
GO
/****** Object:  StoredProcedure [dbo].[CicloActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR CICLO ==================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloActivar] @Ciclo_id INT
AS
	BEGIN
		UPDATE TCiclo
		SET Ciclo_estado = 'A'
		WHERE Ciclo_id = @Ciclo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CicloConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN CICLO =====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloConsultar] @Ciclo_id INT
AS
BEGIN
	 SELECT *
	 FROM TCiclo
	 WHERE Ciclo_id = @Ciclo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CicloEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloActivar 1

/*==================================================================================================*/
/*===================ELIMINAR CICLO ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloEliminar] @Ciclo_id INT 								
AS
BEGIN 
	DELETE FROM TCiclo
	WHERE Ciclo_id = @Ciclo_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[CicloInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloModificar 3,2,1,'num','A'

/*==================================================================================================*/
/*===================INACTIVAR CICLO ===============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloInactivar] @Ciclo_id INT
AS
	BEGIN
		UPDATE TCiclo
		SET Ciclo_estado = 'I'
		WHERE Ciclo_id = @Ciclo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CicloInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CicloInsertar] @Tramite_id int,
									@Departamento_id int,
									@Ciclo_orden VARCHAR(50),
									@Ciclo_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TCiclo(Tramite_id,
							Departamento_id,
							Ciclo_orden,
							Ciclo_estado) 

	SELECT  @Tramite_id,
			@Departamento_id,
			@Ciclo_orden,
			@Ciclo_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[CicloListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloConsultar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN DOCUCICLOMENTO ============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloListarA]
AS
BEGIN
	SELECT Ciclo_id,
			Tramite_id,
			Departamento_id,
			Ciclo_orden,
			Ciclo_estado

	FROM TCiclo
	WHERE Ciclo_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[CicloListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CicloListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN CICLO =====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloListarI]
AS
BEGIN
	SELECT Ciclo_id,
			Tramite_id,
			Departamento_id,
			Ciclo_orden,
			Ciclo_estado

	FROM TCiclo
	WHERE Ciclo_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[CicloModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CicloInsertar 1,1,'num','A'

/*==================================================================================================*/
/*===================MODIFICAR CICLO ===============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CicloModificar] @Ciclo_id INT,
									@Tramite_id int,
									@Departamento_id int,
									@Ciclo_orden VARCHAR(50),
									@Ciclo_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TCiclo
		SET	Tramite_id = @Tramite_id,
			Departamento_id = @Departamento_id,
			Ciclo_orden = @Ciclo_orden,
			Ciclo_estado = @Ciclo_estado
	
		WHERE Ciclo_id = @Ciclo_id
	END
GO
/****** Object:  StoredProcedure [dbo].[CodigoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CodigoInactivar 1

/*==================================================================================================*/
/*===================ACTIVAR CODIGO ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoActivar] @Codigo_id INT
AS
	BEGIN
		UPDATE TCodigo
		SET Codigo_estado = 'A'
		WHERE Codigo_id = @Codigo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CodigoEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA CODIGO ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoConsultar] @Codigo_id INT
AS
BEGIN
	 SELECT *
	 FROM TCodigo
	 WHERE Codigo_id = @Codigo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CodigoActivar 1

/*==================================================================================================*/
/*===================ELIMINAR CODIGO ===============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoEliminar] @Codigo_id INT 								
AS
BEGIN 
	DELETE FROM TCodigo
	WHERE Codigo_id = @Codigo_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CodigoModificar 1,1,'PNG','A'

/*==================================================================================================*/
/*===================INACTIVAR CODIGO ==============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoInactivar] @Codigo_id INT
AS
	BEGIN
		UPDATE TCodigo
		SET Codigo_estado = 'I'
		WHERE Codigo_id = @Codigo_id
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CodigoInsertar] @Organizacion_id int,
									@Codigo_formato VARCHAR(50),
									@Codigo_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TCodigo(Organizacion_id,
							Codigo_formato,
							Codigo_estado) 

	SELECT  @Organizacion_id,
			@Codigo_formato,
			@Codigo_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--CodigoConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA CODIGO ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoListarA]
AS
BEGIN
	SELECT Codigo_id,
			Organizacion_id,
			Codigo_formato,
			Codigo_estado

	FROM TCodigo
	WHERE Codigo_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--CodigoListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA CODIGO ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[CodigoListarI]
AS
BEGIN
	SELECT Codigo_id,
			Organizacion_id,
			Codigo_formato,
			Codigo_estado

	FROM TCodigo
	WHERE Codigo_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[CodigoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CodigoModificar] @Codigo_id INT,
									@Organizacion_id int,
									@Codigo_formato VARCHAR(50),
									@Codigo_estado VARCHAR(1)
									
AS
	BEGIN
		UPDATE TCodigo
		SET	Organizacion_id = @Organizacion_id,
			Codigo_formato = @Codigo_formato,
			Codigo_estado = @Codigo_estado
	
		WHERE Codigo_id = @Codigo_id
	END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DepartamentoInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR DEPARTAMENTO ===========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoActivar] @Departamento_id INT
AS
	BEGIN
		UPDATE TDepartamento
		SET Departamento_estado = 'A'
		WHERE Departamento_id = @Departamento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DepartamentoEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DEPARTAMENTO =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoConsultar] @Departamento_id INT
AS
BEGIN
	 SELECT *
	 FROM TDepartamento
	 WHERE Departamento_id = @Departamento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DepartamentoActivar 1

/*==================================================================================================*/
/*===================ELIMINAR DEPARTAMENTO =========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoEliminar] @Departamento_id INT 								
AS
BEGIN 
	DELETE FROM TDepartamento
	WHERE Departamento_id = @Departamento_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DepartamentoModificar 1,'2','FBI','POLICIA','NCIS','A'

/*==================================================================================================*/
/*===================INACTIVAR DEPARTAMENTO ========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoInactivar] @Departamento_id INT
AS
	BEGIN
		UPDATE TDepartamento
		SET Departamento_estado = 'I'
		WHERE Departamento_id = @Departamento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DepartamentoInsertar] @Organizacion_id int,
									@Departamento_nombre VARCHAR(50),
									@Departamento_tipo VARCHAR(50),
									@Departamento_descripcion VARCHAR(50),
									@Departamento_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TDepartamento(Organizacion_id,
							Departamento_nombre,
							Departamento_tipo,
							Departamento_descripcion,
							Departamento_estado) 

	SELECT  @Organizacion_id,
			@Departamento_nombre,
			@Departamento_tipo,
			@Departamento_descripcion,
			@Departamento_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DepartamentoConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DEPARTAMENTO =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoListarA]
AS
BEGIN
	SELECT Departamento_id,
			Organizacion_id,
			Departamento_nombre,
			Departamento_tipo,
			Departamento_descripcion,
			Departamento_estado

	FROM TDepartamento
	WHERE Departamento_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DepartamentoListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DEPARTAMENTO =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DepartamentoListarI]
AS
BEGIN
	SELECT Departamento_id,
			Organizacion_id,
			Departamento_nombre,
			Departamento_tipo,
			Departamento_descripcion,
			Departamento_estado

	FROM TDepartamento
	WHERE Departamento_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[DepartamentoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DepartamentoModificar] @Departamento_id INT,
									@Organizacion_id int,
									@Departamento_nombre VARCHAR(50),
									@Departamento_tipo VARCHAR(50),
									@Departamento_descripcion VARCHAR(50),
									@Departamento_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TDepartamento
		SET	Organizacion_id = @Organizacion_id,
			Departamento_nombre = @Departamento_nombre,
			Departamento_tipo = @Departamento_tipo,
			Departamento_descripcion = @Departamento_descripcion,
			Departamento_estado = @Departamento_estado
				
		WHERE Departamento_id = @Departamento_id
	END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR DETALLE DEL CASO =======================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoActivar] @DetalleCaso_id INT
AS
	BEGIN
		UPDATE TDetalleCaso
		SET DetalleCaso_estado = 'A'
		WHERE DetalleCaso_id = @DetalleCaso_id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN DETALLE DEL CASO ==========================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoConsultar] @DetalleCaso_id INT
AS
BEGIN
	 SELECT *
	 FROM TDetalleCaso
	 WHERE DetalleCaso_id = @DetalleCaso_id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoActivar 1

/*==================================================================================================*/
/*===================ELIMINAR DETALLE DEL CASO =====================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoEliminar] @DetalleCaso_id INT 								
AS
BEGIN 
	DELETE FROM TDetalleCaso
	WHERE DetalleCaso_id = @DetalleCaso_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoModificar 2,'1','1','2','19/05/2000','19/11/2020','ok','A'

/*==================================================================================================*/
/*===================INACTIVAR DETALLE DEL CASO ====================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoInactivar] @DetalleCaso_id INT
AS
	BEGIN
		UPDATE TDetalleCaso
		SET DetalleCaso_estado = 'I'
		WHERE DetalleCaso_id = @DetalleCaso_id
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DetalleCasoInsertar] @Caso_id int,
									@Ciclo_id int,
									@Documento_id int,
									@DetalleCaso_fechaRecibido DATE,
									@DetalleCaso_fechaTranspaso DATE,
									@DetalleCaso_descripcion VARCHAR(50),
									@DetalleCaso_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TDetalleCaso(Caso_id,
							Ciclo_id,
							Documento_id,
							DetalleCaso_fechaRecibido,
							DetalleCaso_fechaTranspaso,
							DetalleCaso_descripcion,
							DetalleCaso_estado) 

	SELECT  @Caso_id,
			@Ciclo_id,
			@Documento_id,
			@DetalleCaso_fechaRecibido,
			@DetalleCaso_fechaTranspaso,
			@DetalleCaso_descripcion,
			@DetalleCaso_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN DETALLE DEL CASO ==========================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoListarA]
AS
BEGIN
	SELECT DetalleCaso_id,
			Caso_id,
			Ciclo_id,
			Documento_id,
			DetalleCaso_fechaRecibido,
			DetalleCaso_fechaTranspaso,
			DetalleCaso_descripcion,
			DetalleCaso_estado

	FROM TDetalleCaso
	WHERE DetalleCaso_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DetalleCasoListarA

/*=================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN DETALLE DEL CASO ===========================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoListarI]
AS
BEGIN
	SELECT DetalleCaso_id,
			Caso_id,
			Ciclo_id,
			Documento_id,
			DetalleCaso_fechaRecibido,
			DetalleCaso_fechaTranspaso,
			DetalleCaso_descripcion,
			DetalleCaso_estado

	FROM TDetalleCaso
	WHERE DetalleCaso_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[DetalleCasoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DetalleCasoInsertar '1','1','1','2000-05-19','2020-11-19','ok','A'

/*==================================================================================================*/
/*===================MODIFICAR DETALLE DEL CASO ====================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DetalleCasoModificar] @DetalleCaso_id INT,
									@Caso_id int,
									@Ciclo_id int,
									@Documento_id int,
									@DetalleCaso_fechaRecibido DATE,
									@DetalleCaso_fechaTranspaso DATE,
									@DetalleCaso_descripcion VARCHAR(50),
									@DetalleCaso_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TDetalleCaso
		SET	Caso_id = @Caso_id,
			Ciclo_id = @Ciclo_id,
			Documento_id = @Documento_id,
			DetalleCaso_fechaRecibido = @DetalleCaso_fechaRecibido,
			DetalleCaso_fechaTranspaso = @DetalleCaso_fechaTranspaso,
			DetalleCaso_descripcion = @DetalleCaso_descripcion,
			DetalleCaso_estado = @DetalleCaso_estado

		WHERE DetalleCaso_id = @DetalleCaso_id
	END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR DOCUMENTO ==============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoActivar] @Documento_id INT
AS
	BEGIN
		UPDATE TDocumento
		SET Documento_estado = 'A'
		WHERE Documento_id = @Documento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DOCUMENTO ================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoConsultar] @Documento_id INT
AS
BEGIN
	 SELECT *
	 FROM TDocumento
	 WHERE Documento_id = @Documento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoActivar 1

/*==================================================================================================*/
/*===================ELIMINAR DOCUMENTO ============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoEliminar] @Documento_id INT 								
AS
BEGIN 
	DELETE FROM TDocumento
	WHERE Documento_id = @Documento_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoModificar 1,'1','1','DELL','C:\Users\Brandon\Documents\BRANDON\universidad\2020\Semestre N2, 2020\PROGRAMACION 3\Sistema_Matricula','pdf','A'

/*==================================================================================================*/
/*===================INACTIVAR DOCUMENTO ===========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoInactivar] @Documento_id INT
AS
	BEGIN
		UPDATE TDocumento
		SET Documento_estado = 'I'
		WHERE Documento_id = @Documento_id
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DocumentoInsertar] @Tramite_id int,
									@Idioma_id int,
									@Documento_nombre VARCHAR(50),
									@Documento_ruta VARCHAR(2083),
									@Documento_tipo VARCHAR(50),
									@Documento_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TDocumento(Tramite_id,
							Idioma_id,
							Documento_nombre,
							Documento_ruta,
							Documento_tipo,
							Documento_estado) 

	SELECT  @Tramite_id,
			@Idioma_id,
			@Documento_nombre,
			@Documento_ruta,
			@Documento_tipo,
			@Documento_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DOCUMENTO ================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoListarA]
AS
BEGIN
	SELECT Documento_id,
			Tramite_id,
			Idioma_id,
			Documento_nombre,
			Documento_ruta,
			Documento_tipo,
			Documento_estado

	FROM TDocumento
	WHERE Documento_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--DocumentoListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA DOCUMENTO ================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoListarI]
AS
BEGIN
	SELECT Documento_id,
			Tramite_id,
			Idioma_id,
			Documento_nombre,
			Documento_ruta,
			Documento_tipo,
			Documento_estado

	FROM TDocumento
	WHERE Documento_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[DocumentoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--DocumentoInsertar '1','1','MSI','C:\Users\Brandon\Documents\BRANDON\universidad\2020\Semestre N2, 2020\PROGRAMACION 3\Sistema_Matricula','pdf','A'

/*==================================================================================================*/
/*===================MODIFICAR DOCUMENTO ===========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[DocumentoModificar] @Documento_id INT,
									@Tramite_id int,
									@Idioma_id int,
									@Documento_nombre VARCHAR(50),
									@Documento_ruta VARCHAR(2083),
									@Documento_tipo VARCHAR(50),
									@Documento_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TDocumento
		SET	Tramite_id = @Tramite_id,
			Idioma_id = @Idioma_id,
			Documento_nombre = @Documento_nombre,
			Documento_ruta = @Documento_ruta,
			Documento_tipo = @Documento_tipo,
			Documento_estado = @Documento_estado
	
		WHERE Documento_id = @Documento_id
	END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoActivar] @Empleado_id INT
AS
	BEGIN
		UPDATE TEmpleado
		SET Empleado_estado = 'A'
		WHERE Empleado_id = @Empleado_id
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EmpleadoConsultar] @Empleado_id INT
AS
BEGIN
	 SELECT *
	 FROM TEmpleado
	 WHERE Empleado_id = @Empleado_id
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoEliminar] @Empleado_id INT 								
AS
BEGIN 
	DELETE FROM TEmpleado
	WHERE Empleado_id = @Empleado_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoInactivar] @Empleado_id INT
AS
	BEGIN
		UPDATE TEmpleado
		SET Empleado_estado = 'I'
		WHERE Empleado_id = @Empleado_id
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoInsertar] @Departamento_id int,
									@Empleado_nombre VARCHAR(50),
									@Empleado_apellidos VARCHAR(50),
									@Empleado_fechaNacimiento datetime,
									@Empleado_puesto VARCHAR(50),
									@Empleado_genero VARCHAR(50),
									@Empleado_estadoCivil VARCHAR(50),
									@Empleado_fechaIngreso datetime,
									@Empleado_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TEmpleado(Departamento_id,
							Empleado_nombre,
							Empleado_apellidos,
							Empleado_fechaNacimiento,
							Empleado_puesto,
							Empleado_genero,
							Empleado_estadoCivil,
							Empleado_fechaIngreso,
							Empleado_estado) 

	SELECT  @Departamento_id,
			 @Empleado_nombre,
			 @Empleado_apellidos,
			 @Empleado_fechaNacimiento,
			 @Empleado_puesto,
			 @Empleado_genero,
			 @Empleado_estadoCivil,
			 @Empleado_fechaIngreso,
			 @Empleado_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoListarA]
AS
BEGIN
	SELECT Empleado_id,
			Departamento_id,
			Empleado_nombre,
			Empleado_apellidos,
			Empleado_fechaNacimiento,
			Empleado_puesto,
			Empleado_genero,
			Empleado_estadoCivil,
			Empleado_fechaIngreso,
			Empleado_estado

	FROM TEmpleado
	WHERE Empleado_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoListarI]
AS
BEGIN
	SELECT  Empleado_id,
			Departamento_id,
			Empleado_nombre,
			Empleado_apellidos,
			Empleado_fechaNacimiento,
			Empleado_puesto,
			Empleado_genero,
			Empleado_estadoCivil,
			Empleado_fechaIngreso,
			Empleado_estado

	FROM TEmpleado
	WHERE Empleado_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[EmpleadoModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EmpleadoModificar] @Empleado_id INT,
									@Departamento_id int,
									@Empleado_nombre VARCHAR(50),
									@Empleado_apellidos VARCHAR(50),
									@Empleado_fechaNacimiento DATE,
									@Empleado_puesto VARCHAR(50),
									@Empleado_genero VARCHAR(50),
									@Empleado_estadoCivil VARCHAR(50),
									@Empleado_fechaIngreso DATE,
									@Empleado_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TEmpleado
		SET	Departamento_id = @Departamento_id,
			Empleado_nombre = @Empleado_nombre,
			Empleado_apellidos = @Empleado_apellidos,
			Empleado_fechaNacimiento = @Empleado_fechaNacimiento,
			Empleado_puesto = @Empleado_puesto,
			Empleado_genero = @Empleado_genero,
			Empleado_estadoCivil = @Empleado_estadoCivil,
			Empleado_fechaIngreso = @Empleado_fechaIngreso,
			Empleado_estado = @Empleado_estado
	
		WHERE Empleado_id = @Empleado_id
	END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--IdiomaInactivar 1

/*==================================================================================================*/
/*=====================ACTIVAR IDIOMA ==============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaActivar] @Idioma_id INT
AS
	BEGIN
		UPDATE TIdioma
		SET Idioma_estado = 'A'
		WHERE Idioma_id = @Idioma_id
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--IdiomaEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN IDIOMA ====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaConsultar] @Idioma_id INT
AS
BEGIN
	 SELECT *
	 FROM TIdioma
	 WHERE Idioma_id = @Idioma_id
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--IdiomaActivar 1

/*==================================================================================================*/
/*===================ELIMINAR IDIOMA ===============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaEliminar] @Idioma_id INT 								
AS
BEGIN 
	DELETE FROM TIdioma
	WHERE Idioma_id = @Idioma_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--IdiomaModificar 1,Esp,'spa','A'

/*==================================================================================================*/
/*===================INACTIVAR IDIOMA ==============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaInactivar] @Idioma_id INT
AS
	BEGIN
		UPDATE TIdioma
		SET Idioma_estado = 'I'
		WHERE Idioma_id = @Idioma_id
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[IdiomaInsertar] @Idioma_nombre  VARCHAR(50),
									@Idioma_iniciales VARCHAR(3),
									@Idioma_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TIdioma(Idioma_nombre,
							Idioma_iniciales,
							Idioma_estado)
							
	SELECT  @Idioma_nombre,
			@Idioma_iniciales,
			@Idioma_estado
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--IdiomaConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN IDIOMA ====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaListarA]
AS
BEGIN
	SELECT Idioma_id,
			Idioma_nombre,
			Idioma_iniciales,
			Idioma_estado
	FROM TIdioma
	WHERE Idioma_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--IdiomaListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN IDIOMA ====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[IdiomaListarI]
AS
BEGIN
	SELECT Idioma_id,
			Idioma_nombre,
			Idioma_iniciales,
			Idioma_estado
	FROM TIdioma
	WHERE Idioma_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[IdiomaModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[IdiomaModificar] @Idioma_id INT,
									@Idioma_nombre  VARCHAR(50),
									@Idioma_iniciales VARCHAR(3),
									@Idioma_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TIdioma
		SET	Idioma_nombre = @Idioma_nombre,
			Idioma_iniciales = @Idioma_iniciales,
			Idioma_estado = @Idioma_estado
	
		WHERE Idioma_id = @Idioma_id
	END
GO
/****** Object:  StoredProcedure [dbo].[LoginActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--LoginInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR LOGIN ==================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[LoginActivar] @Login_id INT
AS
	BEGIN
		UPDATE TLogin
		SET Login_estado = 'A'
		WHERE Login_id = @Login_id
END
GO
/****** Object:  StoredProcedure [dbo].[LoginConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--LoginEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACION DE UN LOGIN =====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[LoginConsultar] @Login_id INT
AS
BEGIN
	 SELECT *
	 FROM TLogin
	 WHERE Login_id = @Login_id
END
GO
/****** Object:  StoredProcedure [dbo].[LoginConsultarActividad]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginConsultarActividad] @Login_estado Varchar(10)
AS
BEGIN
	 SELECT *
	 FROM TLogin
	 WHERE Login_estado = @Login_estado 
END
GO
/****** Object:  StoredProcedure [dbo].[LoginConsultarCorreo]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginConsultarCorreo] @Login_correoElectronico Varchar(50)
AS
BEGIN
	 SELECT *
	 FROM TLogin
	 WHERE Login_correoElectronico = @Login_correoElectronico 
END
GO
/****** Object:  StoredProcedure [dbo].[LoginConsultarUsuario]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--LoginListarI


CREATE PROCEDURE [dbo].[LoginConsultarUsuario] @Login_Usuario Varchar(10)
AS
BEGIN
	 SELECT *
	 FROM TLogin
	 WHERE Login_Usuario = @Login_Usuario 
END
GO
/****** Object:  StoredProcedure [dbo].[LoginEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--LoginActivar 1

/*==================================================================================================*/
/*===================ELIMINAR LOGIN ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[LoginEliminar] @Login_id INT 								
AS
BEGIN 
	DELETE FROM TLogin
	WHERE Login_id = @Login_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[LoginInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--LoginModificar 1,'brandon','gemelo1','brandonugaldech@gmail.com','S','A'

/*==================================================================================================*/
/*===================INACTIVAR LOGIN ===============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[LoginInactivar] @Login_id INT
AS
	BEGIN
		UPDATE TLogin
		SET Login_estado = 'I'
		WHERE Login_id = @Login_id
END
GO
/****** Object:  StoredProcedure [dbo].[LoginInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginInsertar] @Login_Usuario VARCHAR(10),
									@Login_contraseña VARCHAR(8),
									@Login_correoElectronico VARCHAR(50),
									@Login_administrador VARCHAR(13),
									@Login_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TLogin(Login_Usuario,
							Login_contraseña,
							Login_correoElectronico,
							Login_administrador,
							Login_estado) 

	SELECT  @Login_Usuario,
			@Login_contraseña,
			@Login_correoElectronico,
			@Login_administrador,
			@Login_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[LoginListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--LoginConsultar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN LOGIN =====================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[LoginListarA]
AS
BEGIN
	SELECT Login_id,
			Login_Usuario,
			Login_contraseña,
			Login_correoElectronico,
			Login_administrador,
			Login_estado

	FROM TLogin
	WHERE Login_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[LoginListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginListarI]
AS
BEGIN
	SELECT Login_id,
			Login_Usuario,
			Login_contraseña,
			Login_correoElectronico,
			Login_administrador,
			Login_estado

	FROM TLogin
	WHERE Login_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[LoginModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[LoginModificar] @Login_id INT,
							@Login_Usuario VARCHAR(10),
							@Login_contraseña VARCHAR(8),
							@Login_correoElectronico VARCHAR(50),
							@Login_administrador VARCHAR(13),
							@Login_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TLogin
		SET	Login_Usuario = @Login_Usuario,
			Login_contraseña = @Login_contraseña,
			Login_correoElectronico = @Login_correoElectronico,
			Login_administrador = @Login_administrador,
			Login_estado = @Login_estado
	
		WHERE Login_id = @Login_id
	END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--OrganizacionInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR ORGANIZACION ===========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionActivar] @Organizacion_id INT
AS
	BEGIN
		UPDATE TOrganizacion
		SET Organizacion_estado = 'A'
		WHERE Organizacion_id = @Organizacion_id
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--OrganizacionEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA ORGANIZACION =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionConsultar] @Organizacion_id INT
AS
BEGIN
	 SELECT *
	 FROM TOrganizacion
	 WHERE Organizacion_id = @Organizacion_id
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--OrganizacionActivar 1

/*==================================================================================================*/
/*===================ELIMINAR ORGANIZACION =========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionEliminar] @Organizacion_id INT 								
AS
BEGIN 
	DELETE FROM TOrganizacion
	WHERE Organizacion_id = @Organizacion_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--OrganizacionModificar 1,'A','B','B','A'

/*==================================================================================================*/
/*===================INACTIVAR ORGANIZACION ========================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionInactivar] @Organizacion_id INT
AS
	BEGIN
		UPDATE TOrganizacion
		SET Organizacion_estado = 'I'
		WHERE Organizacion_id = @Organizacion_id
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganizacionInsertar] @Organizacion_nombre VARCHAR(50),
									@Organizacion_tipo VARCHAR(50),
									@Organizacion_descripcion VARCHAR(50),
									@Organizacion_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TOrganizacion(Organizacion_nombre,
							Organizacion_tipo,
							Organizacion_descripcion,
							Organizacion_estado) 

	SELECT  @Organizacion_nombre,
			@Organizacion_tipo,
			@Organizacion_descripcion,
			@Organizacion_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--OrganizacionConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA ORGANIZACION =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionListarA]
AS
BEGIN
	SELECT Organizacion_id,
			Organizacion_nombre,
			Organizacion_tipo,
			Organizacion_descripcion,
			Organizacion_estado

	FROM TOrganizacion
	WHERE Organizacion_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--OrganizacionListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UNA ORGANIZACION =============================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[OrganizacionListarI]
AS
BEGIN
	SELECT Organizacion_id,
			Organizacion_nombre,
			Organizacion_tipo,
			Organizacion_descripcion,
			Organizacion_estado

	FROM TOrganizacion
	WHERE Organizacion_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[OrganizacionModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OrganizacionModificar] @Organizacion_id INT,
									@Organizacion_nombre VARCHAR(50),
									@Organizacion_tipo VARCHAR(50),
									@Organizacion_descripcion VARCHAR(50),
									@Organizacion_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TOrganizacion
		SET	Organizacion_nombre = @Organizacion_nombre,
			Organizacion_tipo = @Organizacion_tipo,
			Organizacion_descripcion = @Organizacion_descripcion,
			Organizacion_estado = @Organizacion_estado
	
		WHERE Organizacion_id = @Organizacion_id
	END
GO
/****** Object:  StoredProcedure [dbo].[TramiteActivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteInactivar 1

/*==================================================================================================*/
/*==================ACTIVAR TRAMITE ================================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteActivar] @Tramite_id INT
AS
	BEGIN
		UPDATE TTramite
		SET Tramite_estado = 'A'
		WHERE Tramite_id = @Tramite_id
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteEliminar 1

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACION DE UN TRAMITE ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteConsultar] @Tramite_id INT
AS
BEGIN
	 SELECT *
	 FROM TTramite
	 WHERE Tramite_id = @Tramite_id
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteEliminar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteActivar 1

/*==================================================================================================*/
/*===================ELIMINAR TRAMITE ==============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteEliminar] @Tramite_id INT 								
AS
BEGIN 
	DELETE FROM TTramite
	WHERE Tramite_id = @Tramite_id
	SELECT 'SE HA ELIMINADO CON EXITO' 		
	
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteInactivar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteModificar 1,'A','B','A'

/*==================================================================================================*/
/*===================INACTIVAR TRAMITE =============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteInactivar] @Tramite_id INT
AS
	BEGIN
		UPDATE TTramite
		SET Tramite_estado = 'I'
		WHERE Tramite_id = @Tramite_id
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
CREATE PROCEDURE [dbo].[TramiteInsertar] @Tramite_nombre VARCHAR(50),
									@Tramite_descripcion VARCHAR(50),
									@Tramite_estado VARCHAR(1)
AS
BEGIN
	INSERT INTO TTramite(Tramite_nombre,
							Tramite_descripcion,
							Tramite_estado) 

	SELECT  @Tramite_nombre,
			@Tramite_descripcion,
			@Tramite_estado
			
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteListarA]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteConsultar 2

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN TRAMITE ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteListarA]
AS
BEGIN
	SELECT Tramite_id,
			Tramite_nombre,
			Tramite_descripcion,
			Tramite_estado

	FROM TTramite
	WHERE Tramite_estado = 'A'
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteListarI]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteListarA

/*==================================================================================================*/
/*===================CONSULTAR TODA LA INFORMACI�N DE UN TRAMITE ===================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteListarI]
AS
BEGIN
	SELECT Tramite_id,
			Tramite_nombre,
			Tramite_descripcion,
			Tramite_estado

	FROM TTramite
	WHERE Tramite_estado = 'I'
END
GO
/****** Object:  StoredProcedure [dbo].[TramiteModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--TramiteInsertar 'A','A','A'

/*==================================================================================================*/
/*===================MODIFICAR TRAMITE =============================================================*/
/*==================================================================================================*/

CREATE PROCEDURE [dbo].[TramiteModificar] @Tramite_id INT,
									@Tramite_nombre VARCHAR(50),
									@Tramite_descripcion VARCHAR(50),
									@Tramite_estado VARCHAR(1)
AS
	BEGIN
		UPDATE TTramite
		SET	Tramite_nombre = @Tramite_nombre,
			Tramite_descripcion = @Tramite_descripcion,
			Tramite_estado = @Tramite_estado
	
		WHERE Tramite_id = @Tramite_id
	END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioConsultar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioConsultar] @Usuario_id INT
AS
BEGIN
	 SELECT *
	 FROM TTipoUsuario
	 WHERE Usuario_id = @Usuario_id
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioInsertar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UsuarioInsertar] @Usuario_id int,
									@Usuario_tipo VARCHAR(15)
AS
BEGIN
	INSERT INTO TTipoUsuario(Usuario_id,
							Usuario_tipo) 

	SELECT  @Usuario_id,
			@Usuario_tipo
			
END
GO
/****** Object:  StoredProcedure [dbo].[UsuarioModificar]    Script Date: 03/10/2020 19:18:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UsuarioModificar] @Usuario_id INT,
									@Usuario_tipo VARCHAR(15)
									
									
AS
	BEGIN
		UPDATE TTipoUsuario
		SET	Usuario_id = @Usuario_id,
			Usuario_tipo = @Usuario_tipo
	
		WHERE Usuario_id = @Usuario_id
	END
GO
USE [master]
GO
ALTER DATABASE [Manejo_registros] SET  READ_WRITE 
GO

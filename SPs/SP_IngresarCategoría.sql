USE [LoginSP11E]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spIngresarCategoria]
@descripcion varchar(100),
@esGenero boolean
as
BEGIN
	SET NOCOUNT ON;
		BEGIN
			INSERT INTO CATEGORIA (DESCRIPCION, ES_GENERO)
			VALUES (@descripcion, @esGenero)
		END
END



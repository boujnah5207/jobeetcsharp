-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolas BAUHAIN
-- Create date: 09/03/2010
-- Description:	Créer les catagories par défaut
--              et efface toutes les données de la base.
-- =============================================
CREATE PROCEDURE ResetDefaultCategories 
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DELETE FROM CategoryAffiliate;
	DELETE FROM Affiliate;
	DELETE FROM Job;
	DELETE FROM Category;
	
	-- Insertion des categories par defaut
	INSERT INTO Category (Name, Slug) VALUES('Design','design');
	INSERT INTO Category (Name, Slug) VALUES('Programming','programming');
	INSERT INTO Category (Name, Slug) VALUES('Manager','Manager');
	INSERT INTO Category (Name, Slug) VALUES('Administrator','administrator');
	
END
GO

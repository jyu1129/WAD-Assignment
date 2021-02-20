INSERT INTO [dbo].[images] values (1, (SELECT * FROM OPENROWSET(BULK N'D:\Users\Justin Yu\source\repos\WAD Assignment\WAD Assignment\tempImg\880433.jpg', SINGLE_BLOB) as T1))

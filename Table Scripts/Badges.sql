-- Badges

-- Inserting data from the XML file into the Badges table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Badges.xml', SINGLE_BLOB) AS X

INSERT INTO Badges
SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@Name','nvarchar(30)') [Name]
FROM @FileData.nodes ('/badges/row') AS X(xData)


SELECT * FROM Badges
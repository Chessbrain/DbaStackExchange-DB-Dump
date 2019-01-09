-- User Badges

-- Inserting data from the XML file into the UserBadges table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Badges.xml',SINGLE_BLOB) AS X

INSERT INTO UserBadges

SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@UserId','int') UserId,
			(
			SELECT BT.Id 
			FROM Badges AS BT
			WHERE BT.Name LIKE X.xData.value('@Name','nvarchar(30)')
			) AS BadgesId,		   
		X.xData.value('@Date','datetime') [Date],
		X.xData.value('@Class','int') Class,
		X.xData.value('@TagBased','nvarchar(5)') TagBased
FROM @FileData.nodes('/badges/row') AS X(xData)



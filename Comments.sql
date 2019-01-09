-- Comments

-- Inserting data from the XML file into the Comments table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Comments.xml',SINGLE_BLOB) AS X

INSERT INTO Comments

SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@PostId','int') PostId,
		X.xData.value('@Score','int') Score,
		X.xData.value('@Text','nvarchar(MAX)') [Text],
		X.xData.value('@CreationDate','datetime') CreationDate,
		X.xData.value('@UserId','int') UserId
FROM @FileData.nodes('/comments/row') AS X(xData)
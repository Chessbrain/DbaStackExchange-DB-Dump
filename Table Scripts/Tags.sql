-- Tags

-- Inserting data from the XML file into the Tags table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Tags.xml', SINGLE_BLOB) AS X

INSERT INTO Tags
SELECT	X.xData.value('@TagName','nvarchar(10)') TagName,
		X.xData.value('@Count','int') [Count],
		X.xData.value('@ExcerptPostId','int') ExcerptPostId,
		X.xData.value('@WikiPostId','int') WikiPostId
FROM @FileData.nodes('/tags/row') AS X(xData)

SELECT * FROM Tags
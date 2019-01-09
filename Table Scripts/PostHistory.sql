-- Post History

-- Inserting data from the XML file into the PostHistory Table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'DbDumpLocation\PostHistory.xml' ,SINGLE_BLOB) AS X

INSERT INTO PostHistory

SELECT	X.xData.value('@Id','int') PostHistoryId,
		X.xData.value('@PostHistoryTypeId','int') Id,
		X.xData.value('@PostId','int') PostId,
		X.xData.value('@RevisionGUID','nvarchar(36)') RevisionGUID,
		X.xData.value('@CreationDate','datetime') CreationDate,
		X.xData.value('@UserId','int') UserId,
		X.xData.value('@Text', 'nvarchar(MAX)') [Text]
FROM @FileData.nodes ('/posthistory/row') AS X(xData)

SELECT * FROM PostHistory

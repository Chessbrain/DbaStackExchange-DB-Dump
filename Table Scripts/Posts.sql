-- Posts

-- Inserting data from the XML file into the Posts table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Posts.xml', SINGLE_BLOB) AS X

INSERT INTO Posts
SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@CreationDate','datetime') CreationDate,
		X.xData.value('@Score','int') Score,
		X.xData.value('@ViewCount','int') ViewCount,
		X.xData.value('@Body','nvarchar(MAX)') Body,
		X.xData.value('@OwnerUserId','int') OwnerUserId,
		X.xData.value('@LastActivityDate','datetime') LastActivityDate,
		X.xData.value('@Title', 'nvarchar(100)') Title,
		X.xData.value('@AnswerCount','int') AnswerCount,
		X.xData.value('@CommentCount','int') CommentCount,
		X.xData.value('@FavoriteCount','int') FavoriteCount
FROM @FileData.nodes('/posts/row') AS X(xData)


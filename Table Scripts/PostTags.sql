-- PostTags

-- Creating the Temp Table that will house all the data
CREATE TABLE #TestingIdea (
Id int PRIMARY KEY IDENTITY (1,1),
PostId int NULL,
Tag nvarchar (MAX) NULL
)
GO

-- Inserting XML file data into the Temp Table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Posts.xml', SINGLE_BLOB) AS X

INSERT INTO #TestingIdea(PostId,Tag)
SELECT	X.xData.value('@Id','int') PostId,
		X.xData.value('@Tags','nvarchar(MAX)')
FROM @FileData.nodes ('/posts/row') AS X(xData)
GO

-- This table has an array of tags, this query splits them using the string_split function. After that you can insert that data into the table again.
-- This won't affect consistency when we insert into the main PostTags table, because we will be matching it based on the TagName (before it was an array, not it's a single word)
INSERT INTO #TestingIdea
SELECT PostId, RIGHT(value,len(value)-1) as SplitTag
FROM #TestingIdea 
CROSS APPLY string_split(Tag,'>')
WHERE value != ''
GO

-- Inserting into the main PostTags table
INSERT INTO PostTags
SELECT PostId, T.Id
FROM #TestingIdea AS I
INNER JOIN Tags AS T
	ON T.TagName = I.Tag
GO






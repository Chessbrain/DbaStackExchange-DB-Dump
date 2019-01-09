-- PostLinks

-- Inserting data from the XML file into the PostLinks table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\PostLinks.xml',SINGLE_BLOB) AS X

INSERT INTO PostLinks

SELECT	X.xData.value('@Id','nvarchar(30)') Id,
		X.xData.value('@CreationDate','datetime') CreationDate,
		X.xData.value('@PostId','int') PostId,
		X.xData.value('@RelatedPostId','int') RelatedPostId,
		X.xData.value('@LinkTypeId','int') LinkTypeId
FROM @FileData.nodes ('/postlinks/row') AS X(xData)
GO

-- Creating a Temp Table that we will use to filter out the inconsistent data
CREATE TABLE #TempPostLinksFix
(
Id int PRIMARY KEY NOT NULL,
CreationDate datetime NOT NULL,
PostId int NOT NULL,
RelatedPostId int NOT NULL,
LinkTypeId int NOT NULL
)
GO

-- Filtering and inserting the consistent data into the Temp Table
INSERT INTO #TempPostLinksFix
SELECT PL.Id, PL.CreationDate, PL.PostId, PL.RelatedPostId, PL.LinkTypeId
FROM PostLinks AS PL
INNER JOIN Posts AS P
	ON P.Id = PL.PostId
INNER JOIN Posts AS P2
	ON P2.Id = PL.RelatedPostId
GO

-- Inserting the consistent back into the main PostLinks table. You will have to DELETE/DROP the PostLinks table first
INSERT INTO PostLinks
SELECT PL.Id, PL.CreationDate, PL.PostId, PL.RelatedPostId, PL.LinkTypeId
FROM #TempPostLinksFix AS PL
GO

-- It is possible to instead use 2 temp tables instead (which would be the better approach rather than dropping the "production" table)
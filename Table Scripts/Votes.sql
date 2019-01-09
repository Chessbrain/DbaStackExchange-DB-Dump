-- Votes

-- Inserting data from the XML file into the Votes table
DECLARE @FileData XML

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'DbDumpLocation\Votes.xml', SINGLE_BLOB) AS X

INSERT INTO Votes
SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@PostId','int') PostId,
		X.xData.value('@VoteTypeId','int') VoteTypeId,
		X.xData.value('@CreationDate','datetime') CreationDate
FROM @FileData.nodes('/votes/row') AS X(xData)
GO

-- Creatinga Temp Table to house the correct and consistent data
CREATE TABLE #TempVotesFix(
Id int PRIMARY KEY,
PostId int NOT NULL,
VoteTypeId int NOT NULL,
CreationDate datetime NOT NULL
)
GO
-- Inserting the consistent data into the Temp Table
INSERT INTO #TempVotesFix
SELECT	V.Id, 
		V.PostId,
		V.VoteTypeId,
		V.CreationDate 
FROM Votes AS V
INNER JOIN Posts AS P
	ON P.Id = V.PostId
GO
-- Inserting the consistent data into the main Votes table. You will need to either delete or drop the table before doing this.
INSERT INTO Votes
SELECT V.Id, V.PostId,V.VoteTypeId,V.CreationDate 
FROM #TempVotesFix AS V
GO

-- It is possible to instead use 2 temp tables instead (which would be the better approach rather than dropping the "production" table)
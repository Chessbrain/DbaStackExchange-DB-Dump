-- Users

-- Inserting data from the XML file into the Users table
DECLARE @FileData XML;

SELECT @FileData = BulkColumn FROM OPENROWSET(BULK 'D:\StackExchange DB DUMP\stackexchange\dba.stackexchange.com\Users.xml', SINGLE_BLOB) AS X;

INSERT INTO Users
SELECT	X.xData.value('@Id','int') Id,
		X.xData.value('@Reputation','int') Reputation,
		X.xData.value('@CreationDate','datetime') CreationDate,
		X.xData.value('@DisplayName','nvarchar(100)') DisplayName,
		X.xData.value('@LastAccessDate','datetime') LastAccessDate,
		X.xData.value('@WebsiteUrl','nvarchar(MAX)') WebsiteUrl,
		X.xData.value('@Location','nvarchar(50)') [Location],
		X.xData.value('@AboutMe','nvarchar(MAX)') AboutMe,
		X.xData.value('@Views','int') [Views],
		X.xData.value('@UpVotes','int') Upvotes,
		X.xData.value('@DownVotes','int') DownVotes,
		X.xData.value('@AccountId','int') AccountId
FROM @FileData.nodes('/users/row') AS X(xData)

SELECT * FROM Users
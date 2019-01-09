# DBA StackExchange DB Dump

This is a small project that takes the XML file DB Dumps from Stack Exchange (specifically DBA Stack Exchange), normalizing it and importing it into SQL Server as a relational database. Expect a rough size of a 2GB database once you're done with this project.

If you are using any version of SQL Server older than 2016, then you won't be able to use the PostTags script. This version of the project uses the "string_split" function to deal with arrays, which did not exist prior to 2016.

This project can be applied to any of the other StackExchange DB Dumps. So if you would like to import the math.stackexchange db dump instead, you can still use the same solution used in this project (you would simply have to change the table names and attributes).

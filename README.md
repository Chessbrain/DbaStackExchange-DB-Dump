# DBA StackExchange DB Dump

This is a small project that takes the XML file DB Dumps from Stack Exchange (specifically DBA Stack Exchange), normalizing it and importing it into SQL Server as a relational database. Expect a rough size of a 2GB database once you're done with this project.

If you are using any version of SQL Server older than 2016, then you won't be able to use the PostTags script. This version of the project uses the "string_split" function to deal with arrays, which did not exist prior to 2016.

This project can be applied to any of the other StackExchange DB Dumps. So if you would like to import the math.stackexchange db dump instead, you can still use the same solution used in this project (you would simply have to change the table names and attributes).

### Alter Commands
This folder holds the script that adds FK and PK constraints to the tables. Using this solution you will have to import the data in without the constraints first, as most of the tables in this db dump already have consistent data (with few exceptions).

### Database Schema
This folder holds the two Schema scripts. One (DatabaseSchema) has the FK and PK included, the other (DatabaseSchemaNoFK) only has PK included. If you want to follow this solution, use the NoFK version... I have included the FK and PK version in case someone had a different idea for a solution and wanted to skip running more than one script for a full database schema.

### Table Scripts
This folder holds all of the scripts for inserting data into the tables, they all have comments explaining what each script does.

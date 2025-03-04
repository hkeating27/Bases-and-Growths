# Bases-and-Growths
A Database-oriented program for comparing entries in SQL tables displayed via R plot
#Running instructions:
1.) Ensure all files are in the same directory
2.) Open the command line and cd to said directory
3.) Use "python setup_db.py" to create the database. Ensure the tables are filled with what you want to compare; it is currently designed for Fire Emblem characters.
4.) Use "RScript query_stats.R" to create the R plot
#Debugging instructions:
a.) Package error: You may not have the requisite packages. Open the R console (not the Windows command line) and use the commands install.packages("DBI"), install.packages("RSQLite"), and install packages("ggplot2") (Database connection, SQLite Database, and plotting respectively)
b.) RScript error: Your computer may not have R installed. Download R and ensure it is in your system path. In Windows go to "Edit system environment variables", click the "Environment Variables" button, and in either/both sections edit the Path variable add a new one that points to the folder R.exe is in; the default is C:\Users\name\Program Files\R\R-4.4.3\bin.
c.) Directory error: make sure the command line is in the correct directory. Very obvious but easy mistake.
Warning: Program was originally created to mathematically prove that my favorite character was better than my sister's. Do not use this to store credit card information.

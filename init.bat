@echo off

rem clear the input variable
set "dbfile="

rem get the user-input database filename
set /p dbfile="Enter sqlite database file to initialize:"

if "%dbfile%" == "" GOTO Error
GOTO Processing

:Processing
 echo Processing %dbfile%...
 sqlite3 %dbfile% > settings/schema.sql .schema
 
 echo Creating new master database "maindb.db"...
 sqlite3 maindb.db < settings/schema_sqlite.sql
 
 GOTO End

:Error
 echo Enter a database file name and  try again

:End
 pause;
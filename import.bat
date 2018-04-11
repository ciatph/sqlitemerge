::----------------------------------------------------------
:: Merge a single sqlite database file's data to the 
:: maindb.db master database file
:: angel;20180411
::----------------------------------------------------------

@echo off
del /F /Q header_*.sql

rem clear the input variable
set "dbfile="

rem get the user-input database filename
echo Enter sqlite database file contents to export:
set /p dbfile="";
cls

if "%dbfile%" == "" GOTO Error
GOTO Processing

:Processing
 @echo on
 echo Exporting database %dbfile%'s tables and contents...
 sqlite3 %dbfile% < settings/commands.txt

 echo Importing %dbfile% into maindb.db...
 sqlite3 maindb.db < header_cultural.sql
 sqlite3 maindb.db < header_f_basal.sql
 sqlite3 maindb.db < header_f_side.sql
 sqlite3 maindb.db < header_f_top.sql
 sqlite3 maindb.db < header_farmer.sql
 sqlite3 maindb.db < header_farmland.sql
 sqlite3 maindb.db < header_notes.sql
 sqlite3 maindb.db < header_pest_disease.sql
 sqlite3 maindb.db < header_photos.sql
 sqlite3 maindb.db < header_production.sql
 sqlite3 maindb.db < header_users.sql
 
 del /F /Q header_*.sql
 @echo off
 GOTO End

:Error
 echo Enter a database file name and  try again

:End
 pause;
::------------------------------------------------------
:: Automatically merge all sqlite database files with 
:: filename[dbName] from subdirectories numbered 
:: 00, 01, ... 0N
::------------------------------------------------------

@echo off 
:: maximum number of directories to traverse
:: starts at 00, 01, ... 0N
set /A maxDir=5

:: maximum number of wait interval in seconds
:: to process next database file
set /A maxSec=3

:: numerical directory index to start traversal
set /A index=0

:: sqlite database filename for each sub directory
set dbName=AppDataCollect.db

:: folder name containing 00,01,..0N database directories
set dbDirectory=databases

del /F /Q *.sql
GOTO Processing

:: export all rows from all tables in a database
:Processing 
 if %index% LSS 10 set dbfile=%dbDirectory%/0%index%/%dbName%
 if %index% GEQ 10 set dbfile=%dbDirectory%/%index%/%dbName%
 
 :: generate export data sql script
 if exist %dbfile% (
   @echo on
   echo Exporting database %dbfile%'s contents...
 
   :: export data
   sqlite3 %dbfile% < settings/commands_tables.txt
   :: insert exported data to master database
   sqlite3 maindb.db < insert_data.sql 
 )
 
 @echo off
 
 :: increment directory index counter
 set /A index += 1
 
 :: clean residual files
 del /F /Q *.sql
 
 :: pause for [maxSec] seconds
 choice /d y /t %maxSec% > nul
 
 if %index% LSS %maxDir% GOTO Processing
 if %index% EQU %maxDir% GOTO End  
 
 @echo off


:Error
 echo Enter a database file name and  try again

:End
 pause;
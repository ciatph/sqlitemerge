::----------------------------------------------------------
:: Create a master sqlite database file 
:: - following the AppDataCollect schema,
:: - modified to have an autoincrement _id index
:: angel;20180411
::----------------------------------------------------------

@echo off

:: settings path
set settingsPath=settings/constants

:: merged database filename
set masterdb="maindb.db"

:: create tables script filename
set sqlScript="create_tables_constants.sql"

:: list of constant SQL tables to create
set fileConstants=%settingsPath%/list_constants.txt

GOTO Main

:Main
  rem clear the input variable
  set "dbfile="

  set /A index=0

  rem get the user-input database filename
  set /p dbfile="Enter sqlite database file to initialize (Press enter if none):"

  if "%dbfile%" == "" set dbfile=databases/appdatacollect.db
  echo Processing %dbfile%...

  echo Creating new master database "maindb.db"...
  sqlite3 maindb.db < settings/schema_sqlite.sql

  GOTO CreateConstants
EXIT /B 0
 
 
:: Create the constant SQL tables inside the merged database
:CreateConstants 
  timeout /t 5 /nobreak
  echo Creating tables for constants...
   
  :: set the sql script header
  echo PRAGMA foreign_keys=OFF; >> %sqlScript%
  echo BEGIN TRANSACTION; >> %sqlScript%

  SETLOCAL ENABLEDELAYEDEXPANSION
  (for /f "tokens=*" %%x in (%fileConstants%) do (
    set /A index += 1
    
    (if !index! GEQ 2 (
      echo CREATE TABLE %%x ^(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT^)^; >> %sqlScript%
    ))
  ))

  :: Set the sql script footer
  echo COMMIT; >> %sqlScript%
  timeout /t 5 /nobreak
  sqlite3 %masterDb% < %sqlScript%  

  :: Insert data into the created constant tables
  echo Inserting data into constant tables...
  insert_constants
 EXIT /B 0

:Error
 echo Enter a database file name and  try again

:End
 pause;
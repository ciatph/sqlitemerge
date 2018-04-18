::----------------------------------------------------------
:: Insert one-column values for an SQL table that has
:: only (1) column. See /constants/*.txt for format
:: angel;20180417
::----------------------------------------------------------

@echo off

set tableName=""
set insertScript=""
set sqlScript=insert_values.sql
set masterDb=maindb.db
set fileRowCount=count.txt
set settingsPath=settings/constants
set /A count=0
set /A index=0
set /A indexList=0

set fileConstants=%settingsPath%/list_constants.txt

GOTO ProcessTables

:: Read and process the constants SQL tables list
:ProcessTables
  del *.sql
  del *.txt

  SETLOCAL ENABLEDELAYEDEXPANSION
  (for /f "tokens=*" %%x in (%fileConstants%) do (
    set /A indexList += 1
    (if !indexList! GEQ 2 (
      CALL :InsertData %%x
    ))
  ))
 EXIT /B 0


:: Insert data as read from the SQL constants table list
:InsertData
  :: set the sql script header
  echo PRAGMA foreign_keys=OFF; >> %sqlScript%
  echo BEGIN TRANSACTION; >> %sqlScript%

  SETLOCAL ENABLEDELAYEDEXPANSION
  (for /f "tokens=*" %%x in (%settingsPath%/%~1.txt) do (
    set /A index += 1

    (if !index! == 2 (
      :: set the current SQL table name
      set tableName=%%x

      :: Count current SQL table contents
      sqlite3 %masterdb% "SELECT COUNT(*) FROM !tableName!" > %fileRowCount%
      set /p count=<%fileRowCount%
    ) else (
      :: insert values into the current SQL table
      if !index! GEQ 4 (
        (if !count! == 0 (
          :: Insert values into the current SQL table only if its empty (count=0)
          echo INSERT INTO !tableName! ^(name^) VALUES ^(^'%%x^'^); >> %sqlScript%
        ))           
      )
    ))
  ))

  :: Set the sql script footer
  echo COMMIT; >> %sqlScript%

  :: Execute the insert data sql script
  if %count% EQU 0 (
    sqlite3 %masterDb% < %sqlScript%
    echo Inserting values to table !tableName!...
  ) else (
    echo Skipping insert.. table count is %count%
  )

  GOTO Clean
  EXIT /B 0

:Clean
  del *.sql
  del *.txt
  timeout /t 3 /nobreak
 EXIT /B 0

:END
  pause;
  EXIT /B 0
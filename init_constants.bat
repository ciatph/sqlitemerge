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

set fileName=%settingsPath%/sel_soil_type.txt

GOTO InsertData

:InsertData
  del *.sql
  del *.txt

  :: set the sql script header
  echo PRAGMA foreign_keys=OFF; >> %sqlScript%
  echo BEGIN TRANSACTION; >> %sqlScript%

  SETLOCAL ENABLEDELAYEDEXPANSION
  (for /f "tokens=*" %%x in (%fileName%) do (
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
 EXIT /B 0

:END
  pause;
  EXIT /B 0
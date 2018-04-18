::----------------------------------------------------------
:: Delete created and residual files.
:: angel;20180411
::----------------------------------------------------------

@echo off

GOTO Main

:Main
  rem Clear the input variable
  set "resetAll="

  echo Are you sure you want to reset everything?
  set /p resetAll="";

  if "%resetAll%" == "" GOTO End

  del *.sql
  del *.csv
  del *.db

  :: Remove references to /databases
  git remote rm databases 
  git rm -r databases
  rmdir /S /Q databases

  :: Restore /databases to original state
  git reset HEAD databases
  git checkout databases
EXIT /B 0
 
:End
 EXIT /B 0
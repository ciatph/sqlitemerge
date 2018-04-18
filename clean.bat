::----------------------------------------------------------
:: Delete created and residual files.
:: angel;20180411
::----------------------------------------------------------

@echo off

GOTO Main

:Main
  rem clear the input variable
  set "resetAll="

  echo Are you sure you want to reset everything?
  set /p resetAll="";

  if "%resetAll%" == "" GOTO End
  
  del *.sql
  del maindb.db
EXIT /B 0
 
:End
 pause;
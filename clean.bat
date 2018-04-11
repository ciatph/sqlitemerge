::----------------------------------------------------------
:: Delete created and residual files.
:: angel;20180411
::----------------------------------------------------------

@echo off

rem clear the input variable
set "resetAll="

echo Are you sure you want to reset everything?
set /p resetAll="";

if "%resetAll%" == "" GOTO End
GOTO Processing

:Processing
 del header_*.sql
 del maindb.db
 del schema.sql
 GOTO End
 
:End
 pause;
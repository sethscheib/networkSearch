:::::::::::::::::::::::::::::::::::::::::::::
:: designLaunch
:: Opens job folder based on user input, customer name and job number.
:: Author: Seth Schieb
:: Version 1.0
:: Added to git
:::::::::::::::::::::::::::::::::::::::::::::

@echo off

::adjust window sizing
mode con: cols=40 lines=5

::Get input from user
set /p varcust="Customer: "
set /p varnum="Job Number: "

::search directory using customer name as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "\\sts2.local\DFS\Design\%varcust%*"') do set customerfolder=%%a

::Set auto completed path
set pth="K:\%customerfolder%\"

::search directory using job number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "\\sts2.local\DFS\Design\%customerfolder%\%varnum%*"') do set jobfolder=%%a


::Set auto completed path
set pth="K:\%customerfolder%\%jobfolder%\"

::Cleanup path string working in escape characters
::& => ^&
setlocal EnableDelayedExpansion
set "pth=%pth:&=^&%"

::Open explorer to the found path
explorer %pth%

exit
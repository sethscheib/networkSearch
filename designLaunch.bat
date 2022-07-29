:::::::::::::::::::::::::::::::::::::::::::::
:: designLaunch
:: Opens job folder based on user input, customer name and job number.
:: Author: Seth Schieb
:: Version 0.2.20220729
:: Added to git
:::::::::::::::::::::::::::::::::::::::::::::

@echo off

::adjust window sizing
mode con: cols=40 lines=5

::Get input from user
set /p varcust="Customer: "
set /p varnum="Job Number: "

::search directory using customer name as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "K:\%varcust%*"') do set customerfolder=%%a

::search directory using job number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "K:\%customerfolder%\%varnum%*"') do set jobfolder=%%a


::Set auto completed path
set "pth=K:\%customerfolder%\%jobfolder%\"

::Open explorer to the found path
explorer %pth%

exit
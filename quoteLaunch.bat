:::::::::::::::::::::::::::::::::::::::::::::
:: quoteLaunch
:: Opens quote folder based on user input, customer name and quote number.
:: Author: Seth Schieb
:: Version 0.3.20220801
:: Added to git
:::::::::::::::::::::::::::::::::::::::::::::

@echo off

::adjust window sizing
mode con: cols=40 lines=5

::Get input from user
set /p varcust="Customer: "
set /p varnum="Quote Number: "

::search directory using quote number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "\\sts2.local\DFS\Quotes\CUSTOMER\%varcust%*"') do set customerfolder=%%a

::Set auto completed path
set "pth=Q:\CUSTOMER\%customerfolder%\2022 Quotes\"

::search directory using quote number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "\\sts2.local\DFS\Quotes\CUSTOMER\%customerfolder%\2022 Quotes\%varnum%*"') do set quotefolder=%%a


::Set auto completed path
set "pth=Q:\CUSTOMER\%customerfolder%\2022 Quotes\%quotefolder%\"

::Cleanup path string working in escape characters
::& => ^&
setlocal EnableDelayedExpansion
set "pth=%pth:&=^&%"

::Open explorer to the found path
explorer %pth%

exit
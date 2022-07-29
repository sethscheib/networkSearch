:::::::::::::::::::::::::::::::::::::::::::::
:: quoteLaunch
:: Opens quote folder based on user input, customer name and quote number.
:: Author: Seth Schieb
:: Version 0.2.20220729
:: Added to git
:::::::::::::::::::::::::::::::::::::::::::::

@echo off

::adjust window sizing
mode con: cols=40 lines=5

::Get input from user
set /p varcust="Customer: "
set /p varnum="Quote Number: "

::search directory using quote number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "Q:\CUSTOMER\%varcust%*"') do set customerfolder=%%a

::search directory using quote number as a wildcard
for /f "delims=" %%a in ('dir /b /ad /on "Q:\CUSTOMER\%customerfolder%\2022 Quotes\%varnum%*"') do set quotefolder=%%a


::Set auto completed path
set "pth=Q:\CUSTOMER\%customerfolder%\2022 Quotes\%quotefolder%\"

::Open explorer to the found path
explorer %pth%

exit
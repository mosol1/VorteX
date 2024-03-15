@echo off
title Vortex [Registry Backup] ^| Creating...
echo Creating a registry Backup...

REM Get current date and time
for /f "tokens=2 delims==" %%I in ('wmic os get localdatetime /value') do set "dt=%%I"
set "YYYY=%dt:~0,4%"
set "MM=%dt:~4,2%"
set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%"
set "Min=%dt:~10,2%"
set "Sec=%dt:~12,2%"

REM Format the date and time
set "formattedDateTime=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

REM Create Vorted [Backup] Path in %USERPROFILE%\OneDrive\Desktop
if not exist "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\" (
    mkdir "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\" >nul 2>&1
    echo [ Created %USERPROFILE%\OneDrive\Desktop\Vorted [Backup] Path ]
)

REM Create folder with date and time in %USERPROFILE%\OneDrive\Desktop\Vorted [Backup]
mkdir "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%" >nul 2>&1
cd /d "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%" >nul 2>&1

REM Backing up registry keys for %USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%
REG SAVE HKLM\SOFTWARE "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%\Software.reg" >nul 2>&1
REG SAVE HKLM\SYSTEM "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%\System.reg" >nul 2>&1
REG SAVE HKU\.DEFAULT "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%\Default.reg" >nul 2>&1
REG SAVE HKLM\SECURITY "%USERPROFILE%\OneDrive\Desktop\Vorted [Backup]\%formattedDateTime%\Security.reg" >nul 2>&1

REM Create Vorted [Backup] Path in %USERPROFILE%\Desktop
if not exist "%USERPROFILE%\Desktop\Vorted [Backup]\" (
    mkdir "%USERPROFILE%\Desktop\Vorted [Backup]\" >nul 2>&1
    echo [ Created %USERPROFILE%\Desktop\Vorted [Backup] Path ]
)

REM Create folder with date and time in %USERPROFILE%\Desktop\Vorted [Backup]
mkdir "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%" >nul 2>&1
cd /d "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%" >nul 2>&1

REM Backing up registry keys for %USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%
REG SAVE HKLM\SOFTWARE "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%\Software.reg" >nul 2>&1
REG SAVE HKLM\SYSTEM "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%\System.reg" >nul 2>&1
REG SAVE HKU\.DEFAULT "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%\Default.reg" >nul 2>&1
REG SAVE HKLM\SECURITY "%USERPROFILE%\Desktop\Vorted [Backup]\%formattedDateTime%\Security.reg" >nul 2>&1


echo Registry Backup Completed Sucessfuly!, all files exported to your Desktop in Vorted [Backup]folder\%formattedDateTime%
echo Press any key to close...

pause >nul

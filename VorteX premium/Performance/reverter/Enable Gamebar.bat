@echo off

:: Important: This script assumes you know the exact changes made earlier and modifies the registry accordingly. 
::           Proceed with extreme caution and create a backup before running this script.

:: Setting keys and values based on assumptions (verify the originals before running)
set gameDVRKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR"
set gameBarKey="HKEY_CURRENT_USER\System\GameConfigStore"
set appCaptureValue="AppCaptureEnabled"
set historicalCaptureValue="HistoricalCaptureEnabled"
set gameDVRValue="GameDVR_Enabled"
set originalValue=1  **Assuming the original value was 1, verify this**

::  Set GameDVR and HistoricalCaptureEnabled in GameDVR key (assuming originals)
reg add "%gameDVRKey%" /v %appCaptureValue% /t REG_DWORD /d %originalValue% /f > nul 2>&1
reg add "%gameDVRKey%" /v %historicalCaptureValue% /t REG_DWORD /d %originalValue% /f > nul 2>&1

:: Set GameDVR in GameConfigStore key (assuming original)
reg add "%gameBarKey%" /v %gameDVRValue% /t REG_DWORD /d %originalValue% /f > nul 2>&1 

:: Informational message
echo Reverted the changes made to the Game Bar registry keys (assuming originals). You may need to restart your computer for changes to take full effect.

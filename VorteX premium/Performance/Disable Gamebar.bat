@echo off

:: Important: Always create a registry backup before making any changes!

:: Setting keys and values to disable Game Bar
set gameDVRKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameDVR"
set gameBarKey="HKEY_CURRENT_USER\System\GameConfigStore"
set appCaptureValue="AppCaptureEnabled"
set historicalCaptureValue="HistoricalCaptureEnabled"
set gameDVRValue="GameDVR_Enabled"
set newValue=0

::  Disable GameDVR and HistoricalCaptureEnabled in GameDVR key
reg add "%gameDVRKey%" /v %appCaptureValue% /t REG_DWORD /d %newValue% /f > nul 2>&1
reg add "%gameDVRKey%" /v %historicalCaptureValue% /t REG_DWORD /d %newValue% /f > nul 2>&1

:: Disable GameDVR in GameConfigStore key
reg add "%gameBarKey%" /v %gameDVRValue% /t REG_DWORD /d %newValue% /f > nul 2>&1 

:: Informational message
echo Xbox Game Bar settings likely disabled. You may need to restart your computer for changes to fully take effect.

@echo off

:: Important: This script assumes the original value was 1. Verify this before running!

:: Key and value for Game Mode
set gameModeKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameConfig"
set gameModeValue="GameDVR_HonoredBySystemPolicy"

:: Assuming the original value was 1 (verify before running)
set originalValue=1

:: Restore the value
reg add "%gameModeKey%" /v %gameModeValue% /t REG_DWORD /d %originalValue% /f > nul 2>&1

echo Reverted Game Mode registry changes (assuming original value was 1). Restart may be required.

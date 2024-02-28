@echo off

:: Important: This script assumes the original value was 0. Verify this before running!

:: Key and value for Fullscreen Optimizations
set fullscreenKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameConfig"
set fullscreenValue="GameDVR_FSEnabled"

:: Assuming the original value was 0 (verify before running)
set originalValue=0

:: Restore the value
reg add "%fullscreenKey%" /v %fullscreenValue% /t REG_DWORD /d %originalValue% /f > nul 2>&1

echo Reverted Fullscreen Optimizations registry changes (assuming original value was 0). Restart may be required.

@echo off

:: Important: Modifying the registry can be risky. Only proceed if you understand the potential consequences and have a registry backup.

:: Key and value for Fullscreen Optimizations
set fullscreenKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameConfig"
set fullscreenValue="GameDVR_FSEnabled"

:: Set registry value to 1 (enable)
reg add "%fullscreenKey%" /v %fullscreenValue% /t REG_DWORD /d 1 /f > nul 2>&1

:: Informational message
echo Fullscreen Optimizations likely enabled. You may need to restart your computer for the changes to take full effect.

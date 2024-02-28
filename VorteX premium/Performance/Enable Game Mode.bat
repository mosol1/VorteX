@echo off

:: Important: Modifying the registry can be risky. Only proceed if you understand the potential consequences and have a registry backup.

:: Key and value for Game Mode
set gameModeKey="HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\GameConfig"
set gameModeValue="GameDVR_HonoredBySystemPolicy"

:: Set registry value to 2 (enable)
reg add "%gameModeKey%" /v %gameModeValue% /t REG_DWORD /d 2 /f > nul 2>&1

:: Informational message
echo Game Mode likely enabled. You may need to restart your computer for the changes to take full effect.

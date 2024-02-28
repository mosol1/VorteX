@echo off

:: Warning: This script assumes you have good reason to disable FSO. Proceed with caution! 

:: Key and value to disable FSO (adjust if needed)
set fsKey="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel"
set fsValue="obcaseinsensitive" 

:: Set registry value to 0 (disable)
reg add "%fsKey%" /v %fsValue% /t REG_DWORD /d 0 /f > nul 2>&1 

:: Informational message
echo FSO setting likely disabled. You may need to restart for changes to take full effect.

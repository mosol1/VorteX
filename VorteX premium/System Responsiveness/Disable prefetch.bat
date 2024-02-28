@echo off

:: Important: Modifying the registry can have unintended consequences. Proceed only if you fully understand the risks and have a backup.

:: Key and value for Prefetch
set prefetchKey="HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters"
set prefetchValue="EnablePrefetcher"

:: Set registry value to 0 (disable)
reg add "%prefetchKey%" /v %prefetchValue% /t REG_DWORD /d 0 /f > nul 2>&1

:: Informational message
echo Prefetch likely disabled. A system restart might be required for changes to take full effect.

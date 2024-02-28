rem Disable Search (Cortana/to restore run SFC scan)
winget uninstall "cortana"
takeown /s %computername% /u %username% /f "%WINDIR%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe"
icacls "%WINDIR%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" /inheritance:r /grant:r %username%:F
ren "%WINDIR%\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\SearchHost.exe" "SearchHost.exe.bak"

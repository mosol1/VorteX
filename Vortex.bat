@echo off
rem Set the desired width and height for the console window
mode con: cols=120 lines=30
Title VorteX
setlocal enabledelayedexpansion

:Preparing
mode 120,30
TITLE Preparing...
SETLOCAL ENABLEDELAYEDEXPANSION
echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$                                /$$          ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$          ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$    ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/    ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/     ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$     ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$    ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/    "
echo.
echo PreOptimization     
echo.
echo.
echo "                                           Getting things ready for you...                                      "
echo.
:: Create Vortex Path
if not exist "C:\Vortex\" (
    mkdir "C:\Vortex" >nul 2>&1
)

if not exist "C:\Vortex\Logs\" (
    mkdir "C:\Vortex\Logs\" >nul 2>&1
)
timeout /t 10 /nobreak > nul
echo.
echo.
cls
Title PreOptimization
echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$                                /$$          ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$          ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$    ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/    ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/     ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$     ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$    ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/    "
echo.
echo PreOptimization     
echo.
echo.
echo "                                           PreOptimizations Running...                                              "
echo.
timeout /t 4 /nobreak > nul
echo.
echo.


:: Disable User Account Control
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f >nul 2>&1

:: Check if System Restore command exists
set "sysRestoreCmd=%SystemRoot%\System32\wbem\SystemRestore.exe"
if not exist "!sysRestoreCmd!" (
    echo Error: System Restore command not found.
    set /p "                                               choice=Couldn't create a restore point. Do you still want to continue? [Y/N]: "
    if /i "!choice!"=="N" (
        echo Exiting script.
        exit /b
    ) else if /i "!choice!"=="Y" (
goto Check For Requirements
    ) else (
        echo Invalid choice. Exiting script.
        exit /b
    )
)

:: Automatic Restore Point
if not exist "C:\Vortex\Logs\ResPoint" (
echo "                                          Creating a restore point...                                               "
    powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Vortex Tweaks' -RestorePointType 'MODIFY_SETTINGS'" & (
        if errorlevel 1 (
            echo Error: Failed to create restore point.
            set /p "choice=Do you still want to continue? [Y/N]: "
            if /i "!choice!"=="N" (
                echo Exiting script.
                exit /b
            ) else if /i "!choice!"=="Y" (
                echo Continuing at your own risk.
            ) else (
                echo Invalid choice. Exiting script.
                exit /b
            )
        ) else (
            echo Restore point created.
        )
    )
    mkdir "C:\Vortex\Logs\ResPoint" >nul 2>&1
) else (
    echo Restore Point Already Created
)
:start
Title Choose color
cls
echo Choose a color:
echo 0 = Black          8 = Gray
echo 1 = Navy           9 = Blue
echo 2 = Green          A = Lime
echo 3 = Teal           B = Aqua
echo 4 = Maroon         C = Red
echo 5 = Purple         D = Fuchsia
echo 6 = Olive          E = Yellow
echo 7 = Silver         F = White

set /p "color_choice=Enter the color code (0-7, 8-F): "

rem Validate color choice
if not "%color_choice%"=="0" if not "%color_choice%"=="1" if not "%color_choice%"=="2" if not "%color_choice%"=="3" if not "%color_choice%"=="4" if not "%color_choice%"=="5" if not "%color_choice%"=="6" if not "%color_choice%"=="7" if not "%color_choice%"=="8" if not "%color_choice%"=="9" if not "%color_choice%"=="A" if not "%color_choice%"=="B" if not "%color_choice%"=="C" if not "%color_choice%"=="D" if not "%color_choice%"=="E" if not "%color_choice%"=="F" (
    echo Invalid color choice!
    timeout /t 1 >nul
    goto start
)

rem Set the color
color %color_choice%

Title Checking system for PowerShell 1.0
:Check For Requirements
if not exist "%windir%\system32\WindowsPowerShell\v1.0\powershell.exe" (
    call:VortexTweaks
    echo.
    echo Missing PowerShell 1.0
    echo press C to continue anyway
    choice /c:"CQ" /n /m " [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)
Title checking system for Admin rights
::Get Admin Rights
rmdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
mkdir %SystemDrive%\Windows\system32\adminrightstest >nul 2>&1
if %errorlevel% neq 0 (
    echo Run Vortex as Admin
    powershell -NoProfile -NonInteractive -Command start -verb runas "'%~s0'" >nul 2>&1
    if !errorlevel! equ 0 exit /b
    call:VortexTweaks
    echo.
    echo Vortex is not running as Admin!
    echo Some optimizations won't work. Continue anyway?
    echo.
    choice /c:"CQ" /n /m " [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)
Title checking for Internet Access
::Check For Internet
Ping www.google.nl -n 1 -w 1000 >nul
if %errorlevel% neq 0 (
    call:VortexTweaks
    echo.
    echo No Internet Connection
    echo press C to continue anyway
    choice /c:"CQ" /n /m " [C] Continue  [Q] Quit" & if !errorlevel! equ 2 exit /b
)

::Run CMD in 32-Bit
set SystemPath=%SystemRoot%\System32
if not "%ProgramFiles(x86)%"=="" (if exist %SystemRoot%\Sysnative\* set SystemPath=%SystemRoot%\Sysnative)
if "%processor_architecture%" neq "AMD64" (start "" /I "%SystemPath%\cmd.exe" /c "%~s0" & exit /b)
echo Proceeding to the next page...
timeout /t 2 >nul
cls
Title VorteX
:Homepage
rem Get OS Name
for /f "tokens=2 delims=:" %%a in ('systeminfo ^| find "OS Name"') do set "os_name=%%a"

rem Get System Type
for /f "tokens=2 delims=:" %%b in ('systeminfo ^| find "System Type"') do set "system_type=%%b"

rem Get Physical Memory
for /f "tokens=2 delims==" %%c in ('wmic OS get TotalVisibleMemorySize /Value ^| findstr "TotalVisibleMemorySize"') do set "TotalMem=%%c"
set /a TotalMem=TotalMem/1048576

rem Calculate the width of the console window
for /f "tokens=2 delims=: " %%w in ('mode con ^| findstr "Columns"') do set "console_width=%%w"

rem Clear the screen
cls

:: Greetings
for /f "tokens=1 delims=:" %%a in ("%time%") do set /a "hour=%%a" & if !hour! geq 0 if !hour! lss 12 (echo Good morning, %USERNAME%!) else if !hour! lss 18 (echo Good afternoon, %USERNAME%!) else (echo Good evening, %USERNAME%! )
echo                                                                     Os name:%os_name%

rem Print System Type
echo                                                                     System Type:            %system_type%

rem Print Physical Memory
echo                                                                     Physical Memory:                            %TotalMem% GB
										     		
                                                         
echo.

echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$                                /$$         ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$         ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$   ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/   ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/    ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$    ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$   ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/   ";
echo.
echo "
echo "                                                                                                                    ";
echo "                                                                                                                    ";
echo "           	[1] Optimizations        [2] CPU Boost       [3] GPU Boost       [4] Memory Tweaks                ";
echo "                                                                                                                    "
echo "                       [5] InputDelay[Keybd]      [6]InputDelay[Mouse]  [7] 0 Ping  [8] 0 Delay
echo.
echo                                 [9]                    [10] Cleaner
echo.
echo                           [A] Recommended Programs [F] FortniteBooster [G] GameOptiFlow
echo. 
echo                                     [U] UltimatePerfTweak [Win32PRIORITYGUIDE]
set /p ans="type your keys:"



if %ans%==1 (
goto M1
)
if %ans%==2 (
goto M2
)
if %ans%==3 (
goto M3
)
if %ans%==4 (
goto M4
)
if %ans%==5 (
goto M5
)
if %ans%==6 (
goto M6
)
if %ans%==7 (
goto M7
)
if %ans%==8 (
goto M8
)
if %ans%==9 (
goto M9
)
if %ans%==10 (
goto M10
)
if %ans%==A (
goto MA
)
if %ans%==a (
goto MA
)
if %ans%==F (
goto MF
)
if %ans%==f (
goto MF
)
if %ans%==G (
goto MG
)
if %ans%==g (
goto MG
)
if %ans%==U (
goto MU
)
if %ans%==u (
goto MU
)

 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage


:M1
cls
echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$     Press [M] to go to Menu    /$$         ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$         ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$   ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/   ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/    ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$    ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$   ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/   ";
echo.
echo "
echo "                                                                                                                    ";
echo "                                                                                                                    ";
echo "                             [1] Disable Gamebar  [2]Bcdedit Tweaks  [3]DWM Twaks                                                 ";
echo.                                   
echo                               [4] 






rem rest here( m2, m3 etc)


:M10
rem Cleaner
cls
echo "  _   _________                     ";
echo " | | / / ___/ /__ ___ ____  ___ ____";
echo " | |/ / /__/ / -_) _ \`/ _ \/ -_) __/";
echo " |___/\___/_/\__/\_,_/_//_/\__/_/   ";
echo "                                    ";
echo.
echo press C to continue anyway
echo "                                         [C] Continue  [M] Menu                                                    "
set /p ans="type your keys:" 
if %ans%==C (
goto VC
)
if %ans%==c (
goto VC
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
ELSE (
echo Invalid Input, Goint to menu...
goto Homepage
:VC
echo                Cleaning temporary files...
timeout /t 2 >nul
del /q /s %TEMP%\*.*
timeout /t 1 >nul
echo               Temporary files cleaned.
timeout /t 2 >nul

echo                Cleaning cache...
cls
rmdir /q /s %LOCALAPPDATA%\Temp\*
echo                Cache cleaned.
timeout /t 2 >nul

echo                 Cleaning shader cache...
cls
del /q /s %LOCALAPPDATA%\Microsoft\Windows\INetCache\*.*
echo                Shader cache cleaned.
timeout /t 2 >nul

echo              Cleaning log files...
cls
del /q /s %USERPROFILE%\AppData\Local\Temp\*.log
echo              Log files cleaned.
timeout /t 2 >nul

echo             Cleaning browser cache...
cls
del /q /s %LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*.*
del /q /s %LOCALAPPDATA%\Mozilla\Firefox\Profiles\*\cache2\*.*
echo Browser cache cleaned.
timeout /t 2 >nul

echo           Cleaning DirectX shader cache...
cls
del /q /s %LOCALAPPDATA%\Microsoft\DirectX Shader Cache\*.*
echo        DirectX shader cache cleaned.
timeout /t 2 >nul

echo Cleaning prefetch data...
cls
del /q /s %WINDIR%\Prefetch\*.*
echo          Prefetch data cleaned.
timeout /t 2 >nul

echo         Cleaning thumbnail cache...
cls
del /q /s %USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer\thumbcache_*.db
echo        Thumbnail cache cleaned.
timeout /t 2 >nul

echo         Cleaning DNS cache...
cls
ipconfig /flushdns
echo          DNS cache cleaned.
timeout /t 2 >nul

echo          Disabling system animations...
cls
timeout /t 1 >nul
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "MinAnimate" /t REG_SZ /d "0" /f
echo System animations disabled.
timeout /t 2 >nul

echo        Running DeviceCleanup...
cls
timeout /t 2 >nul
set "BASE_DIR=C:\Vortex"
set "RESOURCES_DIR=%BASE_DIR%\resources\DeviceCleanup\x64"
set "EXE_URL=https://cdn.discordapp.com/attachments/1055581364784726048/1203358837223202856/DeviceCleanup.exe?ex=65d0ce40&is=65be5940&hm=febe7e29a7e079f7671512519a95f82480b5e20a308261cc436b934c74bb8d21"

echo       Creating folder structure...
timeout /t 2 >nul
mkdir "%RESOURCES_DIR%" 2>nul
if exist "%RESOURCES_DIR%" (
    echo             Resources folder created successfully.
) else (
 echo       Failed to create resources folder.
    pause
    goto Homepage
)

echo          Downloading DeviceCleanup.exe...
timeout /t 2 >nul
powershell -command "& { Invoke-WebRequest '%EXE_URL%' -OutFile '%RESOURCES_DIR%\DeviceCleanup.exe' }"
if exist "%RESOURCES_DIR%\DeviceCleanup.exe" (
    echo DeviceCleanup.exe downloaded successfully.
) else (
    echo         Failed to download DeviceCleanup.exe.
    pause
    goto Homepage
)

echo          Creating DeviceCleanup.ini...
timeout /t 2 >nul
echo. > "%RESOURCES_DIR%\DeviceCleanup.ini"
if exist "%RESOURCES_DIR%\DeviceCleanup.ini" (
    echo          DeviceCleanup.ini created successfully.
) else (
    echo       Failed to create DeviceCleanup.ini.
    pause
    goto Homepage
)

echo             Running DeviceCleanup...
timeout /t 2 >nul
start "" "%RESOURCES_DIR%\DeviceCleanup.exe"
echo            DeviceCleanup started.
timeout /t 5 >nul

echo 					All tasks completed successfully!
timeout /t 2 >nul
cls
goto Homepage


:MF
cls
echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$     Press [M] to go to Menu    /$$         ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$         ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$   ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/   ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/    ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$    ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$   ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/   ";
echo.
echo "        All These tweaks are automatic including the islc the setting are alredy set for best performance          ";
echo "                                                                                                                    ";
echo "                                                                                                                    ";
echo "                             [1] ISLC    [2] FortnitePerfMod    [3] FortniteResolution + Guide                      ";      
echo "                                                                                                                    ";
echo "                             [4] FortniteCommandLine            [5]                                                 ";

set /p ans="type your keys:"
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
if %ans%==1 (
goto MF-M1
)
if %ans%==2 (
goto MF-M2
)
if %ans%==3 (
goto MF-M3
)
if %ans%==4 (
goto MF-M4
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
ELSE (
echo Invalid Input, Goint to menu...
goto Homepage
rem ISLC
:MF-M1
cls
set "basedir=C:\Vortex"
set "foldername=ISLC"
set "shortcutname=Intelligent standby list cleaner.lnk"
set "islc_exe_url=https://cdn.discordapp.com/attachments/1055581364784726048/1202207199418646560/Intelligent_standby_list_cleaner_ISLC.exe?ex=65cc9db4^&is=65ba28b4^&hm=e411cbc55b24a21625ba9df155d1f967914d92e3108b93789d1743598fa8c690^&cc0-94f5-4bc7-aa50-4edcace00c91"
set "islc_config_url=https://cdn.discordapp.com/attachments/1055581364784726048/1202204701295116298/Intelligent_standby_list_cleaner_ISLC.exe.Config?ex=65cc9b60^&is=65ba2660^&hm=15512463b7ad96cff2345abd0f1b48462e6bc995f4dd728eed41babc5418a66c^&"
set "backup_url=https://cdn.discordapp.com/attachments/1055581364784726048/1202204751010467900/Intelligent_Standby_List_Cleaner_Backup.7z?ex=65cc9b6c^&is=65ba266c^&hm=43b7264d2e0c113d56f3b12c4d580920ef271a3106607989cf61628c62f2a75e^&"
set "islc_pdb_url=https://cdn.discordapp.com/attachments/1055581364784726048/1202204654805717042/Intelligent_standby_list_cleaner_ISLC.pdb?ex=65cc9b55^&is=65ba2655^&hm=746f4b688b26739895e3d30f8244bb9fcfe8aa15604e05d2d39128b41a65ecfe^&"

echo Checking if the folder exists...
if not exist "%basedir%\%foldername%\" (
    echo Folder does not exist, creating...
    mkdir "%basedir%\%foldername%"
    if not exist "%basedir%\%foldername%\" (
        echo Failed to create folder.
        timeout /t 1 > nul
        goto MF
    )
) else (
    echo Folder already exists.
)

echo Downloading files...

bitsadmin /transfer "ISLC_exe" %islc_exe_url% "%basedir%\%foldername%\Intelligent standby list cleaner ISLC.exe" > nul
echo ISLC.exe downloaded.
timeout /t 1 > nul

bitsadmin /transfer "ISLC_config" %islc_config_url% "%basedir%\%foldername%\Intelligent standby list cleaner ISLC.exe.Config" > nul
echo ISLC.exe.Config downloaded.
timeout /t 1 > nul

bitsadmin /transfer "Backup" %backup_url% "%basedir%\%foldername%\Intelligent Standby List Cleaner Backup.7z" > nul
echo Backup file downloaded.
timeout /t 1 > nul

bitsadmin /transfer "ISLC_pdb" %islc_pdb_url% "%basedir%\%foldername%\Intelligent standby list cleaner ISLC.pdb" > nul
echo ISLC.pdb downloaded.
timeout /t 1 > nul

echo All files downloaded successfully.

echo Creating shortcut for ISLC...
set "shortcuttarget=%basedir%\%foldername%\Intelligent standby list cleaner ISLC.exe"
set "startupfolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
set "shortcutpath=%startupfolder%\%shortcutname%"

echo [InternetShortcut] > "%shortcutpath%"
echo URL=%shortcuttarget% >> "%shortcutpath%"
echo IconIndex=0 >> "%shortcutpath%"
echo IconFile=%shortcuttarget% >> "%shortcutpath%"

echo Shortcut created successfully.

echo Running ISLC...
start "" "%basedir%\%foldername%\Intelligent standby list cleaner ISLC.exe"

echo Running ISLC on startup...
copy "%basedir%\%foldername%\%shortcutname%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"
echo.
echo press C to continue anyway
echo "                                         [C] Continue  [M] Menu                                                    "
set /p ans="type your keys:" 
if %ans%==C (
goto MF
)
if %ans%==c (
goto MF
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
ELSE (
echo Invalid Input, Goint to menu...
goto Homepage


rem the rest here(MF-M2 )
:MF-M3
rem FNresolution
cls
echo "                           _    __                     __      __  _                                                ";
echo "                          | |  / /_______  _________  / /_  __/ /_(_)___  ____  _____                               ";
echo "                          | | / / ___/ _ \/ ___/ __ \/ / / / / __/ / __ \/ __ \/ ___/                               ";
echo "                          | |/ / /  /  __(__  ) /_/ / / /_/ / /_/ / /_/ / / / (__  )                                ";
echo "                          |___/_/   \___/____/\____/_/\__,_/\__/_/\____/_/ /_/____/                                 ";
echo "                                                                                                                    ";
echo                                                                Press [M] to go to Menu
echo                     This is the best Fortnite resolution Guide of all types of PC's and Laptops      
echo.
echo.
echo                           [1] PC                           [2] Laptop
echo.
set /p ans="type your keys:"
if %ans%==1 (
goto RP
)
if %ans%==2 (
goto RL
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:RP
rem PC resolution
cls
echo "                           _    __                     __      __  _                                                ";
echo "                          | |  / /_______  _________  / /_  __/ /_(_)___  ____  _____                               ";
echo "                          | | / / ___/ _ \/ ___/ __ \/ / / / / __/ / __ \/ __ \/ ___/                               ";
echo "                          | |/ / /  /  __(__  ) /_/ / / /_/ / /_/ / /_/ / / / (__  )                                ";
echo "                          |___/_/   \___/____/\____/_/\__,_/\__/_/\____/_/ /_/____/                                 ";
echo "                                                                                                                    ";
echo                        Press [B] to go back                       Press [M] to go to Menu
echo                                        PC resolutions [1920x1080]       
echo.
echo.
echo                           [1] High-end PCs                          [2] Mid-end PCs
echo                                               [3] Low-end PCs
echo.
set /p ans="type your keys:"
if %ans%==1 (
goto RP-1
)
if %ans%==2 (
goto RP-2
)
if %ans%==3 (
goto RP-3
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
if %ans%==B (
goto MF-M3
)
if %ans%==b (
goto MF-M3
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:RP-1
rem High end PCs
cls
echo "                           _    __                     __      __  _                                                ";
echo "                          | |  / /_______  _________  / /_  __/ /_(_)___  ____  _____                               ";
echo "                          | | / / ___/ _ \/ ___/ __ \/ / / / / __/ / __ \/ __ \/ ___/                               ";
echo "                          | |/ / /  /  __(__  ) /_/ / / /_/ / /_/ / /_/ / / / (__  )                                ";
echo "                          |___/_/   \___/____/\____/_/\__,_/\__/_/\____/_/ /_/____/                                 ";
echo "                                                                                                                    ";
echo                                                                Press [M] to go to Menu
echo                                        High end PCs [1920x1080]       
echo.
echo.
echo                           	[1] 1720 x 1080  
echo                                          -Peterbot,AsianJeff. Better aim precision, Low input delay, + Fps boost
echo.
echo                            [2] 1680 x 1050 
echo                                          -Martoz  Better aim, low input day. Not too stretched + Fps
echo.
echo                            [3] 1550 x 1080
echo                                          -Pretty stretched(Wide) . Still playable Best wide resolution for Comp.     
echo.                                               
echo                                                                  [A] Apply a Resolution    
echo                                                                  [B] Go back
set /p ans="type your keys:"
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
if %ans%==B (
goto RP
)
if %ans%==b (
goto RP
)
if %ans%==A (
goto RA
)
if %ans%==a (
goto RA
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:RA
rem apply a resolution
echo This will open a program to set custom Fortnite resolution 
echo Make sure to check ReadOnly to make sure Fortnite doent modify the change back to default.
echo Press [C] to continue (this will open the program).
pause >nul
echo.
set "BASE_DIR=C:\Vortex"
set "RESOURCES_DIR=%BASE_DIR%\resources"
set "EXE_URL=https://cdn.discordapp.com/attachments/1055581364784726048/1203404593908949082/alphares_1.2.1_x64.exe?ex=65d0f8dd&is=65be83dd&hm=ce2963fff1e7d07052e5cdf8f5d37e51cc9677472e12acc15146d6195af0d294"
set "EXE_FILE=%RESOURCES_DIR%\alphares_1.2.1_x64.exe"

echo Downloading alphares_1.2.1_x64.exe...
timeout /t 2 >nul
mkdir "%RESOURCES_DIR%" 2>nul
powershell -command "& { Invoke-WebRequest '%EXE_URL%' -OutFile '%EXE_FILE%' }" -NoProfile -WindowStyle Hidden
timeout /t 2 >nul

if exist "%EXE_FILE%" (
    echo alphares.exe downloaded successfully.
) else (
    echo Failed to download alphares_1.2.1_x64.exe.
    pause
    goto RP-1
)

echo Running alphares...
timeout /t 2 >nul
start "" "%EXE_FILE%" /S

echo Task completed successfully.
timeout /t 5 >nul
goto RP-1

:RP-2
rem Mid end PCs
cls
echo "                           _    __                     __      __  _                                                ";
echo "                          | |  / /_______  _________  / /_  __/ /_(_)___  ____  _____                               ";
echo "                          | | / / ___/ _ \/ ___/ __ \/ / / / / __/ / __ \/ __ \/ ___/                               ";
echo "                          | |/ / /  /  __(__  ) /_/ / / /_/ / /_/ / /_/ / / / (__  )                                ";
echo "                          |___/_/   \___/____/\____/_/\__,_/\__/_/\____/_/ /_/____/                                 ";
echo "                                                                                                                    ";
echo                                                                Press [M] to go to Menu
echo                                        Mid end PCs [1920x1080]       
echo.
echo.
echo                           	[1] 1720 x 1080  
echo                                          -Peterbot,AsianJeff. Better aim precision, Low input delay, + Fps boost
echo.
echo                            [2] 1680 x 1050 
echo                                          -Martoz  Better aim, low input day. Not too stretched + Fps
echo.
echo                            [3] 1550 x 1080
echo                                          -Pretty stretched(Wide) . Still playable Best wide resolution for Comp.     
echo.                                               
echo                                                                  [A] Apply a Resolution    
echo                                                                  [B] Go back
set /p ans="type your keys:"
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
if %ans%==B (
goto RP
)
if %ans%==b (
goto RP
)
if %ans%==A (
goto RA
)
if %ans%==a (
goto RA
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:RA
rem apply a resolution
echo This will open a program to set custom Fortnite resolution 
echo Make sure to check ReadOnly to make sure Fortnite doent modify the change back to default.
echo Press [C] to continue (this will open the program).
pause >nul
echo.
set "BASE_DIR=C:\Vortex"
set "RESOURCES_DIR=%BASE_DIR%\resources"
set "EXE_URL=https://cdn.discordapp.com/attachments/1055581364784726048/1203404593908949082/alphares_1.2.1_x64.exe?ex=65d0f8dd&is=65be83dd&hm=ce2963fff1e7d07052e5cdf8f5d37e51cc9677472e12acc15146d6195af0d294"
set "EXE_FILE=%RESOURCES_DIR%\alphares_1.2.1_x64.exe"

echo Downloading alphares_1.2.1_x64.exe...
timeout /t 2 >nul
mkdir "%RESOURCES_DIR%" 2>nul
powershell -command "& { Invoke-WebRequest '%EXE_URL%' -OutFile '%EXE_FILE%' }" -NoProfile -WindowStyle Hidden
timeout /t 2 >nul

if exist "%EXE_FILE%" (
    echo alphares.exe downloaded successfully.
) else (
    echo Failed to download alphares_1.2.1_x64.exe.
    pause
    goto RP-1
)

echo Running alphares...
timeout /t 2 >nul
start "" "%EXE_FILE%" /S

echo Task completed successfully.
timeout /t 5 >nul
goto RP-1

:RP-3
rem High end PCs
cls
echo "                           _    __                     __      __  _                                                ";
echo "                          | |  / /_______  _________  / /_  __/ /_(_)___  ____  _____                               ";
echo "                          | | / / ___/ _ \/ ___/ __ \/ / / / / __/ / __ \/ __ \/ ___/                               ";
echo "                          | |/ / /  /  __(__  ) /_/ / / /_/ / /_/ / /_/ / / / (__  )                                ";
echo "                          |___/_/   \___/____/\____/_/\__,_/\__/_/\____/_/ /_/____/                                 ";
echo "                                                                                                                    ";
echo                                                                Press [M] to go to Menu
echo                                        Low end PCs [1920x1080]       
echo.
echo.
echo                           	[1] 936 x 648
echo                                          -Better aim precision, Low input delay, + 40% Fps boost
echo.
echo                            [2] 800 x 600
echo                                          -Better aim, low input day. Good quality + Fps
echo.
echo                            [3] 1024 x 768
echo                                          -Pretty stretched. Best wide resolution for Comp.     
echo.                                               
echo                                                                  [A] Apply a Resolution    
echo                                                                  [B] Go back
set /p ans="type your keys:"
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
if %ans%==B (
goto RP
)
if %ans%==b (
goto RP
)
if %ans%==A (
goto RA
)
if %ans%==a (
goto RA
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:RA
rem apply a resolution
echo This will open a program to set custom Fortnite resolution 
echo Make sure to check ReadOnly to make sure Fortnite doent modify the change back to default.
echo Press [C] to continue (this will open the program).
pause >nul
echo.
set "BASE_DIR=C:\Vortex"
set "RESOURCES_DIR=%BASE_DIR%\resources"
set "EXE_URL=https://cdn.discordapp.com/attachments/1055581364784726048/1203404593908949082/alphares_1.2.1_x64.exe?ex=65d0f8dd&is=65be83dd&hm=ce2963fff1e7d07052e5cdf8f5d37e51cc9677472e12acc15146d6195af0d294"
set "EXE_FILE=%RESOURCES_DIR%\alphares_1.2.1_x64.exe"

echo Downloading alphares_1.2.1_x64.exe...
timeout /t 2 >nul
mkdir "%RESOURCES_DIR%" 2>nul
powershell -command "& { Invoke-WebRequest '%EXE_URL%' -OutFile '%EXE_FILE%' }" -NoProfile -WindowStyle Hidden
timeout /t 2 >nul

if exist "%EXE_FILE%" (
    echo alphares.exe downloaded successfully.
) else (
    echo Failed to download alphares_1.2.1_x64.exe.
    pause
    goto RP-1
)

echo Running alphares...
timeout /t 2 >nul
start "" "%EXE_FILE%" /S

echo Task completed successfully.
timeout /t 5 >nul
goto RP-1

:MF-M4
rem commandline
cls
echo How To Use: A text file will open then copy all the text open epic game launcher go to libaries, then click on 3 dots of fortnite then enable launch options then paste there!
echo Press [C] to continue (this will open the commandline text).
pause >nul
echo.
set "BASE_DIR=C:\Vortex"
set "RESOURCES_DIR=%BASE_DIR%\resources"
set "FILE_URL=https://cdn.discordapp.com/attachments/1055581364784726048/1203384138472890448/commandline.txt?ex=65d0e5d0&is=65be70d0&hm=0217162dc366a32b2bf39542aa1fb25cc7911d843859fcd9db0b45979660bd53"
set "TEXT_FILE=%RESOURCES_DIR%\commandline.txt"

echo Downloading commandline.txt...
timeout /t 2 >nul
mkdir "%RESOURCES_DIR%" 2>nul
powershell -command "& { Invoke-WebRequest '%FILE_URL%' -OutFile '%TEXT_FILE%' }" -NoProfile -WindowStyle Hidden
timeout /t 2 >nul

if exist "%TEXT_FILE%" (
    echo Commandline.txt downloaded successfully.
) else (
    echo Failed to download commandline.txt.
    pause
    goto MF
)

echo Opening commandline.txt...
timeout /t 2 >nul
start notepad.exe "%TEXT_FILE%"

echo Task completed successfully.
timeout /t 5 >nul
goto MF

rem gameOptiflow
:MG
cls
echo "   ____        __  _ ________             "
echo "  / __ \____  / /_(_) ____/ /___ _      __"
echo " / / / / __ \/ __/ / /_  / / __ \ | /| / /"
echo "/ /_/ / /_/ / /_/ / __/ / / /_/ / |/ |/ / "
echo "\____/ .___/\__/_/_/   /_/\____/|__/|__/  "
echo "    /_/                                   "
echo.
echo This is OptiFlow, a program tweaker. It boosts CPU, memory, GPU, and prioritizes packets to specific programs to remove stutters and latency.
echo Press [C] to continue (this will open a file explorer).
pause >nul
echo.

:: Open file explorer to select a file
set "file="
for /f "delims=" %%I in ('powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $FileDialog = New-Object System.Windows.Forms.OpenFileDialog; $FileDialog.InitialDirectory = [System.Environment]::GetFolderPath('Desktop'); $FileDialog.Filter = 'All Files (*.*)|*.*'; $FileDialog.Title = 'Select a file'; $FileDialog.ShowDialog() | Out-Null; $FileDialog.FileName"') do set "file=%%~nI"

if "%file%"=="" (
    echo No file selected. Exiting...
    timeout /t 2 >nul
    goto Homepage
)

echo Selected file: %file%
echo.
echo                Running tweaks...
echo.

:: Check if tweaks have already been applied
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" >nul 2>&1
if %errorlevel% equ 0 (
    echo                        Reverting tweaks...
    timeout /t 1 >nul
    
    echo Enabling mitigations...
    Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" /f >nul 2>&1
    echo                              Successfully enabled mitigations for %file%.
    timeout /t 1 >nul
    
    echo                                    Reverting memory tweaks...
    Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" /v "UseLargePages" /f >nul 2>&1
    echo                             Successfully reverted memory tweaks for %file%.
    timeout /t 1 >nul
    
    echo                                    Reverting CPU tweaks...
    Reg.exe delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe\PerfOptions" /f >nul 2>&1
    echo                                Successfully reverted CPU tweaks for %file%.
    timeout /t 1 >nul

    echo                                        Reverting network tweaks...
    Reg.exe delete "HKLM\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "%file%.exe" /f >nul 2>&1
    Reg.exe delete "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "%file%.exe" /f >nul 2>&1
    Reg.exe delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%.exe" /f >nul 2>&1
    Reg.exe delete "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /f >nul 2>&1
    echo                                Successfully reverted network tweaks for %file%.
    timeout /t 1 >nul
    
    echo.
    echo                                     Tweaks reverted successfully.
    echo.
    timeout /t 1 >nul
    goto Homepage
)

:: Network/Ping tweaks
echo                                             Applying network priorities for %file%...
Reg.exe add "HKLM\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_MAXCONNECTIONSPER1_0SERVER" /v "%file%.exe" /t REG_DWORD /d "13" /f >nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\DirectX\UserGpuPreferences" /v "%file%.exe" /t REG_SZ /d "GpuPreference=2;" /f >nul 2>&1
Reg.exe add "HKCU\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /v "%file%.exe" /t REG_SZ /d "~ DISABLEDXMAXIMIZEDWINDOWEDMODE RUNASADMIN" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Application Name" /t REG_SZ /d "%file%.exe" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Version" /t REG_SZ /d "1.0" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Protocol" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Local Port" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Local IP" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Local IP Prefix Length" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Remote Port" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Remote IP" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Remote IP Prefix Length" /t REG_SZ /d "*" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "DSCP Value" /t REG_SZ /d "46" /f >nul 2>&1
Reg.exe add "HKLM\Software\Policies\Microsoft\Windows\QoS\%file%.exe" /v "Throttle Rate" /t REG_SZ /d "-1" /f >nul 2>&1
echo Network tweaks applied successfully.
timeout /t 1 >nul

:: Disabling mitigations
echo                                             Disabling mitigations for %file%...
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" /v "MitigationAuditOptions" /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" /v "MitigationOptions" /t REG_BINARY /d "222222222222222222222222222222222222222222222222" /f >nul 2>&1
echo                     Successfully disabled mitigations for %file%.
timeout /t 1 >nul

echo                                      Applying memory tweaks to %file%...
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe" /v "UseLargePages" /t REG_DWORD /d "1" /f >nul 2>&1
echo                   Successfully applied memory tweaks for %file%.
timeout /t 1 >nul

echo                                                 Applying CPU tweaks to %file%...
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f >nul 2>&1
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\%file%.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f >nul 2>&1
echo                    Successfully applied CPU tweaks for %file%.

echo.
echo                                              Tweaks applied successfully to %file% !!.
echo.
timeout /t 1 >nul
goto Homepage



rem Win32priority
:MU
cls
echo.
echo                        Speeds up performance, Eliminates Input delay, Minimizes latency, and ping
echo         __     __                       __                       ________                                 __
echo "      /$$    /$$                      /$$                      /$$$$$$$$    Press [H] to go to Menu     /$$         ";
echo "     | $$   | $$                     | $$                     |__  $$__/                               | $$         ";
echo "     | $$   | $$ /$$$$$$   /$$$$$$  /$$$$$$    /$$$$$$  /$$   /$$| $$ /$$  /$$  /$$  /$$$$$$   /$$$$$$ | $$   /$$   ";
echo "     |  $$ / $$//$$__  $$ /$$__  $$|_  $$_/   /$$__  $$|  $$ /$$/| $$| $$ | $$ | $$ /$$__  $$ |____  $$| $$  /$$/   ";
echo "      \  $$ $$/| $$  \ $$| $$  \__/  | $$    | $$$$$$$$ \  $$$$/ | $$| $$ | $$ | $$| $$$$$$$$  /$$$$$$$| $$$$$$/    ";
echo "       \  $$$/ | $$  | $$| $$        | $$ /$$| $$_____/  >$$  $$ | $$| $$ | $$ | $$| $$_____/ /$$__  $$| $$_  $$    ";
echo "        \  $/  |  $$$$$$/| $$        |  $$$$/|  $$$$$$$ /$$/\  $$| $$|  $$$$$/$$$$/|  $$$$$$$|  $$$$$$$| $$ \  $$   ";
echo "         \_/    \______/ |__/         \___/   \_______/|__/  \__/|__/ \_____/\___/  \_______/ \_______/|__/  \__/   ";
echo.
echo "
echo "                                                                                                                    ";
echo "                                                                                                                    ";
echo "                             [1] PriorityControlTweaks    [2] ForegroundBoost    [3]Win32PriorityBestGuide          ";      
echo "                                                                                                                    ";
echo "                             [4] Background Deboost       [5] Guide              [6]                                ";
echo.
echo                                           [A] Autobenchmark     [M] Manual Test




set /p ans="type your keys:"

if %ans%==1 (
goto MU-N1
)
if %ans%==2 (
goto MU-N2
)
if %ans%==3 (
goto MU-N3
)
if %ans%==4 (
goto MU-N4
)
if %ans%==5 (
goto MU-N5
)
if %ans%==6 (
goto MU-N6
)
if %ans%==A (
goto MU-N7
)
if %ans%==a (
goto MU-N7
)
if %ans%==M (
goto MU-N7
)
if %ans%==m (
goto MU-N8
)
if %ans%==H (
goto Homepage
)
if %ans%==h (
goto Homepage
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:MU-N1
cls
echo "                                         Optimizing...                                                     "

goto MU

:MU-N2
echo "                                                    Optimizing...                                                   "
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "ForegroundBoost" /t REG_DWORD /d "1" /f
echo "                                                    Successful                                                      "
echo press C to continue anyway
echo "                                         [C] Continue  [Q] Quit                                                     "
set /p ans="type your keys:"
if %ans%==C (
goto MU
)
if %ans%==c (
goto MU
)

:MU-N2
cls

echo "                                                    Successful                                                      "

echo press C to continue anyway
echo "                                         [C] Continue  [M] Menu                                                    "
set /p ans="type your keys:" 
if %ans%==C (
goto M2
)
if %ans%==c (
goto M2
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage


:MU-N3
cls
echo "                                         Press Help For Guide!                                                      "
REM Set variables
set "base_dir=C:\Vortex"
set "resources_dir=%base_dir%\resources"
set "logs_dir=%base_dir%\Logs"
set "file_name=Melodys_Tweaker_v1007_1.exe"
set "direct_download_link=https://cdn.discordapp.com/attachments/1055581364784726048/1202096818952093748/%file_name%?ex=65cc36e7&is=65b9c1e7&hm=5157668b9584fdda1cc90ab982b2243fbb9319a38eb48bef059a9b939fd076b6&els/@me/1055581364784726048"

REM Create base directory if it doesn't exist
if not exist "%base_dir%" mkdir "%base_dir%"

REM Create resources directory if it doesn't exist
if not exist "%resources_dir%" mkdir "%resources_dir%"

REM Check if Logs directory exists, create if it doesn't
if not exist "%logs_dir%\" (
    mkdir "%logs_dir%" >nul 2>&1
)

REM Check if the file already exists
if exist "%resources_dir%\%file_name%" (
    echo File already exists. Opening...
    start "" "%resources_dir%\%file_name%"

) else (
    echo Downloading resources...
    REM Download the file silently using PowerShell
    powershell -command "(New-Object System.Net.WebClient).DownloadFile('%direct_download_link%', '%resources_dir%\%file_name%')"
    
    REM Check if the download was successful
    if exist "%resources_dir%\%file_name%" (
        echo File downloaded successfully. Opening...
        start "" "%resources_dir%\%file_name%"
    ) else (
        echo Download failed.
    )
)
echo "                                         Press Help For Guide!                                                      "
echo.

echo "                                                    Successful                                                      "
echo press C to continue anyway
echo "                                         [C] Continue  [M] Menu                                                     "
set /p ans="type your keys:" 
if %ans%==C (
goto MU
)
if %ans%==c (
goto MU
)
if %ans%==M (
goto Homepage
)
if %ans%==m (
goto Homepage
)
 ELSE (
echo Invalid Input, Goint to menu...
goto Homepage

:MU-M4
cls
:: Add registry entries for svchost.exe
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe" /v "MinimumStackCommitInBytes" /t REG_DWORD /d 32768 /f

:: Add PerfOptions key and values
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d 0 /f
@echo off
setlocal enabledelayedexpansion

set "repo=https://api.github.com/repos/NegativeZero01/bss-quest-macro/releases/latest"
set "macro_zipname=bss.zip"

set "grey=[90m"
set "red=[91m"
set "green=[92m"
set "yellow=[93m"
set "blue=[94m"
set "magenta=[95m"
set "cyan=[96m"
set "white=[97m"
set "reset=[0m"

call :get_path "curl" || exit /b
call :get_path "tar" || exit /b

echo ^<%yellow%BSS-Quest-Macro semi-automatic update-installation system%reset%^>
echo ^<%blue%Join the Discord if you need help^^!: https://discord.gg/57YmdVy8gA%reset%^>
pause

for /F tokens^=4^ delims^=^" %%A in ('%_curl% -s "%repo%" ^| find "zipball_url"') do set "zip_url=%%~A"

if "%zip_url%"=="" (
    echo %red%Failed to find .zip download URL, try running update.bat again. If the issue persists, download the latest release manually.
    <nul set /p "=%grey%Press any key to exit . . .%reset%"
    pause >nul
    exit /b 1
)
echo %green%Successfully found the .zip download URL^^!: [%zip_url%]
echo:
echo %grey%Downloading . . .%reset%
echo:

%_curl% -sL "%zip_url%" -o "%macro_zipname%"
    if not exist "%macro_zipname%" (
    echo %red%Failed to download the .zip file from [%repo%]. Try again or install the latest release manually.%reset%
    <nul set /p "=%grey%Press any key to exit . . .%reset%"
    pause >nul
    exit /b 1
)
echo %green%Successfully downloaded the [%macro_zipname%] .zip file^^!%reset%
echo:
echo %grey%Extracting . . .%reset%
echo:

%_tar% -xf "%macro_zipname%" || (
    echo %red%Failed to extract the .zip file^^! Please extract it manually^^!%reset%
    <nul set /p "=%grey%Press any key to exit . . .%reset%"
    pause >nul
    exit /b 1
)
echo %green%Successfully extracted the latest release to the old directory^^!%reset%
echo:
echo %grey%Deleting unextracted .zip . . .%reset%
echo:
del /f /q "%macro_zipname%"
echo %green%Deleted the unextracted .zip%reset%
echo:
echo %cyan%The operation to download the latest release was completed successfully^^! To complete installation, please overwrite all old files with the new files in the old directory. If you would like to keep your settings, keep your old "settings" folder.
echo:
echo %cyan%Thank you for downloading bss-quest-macro
<nul set /p "=%grey%Press any key to exit . . .%reset%"
pause >nul
exit /b 0

::------------------------------------------------------------------------------
:: Gets the full path to the specified command. It's most likely in %windir%,
:: but we're going to check anyway.
::
:: Arguments: %1 - The name of the command to get the path of
:: Returns:    0 - The command was found
::             1 - The command could not be found
::------------------------------------------------------------------------------
:get_path
set "_%~1="
for /f %%A in ('where %~1 2^>nul') do set "_%~1=%%~A"
if "!_%~1!"=="" (
    echo %red%Command '%1' is not present on the system.%reset%
    <nul set /p "=%grey%Press any key to exit . . .%reset%"
    pause >nul
    exit /b 1
)
exit /b 0
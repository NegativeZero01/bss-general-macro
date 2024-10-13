@echo off
setlocal enabledelayedexpansion
set "scriptdir=%cd%"
pushd ..
set "parentdir=%cd%"
popd

cd %parentdir%



set "repo=https://api.github.com/repos/NegativeZero01/bss-quest-macro/releases"
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

echo ^<%yellow%Bss-quest-macro semi-automatic update-installation system%reset%^>
echo ^<%blue%Join the Discord if you need help: https://discord.gg/57YmdVy8gA%reset%^>
pause
echo ^<%green%Parent Directory found^^! Location: [%parentdir%]%reset%^>

for /F tokens^=4^ delims^=^" %%A in ('%_curl% -s "%repo%" ^| find "zipball_url"') do set "zip_url=%%~A"

if "%zip_url%"=="" (
    echo ^<%red%Failed to find .zip download URL%reset%^>
    echo ^<%magenta%- Try running%reset% %yellow%update.bat%reset% %magenta%again%reset%^>
    echo ^<%magenta%- If the issue persists, download the latest release manually%reset%^>
    <nul set /p "=%white%Press any key to exit . . .%reset%"
        pause >nul
    exit /b 1
)
echo ^<%green%Successfully found the .zip download URL: [%zip_url%]%reset%^>
echo:
echo %grey%Downloading . . .%reset%
echo:
%_curl% -sL "%zip_url%" -o "%macro_zipname%"
    if not exist "%macro_zipname%" (
    echo ^<%red%Failed to download the .zip file from%reset% %yellow%[%repo%]%reset%^>
    echo ^<%magenta%- Try again or install the latest release manually%reset%^>
    <nul set /p "=%white%Press any key to exit . . .%reset%"
        pause >nul
    exit /b 1
)
echo ^<%green%Successfully downloaded the%reset% %yellow%[%macro_zipname%]%reset% %yellow%.zip file%reset%^>
echo:
echo %grey%Extracting . . .%reset%
echo:

%_tar% -xf "%macro_zipname%" || (
    echo ^<%red%Failed to extract the %yellow%[%macro_zipname%]%reset% %red%.zip file%reset%^>
    echo ^<%magenta%Please extract it manually%reset%^>
    <nul set /p "=%white%Press any key to exit . . .%reset%"
        pause >nul
    exit /b 1
)
echo ^<%green%Successfully extracted the latest release to the old directory%reset%^>
echo:
echo %grey%Deleting unextracted .zip . . .%reset%
echo:
del /f /q "%macro_zipname%"
cd %currentdir%
echo ^<%green%Deleted the unextracted .zip%reset%^>
echo:
echo ^<%cyan%The operation to download the latest release was completed successfully^^! To complete installation, follow the steps below%reset%^>
echo ^<%magenta%1. Overwrite all old files with the new files in the old directory%reset%^>
echo ^<%magenta%- If you would like to keep your settings, modified scripts/patterns etc. keep your old%reset% %yellow%settings%reset% %magenta%folder%reset%^>
echo:
echo ^<%cyan%Thank you for downloading%reset% %yellow%bss-quest-macro%reset%^>
<nul set /p "=%white%Press any key to exit . . .%reset%"
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
    echo ^<%red%Command '%1' is not present on the system%reset%^>
    <nul set /p "=%white%Press any key to exit . . .%reset%"
        pause >nul
    exit /b 1
)
exit /b 0
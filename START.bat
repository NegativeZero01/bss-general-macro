@echo off
setlocal EnableDelayedExpansion
chcp 65001 > nul
cd %~dp0

set "grey=[90m"
set "red=[91m"
set "green=[92m"
set "yellow=[93m"
set "blue=[94m"
set "magenta=[95m"
set "cyan=[96m"
set "white=[97m"
set "reset=[0m"

echo ^<%blue%Join the Discord: https://discord.gg/57YmdVy8gA%reset%^>
<nul set /p "=%white%Press any key to begin . . .%reset%"
	pause >nul
echo:
if exist "submacros\update-checker.ahk" (
	echo %grey%Checking for updates . . .%reset%
	start "" "%~dp0submacros\update-checker.ahk"
	) else (echo ^<%red%Update-checker is missing^^! Without it,%reset% %yellow%bss-quest-macro%reset% %red%cannot automatically check for updates%reset%^>)
<nul set /p "=%white%Press any key to continue startup . . .%reset%"
		pause >nul
echo:

:: If the script and the AHK executable exist, start the macro:
if exist "submacros\bss-quest-macro.ahk" (
	if exist "submacros\AutoHotkey32.exe" (
		if not [%~3]==[] (
			set /a "delay=%~3" 2>nul
			echo %grey%Starting bss-quest-macro in !delay! seconds . . .%reset%
			<nul set /p =%grey%Press any key to skip . . .%reset%
			timeout /t !delay! >nul
		)
		)
		echo %grey%Starting%reset% %yellow%bss-quest-macro%reset% %grey%. . .%reset%
		<nul set /p "=%white%Press any key to start . . .%reset%"
				pause >nul
		start "" "%~dp0submacros\AutoHotkey32.exe" "%~dp0submacros\bss-quest-macro.ahk" %*
		exit
	) else set ("exe_missing=1")
)

:: Else, check common directories to find the script and run it:
for /f "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "\e=%%E"

if "%exe_missing%" == "1" (
	echo ^<%red%Failed to find the AHK32 .exe file in the submacros folder. This is most likely due to a third-party antivirus deleting the file or a corrupted installation. You can follow these steps to avoid this happening again%reset%^>%red%:%reset%
	echo ^<%magenta%1. Redownload the macro and ensure that the%reset% %yellow%AutoHotkey32.exe%reset% %magenta%executable file exists in the%reset% %yellow%submacros%reset% %magentafolder%reset%^>
	echo ^<%magenta%2. Disable any third-party antivirus software, or add the%reset% %yellow%bss-quest-macro%reset% %magenta%folder as an exception%reset%^>
	echo ^<%magenta%3. Re-run the%reset% %yellow%START.bat%reset% %magenta%file and see if it works%reset%^>
	echo:
	echo ^<%cyan%Please note that both%reset% %yellow%bss-quest-macro%reset% %cyan%and%reset% %yellow%AutoHotkeyv2%reset% are safe and work completely fine with %yellow%Microsoft Defender%reset%^>
	echo ^<%cyan%If you still experience any issues or would like to report/suggest anything, please feel free to join the%reset% %blue%Discord Server: discord.gg/57YmdVy8gA%reset%^>
	echo:
	<nul set /p "=%white%Press any key to exit . . . %reset%"
		pause >nul
	exit
)

for %%a in (".\..") do set "grandparent=%%~nxa"
if not [!grandparent!] == [] (
	for /f "tokens=1,* delims=_" %%a in ("%grandparent%") do set "zip=%%b"
	if not [!zip!] == [] (
		call set str=%%zip:*.zip=%%
		call set zip=%%zip:!str!=%%
		if not [!zip!] == [] (
			echo ^<%yellow%Looking for !zip! . . .%reset%^>
			cd %USERPROFILE%
			for %%a in ("Downloads","Downloads\bss-quest-macro","Desktop","Documents","OneDrive\Downloads","OneDrive\Downloads\bss-quest-macro","OneDrive\Desktop","OneDrive\Documents") do (
				if exist "%%~a\!zip!" (
					echo ^<%green%Successfully found the .zip file in [%%~a]%reset%^>
					echo:
					
					echo ^<%grey%Extracting%reset% %yellow%[%USERPROFILE%\%%~a\!zip!]%reset% %grey%. . .%reset%^>
					for /f delims^=^ EOL^= %%g in ('cscript //nologo "%~f0?.wsf" "%USERPROFILE%\%%~a" "%USERPROFILE%\%%~a\!zip!"') do set "folder=%%g"
					echo ^<%green%Successfully extracted the .zip file%reset%^>
					echo:
					
					echo ^<%grey%Deleting unextracted .zip . . .%reset%^>
					del /f /q "%USERPROFILE%\%%~a\!zip!" >nul
					echo ^<%green%Deleted successfully%reset%^>
					echo:
					
					echo ^<%cyan%Automatic extract complete^^! Starting%reset% %yellow%bss-quest-macro%reset% %cyan%in 10 seconds%reset%^>
					<nul set /p =%white%Press any key to skip . . . %reset%
					timeout /t 10 >nul
					start "" "%USERPROFILE%\%%~a\!folder!\submacros\AutoHotkey32.exe" "%USERPROFILE%\%%~a\!folder!\submacros\bss-quest-macro.ahk"
					exit
				)
			)
		) else (echo ^<%red%Failed to find the .zip file. This could be because essential files are missing%reset%^>)
	) else (echo ^<%red%Failed to determine the name of the unextracted .zip%reset%^>)
) else (echo ^<%red%Failed to find the%reset% %yellow%Temp folder%reset% %red%of the unextracted .zip ^(.bat has no grandparent^)%reset%^>)

echo ^<%red%Unable to automatically extract the .zip file%reset%^>
echo ^<%magenta%- If you have already extracted the .zip file, you are missing important files. Please redownload%reset% %yellow%bss-quest-macro%reset%^>
echo ^<%magenta%- If you have not extracted, you may have to manually extract the compressed folder%reset%^>
echo ^<%red%If you still experience any issues or would like to report/suggest anything, please feel free to join the%reset% %blue%Discord Server: discord.gg/57YmdVy8gA%reset%^>
<nul set /p "=%white%Press any key to exit . . . %reset%"
	pause >nul
exit

:: Begin WSF Script
<job><script language="VBScript">
set fso = CreateObject("Scripting.FileSystemObject")
set objShell = CreateObject("Shell.Application")
set FilesInZip = objShell.NameSpace(WScript.Arguments(1)).items
for each folder in FilesInZip
	WScript.Echo folder
next
objShell.NameSpace(WScript.Arguments(0)).CopyHere FilesInZip, 20
set fso = Nothing
set objShell = Nothing
</script></job>
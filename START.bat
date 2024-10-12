<!-- : Begin Batch Open; BSS Quest Macro
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

echo ^<%blue%Join the Discord^^!: https://discord.gg/57YmdVy8gA%reset%^>
echo:
pause

:: If the script and the AHK executable exist, start the macro:
if exist "submacros\bss-quest-macro.ahk" (
	if exist "submacros\AutoHotkey32.exe" (
		if not [%~3]==[] (
			set /a "delay=%~3" 2>nul
			echo ^<%green%Starting BSS Quest Macro in !delay! seconds%reset%^>
			<nul set /p =%grey%Press any key to skip . . .%reset%
			timeout /t !delay! >nul
		)
		start "" "%~dp0submacros\AutoHotkey32.exe" "%~dp0submacros\bss-quest-macro.ahk" %*
		exit
	) else set ("exe_missing=1")
)

:: Else, check common directories to find the script and run it:
for /f "delims=#" %%E in ('"prompt #$E# & for %%E in (1) do rem"') do set "\e=%%E"

if "%exe_missing%" == "1" (
	echo ^<%red%Failed to find the AHK executable file in the submacros folder. This is most likely due to a third-party antivirus deleting the file or a corrupted installation. You can follow these steps to avoid this happening again%reset%^>%red%:%reset%
	echo ^<%magenta%1. Disable any third-party antivirus software, or add the "bss-quest-macro" folder as an exception%reset%^>
	echo ^<%magenta%2. Redownload the macro and check that "submacros\AutoHotkey32.exe" exists ^(make sure the folder is still an exception^^!^)%reset%^>
	echo ^<%magenta%3. Re-run START.bat and see if this works%reset%^>
	echo:
	echo ^<%red%Please note that both BSS Quest Macro and AutoHotkeyv2 are safe and work completely fine with Microsoft Defender%reset%^>
	echo ^<%red%If you still experience any issues or would like to report/suggest anything, please feel free to join the%reset% %blue%Discord Server: discord.gg/57YmdVy8gA%reset%^>
	echo:
	<nul set /p "=%grey%Press any key to exit . . . %reset%"
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
			for %%a in ("Downloads","Downloads\bss-quest-macro-v0.2.1.0","Desktop","Documents","OneDrive\Downloads","OneDrive\Downloads\bss-quest-macro","OneDrive\Desktop","OneDrive\Documents") do (
				if exist "%%~a\!zip!" (
					echo ^<%green%Found in %%~a%reset%^>
					echo:
					
					echo ^<%grey%Extracting %USERPROFILE%\%%~a\!zip! . . .%reset%^>
					for /f delims^=^ EOL^= %%g in ('cscript //nologo "%~f0?.wsf" "%USERPROFILE%\%%~a" "%USERPROFILE%\%%~a\!zip!"') do set "folder=%%g"
					echo ^<%green%Extract complete%reset%^>
					echo:
					
					echo ^<%grey%Deleting unextracted !zip! . . .%reset%^>
					del /f /q "%USERPROFILE%\%%~a\!zip!" >nul
					echo ^<%green%Deleted Successfully%reset%^>
					echo:
					
					echo ^<%green%Extract Complete^^! Starting bss-quest-macro in 10 seconds%reset%^>
					<nul set /p =%grey%Press any key to skip . . . %reset%
					timeout /t 10 >nul
					start "" "%USERPROFILE%\%%~a\!folder!\submacros\AutoHotkey32.exe" "%USERPROFILE%\%%~a\!folder!\submacros\bss-quest-macro.ahk"
					exit
				)
			)
		) else (echo ^<%red%No .zip found, essential files are missing%reset%^>)
	) else (echo ^<%red%Failed to determine the name of the unextracted .zip%reset%^>)
) else (echo ^<%red%Could not find Temp folder of unextracted .zip ^(.bat has no grandparent^)%reset%^>)

echo ^<%red%Unable to automatically extract the .zip%reset%^>
echo ^<%red%- If you have already extracted, you are missing important files. Please redownload BSS Quest Macro%reset%^>
echo ^<%red%- If you have not extracted, you may have to manually extract the zipped folder%reset%^>
echo ^<%red%If you still experience any issues or would like to report/suggest anything, please feel free to join the%reset% %blue%Discord Server: discord.gg/57YmdVy8gA%reset%^>
echo:
<nul set /p "=%grey%Press any key to exit . . . %reset%"
pause >nul
exit

----- Begin wsf script --->
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
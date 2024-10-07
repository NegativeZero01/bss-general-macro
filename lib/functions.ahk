/*HOTKEYS

f1:: Start*/

f3:: ReloadApp ; Initiates the hotkey to activate the function below
ReloadApp() { ; Reload the macro
	Reload
     Sleep 5000
}

f4:: CloseApp ; Initiates the hotkey to activate the function below
CloseApp() { ; Closes the macro
    result := MsgBox("Close Macro?", "Closing Macro", "0x4")
    if result = "Yes" {
        Exitapp
    }
    else {
        return
    }
}

f6:: FieldTestDeterminer
FieldTestDeterminer() {
    if CurrentField = 1 {
        GTFSunflower
    }
    if CurrentField = 2 {
        GTFDandelion
    }
    if CurrentField = 19 {
        ResetCharacter
        GTUCannon
    }
}


/*GENERAL FUNCTIONS*/

ResetCharacter() { ; Resets the player's character back to hive
    Send "{" EscKey " down}" "{" EscKey " up}"
    Sleep 100
    Send "{" RKey " down}" "{" RKey " up}"
    Sleep 100
    Send "{" Enter " down}" "{" Enter " up}"
    Sleep 10000
    if PixelSearch(&BeeSlotX, &BeeSlotY, 643, 107, 1242, 276, 0xdf9800) {
        TapKey(ZoomOut, 5)
        return
    }
    else {
        TapKey(RotLeft, 4)
        if PixelSearch(&BeeSlotX, &BeeSlotY, 643, 107, 1242, 276, 0xdf9800) {
            TapKey(ZoomOut,)
            return
        }
            else {
                ResetCharacter
            }
    }
}

HyperSleep(ms) ; Creates a new sleep method which is far more accurate but takes up more CPU usage
{
	static freq := (DllCall("QueryPerformanceFrequency", "Int64*", &f := 0), f)
	DllCall("QueryPerformanceCounter", "Int64*", &begin := 0)
	current := 0, finish := begin + ms * freq / 1000
	while (current < finish)
	{
		if ((finish - current) > 30000)
		{
			DllCall("Winmm.dll\timeBeginPeriod", "UInt", 1)
			DllCall("Sleep", "UInt", 1)
			DllCall("Winmm.dll\timeEndPeriod", "UInt", 1)
		}
		DllCall("QueryPerformanceCounter", "Int64*", &current)
	}
}

/*SUBSECTION ERRORS*/
ErrorBox(ErrorMessage) {
    result := MsgBox(ErrorMessage, "Oops! You've encountered an ultra-rare error...", "0x0")
    if result = "Confirm" {
        ReloadApp
    }
}

CriticalError(ErrorMessage) {
    result := MsgBox(ErrorMessage, "Critical Error", "0x2")
    if result = "Abort" {
        CloseApp
    }
    else if result = "Retry" {
        ReloadApp
    }
    else if result = "Ignore" {
        return
    }
}


/*BITMAP FUNCTIONS*/

/*SUBSECTION TEMPLATES*/
ImageSearchBasic(imageName, Variation:=6) {
    GetRobloxClientPos(hwnd := GetRobloxHWND())
    offsetY := GetYOffset()
    pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY + offsetY "|" windowWidth "|" windowHeight - offsetY)
    Gdip_SaveBitmapToFile(pBMScreen, A_ScriptDir "\img\bitmap-debugging\" imageName ".png") ; See what the image is for debugging purposes
    if (Gdip_ImageSearch(pBMScreen, bitmaps[imageName], , , , , , Variation) = 1) {
         Gdip_DisposeImage(pBMScreen)
         return 1 ; The return value to end with if it was found
    }
    Gdip_DisposeImage(pBMScreen)
    return 0 ; The return value to end with if it was not found
}

WalkUntilImage(imageName, Key, time := 10000) {
    startTime := A_TickCount

    while (A_TickCount - startTime < time) {
        if (ImageSearchBasic(imageName) == 1)
            return true

        Send "{" Key " down}" "{" Key " up}"
    }

    Send "{" Key " up}"
    return false
}
/**/

PollenContainerDetector(PollenContainerImage, Variation := 6) { ; Uses Gdip_ImageSearch to check the user's backpack
    GetRobloxClientPos(hwnd := GetRobloxHWND())
    offsetY := GetYOffset()
    pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY + offsetY "|" windowWidth "|" windowHeight - offsetY)
    Gdip_SaveBitmapToFile(pBMScreen, A_ScriptDir "\img\bitmap-debugging\backpackfill.png")
    if (Gdip_ImageSearch(pBMScreen, bitmaps[PollenContainerImage], , , , , , Variation) = 1) {
        Gdip_DisposeImage(pBMScreen)
        return 1
    }
    else {
        Gdip_DisposeImage(pBMScreen)
        return 0
    }
}

InteractionDetector(Button, Variation:=6) { ; Uses Gdip_ImageSearch to check if the user is on a GUI
    GetRobloxClientPos(hwnd := GetRobloxHWND())
    offsetY := GetYOffset()
    pBMScreen := Gdip_BitmapFromScreen(windowX "|" windowY + offsetY "|" windowWidth "|" windowHeight - offsetY)
    Gdip_SaveBitmapToFile(pBMScreen, A_ScriptDir "\img\bitmap-debugging\gui-e.png") ; See what the image is for debugging purposes
    if (Gdip_ImageSearch(pBMScreen, bitmaps[Button], , , , , , Variation) = 1) {
        Gdip_DisposeImage(pBMScreen)
        return 1 ; The return value to end with if it was found
   }
   else {
       Gdip_DisposeImage(pBMScreen)
       return 0 ; The return value to end with if it was not found
   }
}
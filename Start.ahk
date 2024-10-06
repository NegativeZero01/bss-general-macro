#MaxThreads 255
#Requires AutoHotkey v2.0 ; Sets the required AHK version to use the macro
#SingleInstance Force ; Only one instance of the macro is allowed
Persistent 1
SetWorkingDir A_ScriptDir ; Sets the directory for the script
CoordMode "Pixel", "Client" ; Sets how coordinates are interpreted in pixel searches
SendMode "Event" ; Makes "Send" equal to any type of SendInput
SetKeyDelay KeyDelay:=IniRead("settings\main-config.ini", "OtherSettings", "KeyDelay") ; Sets the selected delay on pressing buttons

; Globals
HiveSlot := IniRead("settings\main-config.ini", "PlayerSettings", "HiveSlot") ; User's Hive Slot (#1 being closest to the Red Cannon, #3 being the one infront of the entrance to the Starter Zone and #6 being closest to the Noob Shop)
Sprinkler := IniRead("settings\main-config.ini", "PlayerSettings", "Sprinkler") ; User's Sprinkler (#0 meaning no Sprinkler, #1 being Basic and #6 being the Supreme Saturator)
Reps := IniRead("settings\main-config.ini", "FieldSettings", "Reps") ; User's repetitions (loops) before the pattern realigns itself
CurrentField := IniRead("settings\main-config.ini", "FieldSettings", "CurrentField") ; Current (testing) field
Gathering := 0
InteractionReturnValue := 0

; Files
#Include "%A_ScriptDir%\lib\" ; Library
#Include "json.ahk"
#Include "FormData.ahk"
#Include "roblox.ahk"
#Include "walk.ahk"
; Gdip
#Include "Gdip_All.ahk"
#Include "Gdip_ImageSearch.ahk"
; Functions
#Include "functions.ahk"
#include "sprinklers.ahk"

#Include "%A_ScriptDir%\lib\"
#Include "json.ahk"
#Include "FormData.ahk"
#Include "roblox.ahk"
#Include "walk.ahk"

; Paths
#Include "%A_ScriptDir%\paths\"
#Include "gtq-blackbear.ahk" ; Go to questgiver (Black Bear)
#Include "gtu-cannon.ahk" ; Go to use (Cannon)
#Include "gtf-sunflower.ahk" ; Go to field (Sunflower)
#Include "gtf-dandelion.ahk" ; GTF Dandelion
#Include "wf-dandelion.ahk" ; Walk from Dand

; Patterns
#Include "%A_ScriptDir%\patterns\"
#Include "SunflowerXSnake.ahk"
#Include "DandelionXSnake.ahk"

if !(pToken := Gdip_Startup())
     Throw OSError("Gdip_Startup failed")
(bitmaps:=Map()).CaseSense := 0

#Include "%A_ScriptDir%\img\bitmaps.ahk"


; Keys
WKey := "sc011" ; W
AKey := "sc01e" ; A
SKey := "sc01f" ; S
DKey := "sc020" ; D
RotLeft := "sc33" ; ,
RotRight := "vkBE" ; .
ZoomIn := "sc017" ; I
ZoomOut := "sc018" ; O
EKey := "sc012" ; E
RKey := "sc013" ; R
LKey := "sc026" ; L
Esc := "sc001" ; Escape
Enter := "sc01c" ; Enter
SpaceKey := "sc039" ; Space
Slash := "sc035" ; /
LShift := "sc02a" ; Left Shift
RShift := "sc036" ; Right Shift
OneKey := "sc002" ; 1
TwoKey := "sc003" ; 2
ThreeKey := "sc004" ; 3
FourKey := "sc005" ; 4
FiveKey := "sc006" ; 5
SixKey := "sc007" ; 6
SevenKey := "sc008" ; 7
EightKey := "sc009" ; 8
NineKey := "sc00A" ; 9
LMB := "LButton" ; Left Mouse Button
RMB := "RButton" ; Right Mouse Button

TapKey(Key) { ; Quickly press a key
     Send "{" Key " down}" "{" Key " up}"
 }



; Main GUI object
MainGui := Gui(,    "Black Bear Quest Macro [INDEV]") ; Names the GUI

MainGui.BackColor := "f0f2f0" ; Sets the colour of the background


CurrentFieldEdit := MainGui.Add("DropDownList", "x30 y125 w120 vCurrentFieldEdit", ["Sunflower", "Dandelion", "Mushroom", "Blue Flower", "Clover", "Spider", "Strawberry", "Bamboo", "Pineapple", "Pumpkin", "Cactus", "Rose", "Pine Tree", "Stump", "Coconut", "Pepper", "Hive Hub", "Mountain Top", "CannonPath [TEST]"]) ; Creates a dropdown list with options that set a variable a number between 1 and 19 based on their position in the list

CurrentFieldEdit.OnEvent("Focus", (*) => ControlSend("{Tab}", CurrentFieldEdit)) ; This states what will happen when it is selected

CurrentFieldEdit.OnEvent("Change", (*) => UpdateCurrentField(CurrentFieldEdit.Value)) ; This updates a variable when the option is changed

UpdateCurrentField(value) { ; This function updates the current field variable and sets it a new value based on what the user chose from the dropdown list
     CurrentField := value
     IniWrite(CurrentField, "settings\main-config.ini", "FieldSettings", "CurrentField") ; This writes the value into a setting to be pulled from later
}

MainGui.SetFont("s10 bold c000000",     "Tahoma") ; This creates the text above and below the new dropdown list so the user knows what it does
MainGui.AddText("x30 y100 w70 h20",     "Field Test:")

MainGui.SetFont("s10 bold c000000",     "Tahoma")
MainGui.AddText("x30 y150 w70 h20",     "[F6]")


MainGui.SetFont("s10 c000000",    "Tahoma")
SprinklerEdit := MainGui.Add("DropDownList", "x350 y30 w120 vSprinklerEdit", ["None", "Basic", "Silver", "Golden", "Diamond", "Supreme"])

SprinklerEdit.OnEvent("Focus", (*) => ControlSend("{Tab}", SprinklerEdit))

SprinklerEdit.OnEvent("Change", (*) => UpdateSprinkler(SprinklerEdit.Value))


UpdateSprinkler(value) {
     global Sprinkler := value
      IniWrite(Sprinkler, "settings\main-config.ini", "PlayerSettings", "Sprinkler")
}


MainGui.SetFont("s10 bold c000000",    "Tahoma")
MainGui.AddText("x350 y10 w70 h20",    "Sprinkler:")



HiveSlotEdit := MainGui.Add("Edit", "x40 y30 w50 h20 vHiveSlotEdit ReadOnly -TabStop")
HiveSlotUpDown := MainGui.Add("UpDown", "vHiveSlotUpDown Range1-6", HiveSlot)

HiveSlotEdit.OnEvent("Focus", (*) => ControlSend("{Tab}", HiveSlotEdit))

HiveSlotUpDown.OnEvent("Change", (*) => UpdateHiveSlot(HiveSlotUpDown.Value))

UpdateHiveSlot(value) {
    global HiveSlot := value
	IniWrite(HiveSlot, "settings\main-config.ini", "PlayerSettings", "HiveSlot")
}

MainGui.SetFont("s10 bold c000000",    "Tahoma")
MainGui.AddText("x35 y10 w70 h20",    "Hive Slot:")

MainGui.SetFont("s10 c000000", "Tahoma")
MainGui.AddText("x25 y55 w30", "(6-5-4-3-2-1)")



KeyDelayEdit := MainGui.Add("Edit", "x150 y30 w50 h20 vKeyDelayEdit ReadOnly -TabStop")
KeyDelayUpDown := MainGui.Add("UpDown", "vKeyDelayUpDown Range20-40", KeyDelay)

KeyDelayEdit.OnEvent("Focus", (*) => ControlSend("{Tab}", KeyDelayEdit))

KeyDelayUpDown.OnEvent("Change", (*) => UpdateKeyDelay(KeyDelayUpDown.Value))

UpdateKeyDelay(value) {
    global KeyDelay := value
    IniWrite(KeyDelay, "settings\main-config.ini", "OtherSettings", "KeyDelay")
}    

MainGui.SetFont("s10 bold c000000",    "Tahoma")
MainGui.AddText("x150 y10 w70 h20",    "Key Delay:")

MainGui.SetFont("s8 c000000",    "Tahoma")
MainGui.AddText("x135 y50 w100 h50",    "Recommended: 40")



RepsEdit := MainGui.Add("Edit", "x200 y125 w50 h20 vRepsEdit ReadOnly -TabStop")
RepsUpDown := MainGui.Add("UpDown", "vRepsUpDown Range2-5", Reps)

RepsEdit.OnEvent("Focus", (*) => ControlSend("{Tab}", RepsEdit))

RepsUpDown.OnEvent("Change", (*) => UpdateReps(RepsUpDown.Value))

UpdateReps(value) {
    global Reps := value
	IniWrite(Reps, "settings\main-config.ini", "FieldSettings", "Reps")
}

MainGui.SetFont("s10 bold c000000",    "Tahoma")
MainGui.AddText("x200 y100 w70 h20",    "Reps:")

MainGui.SetFont("s7 c000000", "Tahoma")
MainGui.AddText("x170 y145 w150 h50", "(Loops before realigning)")



Movespeed := IniRead("settings\main-config.ini", "PlayerSettings", "BaseMovespeed")
MovespeedEdit := MainGui.AddEdit("x250 y30 w50 h20 -TabStop", Movespeed)
MovespeedEdit.BackColor := "000000"
MovespeedEdit.SetFont("c000000", "Tahoma")
MainGui.SetFont("s10 bold c000000", "Tahoma")
MainGui.AddText("x250 y10 w70 h20", "Speed:")
MainGui.SetFont("s8 c000000", "Tahoma")
MainGui.AddText("x250 y55 w70 h30", "(WITHOUT BUFFS)")

MovespeedEdit.OnEvent("Change", (*) => SaveMovespeed(MovespeedEdit.Value))

SaveMovespeed(value) {
    IniWrite(value, "settings\main-config.ini", "PlayerSettings", "BaseMovespeed")
}



ConvertTime := IniRead("settings\main-config.ini", "OtherSettings", "ConvertTime")
ConvertTimeEdit := MainGui.AddEdit("x350 y125 w50 h20 -TabStop", ConvertTime)
ConvertTimeEdit.BackColor := "000000"
ConvertTimeEdit.SetFont("c000000", "Tahoma")
MainGui.SetFont("s8 bold c000000", "Tahoma")
MainGui.AddText("x350 y90 w70 h30", "Convert Delay:")
MainGui.SetFont("s7 c000000", "Tahoma")
MainGui.AddText("x345 y150 w100 h50", "(Wait time in seconds)")

ConvertTimeEdit.OnEvent("Change", (*) => SaveConvertTime(ConvertTimeEdit.Value))

SaveConvertTime(value) {
    IniWrite(value, "settings\main-config.ini", "OtherSettings", "ConvertTime")
}



HiveBees := IniRead("settings\main-config.ini", "PlayerSettings", "HiveBees")
HiveBeesEdit := MainGui.AddEdit("x40 y210 w50 h20 -TabStop", HiveBees)
HiveBeesEdit.BackColor := "000000"
HiveBeesEdit.SetFont("c000000", "Tahoma")
MainGui.SetFont("s10 bold c000000", "Tahoma")
MainGui.AddText("x30 y180 w110 h30", "Bees in Hive:")

HiveBeesEdit.OnEvent("Change", (*) => SaveHiveBees(HiveBeesEdit.Value))

SaveHiveBees(value) {
    IniWrite(value, "settings\main-config.ini", "PlayerSettings", "HiveBees")
}


MainGui.Show("w500 h300")





Start() {
    ResetCharacter
    ZoomOutFully
    Send "{" SKey " down}"
    Walk(7)
    Send "{" SKey " up}"
    Loop 2 {
        Send "{" RotRight " down}" "{" RotRight " up}"
    }
    Sleep 100
    GTQBlackBear
    if PixelSearch(&DialogueXPos, &DialogueYPos, 569, 493, 1204, 827, 0x2257a8, 1)
        MouseMove(DialogueXPos, DialogueYPos [, 10])
        TapKey("LMB")
}

if PixelSearch(&DialogueXPos, &DialogueYPos, 569, 493, 1204, 827, 0x2257a8) {
    MouseMove(DialogueXPos, DialogueYPos [, Speed := 10])
    Send "{" LMB " down}" "{" LMB " up}"
}
else {
    Loop 4 {
        Send "{" RotLeft " down}" "{" RotLeft " up}"
    }
        if PixelSearch(&BeeSlotX, &BeeSlotY, 643, 107, 1242, 276, 0xdf9800) {
            return
        }
        else {
            ResetCharacter
        }
}
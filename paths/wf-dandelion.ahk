WFDandelion() {
    Sleep 100
    Send "{" SKey " down}"
    Walk(44)
    Send "{" SKey " up}"
    TapKey(RotRight, 2)
    Send "{" WKey " down}"
    Walk(35)
    Send "{" WKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(30)
    Send "{" DKey " up}"
    Send "{" SKey " down}"
    Walk(2)
    Send "{" SKey " up}"
    WalkUntilImage("EButton", AKey, 180000)
    TapKey(EKey)
    Sleep(ConvertTime * 1000)
    GTFDandelion
}
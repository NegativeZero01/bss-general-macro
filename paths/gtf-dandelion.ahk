GTFDandelion() {
    ResetCharacter
    ZoomOutFully
    CannonSlopeAlignment
    Send "{" AKey " down}"
    Walk(20)
    Send "{" AKey " up}"
    Send "{" SKey " down}"
    Walk(31)
    Send "{" SKey " up}"
    Loop 2 {
         Send "{" RotLeft " down}" "{" RotLeft " up}"
    }
    Sleep 500
    SprinklerPlacement
    Send "{" DKey " down}"
    Walk(10)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(10)
    Send "{" WKey " up}"
    Send "{" DKey " down}"
    Walk(5)
    Send "{" DKey " up}"
    TapKey("SKey")
    Send "{" DKey " down}"
    Send "{" WKey " down}"
    Sleep(100)
    Send "{" WKey " up}"
    Sleep(25)
    Send "{" DKey " up}"
    Sleep(1000)
    Gathering := 1
    DandelionXSnake
}
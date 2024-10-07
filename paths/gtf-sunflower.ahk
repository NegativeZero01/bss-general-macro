GTFSunflower() {
    ResetCharacter
    CannonRamp
    Send "{" SKey " down}"
    Walk(12)
    Send "{" SKey " up}"
    Sleep(100)
    Send "{" DKey " down}"
    Walk(7)
    Send "{" DKey " up}"
    Sleep(100)
    Send "{" SKey " down}"
    Walk(10)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(7)
    Send "{" DKey " up}"
    Send "{" SKey " down}"
    Walk(10)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(3)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(10)
    Send "{" WKey " up}"
    SprinklerPlacement
    SunflowerXSnake
}
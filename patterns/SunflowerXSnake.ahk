while Gathering = 1 {
    Loop {
        Sleep 10000
        PollenContainerDetector("PollenContainerFull")
    }
    if PollenContainerDetector("PollenContainerFull") = 1 {
        global Gathering := 0
    }
}

SunflowerXSnake() {
    global startTime := A_TickCount
    global Gathering := 1
    Send "{" LMB " down}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" AKey " down}"
    Walk(14)
    Send "{" AKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(13)
    Send "{" DKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" AKey " down}"
    Walk(14)
    Send "{" AKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(13)
    Send "{" DKey " up}"
    Send "{" AKey " down}" "{" WKey " down}"
    Walk(15)
    Send "{" WKey " up}" "{" AKey " up}"
    Send "{" DKey " down}"
    Walk(13)
    Send "{" DKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" AKey " down}"
    Walk(14)
    Send "{" AKey " up}"
    Send "{" SKey " down}"
    Walk(3)
    Send "{" SKey " up}"
    Send "{" DKey " down}"
    Walk(20)
    Send "{" DKey " up}"
    Send "{" LMB " up}"
    SunflowerCornerAlignment
}

SunflowerCornerAlignment() {
    Send "{" DKey " down}"
    Walk(20)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(20)
    Send "{" WKey " up}"
    if Gathering = 1 or (A_TickCount - startTime) < (GatherTime * 60000) {
        SunflowerXSnake
    }
    else if Gathering = 0 or (A_TickCount - startTime) > (GatherTime * 60000) {
        WFSunflower
    }
}
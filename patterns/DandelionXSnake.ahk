while Gathering = 1 {
    Loop {
        Sleep 10000
        PollenContainerDetector("PollenContainerFull")
    }
    if PollenContainerDetector("PollenContainerFull") = 1 {
        global Gathering := 0
    }
}

DandelionXSnake() {
    global startTime := A_TickCount
    global Gathering := 1
    Send "{" LMB " down}"
    Send "{" SKey " down}"
    Walk(19)
    Send "{" SKey " up}"
    Loop Reps {
    	Send "{" AKey " down}"
        Walk(12.5)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(13.5)
        Send "{" DKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" AKey " down}"
        Walk(12.5)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(13.5)
        Send "{" DKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" AKey " down}"
        Walk(12.5)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(13.5)
        Send "{" DKey " up}"
        Sleep 100
        Send "{" AKey " down}" "{" SKey " down}"
        Walk(10)
        Send "{" AKey " up}" "{" SKey " up}"
        Send "{" DKey " down}"
        Walk(13.5)
        Send "{" DKey " up}"
    }
    Send "{" LMB " up}"
    DandelionCornerAlignment
}

DandelionCornerAlignment() {
    Send "{" DKey " down}"
    Walk(20)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(25)
    Send "{" WKey " up}"
    if Gathering = 1 or (A_TickCount - startTime) < (GatherTime * 60000) {
        DandelionXSnake
    }
    else if Gathering = 0 or (A_TickCount - startTime) > (GatherTime * 60000) {
        WFDandelion
    }
}
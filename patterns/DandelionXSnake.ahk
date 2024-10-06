while Gathering = 1 {
    Loop {
        Sleep 10000
        BackpackFullDetector("PollenContainerFull")
    }
}

DandelionCornerAlignment() {
    Send "{" DKey " down}"
    Walk(20)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(25)
    Send "{" WKey " up}"
    if Gathering := 1 {
        DandelionXSnake
    }
    else {
        WFDandelion
    }
}

DandelionXSnake() {
    Send "{" LMB " down}"
    Send "{" SKey " down}"
    Walk(19)
    Send "{" SKey " up}"
    Loop Reps {
        Send "{" AKey " down}"
        Walk(14)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(14)
        Send "{" DKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" AKey " down}"
        Walk(13)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(14)
        Send "{" DKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" AKey " down}"
        Walk(13)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
        Send "{" DKey " down}"
        Walk(14)
        Send "{" DKey " up}"
        Send "{" AKey " down}" "{" SKey " down}"
        Walk(15)
        Send "{" AKey " up}" "{" SKey " up}"
        Send "{" DKey " down}"
        Walk(14)
        Send "{" DKey " up}"
        Send "{" LMB " up}"
    }
    DandelionCornerAlignment
}
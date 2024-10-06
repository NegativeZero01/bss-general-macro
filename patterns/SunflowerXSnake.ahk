SunflowerCornerAlignment() {
    Send "{" LMB " up}"
    Send "{" WKey " down}"
    Walk(20)
    Send "{" WKey " up}"
    if Gathering := 1 {
        SunflowerXSnake
    }
}

SunflowerXSnake() {
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
    SunflowerCornerAlignment
}
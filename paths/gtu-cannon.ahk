CannonRamp() {
    Send "{" WKey " down}"
    Walk(5)
    Send "{" WKey " up}"
    Sleep 100
    if Hiveslot = 1 {
        Send "{" DKey " down}"
        Walk(10)
        Send "{" DKey " up}"
    }
    if HiveSlot = 2 {
        Send "{" DKey " down}"
        Walk(15)
        Send "{" DKey " up}"
    }
    if HiveSlot = 3 {
        Send "{" DKey " down}"
        Walk(25)
        Send "{" DKey " up}"
    }
    if HiveSlot = 4 {
        Send "{" DKey " down}"
        Walk(40)
        Send "{" DKey " up}"
    }
    if HiveSlot = 5 {
        Send "{" DKey " down}"
        Walk(50)
        Send "{" DKey " up}"
    }
    if HiveSlot = 6 {
        Send "{" DKey " down}"
        Walk(60)
        Send "{" DKey " up}"
    }
}

GTUCannon() {
    CannonRamp
    Send "{" SpaceKey " down}" "{" SpaceKey " up}"
    Send "{" DKey " down}"
    Walk(2)
    Send "{" DKey " up}"
    Send "{" WKey " down}"
    Walk(2)
    Send "{" WKey " up}"
    WalkUntilImage("EButton", DKey, 30000) 
    Send "{" EKey " down}" "{" EKey " up}"
}
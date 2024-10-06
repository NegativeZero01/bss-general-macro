CannonSlopeAlignment() {
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

CannonPath() {
    CannonSlopeAlignment
    TapKey("SpaceKey")
    Send "{" DKey " down}"
    Loop 1 {
        Send "{" WKey " down}"
        Walk(2)
        Send "{" WKey " up}"
    }
    Walk(7)
    Send "{" DKey " up}"
    Sleep 100
    TapKey("EKey")
}
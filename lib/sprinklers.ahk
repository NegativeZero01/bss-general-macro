PlaceSprinkler() {
    Send "{" SpaceKey " down}" "{" SpaceKey " up}"
    HyperSleep(700)
    Send "{" OneKey " down}" "{" OneKey " up}"
    Sleep 100
}

SprinklerPlacement() {
    if CurrentField = "1" {

        if Sprinkler = "1" {
            SunflowerCornerAlignment
        }

        if Sprinkler = "2" {
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            Sleep 100
            Send "{" AKey " down}"
            Walk(10)
            Send "{" AKey " up}"
            Sleep 100
            Send "{" SKey " down}"
            Walk(5)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(15)
            Send "{" DKey " up}"
            SunflowerCornerAlignment
        }

        if Sprinkler = "3" {
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            Sleep 100
            Send "{" AKey " down}"
            Walk(14)
            Send "{" AKey " up}"
            Sleep 100
            Send "{" SKey " down}"
            Walk(5)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(8)
            Send "{" DKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(15)
            Send "{" DKey " up}"
            SunflowerCornerAlignment
        }

        if Sprinkler = "4" {
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            Sleep 100
            Send "{" AKey " down}"
            Walk(14)
            Send "{" AKey " up}"
            Sleep 100
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(8)
            Send "{" DKey " up}"
            PlaceSprinkler
            Send "{" AKey " down}"
            Walk(4)
            Send "{" AKey " up}"
            Send "{" SKey " down}"
            Walk(8)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(15)
            Send "{" DKey " up}"
            SunflowerCornerAlignment
        }

        if Sprinkler = "5" {
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            Sleep 100
            Send "{" AKey " down}"
            Walk(14)
            Send "{" AKey " up}"
            Sleep 100
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" SKey " down}"
            Walk(10)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" WKey " down}"
            Walk(10)
            Send "{" WKey " up}"
            Send "{" DKey " down}"
            Walk(8)
            Send "{" DKey " up}"
            PlaceSprinkler
            Send "{" SKey " down}"
            Walk(10)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(15)
            Send "{" DKey " up}"
            SunflowerCornerAlignment
        }

        if Sprinkler = "6" {
            Send "{" SKey " down}"
            Walk(3)
            Send "{" SKey " up}"
            Sleep 100
            Send "{" AKey " down}"
            Walk(10)
            Send "{" AKey " up}"
            Sleep 100
            Send "{" SKey " down}"
            Walk(7)
            Send "{" SKey " up}"
            PlaceSprinkler
            Send "{" DKey " down}"
            Walk(15)
            Send "{" DKey " up}"
            SunflowerCornerAlignment
        }

    }

    if CurrentField = "2" {

        if Sprinkler = "1" {
        Send "{" WKey " down}"
        Walk(42)
        Send "{" WKey " up}"
       }
   
       if Sprinkler = "2" {
        Send "{" WKey " down}"
        Walk(30)
        Send "{" WKey " up}"
        PlaceSprinkler
        Send "{" WKey " down}"
        Walk(12)
        Send "{" WKey " up}"
       }
   
       if Sprinkler = "3" {
        Send "{" WKey " down}"
        Walk(30)
        Send "{" WKey " up}"
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        PlaceSprinkler
        Send "{" DKey " down}"
        Walk(10)
        Send "{" DKey " up}"
        PlaceSprinkler
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        Send "{" WKey " down}"
        Walk(12)
        Send "{" WKey " up}"
       }
   
       if Sprinkler = "4" {
        Send "{" WKey " down}"
        Walk(28)
        Send "{" WKey " up}"
        Sleep 100
        PlaceSprinkler
        Send "{" WKey " down}"
        Walk(7)
        Send "{" WKey " up}"
        Sleep 100
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        PlaceSprinkler
        Send "{" DKey " down}"
        Walk(10)
        Send "{" DKey " up}"
        PlaceSprinkler
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        Sleep 100
        Send "{" WKey " down}"
        Walk(7)
        Send "{" WKey " up}"
       }
   
       if Sprinkler = "5" {
        Send "{" WKey " down}"
        Walk(28)
        Send "{" WKey " up}"
        Sleep 100
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        PlaceSprinkler
        Send "{" DKey " down}"
        Walk(9)
        Send "{" DKey " up}"
        PlaceSprinkler
        Send "{" AKey " down}"
        Walk(4)
        Send "{" AKey " up}"
        Sleep 25
        Send "{" WKey " down}"
        Walk(7)
        Send "{" WKey " up}"
        Sleep 100
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        PlaceSprinkler
        Send "{" DKey " down}"
        Walk(10)
        Send "{" DKey " up}"
        PlaceSprinkler
        Send "{" AKey " down}"
        Walk(5)
        Send "{" AKey " up}"
        Sleep 100
        Send "{" WKey " down}"
        Walk(7)
        Send "{" WKey " up}"
       }
   
       if Sprinkler = "6" {
        Send "{" WKey " down}"
        Walk(30)
        Send "{" WKey " up}"
        PlaceSprinkler
        Send "{" WKey " down}"
        Walk(12)
        Send "{" WKey " up}"
       }
    }
}
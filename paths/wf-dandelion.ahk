WFDandelion() {
    DandelionCornerAlignment
    Send "{" SKey " down}"
    Walk(44)
    Send "{" SKey " up}"
    Loop 2 {
        TapKey("RotLeft")
    }
    Send "{" WKey " down}"
    Walk(9)
    Send "{" WKey " up}"

    if HiveSlot = 1 {
        Send "{" DKey " down}"
        Walk(17)
        Send "{" DKey " up}"
        Send "{" WKey " down}"
        Walk(20)
        Send "{" WKey " up}"
        Send "{" SKey " down}"
        Walk(3)
        Send "{" SKey " up}"
        InteractionDetector("EButton")
        if InteractionReturnValue = 1 {
            TapKey("EKey")
            Sleep (ConvertTime * 1000)
            WFDandelion
        }
        else {
            MsgBox "Error! Could not find hive. Resetting...", "Oops! You've ran into an error"
            GTFDandelion
        }
    }
}
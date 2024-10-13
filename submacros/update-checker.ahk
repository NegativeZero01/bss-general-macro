#Requires AutoHotkey v2.0 
#Include "%A_InitialWorkingDir%\lib\cJSON.ahk"

global releases := QueryGitHubRepo("NegativeZero01/bss-quest-macro", "releases")
result := MsgBox("A new, updated version of the macro has been found on the GitHub archive. This release is " releases[1]["tag_name"] ". Would you like to download it?", "New Update Available", "0x1") ; Display latest release version number
if result = "OK" {
        MsgBox("Please note that, if the displayed release was an 'alpha', 'beta' and/or 'pre-release', you will not be updated to it and instead just have the current version of bss-quest-macro redownloaded. Update.bat only installs the latest release so pre-releases will have to be installed manually", "Notice")
        run "update.bat"
        ExitApp
}
global ReleaseName := "bss-quest-macro-" releases[1]["tag_name"]

QueryGitHubRepo(repo, subrequest := "", data := "", token := "") {
    whr := ComObject("WinHttp.WinHttpRequest.5.1")
    repo := StrSplit(repo, "/")
    if (subrequest := Trim(subrequest, "/\"))
        subrequest := "/" subrequest

    whr.Open("GET", "https://api.github.com/repos/" repo[1] "/" repo[2] subrequest (data ? ObjToQuery(data) : ""), true)
    whr.SetRequestHeader("Accept", "application/vnd.github+json")
    if token
        whr.SetRequestHeader("Authorization", "Bearer " token)
    whr.Send()
    whr.WaitForResponse()
    return JSON.Load(whr.ResponseText)
}

ObjToQuery(oData) { ; https://gist.github.com/anonymous1184/e6062286ac7f4c35b612d3a53535cc2a?permalink_comment_id=4475887#file-winhttprequest-ahk
    static HTMLFile := InitHTMLFile()
    if (!IsObject(oData)) {
        return oData
    }
    out := ""
    for key, val in (oData is Map ? oData : oData.OwnProps()) {
        out .= HTMLFile.parentWindow.encodeURIComponent(key) "="
        out .= HTMLFile.parentWindow.encodeURIComponent(val) "&"
    }
    return "?" RTrim(out, "&")

    InitHTMLFile() {
        doc := ComObject("HTMLFile")
        doc.write("<meta http-equiv='X-UA-Compatible' content='IE=Edge'>")
        return doc
    }
}
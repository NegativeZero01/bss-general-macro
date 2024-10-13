#Requires AutoHotkey v2.0 
#Include "%A_InitialWorkingDir%\lib\cJSON.ahk"

QueryUpdate() {
    result := MsgBox("An updated version of the macro was found. This release is " releases[1]["tag_name"] ", and your current version is " releasetag ". Would you like to download it?", "New Update Available", "0x1") ; Display latest release version number
    if result = "OK" {
        run "update.bat"
        ExitApp
    }
}

global releasetag := "v0.3.0.0-alpha.1"
global releases := QueryGitHubRepo("NegativeZero01/bss-quest-macro", "releases")
global ReleaseName := "bss-quest-macro-" releases[1]["tag_name"]

if releases[1]["tag_name"] != releasetag {
    QueryUpdate()
} else {
    ExitApp
}

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
#Requires AutoHotkey v2.0 
#include "%A_InitialWorkingDir%\lib\cJSON.ahk"

releases := QueryGitHubRepo("NegativeZero01/bss-quest-macro", "releases")
MsgBox releases[1]["tag_name"] ; Display latest release version number
ReleaseName := "bss-quest-macro-" releases[1]["tag_name"]
Download releases[1]["zipball_url"], ReleaseName ".zip" ; Download as zip
DirCopy ReleaseName ".zip", ReleaseName ; Extract zip

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
    return cJSON.Load(whr.ResponseText)
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
Set ws = CreateObject("Wscript.Shell") 
Set fso = createObject("Scripting.FileSystemObject")
ws.run "cmd /c " & fso.getParentFolderName(WScript.ScriptFullName) &"\lemonade.exe server", vbhide

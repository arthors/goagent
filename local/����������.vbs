
Set WshShell = WScript.CreateObject("WScript.Shell")
Set fso = WScript.CreateObject("Scripting.FileSystemObject")
strDesktop = WshShell.SpecialFolders("Startup")
Set oShellLink = WshShell.CreateShortcut(strDesktop & "\goagent.lnk")
oShellLink.TargetPath = WshShell.CurrentDirectory & "\goagent.exe"
oShellLink.WindowStyle = 1
oShellLink.Description = "GoAgent"
oShellLink.WorkingDirectory = WshShell.CurrentDirectory
oShellLink.Save

WshShell.Environment("Process").Item("PYTHONSCRIPT2") = "import sys,os,ctypes;ctypes.windll.kernel32.WritePrivateProfileStringA('listen', 'visible', ' 0', os.path.abspath('proxy.ini'))"
WshShell.Run "proxy.exe"

WScript.Echo "成功加入GoAgent到启动项"
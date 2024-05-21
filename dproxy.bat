@echo off
setlocal enabledelayedexpansion

set /p prox=enter socks5 port of your proxy (10808 for v2rayn / 2080 for nekoray)   :  


set "basePath=%USERPROFILE%\AppData\Local\Discord"
set "targetPath="


for /d %%i in ("%basePath%\app-*") do (
    set "targetPath=%%i"
)


set "shortcutPath=%~dp0DiscordProxy.lnk"
set "targetExe=%targetPath%\Discord.exe"
set "arguments=--proxy-server="socks5://127.0.0.1:%prox%""


powershell -command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%shortcutPath%'); $s.TargetPath = '%targetExe%'; $s.Arguments = '%arguments%'; $s.Save()"


exit /b 0

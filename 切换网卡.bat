@echo off&color 17
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
rem start命令：start "title" filename
start "获取权限" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)
exit /B
:UACAdmin

netsh interface show interface lan | findstr 启用
if ERRORLEVEL 1 (
netsh interface set interface WLAN disabled
echo 无线网已禁用
netsh interface set interface LAN enabled
echo 有线网已启用
) else (
netsh interface set interface LAN disabled
echo 有线网已禁用
netsh interface set interface WLAN enabled
echo 无线网已启用
)

pause
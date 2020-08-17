@echo off&color 17
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
rem start命令：start "title" filename
start "获取权限" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)
exit /B
:UACAdmin
cd /d "%~dp0"
echo 当前运行路径是：%CD%
echo 已获取管理员权限

reg ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v AwayModeEnabled /d 0 /f /t REG_DWORD
reg QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /f AwayModeEnabled
pause
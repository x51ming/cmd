@echo off&color 17
if exist "%SystemRoot%\SysWOW64" path %path%;%windir%\SysNative;%SystemRoot%\SysWOW64;%~dp0
bcdedit >nul
if '%errorlevel%' NEQ '0' (goto UACPrompt) else (goto UACAdmin)
:UACPrompt
rem start���start "title" filename
start "��ȡȨ��" mshta vbscript:createobject("shell.application").shellexecute("""%~0""","::",,"runas",1)(window.close)
exit /B
:UACAdmin
cd /d "%~dp0"
echo ��ǰ����·���ǣ�%CD%
echo �ѻ�ȡ����ԱȨ��
rem ����ѡ��
echo select disk 2 >"%tmp%\dp"
echo online disk >>"%tmp%\dp"
@echo on
diskpart /s "%tmp%\dp"
pause
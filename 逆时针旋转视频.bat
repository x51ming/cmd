@echo off
echo "��ʱ����ת%~dpn1_rot%~x1"
pause
ffmpeg -i %1 -metadata:s:v rotate="90" -codec copy "%~dpn1_rot%~x1"
pause

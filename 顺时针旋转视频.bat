@echo off
echo "ÄæÊ±ÕëĞı×ª%~dpn1_rot%~x1"
pause
ffmpeg -i %1 -metadata:s:v rotate="90" -codec copy "%~dpn1_rot%~x1"
pause

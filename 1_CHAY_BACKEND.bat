@echo off
title TOEIC Backend (localhost:5000)
cd /d C:\Giua-ky\backend\ToeicBackend
echo Dang chay backend... mo trinh duyet http://localhost:5000/Exam
"C:\Program Files\dotnet\dotnet.exe" run --urls http://localhost:5000
pause

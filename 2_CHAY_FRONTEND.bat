@echo off
title TOEIC Flutter App (Chrome)
cd /d C:\Giua-ky\frontend\toeic_app
echo Dang chay app Flutter tren Chrome...
C:\src\flutter\bin\flutter.bat run -d chrome --dart-define=USE_MOCK=false
pause

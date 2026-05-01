@echo off
chcp 65001 >nul
title Nginx windows环境查杀工具

:MENU
cls
echo ===============================
echo        Nginx 管理工具
echo ===============================
echo 1. 查找 nginx 进程
echo 2. 终止 nginx 进程
echo 3. 退出
echo ===============================
set /p choice=请选择操作 [1-3]： 

if "%choice%"=="1" goto FIND
if "%choice%"=="2" goto KILL
if "%choice%"=="3" exit
goto MENU

:FIND
cls
echo 正在查找 nginx 进程...
echo --------------------------------------
tasklist | findstr /i "nginx"
echo --------------------------------------
echo.
pause
goto MENU

:SHOWPORT
cls
echo nginx PID: %PID%
echo --------------------------------------
echo 正在查询端口信息...
netstat -ano | findstr "%PID%"
echo --------------------------------------
echo.
pause
goto MENU

:KILL
cls
echo 正在查找 nginx 进程...
tasklist /fi "imagename eq nginx.exe"
echo.
echo 正在结束 nginx 进程...
taskkill /fi "imagename eq nginx.exe" /F
echo.
echo 操作完成！
pause
goto MENU

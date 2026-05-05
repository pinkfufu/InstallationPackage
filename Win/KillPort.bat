@echo off
title 端口查杀工具
:start
cls
echo =======================================
set /p port=请输入要查询的端口号: 
echo =======================================

echo 正在查询端口 %port% 的占用情况...
:: 显示占用详情
netstat -ano | findstr :%port%

if %errorlevel% neq 0 (
    echo.
    echo [提示] 端口 %port% 当前没有被占用。
    goto retry
)

echo.
echo 最后一列数字即为 PID。
echo 如果你想结束进程，请输入 PID；如果不想杀进程，直接按回车跳过。
set /p kpid=请输入要杀掉的 PID: 

if "%kpid%"=="" (
    echo 已跳过杀进程操作。
    goto retry
)

:: 执行杀进程
taskkill /F /PID %kpid%
if %errorlevel% equ 0 (
    echo 成功结束进程 %kpid%！
) else (
    echo 结束进程失败，请检查 PID 是否正确或尝试以管理员身份运行。
)

:retry
echo.
echo ---------------------------------------
echo 输入 1 继续查询，直接关闭窗口退出。
set /p op=选择: 
if "%op%"=="1" goto start
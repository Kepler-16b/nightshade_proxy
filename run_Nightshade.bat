@echo off
chcp 65001 > nul
setlocal

set LAST_HEADER="#最后一次运行时使用的代理服务器为："

REM 提示用户输入代理服务器地址
set /p PROXY_SERVER=请输入代理服务器地址（如127.0.0.1）: 

REM 提示用户输入代理服务器端口
set /p PROXY_PORT=请输入代理服务器端口号: 

REM 将用户输入的代理信息写入配置文件
echo LAST_HEADER=%LAST_HEADER%> last_proxy_config.txt
echo PROXY_SERVER=%PROXY_SERVER%> last_proxy_config.txt
echo PROXY_PORT=%PROXY_PORT%>> last_proxy_config.txt

REM 设置要运行的程序路径
set PROGRAM_NAME=Nightshade.exe
set PROGRAM_PATH=%~dp0%PROGRAM_NAME%

REM 设置环境变量，让 Nightshade.exe 使用指定的代理
set HTTP_PROXY=http://%PROXY_SERVER%:%PROXY_PORT%
set HTTPS_PROXY=http://%PROXY_SERVER%:%PROXY_PORT%
set FTP_PROXY=http://%PROXY_SERVER%:%PROXY_PORT%

REM 运行程序
start "" "%PROGRAM_PATH%"

REM 退出脚本
exit


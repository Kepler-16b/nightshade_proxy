@echo off
setlocal

REM 提示用户输入代理服务器地址
set /p PROXY_SERVER=Enter your system proxy server (e.g. 127.0.0.1): 

REM 提示用户输入代理服务器端口
set /p PROXY_PORT=Enter your system proxy port: 

REM 将用户输入的代理信息写入配置文件
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

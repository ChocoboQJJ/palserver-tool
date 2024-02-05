@echo off

rem 开始无限循环
rem Begin infinite loop
:restart

rem 强制结束进程（替换成你的程序的名称，如xxx.exe）
rem Forcefully terminate the process (replace with the name of your program, e.g., xxx.exe)
taskkill /f /t /im xxx.exe

rem 启动程序（替换成你的程序的绝对路径，如G:\xxxxx\xxx.exe）
rem Start the program (replace with the absolute path of your program, e.g., G:\xxxxx\xxx.exe)
start G:\xxxxx\xxx.exe

rem 等待21600秒（6小时）
rem Wait for 21600 seconds (6 hours)
timeout /t 21600 /nobreak

rem 返回循环的开始
rem Return to the start of the loop
goto restart
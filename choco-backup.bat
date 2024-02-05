@echo off
chcp 65001
setlocal enabledelayedexpansion

rem 获取用户输入的源路径
rem Get the source path from user input
set /p source="输入要压缩的文件或文件夹（文件或文件夹）： "

rem 获取用户输入的压缩文件的保存路径
rem Get the destination path from user input
set /p destination="输入压缩文件的保存路径（文件夹）： "

rem 无限循环
rem Start of infinite loop
:loop

rem 获取当前日期和时间
rem Get the current date and time
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "dt=!dt:~0,8!_!dt:~8,6!"

rem 设置压缩文件的目标路径
rem Set the destination path for the compressed file
set "destinationPath=!destination!\backup_!dt!.zip"

rem 使用PowerShell命令压缩文件或文件夹
rem Use PowerShell command to compress the file or folder
powershell.exe -nologo -noprofile -command "& { Compress-Archive -Path %source% -DestinationPath !destinationPath! }"

rem 检查压缩文件的数量，如果超过用户指定的最大数量，则删除最旧的压缩文件
rem Check the number of compressed files, if it exceeds the user-specified maximum number, delete the oldest compressed file
for /f "skip=24 delims=" %%a in ('dir /b /o-d /a-d "!destination!\*.zip"') do del "!destination!\%%a"

rem 在下一次迭代之前等待用户指定的时间间隔
rem Wait for the user-specified time interval before the next iteration
timeout /t 3600 /nobreak

rem 返回循环的开始
rem Return to the start of the loop
goto loop
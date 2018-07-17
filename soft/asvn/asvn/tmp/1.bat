@echo off
setlocal enabledelayedexpansion
set config_file=build.properties
set from_version=7298
set to_version=7302


rem 读取配置文件
for /f "tokens=1,2 delims==" %%i in (%config_file%) do (
    set %%i=%%j
)

rem 删除临时文件
set current_path=%~dp0
del /f /s /q %current_path%%tempdir%

rem 比较差异文件
D:\soft1\asvn\bin\svn diff --summarize -r 7298:7302 http://210.14.78.35:9013/svn/fluxoms/B_1.13 > file_list.txt

rem 导出差异文件
for /f "delims=" %%i in (file_list.txt) do (
    call :export %%i
)
goto :EOF

:export
set fullpath=%2
set filename=%~nx2
set "filepath=!fullpath:%filename%=!"
set "filepath=!filepath:%url%=!"
set "filepath=%filepath:/=\%"
if not exist %tempdir%%filepath% mkdir %tempdir%%filepath%
echo %to_version% %fullpath% %tempdir%%filepath%%filename%
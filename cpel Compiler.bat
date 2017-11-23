DEVICE=ANSI.SYS
:: Version 1.0.4
@echo off
mode 1000
title cpel Compiler
goto start

:start
(
@echo off
echo @echo off
echo rem Compiled by Addison's cpel Compiler from cpel v04. 
)>sys.bat
(
@echo off
)>sys.cpel
cls
echo 1= Start new
echo 2= Import from cpel
set /p home= "-->"
if %home%==2 goto importcpel
cls
set /p xt= "Script Name: "
echo Type the program here:
goto compile

:er
cls
echo Not existent!
pause
goto start

:importcpel
cls
echo cpel Name (without .cpel):
set /p xt= ""
if not exist "%xt%.cpel" goto er
(
type "%~dp0%xt%.cpel"
)|clip
cls
echo Right-click to confirm that you are not a bot:
goto compile

:compile
set /a line=%line%+1
set cmd=-
set /p cmd= "[0m%line% | [1;32m "
(
@echo off
type "sys.cpel"
echo %cmd%
)>sys-2.cpel
del "%~dp0/sys.cpel"
ren "%~dp0/sys-2.cpel" "sys.cpel"
if "%cmd%"=="output" goto echo
if "%cmd%"=="input" goto setp
if "%cmd%"=="connect" goto ping
if "%cmd%"=="wait" goto wait
if "%cmd%"=="end" goto exit
if "%cmd%"=="export" goto compilend
if "%cmd%"=="fullscreen" goto fullscreen
if "%cmd%"=="clear" goto cls
goto compile

:echo
set /a line=%line%+1
set /p cmdc= "[0m%line% |  "
(
@echo off
type "sys.cpel"
echo %cmdc%
)>sys-2.cpel
del "%~dp0/sys.cpel"
ren "%~dp0/sys-2.cpel" "sys.cpel"
goto savecho

:savecho
(
@echo off
type "sys.bat"
echo. 
echo rem Echoes "%cmdc%"
echo echo %cmdc%
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:setp
set /a line=%line%+1
set /p cmdc= "[0m%line% | [0m "
(
@echo off
type "sys.cpel"
echo %cmdc%
)>sys-2.cpel
del "%~dp0/sys.cpel"
ren "%~dp0/sys-2.cpel" "sys.cpel"
goto savesetp

:savesetp
(
@echo off
type "sys.bat"
echo. 
echo rem Lets the user type and saves it to the variable %cmdc%. 
echo set /p %cmdc%= ""
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:exit
(
type "sys.bat"
echo. 
echo rem Exits. 
echo exit
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:ping
set /a line=%line%+1
set /p cmdc= "[0m%line% | [0m "
(
@echo off
type "sys.cpel"
echo %cmdc%
)>sys-2.cpel
del "%~dp0/sys.cpel"
ren "%~dp0/sys-2.cpel" "sys.cpel"
goto saveping

:saveping
(
@echo off
type "sys.bat"
echo. 
echo rem Pings the IP address %cmdc%
echo ping %cmdc%
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:wait
(
@echo off
type "sys.bat"
echo. 
echo rem Waits for the user to press any key, displaying "Press any key to continue..."
echo pause
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:fullscreen
(
@echo off
type "sys.bat"
echo. 
echo rem Makes the screen go to maximum size. 
echo mode 1000
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:cls
(
type "sys.bat"
echo. 
echo rem Clears the screen. 
echo cls
)>sys2.cpel
del "%~dp0/sys.bat"
ren "%~dp0/sys2.cpel" "sys.bat"
goto compile

:compilend
(
@echo off
)|clip
(
@echo off
type "sys.cpel"
echo. 
)>sys-2.cpel
del "%~dp0/sys.cpel"
ren "%~dp0/sys-2.cpel" "sys.cpel"
del "compiled_%xt%.bat"
del "%xt%.cpel"
ren "sys.bat" "compiled_%xt%.bat"
ren "sys.cpel" "%xt%.cpel"
echo. 
cls
echo [0m Compiling...
ping localhost >nul
:ec
set ce=nul
echo [0m Compiled!
echo. 
echo. 
echo 1= Run program
echo 2= Open CPEL in notepad
echo 3= Exit
set /p ce= "-->"
if "%ce%"=="1" goto rp
if "%ce%"=="3" exit
if "%ce%"=="2" (
start notepad "%~dp0%xt%.cpel"
cls
goto ec
)
cls
goto ec

:rp
cls
call "compiled_%xt%.bat"
cls
goto ec
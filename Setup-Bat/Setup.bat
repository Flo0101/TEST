@echo off
@echo off

:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------    
winget install Google.Chrome
winget install Mozilla.Firefox
winget install Oracle.MySQL
winget install Microsoft.Teams
winget install Docker.DockerDesktop
winget install Postman.Postman
winget install Spotify.Spotify
winget install TeamViewer.TeamViewer
winget install Git.Git
winget install 7zip.7zip
winget install Greenshot.Greenshot
winget install DominikReichl.KeePass
winget install Notepad++.Notepad++
winget install Microsoft.OneDrive
winget install Axosoft.GitKraken
winget install PuTTY.PuTTY
winget install Microsoft.VisualStudioCode
winget install Twilio.Authy

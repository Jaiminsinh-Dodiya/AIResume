@echo off
setlocal enabledelayedexpansion
title AI-Resume WebApplication - Setup

echo ============================================
echo  AI-Resume WebApplication - Auto Setup
echo ============================================
echo.

set "ROOT=%~dp0"
set "SLN=%ROOT%AI-Resume WebApplication.sln"
set "TOOLS=%ROOT%tools"
set "NUGET_EXE=%TOOLS%\nuget.exe"

if not exist "%SLN%" (
    echo [ERROR] Could not find "AI-Resume WebApplication.sln" next to this script.
    echo Make sure setup.bat sits in the same folder as the .sln file.
    pause
    exit /b 1
)

REM ---------------------------------------------
REM 1. Get nuget.exe if we don't already have it
REM ---------------------------------------------
if not exist "%TOOLS%" mkdir "%TOOLS%"

if not exist "%NUGET_EXE%" (
    echo [1/4] Downloading nuget.exe ...
    powershell -NoProfile -ExecutionPolicy Bypass -Command ^
        "Invoke-WebRequest -Uri 'https://dist.nuget.org/win-x86-commandline/latest/nuget.exe' -OutFile '%NUGET_EXE%'"
    if not exist "%NUGET_EXE%" (
        echo [ERROR] Failed to download nuget.exe. Check your internet connection.
        pause
        exit /b 1
    )
) else (
    echo [1/4] nuget.exe already present, skipping download.
)

REM ---------------------------------------------
REM 2. Restore NuGet packages
REM ---------------------------------------------
echo.
echo [2/4] Restoring NuGet packages ...
"%NUGET_EXE%" restore "%SLN%"
if errorlevel 1 (
    echo [ERROR] NuGet restore failed.
    pause
    exit /b 1
)

REM ---------------------------------------------
REM 3. Find MSBuild via vswhere
REM ---------------------------------------------
echo.
echo [3/4] Locating MSBuild ...

set "VSWHERE=%ProgramFiles(x86)%\Microsoft Visual Studio\Installer\vswhere.exe"
set "MSBUILD="

if exist "%VSWHERE%" (
    for /f "usebackq tokens=*" %%i in (`"%VSWHERE%" -latest -prerelease -products * -requires Microsoft.Component.MSBuild -find MSBuild\**\Bin\MSBuild.exe`) do (
        set "MSBUILD=%%i"
    )
)

if not defined MSBUILD (
    echo [ERROR] Could not locate MSBuild.exe automatically.
    echo Make sure Visual Studio 2022 is installed with the
    echo "ASP.NET and web development" workload.
    pause
    exit /b 1
)

echo Found MSBuild at:
echo   !MSBUILD!

REM ---------------------------------------------
REM 4. Build the solution
REM ---------------------------------------------
echo.
echo [4/4] Building solution (Debug^|Any CPU) ...
"!MSBUILD!" "%SLN%" /t:Build /p:Configuration=Debug /p:Platform="Any CPU" /m /nologo /verbosity:minimal

if errorlevel 1 (
    echo.
    echo [ERROR] Build failed. Scroll up for details.
    pause
    exit /b 1
)

echo.
echo ============================================
echo  Setup complete! Open the .sln in Visual
echo  Studio 2022 and press F5 to run the site.
echo ============================================
pause

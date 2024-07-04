@echo off
setlocal

color A

REM Define source and destination paths
set "source1=C:\Script_v1\Content Downloader\IDSContentDownloader.exe.config"
set "destination1=C:\IDSSystem\Content Downloader"

set "source2=C:\Script_v1\DataDownloader\IDSDataDownloader.exe.config"
set "destination2=C:\IDSSystem\DataDownloader"

set "source3=C:\Script_v1\Datawall Designer\Datawall Designer.exe.config"
set "destination3=C:\IDSSystem\Datawall Designer"

set "source4=C:\Script_v1\WavetecCMS\Web.config"
set "destination4=C:\IDSSystem\WavetecCMS"

REM Track success
set "success=true"

REM Function to check and copy file
call :copyFile "%source1%" "%destination1%"
call :copyFile "%source2%" "%destination2%"
call :copyFile "%source3%" "%destination3%"
call :copyFile "%source4%" "%destination4%"

REM If success flag is still true, then all files were copied successfully
if "%success%"=="true" (
    echo All files copied successfully.
)

exit /b 0

:copyFile
set "src=%~1"
set "dest=%~2"

REM Check if the source file exists
if not exist "%src%" (
    echo Source file does not exist: %src%
    set "success=false"
    exit /b 1
)

REM Check if the destination directory exists
if not exist "%dest%" (
    echo Destination directory does not exist: %dest%
    set "success=false"
    exit /b 1
)

REM Copy the file to the destination
copy /y "%src%" "%dest%"

REM Check if the copy was successful
if %errorlevel% neq 0 (
    echo Failed to copy file from %src% to %dest%
    set "success=false"
    exit /b 1
)

REM If successful, echo a success message
echo File copied successfully from %src% to %dest%
goto :EOF

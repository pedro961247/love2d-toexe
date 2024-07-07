@echo off

if "%~1"=="" (
    echo primeiro insira a pasta do seu projeto
    pause
    exit /b
) 

if not exist "%~1" (
    echo primeiro insira a pasta do seu projeto
    pause
    exit /b
)

"C:\Program Files\7-Zip\7z.exe" a "%~dp0tempfile_project.zip" "%~1\*"

timeout /t 2 /nobreak

ren "%~dp0tempfile_project.zip" "tempfile_project.love"

set /p nome=Insira um nome para o executavel: 

copy /b "C:\Program Files\LOVE\love.exe" + "%~dp0tempfile_project.love" "%~dp0%nome%.exe" || (set /p f=Arraste o arquivo do love.exe:)

if %errorlevel% neq 0 (
    echo %f%
    copy /b "%f%" + "%~dp0tempfile_project.love" "%~dp0%nome%.exe"
)

timeout /t 1 /nobreak

del "%~dp0tempfile_project.love"

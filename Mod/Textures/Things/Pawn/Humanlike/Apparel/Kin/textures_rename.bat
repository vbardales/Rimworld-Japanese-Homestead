echo off
for /r %%f in ( * ) do call :sub "%%f"
exit /b

:sub
set fname=%~nx1
set fname=%fname:WA-Dressing-Kamishimo=WA-Dressing-Kin%
ren %1 %fname%
goto :EOF

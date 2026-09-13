echo off
for /r %%f in ( * ) do call :sub "%%f"
exit /b

:sub
set fname=%~nx1
set fname=%fname:WA-Dressing-TownGirl=WA-Dressing-PriestSoldier%
ren %1 %fname%
goto :EOF

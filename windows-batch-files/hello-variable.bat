@echo off

set name=test

set /a num=1

echo Hello %name%!

:top
set /a num=%num%+1
echo %num%
goto top

pause
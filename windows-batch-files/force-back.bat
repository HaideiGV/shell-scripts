@echo off
set /a num=0
set /a peek=200

Rem First loop
:top
set /a num=%num%+1
echo %num%
if %num%==%peek% goto goback
goto top


Rem Second loop
:goback
set /a num=%num%-1
echo %num%
set /a peek=%peek%-10 
if %num%==0 goto top
goto goback
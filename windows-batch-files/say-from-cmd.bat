@echo off

set v1=Hi!
set v2=Bye!

echo Press 1 to say Hi!
echo Press 2 to say Bye!

set /p you=

if %you%==1 echo You say %v1%
if %you%==2 echo You say %v2%

pause
@echo off

echo Type name
set /p name=
echo Type age
set /p age=
echo Type gender
set /p gender=

if %gender%==m echo My name is %name%. I am %age% years old. I am a man!
if %gender%==f echo My name is %name%. I am %age% years old. I am a woman!

pause
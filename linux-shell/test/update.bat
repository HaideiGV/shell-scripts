@echo off

Rem psql -d testdb -U haidei -c "select * from querylist" > outw.txt

Setlocal EnableDelayedExpansion
set LIST=
for %%i in (*createtable.sql) do set LIST=!LIST! %%i
echo %LIST%

for %%num in ("%LIST%") do (
	echo %%num
)
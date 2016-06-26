@echo off
setlocal enabledelayedexpansion
color 0e

psql -d testdb -U postgres -c "select * from querylist limit 1;" > dbversion.txt


set version=
for /f %%g in ('findstr /r "[0-9]*\createtable.sql" dbversion.txt') do (
	set version=%%g
	)

echo Current version is %version%

for /r %%i in (*createtable.sql) do (echo %%~nxi >> files.txt)

set last=%version%
for /f %%s in ('findstr "[0-9]*\.*" ./files.txt') do (
	echo Local %%s|findstr /r /c:"[0-9]*\.*"
	if "%version%" LSS "%%s" (
		psql -d testdb -U postgres -a -f "%%s" > nul
		set last=%%s
	) else (
		rem echo Already updated!
	)
)

psql -d testdb -U postgres -c "update querylist set queryname='"%last%"'"

del files.txt
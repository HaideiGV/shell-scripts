@echo off
setlocal EnableDelayedExpansion

psql -d testdb -U postgres -c "select * from querylist" > dbversion.txt

set version=
for /F "skip=2" %%G in (dbversion.txt) do (
	set version=!version!%%G
	set sign=%version:~-19,-18%
	@echo %sign%
	if %sign%=="." (set version=%version:~0,-20%)
	else (set version=%version:~0,-19%)
	) %%G

echo %version%| findstr /r "[0-9]*"


for %%i in (*.createtable.sql) do (
	echo %%i > filelist.txt
	)


for /F "skip=2" %%s in (filelist.txt) do (
	echo %%s| findstr /r "[0-9]*"
	rem echo %file_version%
	if %version% LSS %file_version% (
		psql -d testdb -U postgres -a -f "%%s"
		set max_file=%file_version%.createtable.sql
		)
	else (echo "All scripts are updated!")
	)

rem psql -d testdb -U postgres -c "update querylist set queryname='"%max_file%"'"

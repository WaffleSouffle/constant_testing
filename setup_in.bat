::Create a windows link to the project to be watched.
@setlocal
@openfiles 1>NUL 2>&1
@set _ISADMIN=%errorlevel%
@if %_ISADMIN% NEQ 0 goto :NotElevated

@set script_dir=%~dp0
@set FISH=%1
@shift
@echo x%FISH%x|@findstr /C:"xx" >NUL 2>&1
@if %ERRORLEVEL%==0 goto :NoParameter
for %%y IN (%FISH%) do @mklink %FISH%\constant_testing.sh %script_dir%constant_testing.sh
@goto :Finish

:NoParameter
@echo Error: No target project specified.
@goto :Finish

:NotElevated
@echo You are not running with elevated priviliges. Please run from an elevated command prompt.
@goto :Finish

:Finish

@endlocal
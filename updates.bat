@echo off
setlocal enabledelayedexpansion

.\MaintenanceTool.exe --checkupdates | findstr /C:"<update " > nul

if %errorlevel% == 0 (
  .\MaintenanceTool.exe --updater
  if not "%~1" == "" (
    set /P automatic= Do you want to continue to automatically check for updates? ^(Y/n^) 
    if /I "!automatic!" == "n" (
      set returnvalue=1
      goto :EXIT
    )
    set returnvalue=0
    goto :EXIT
  )
  goto :EOF
)

:EXIT
endlocal & set %~1=%returnvalue%

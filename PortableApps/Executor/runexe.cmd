@echo off

IF "%~1"=="" (
    echo Usage: %~n0 [parameter]
    echo Example: %~n0 google best series right now
    goto :eof
)

REM echo Running executor.exe -r %*
executor.exe -r %*
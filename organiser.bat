@echo off
setlocal enabledelayedexpansion

:: Loop through all files in the current directory
for %%a in ("*.*") do (
    :: Check if the item is a file and not this batch script itself
    if "%%~fa" NEQ "%~f0" (
        :: Ensure the file has an extension
        if "%%~xa" NEQ "" (
            :: Get extension without the leading dot
            set "ext=%%~xa"
            set "ext=!ext:~1!"
            
            :: Create the folder if it doesn't exist
            if not exist "!ext!" mkdir "!ext!"
            
            :: Move the file into the folder
            move "%%~fa" "!ext!\"
        )
    )
)

pause







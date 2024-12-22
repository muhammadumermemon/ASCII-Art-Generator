@echo off
:: Set title
title ASCII Art Generator

:: Set variables
set image_path=
set output_path=
set width=80
set height=24

:: Get image file path from user
set /p image_path=Enter image file path: 

:: Get output file path from user
set /p output_path=Enter output file path: 

:: Convert image to ASCII art
convert %image_path% -colorspace Gray -compress None txt:%output_path%

:: Set ASCII art characters
set "ascii_chars= @%#*+=-:. "

:: Create ASCII art
for /f "tokens=*" %%a in (%output_path%) do (
    set "line=%%a"
    set "ascii_line="
    for /l %%b in (1,1,!width!) do (
        set /a "char_index=!random! %% 10"
        set "ascii_line=!ascii_line!!ascii_chars:~!char_index!,1!"
    )
    echo !ascii_line!
)

:: Display success message
echo ASCII art generated successfully!

:: Error handling
if !errorlevel! neq 0 (
    echo Error generating ASCII art.
    exit /b 1
)

:: Pause
pause

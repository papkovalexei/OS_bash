sc pause Winmgmt
timeout /t 5
sc query type=service state=all > buffer.txt
supportmegascript.bat
@echo off
:loop
start /B CMD /C CALL C:\Windows\SysWOW64\WindowsPowerShell\v1.0\PowerShell C:\Users\I16881\Desktop\AutomationOCS\automationOCstatus.ps1
timeout /t 60
goto loop  
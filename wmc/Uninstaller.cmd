>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if "%errorlevel%" NEQ "0" (
	echo: Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
	echo: UAC.ShellExecute "%~s0", "", "", "runas", 1 >> "%temp%\getadmin.vbs"
	"%temp%\getadmin.vbs" &	exit 
)
if exist "%temp%\getadmin.vbs" del /f /q "%temp%\getadmin.vbs"


for /f "tokens=6 delims=[]. " %%G in ('ver') do set winbuild=%%G
if %winbuild% LSS 9600 (
echo ============================================================
echo ERROR: This pack require Windows 8.1 at least.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
%windir%\system32\reg.exe query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v PROCESSOR_ARCHITECTURE | find /i "amd64" 1>nul || (
echo ============================================================
echo ERROR: This pack is for 64-bit systems.
echo ============================================================
echo.
echo.
echo Press any key to exit...
pause >nul
goto :eof
)
cd /d "%~dp0"
%windir%\System32\reg.exe add HKU\.DEFAULT\Console\^%%SystemRoot^%%_system32_cmd.exe /v ScreenBufferSize /t REG_DWORD /d 19660880 /f >nul 2>&1
bin\NSudoC.exe -U:T -P:E "\"\"%~dp0bin\Uninstall.bat"

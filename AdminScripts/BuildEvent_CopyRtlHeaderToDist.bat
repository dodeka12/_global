@ECHO OFF
ECHO 	Build Event: Copy DLL Export Header to Distribution
ECHO 	------------------------------------------------------------------------------------------------

if [%1] == [] (
    set IncDir=%CtDistModIncDir%
) else (
    set IncDir=%CtDistModIncDir%..\%1\
)

ECHO %CtHeaderDir%
ECHO %IncDir%

attrib -R "%IncDir%*.h" /S > nul

if exist "%CtProjectDir%CluTec.RtlHeaderList.txt" (
	for /f "tokens=*" %%i in (%CtProjectDir%CluTec.RtlHeaderList.txt) DO (
		xcopy "%CtHeaderDir%%%i"   "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
	)
) else (
	xcopy "%CtHeaderDir%*.h"   "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
)

attrib +R "%IncDir%*.h" /S > nul
ECHO 	------------------------------------------------------------------------------------------------
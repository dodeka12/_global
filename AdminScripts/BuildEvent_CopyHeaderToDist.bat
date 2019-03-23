@ECHO OFF
ECHO 	Build Event: Copy Header to Distribution
ECHO 	------------------------------------------------------------------------------------------------

if [%1] == [] (
    set IncDir=%CtDistModIncDir%
) else (
    set IncDir=%CtDistModIncDir%..\%1\
)

ECHO 		%IncDir%
ECHO		%CtHeaderDir%

attrib -R "%IncDir%*.h" /S > nul
attrib -R "%IncDir%*.cuh" /S > nul
attrib -R "%IncDir%*.cxx" /S > nul

if exist "%CtProjectDir%CluTec.HeaderList.txt" (
	for /f "tokens=*" %%i in (%CtProjectDir%CluTec.HeaderList.txt) DO (
		xcopy "%CtHeaderDir%%%i"   "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
	)
) else (
	xcopy "%CtHeaderDir%*.h"   "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
	xcopy "%CtHeaderDir%*.cuh" "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
	xcopy "%CtHeaderDir%*.cxx" "%IncDir%" /I /R /Y /Q /D /EXCLUDE:%CtGlobalDir%AdminScripts\CopyExcludeFiles.txt
)


attrib +R "%IncDir%*.h" /S > nul
attrib +R "%IncDir%*.cuh" /S > nul
attrib +R "%IncDir%*.cxx" /S > nul
ECHO 	------------------------------------------------------------------------------------------------
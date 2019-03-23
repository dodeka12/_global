@ECHO OFF

SET COPY_FLAGS=/S /E /R /Y

:: Switch to solution folder
cd ..\..

FOR /f "tokens=*" %%F IN ('dir /ad /b "Bin.*"') DO ( 

	xcopy %%F\Debug _dist\Debug\ %COPY_FLAGS%
	
	xcopy %%F\Release _dist\Release\ %COPY_FLAGS%

	xcopy %%F\RTM _dist\RTM\ %COPY_FLAGS%
	
	xcopy %%F\_symbol X:\_symbol %COPY_FLAGS%

)

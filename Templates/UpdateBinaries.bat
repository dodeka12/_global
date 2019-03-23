@ECHO OFF

FOR /f "tokens=*" %%F IN ('dir /ad /b "_global.*"') DO ( 

	cd %%F\AdminScripts
	CopyBinariesToDist.bat
	
)

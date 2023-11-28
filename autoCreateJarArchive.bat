@echo off
setlocal enabledelayedexpansion
set /a counter=0

set projectName=tmpname
set javaDir=tmpDir
set manifestDir=tmpDir

if exist config.txt (
echo Read config-file
) else ( 
echo error read config-file
)

for /f "delims=" %%i in (config.txt) do (
set /a counter+=1
if !counter! EQU 2 (set projectName=%%i)
if !counter! EQU 4 (set javaDir=%%i)
if !counter! EQU 6 (set manifestDir=%%i)
echo !counter! %%i
)
echo ___
echo Data from config-file:
echo javaDir=%javaDir% 
echo projectName=%projectName% 
echo manifestDir=%manifestDir%
echo ___

if "%javaDir%"=="tmpDir" ( 
echo error java-files dirrectory
pause
exit
)
if "%projectName%"=="tmpname" ( 
echo error projectName
pause
exit
)
if "%manifestDir%"=="tmpDir" ( 
echo error manifest-files dirrectory
pause
exit
)

javac .\src%javaDir%\*.java
cd src
jar cfm ..\%projectName% .\%manifestDir% .%javaDir%\*.class

echo ___
echo Cancel create jar-archive

@echo on
pause
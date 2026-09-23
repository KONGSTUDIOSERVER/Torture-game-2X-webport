@echo off
setlocal
set "EDITOR=C:\Program Files\Unity\Hub\Editor\2019.3.4f1\Editor\Unity.exe"
if not exist "%EDITOR%" (
  echo Unity 2019.3.4f1 was not found. Install it with WebGL Build Support in Unity Hub.
  pause
  exit /b 1
)
echo Building the original game for the browser. This can take several minutes.
echo Close this project in Unity first. Progress is recorded in build.log.
"%EDITOR%" -batchmode -quit -projectPath "%~dp0UnityProject" -buildTarget WebGL -executeMethod WebPortBuild.Build -logFile "%~dp0build.log"
if errorlevel 1 (
  echo Build did not complete. See build.log in this folder.
  pause
  exit /b 1
)
if not exist "%~dp0WebBuild\index.html" (
  echo Unity did not produce a browser build. See build.log.
  pause
  exit /b 1
)
echo Build complete. Run Play-WebPort.cmd to play locally.
pause

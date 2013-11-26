@echo Off

SET msbuild="%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"

if "%1" == "" (
   call "%~dp0build.cmd"
)

echo %msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m
%msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m

@echo Off

SET msbuild="%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"

IF ["%1"] == [""] (
   call "%~dp0pack.cmd"
)

echo %msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m
%msbuild% "%~dp0src\BuildTargets\NuGetPush.proj" /nologo /verbosity:m

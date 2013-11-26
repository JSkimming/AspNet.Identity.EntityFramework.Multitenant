@echo Off
SET config=%1
IF "%config%" == "" (
    SET config=Release
)

SET msbuild="%windir%\Microsoft.NET\Framework\v4.0.30319\msbuild.exe"

call "%~dp0src\RestorePackages.cmd"
echo %msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%" /p:VisualStudioVersion=12.0
%msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%" /p:VisualStudioVersion=12.0

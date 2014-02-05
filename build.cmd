@echo Off
SET config=%1
IF "%config%" == "" (
    SET config=Release
)

@call "%~dp0setmsbuild.cmd"

call "%~dp0src\RestorePackages.cmd"
echo %msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%"
%msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%"

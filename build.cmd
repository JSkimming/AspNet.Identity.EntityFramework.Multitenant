@echo Off
SET config=%1
IF "%config%" == "" (
    SET config=Release
)

CALL "%~dp0setmsbuild.cmd"

call "%~dp0RestorePackages.cmd"
echo %msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%"
%msbuild% "%~dp0src\AspNet.Identity.EntityFramework.Multitenant.sln" /nologo /verbosity:m /t:Rebuild /p:Configuration="%config%"

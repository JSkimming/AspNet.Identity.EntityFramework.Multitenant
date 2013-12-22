@echo Off

SET config=%1

IF ["%1"] == [""] (
   SET config=Release
)

call "%~dp0build.cmd" %config%

@echo "%~dp0src\.nuget\NuGet.exe" pack "%~dp0src\AspNet.Identity.EntityFramework.Multitenant\AspNet.Identity.EntityFramework.Multitenant.csproj" -Properties Configuration=%config% -NonInteractive -Symbols -OutputDirectory "%~dp0src\AspNet.Identity.EntityFramework.Multitenant\bin\%config%"
"%~dp0src\.nuget\NuGet.exe" pack "%~dp0src\AspNet.Identity.EntityFramework.Multitenant\AspNet.Identity.EntityFramework.Multitenant.csproj" -Properties Configuration=%config% -NonInteractive -Symbols -OutputDirectory "%~dp0src\AspNet.Identity.EntityFramework.Multitenant\bin\%config%"
